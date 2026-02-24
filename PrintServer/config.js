// Configuración del Agente de Impresión (Modo Webhook)
module.exports = {
    server: {
        port: 3000
    },

    // Configuración de Ngrok (Opcional, para autoconexión)
    ngrok: {
        enabled: true,
        authToken: '', // TU_TOKEN_DE_NGROK (Opcional pero recomendado)
        region: 'us'   // us, eu, ap, au, sa, jp, in
    },
    // Configuración de JasperReports Server
    jasper: {
        baseUrl: 'https://kmelot.online:443/jasperserver',
        username: 'jasperadmin',
        password: 'FjCb2484930',
        reportPath: '/reports/salotex/RECIBO_DINERO',
        outputFormat: 'pdf'
    },
    printer: {
        name: null, // null = impresora por defecto
        platform: process.platform
    }
};