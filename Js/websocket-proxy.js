/**
 * 
 * 14 Jul 2025 
 * File url :
 * https://cdn.socket.io/4.7.4/socket.io.min.js
 * Javier Caballero/DeepSeek
 */ 

const WS_CONFIG = {
    serverUrl: 'wss://baileys.kmelot.online/?session_id=',
    apiKey: '0a580dfc-120b-458a-b6c8-5c288a48ea4f',
    sessionId: '39A5A662B4F78908E063E75E000A99BF',
    reconnectDelay: 3000, // 3 segundos entre reconexiones
    maxReconnectAttempts: 5 // Máximo de intentos de reconexión
};
let socket = null;
let reconnectAttempts = 0;
let reconnectTimer = null;
let isManualDisconnect = false;
/**
 * Establece una nueva conexión WebSocket
 * @returns {Socket} Instancia del socket conectado
 */
function connectWebSocket() {
    // Si ya hay una conexión activa, la cerramos primero
    if (socket && socket.connected) {
        console.log('Conexión existente encontrada, cerrando...');
        disconnectWebSocket();
    }
    console.log('Iniciando nueva conexión WebSocket...');
    // Resetear estado de reconexión
    isManualDisconnect = false;
    reconnectAttempts = 0;
    socket = io(WS_CONFIG.serverUrl + WS_CONFIG.sessionId, {
        transports: ['websocket'],
        auth: {
            token: WS_CONFIG.apiKey
        },
        query: {
            api_key: WS_CONFIG.apiKey,
            client_type: 'web',
            timestamp: Date.now() // Evitar caché
        },
        reconnection: false // Gestionamos la reconexión manualmente
    });
    // Configurar manejadores de eventos
    setupSocketHandlers();    
    return socket;
}
/**
 * Cierra la conexión WebSocket actual
 */
function disconnectWebSocket() {
    if (socket) {
        console.log('Desconectando WebSocket...');
        isManualDisconnect = true;
        socket.disconnect();
        socket = null;
        // Limpiar temporizador de reconexión si existe
        if (reconnectTimer) {
            clearTimeout(reconnectTimer);
            reconnectTimer = null;
        }
    }
}
/**
 * Configura los manejadores de eventos del socket
 */
function setupSocketHandlers() {
    socket.on('connect', () => {
        console.log('✅ Conectado al servidor WebSocket');
        reconnectAttempts = 0;
        // Mostrar estado en la UI si es necesario
        updateConnectionStatus('connected');
    });
    socket.on('disconnect', (reason) => {
        console.log(`⚠️ Desconectado: ${reason}`);
        updateConnectionStatus('disconnected'); 
        if (!isManualDisconnect) {
            attemptReconnection(reason);
        }
    });
    socket.on('connect_error', (error) => {
        console.error('❌ Error de conexión:', error.message);
        updateConnectionStatus('error'); 
        // Intentar reconectar en caso de error
        if (!isManualDisconnect) {
            attemptReconnection('connect_error');
        }
    });
    socket.on('chats.update', (data) => {
        console.log('💬 Nuevo mensaje recibido:', data);
        // Actualizar la UI con los nuevos mensajes
        updateChatUI(data);
    });
    // Heartbeat para mantener la conexión activa
    socket.on('ping', () => {
        console.debug('🏓 Ping recibido');
        socket.emit('pong');
    });
}
/**
 * Intenta reconectar al servidor
 * @param {string} reason - Razón de la desconexión
 */
function attemptReconnection(reason) {
    if (reconnectTimer) {
        clearTimeout(reconnectTimer);
    }   
    // Verificar si hemos excedido el máximo de intentos
    if (reconnectAttempts >= WS_CONFIG.maxReconnectAttempts) {
        console.error('🚫 Máximo de intentos de reconexión alcanzado');
        updateConnectionStatus('connection_lost');
        return;
    }    
    reconnectAttempts++;
    const delay = calculateReconnectDelay();
    console.log(`🔁 Intentando reconexión #${reconnectAttempts} en ${delay/1000} segundos...`);
    reconnectTimer = setTimeout(() => {
        if (shouldCreateNewConnection(reason)) {
            connectWebSocket();
        } else {
            socket.connect();
        }
    }, delay);
}
/**
 * Calcula el retraso para la reconexión (backoff exponencial)
 */
function calculateReconnectDelay() {
    return Math.min(
        WS_CONFIG.reconnectDelay * Math.pow(2, reconnectAttempts - 1),
        30000 // Máximo 30 segundos
    );
}
/**
 * Determina si se debe crear una nueva conexión
 */
function shouldCreateNewConnection(reason) {
    return reason.includes('transport close') || 
           reason.includes('ping timeout') ||
           !socket;
}
/**
 * Actualiza el estado de la conexión en la UI
 */
function updateConnectionStatus(status) {
    console.log(`Actualizando estado de conexión: ${status}`);
}
/**
 * Actualiza la interfaz con nuevos mensajes
 */
function updateChatUI(data) {
    try {
        if (!data || typeof data !== 'object') {
            console.error('Datos de mensaje no válidos:', data);
            return;
        }
        // Mostrar estructura completa para depuración
        console.debug('Datos completos recibidos:', JSON.parse(JSON.stringify(data)));
        // Extracción del ID según la estructura real mostrada en los logs
        const messageId = data?.data?.data?.chats?.id;
        // Fallbacks alternativos para diferentes estructuras
        const fallbackId = data.id || 
                         data.data?.id || 
                         data.chats?.id || 
                         data.data?.chats?.id;
        // Usar el ID encontrado (con prioridad a la estructura anidada)
        const finalId = messageId || fallbackId;        if (!finalId) {
            console.warn('No se pudo extraer el ID del mensaje', data);
            return;
        }
        console.log('📩 Mensaje recibido con ID:', finalId);
    } catch (error) {
        console.error('Error al procesar mensaje:', error);
        apex.message.showErrors([{
            type: 'error',
            location: 'page',
            message: 'Error al procesar mensaje',
            unsafe: false
        }]);
    }
}