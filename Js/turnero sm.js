// Variables globales
let socket = null;
let tvConfig = null;
let historialTurnos = [];
let currentTurno = null;
let displayTimeout = null;
let turnoQueue = [];

// Configuración
const MAX_HISTORIAL = 6;
const TURNO_DISPLAY_TIME = 25000; // 25 segundos
const WEBSOCKET_URL = 'http://192.168.41.35:3000';

// Mapeo de colores por sección
const COLORES_SECCION = {
    'LABORATORIO': '#e67e22',
    'PEDIATRÍA': '#e91e63',
    'URGENCIAS': '#e74c3c',
    'CONSULTORIOS': '#3498db',
    'RADIOLOGÍA': '#9b59b6',
    'CARDIOLOGÍA': '#16a085',
    'DEFAULT': '#95a5a6'
};

// Inicializar al cargar
$(document).ready(function() {
    console.log('Inicializando turnero...');
    initTurnero();
});

// Inicializar sistema
async function initTurnero() {
    try {
        // Obtener configuración de la TV según IP
        const config = await getTVConfig();
        
        if (!config.success) {
            mostrarError('TV no registrada: ' + config.message);
            return;
        }
        
        tvConfig = config;
        console.log('Configuración TV:', tvConfig);
        
        // Actualizar info en pantalla de espera
        $('#tv-nombre-wait').text(tvConfig.tvNombre);
        $('#sala-nombre-wait').text('Sala: ' + tvConfig.sala);
        
        // Conectar al WebSocket
        connectWebSocket();
        
    } catch (error) {
        console.error('Error inicializando:', error);
        mostrarError('Error de inicialización');
    }
}

// Obtener configuración desde APEX
function getTVConfig() {
    return new Promise((resolve, reject) => {
        apex.server.process('GET_TV_CONFIG', {}, {
            dataType: 'json',
            success: function(response) {
                console.log('IP detectada:', response.ip);
                resolve(response);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Error AJAX:', textStatus);
                reject(new Error(textStatus));
            }
        });
    });
}

// Conectar al WebSocket
function connectWebSocket() {
    console.log('Conectando a WebSocket:', WEBSOCKET_URL);
    
    socket = io(WEBSOCKET_URL, {
        reconnection: true,
        reconnectionDelay: 1000,
        reconnectionDelayMax: 5000,
        reconnectionAttempts: Infinity
    });
    
    socket.on('connect', function() {
        console.log('WebSocket conectado');
        updateConnectionStatus(true);
        
        // Unirse a la sala
        socket.emit('join-room', {
            room: tvConfig.sala,
            userName: tvConfig.tvNombre
        });
    });
    
    socket.on('joined', function(data) {
        console.log('Unido a sala:', data.room);
        //apex.message.showPageSuccess('Conectado a sala: ' + data.room);               
    });
    
    // Escuchar eventos de turnos
    socket.on('websocket:message', function(data) {
        console.log('Nuevo turno recibido:', data);
        procesarLlamado(data);
    });
    
    socket.on('disconnect', function() {
        console.log('WebSocket desconectado');
        updateConnectionStatus(false);
    });
    
    socket.on('error', function(error) {
        console.error('Error WebSocket:', error);
    });
}

// Procesar llamado de turno
function procesarLlamado(data) {
    // Agregar timestamp si no viene
    if (!data.hora) {
        const now = new Date();
        data.hora = now.toLocaleTimeString('es-PY', { 
            hour: '2-digit', 
            minute: '2-digit',
            hour12: true 
        });
    }
    
    // Determinar sección y color
    const seccion = extraerSeccion(data);
    data.seccion = seccion;
    data.color = COLORES_SECCION[seccion] || COLORES_SECCION.DEFAULT;
    
    // Agregar a cola de turnos
    turnoQueue.push(data);
    
    // Si no hay turno mostrándose, mostrar inmediatamente
    if (!currentTurno) {
        mostrarSiguienteTurno();
    }
}

// Extraer sección del turno
function extraerSeccion(data) {
    // Intentar extraer de diferentes campos
    if (data.seccion) return data.seccion.toUpperCase();
    if (data.consultorio && data.consultorio.includes('LAB')) return 'LABORATORIO';
    if (data.consultorio && data.consultorio.includes('PED')) return 'PEDIATRÍA';
    if (data.consultorio && data.consultorio.includes('URG')) return 'URGENCIAS';
    
    // Por defecto
    return 'CONSULTORIOS';
}

// Mostrar siguiente turno de la cola
function mostrarSiguienteTurno() {
    if (turnoQueue.length === 0) {
        // No hay más turnos, volver a espera
        volverAEspera();
        return;
    }
    
    // Tomar primer turno
    currentTurno = turnoQueue.shift();
    
    // Agregar al historial
    agregarAHistorial(currentTurno);
    
    // Mostrar en pantalla grande
    mostrarTurnoActivo(currentTurno);
    
    // Programar siguiente turno
    if (displayTimeout) {
        clearTimeout(displayTimeout);
    }
    
    displayTimeout = setTimeout(function() {
        mostrarSiguienteTurno();
    }, TURNO_DISPLAY_TIME);
}

// Mostrar turno en zona izquierda
function mostrarTurnoActivo(turno) {
    // Ocultar panel espera
    $('#panel-espera').removeClass('visible').addClass('hidden');
    
    // Actualizar datos
    $('#txt-seccion').text(turno.seccion);
    $('#txt-ticket').text(turno.ticket);
    $('#txt-prestador').text(turno.medico || turno.prestador || 'Profesional');
    $('#txt-lugar').text(turno.consultorio || turno.lugar);
    
    // Aplicar color
    $('#txt-ticket').css('color', turno.color);
    $('#txt-seccion').css({
        'color': turno.color,
        'border-color': turno.color
    });
    
    // Mostrar panel activo
    $('#panel-activo').removeClass('hidden').addClass('visible');
    
    // Reproducir sonido (opcional)
    reproducirSonido();
}

// Volver a pantalla de espera
function volverAEspera() {
    $('#panel-activo').removeClass('visible').addClass('hidden');
    $('#panel-espera').removeClass('hidden').addClass('visible');
    currentTurno = null;
}

// Agregar turno al historial
//function agregarAHistorial(turno) {
//    // Agregar al inicio
//    historialTurnos.unshift(turno);
//    
//    // Mantener máximo
//    if (historialTurnos.length > MAX_HISTORIAL) {
//        historialTurnos = historialTurnos.slice(0, MAX_HISTORIAL);
//    }
//    
//    // Renderizar
//    renderizarHistorial();
//}

// Agregar turno al historial (SOLO si NO es igual al último)
function agregarAHistorial(turno) {
    // Verificar si es igual al último del historial
    if (historialTurnos.length > 0) {
        const ultimoTurno = historialTurnos[0]; // El primero es el más reciente
        
        // Comparar si es el mismo turno (mismo ticket, sección y lugar)
        const esMismoTurno = 
            ultimoTurno.ticket === turno.ticket &&
            ultimoTurno.seccion === turno.seccion &&
            (ultimoTurno.consultorio || ultimoTurno.lugar) === (turno.consultorio || turno.lugar);
        
        if (esMismoTurno) {
            console.log('Turno repetido, no se agrega al historial:', turno.ticket);
            return; // NO agregar al historial, pero SÍ se muestra en pantalla
        }
    }
    // Agregar al inicio
    historialTurnos.unshift(turno);
    // Mantener máximo
    if (historialTurnos.length > MAX_HISTORIAL) {
        historialTurnos = historialTurnos.slice(0, MAX_HISTORIAL);
    }  
    // Renderizar
    renderizarHistorial();
}


// Renderizar lista de historial
function renderizarHistorial() {
    const contenedor = $('#history-list');
    contenedor.empty();
    
    if (historialTurnos.length === 0) {
        contenedor.html('<div class="empty-history">Sin historial reciente</div>');
        return;
    }
    
    historialTurnos.forEach(function(turno) {
        const card = `
            <div class="card-turno" style="border-left-color: ${turno.color}">
                <div class="card-left">
                    <h3 style="color: ${turno.color}; font-size: 18px; font-weight: bold; margin: 0;">
                        ${turno.ticket}
                        <span class="badge-seccion">${turno.seccion}</span>
                    </h3>
                    <span style="color: ${turno.color}; font-size: 18px; font-weight: bold;">
                        ${turno.consultorio || turno.lugar}
                    </span>
                </div>
                <div class="card-time">${turno.hora}</div>
            </div>
        `;
        contenedor.append(card);
    });
}

// Actualizar indicador de conexión
function updateConnectionStatus(connected) {
    const indicator = $('#connection-indicator');
    indicator.removeClass('connected disconnected');
    indicator.addClass(connected ? 'connected' : 'disconnected');
}

// Reproducir sonido de notificación
function reproducirSonido() {
    // Implementar con HTML5 Audio si se necesita
    try {
        const audio = new Audio('#WORKSPACE_IMAGES#campana.wav');
        audio.play().catch(e => console.log('No se pudo reproducir audio'));
    } catch (e) {
        console.log('Audio no disponible');
    }
}

// Mostrar error
function mostrarError(mensaje) {
    $('#panel-espera .waiting-content').html(`
        <div style="color: #e74c3c;">
            <h2>ERROR</h2>
            <p>${mensaje}</p>
        </div>
    `);
}

// Limpiar al salir
$(window).on('beforeunload', function() {
    if (socket && socket.connected) {
        socket.disconnect();
    }
});