const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');
const fs = require('fs');
const path = require('path');
const { exec, spawn } = require('child_process');
const config = require('./config');

const app = express();
app.use(bodyParser.json());

// Función principal de log
function log(msg, type = 'INFO') {
    const timestamp = new Date().toISOString();
    console.log(`[${timestamp}] [${type}] ${msg}`);
}

/**
 * 2. Descargar PDF desde JasperReports Server
 */
async function fetchReport(turnoId) {
    try {
        log(`Descargando reporte para Turno ID: ${turnoId}...`);

        const auth = {
            username: config.jasper.username,
            password: config.jasper.password
        };

        const reportUrl = `${config.jasper.baseUrl}/rest_v2/reports${config.jasper.reportPath}.${config.jasper.outputFormat}`;

        const response = await axios.get(reportUrl, {
            params: { 'P_ID_COBRO': turnoId },
            auth: auth,
            responseType: 'arraybuffer'
        });

        const fileName = `ticket_${turnoId}_${Date.now()}.pdf`;
        const filePath = path.join(__dirname, 'temp', fileName);

        if (!fs.existsSync(path.join(__dirname, 'temp'))) {
            fs.mkdirSync(path.join(__dirname, 'temp'));
        }

        fs.writeFileSync(filePath, response.data);
        log(`Reporte guardado en: ${filePath}`);

        return filePath;

    } catch (error) {
        throw new Error(`Fallo descargando reporte jasper: ${error.message}`);
    }
}

/**
 * 3. Enviar a la impresora
 */
async function printFile(filePath) {
    return new Promise((resolve, reject) => {
        let command = '';
        const printerName = config.printer.name;

        if (process.platform === 'win32') {
            if (printerName) {
                log('ADVERTENCIA: Usando Powershell genérico. Configurar CLI específico para rapidez.', 'WARN');
                command = `powershell -Command "Start-Process -FilePath '${filePath}' -Verb Print -PassThru | %{sleep 10; $_} | kill"`;
            } else {
                command = `powershell -Command "Start-Process -FilePath '${filePath}' -Verb Print -PassThru | %{sleep 10; $_} | kill"`;
            }
        } else {
            // Linux / Mac (CUPS)
            command = `lp ${printerName ? `-d "${printerName}"` : ''} "${filePath}"`;
        }

        log(`Ejecutando comando: ${command}`);

        exec(command, (error, stdout, stderr) => {
            if (error) {
                log(`Error impresión: ${error.message}`, 'ERROR');
                reject(error);
                return;
            }
            if (stderr) log(`Print stderr: ${stderr}`, 'WARN');
            log(`Impresión enviada correctamente.`);
            resolve();
        });
    });
}

/**
 * Endpoint para recibir notificaciones de impresión
 */
app.post('/print', async (req, res) => {
    const { turnoId } = req.body;

    if (!turnoId) {
        return res.status(400).json({ error: 'Falta parametro turnoId' });
    }

    log(`Recibida petición de impresión para Turno: ${turnoId}`);
    res.json({ status: 'Processing', message: 'Trabajo recibido' });

    try {
        const filePath = await fetchReport(turnoId);
        await printFile(filePath);

        if (filePath && fs.existsSync(filePath)) {
            try { fs.unlinkSync(filePath); } catch (e) { }
        }
    } catch (error) {
        log(`Error procesando impresión: ${error.message}`, 'ERROR');
    }
});

app.listen(config.server.port, () => {
    log(`Agente de Impresión escuchando en puerto ${config.server.port}`, 'START');

    if (config.ngrok && config.ngrok.enabled) {
        log('Iniciando túnel Ngrok (System Command)...');

        // AQUI ESTÁ EL CAMBIO IMPORTANTE: --log=stdout para que podamos leer la URL
        const ngrokProcess = spawn('ngrok', ['http', config.server.port, '--log=stdout', '--log-format=logfmt']);

        ngrokProcess.stdout.on('data', (data) => {
            const output = data.toString();
            // Descomentar para debug extremo:
            // console.log(output);

            const match = output.match(/url=(https:\/\/[^ ]+)/);
            if (match && match[1]) {
                log(`================================================================`, 'SUCCESS');
                log(`🌍 URL PÚBLICA DE NGROK: ${match[1]}`, 'SUCCESS');
                log(`   Copiar esta URL en tu procedimiento de base de datos (ORACLE).`, 'SUCCESS');
                log(`   Ej: ${match[1]}/print`, 'SUCCESS');
                log(`================================================================`, 'SUCCESS');
            }
        });

        ngrokProcess.stderr.on('data', (data) => {
            const output = data.toString();
            const match = output.match(/url=(https:\/\/[^ ]+)/);
            if (match && match[1]) {
                log(`================================================================`, 'SUCCESS');
                log(`🌍 URL PÚBLICA DE NGROK: ${match[1]}`, 'SUCCESS');
                log(`   Copiar esta URL en tu procedimiento de base de datos (ORACLE).`, 'SUCCESS');
                log(`   Ej: ${match[1]}/print`, 'SUCCESS');
                log(`================================================================`, 'SUCCESS');
            }
        });

        ngrokProcess.on('error', (err) => {
            log(`Error ejecutando comando ngrok: ${err.message}`, 'ERROR');
            log(`Asegúrate de tener ngrok instalado en tu sistema (brew install ngrok).`);
        });
    } else {
        log(`RECUERDA: Debes usar Ngrok o similar para exponer este puerto a Internet.`);
    }
});