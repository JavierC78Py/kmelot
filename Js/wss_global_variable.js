/**
 * CONEXIÓN WEBSOCKET CON AUTENTICACIÓN - VERSIÓN CORREGIDA
 * Implementación robusta para Oracle APEX
 * 
 * 
 * Version de prueba inicial, no funciono porque no envia correctamente el token por js.
 */
function connectWebSocket() {
    // 1. CONFIGURACIÓN EXACTA (verifica estos valores)
    const config = {
        wsBaseUrl: 'wss://baileys.kmelot.online', // Usar WSS (WebSocket Secure)
        sessionId: '39A5A662B4F78908E063E75E000A99BF', // ID exacto de sesión
        authToken: '0a580dfc-120b-458a-b6c8-5c288a48ea4f' // Token exacto del header
    };
    // 2. VALIDACIÓN DE CONFIGURACIÓN
    if (!config.wsBaseUrl || !config.sessionId || !config.authToken) {
        console.error('❌ Configuración incompleta. Verifica wsBaseUrl, sessionId y authToken');
        return;
    }

    // 3. CONSTRUCCIÓN DE URL (con validación)
    const buildSafeWebSocketUrl = () => {
        // Asegurar que la URL base comience con wss://
        const baseUrl = config.wsBaseUrl.startsWith('wss://') ? 
            config.wsBaseUrl : 
            `wss://${config.wsBaseUrl.replace(/^(https?|wss?):\/\//, '')}`;
        
        // Codificar parámetros correctamente
        const params = new URLSearchParams();
        params.append('session_id', config.sessionId);
        params.append('token', config.authToken);
        
        return `${baseUrl}?${params.toString()}`;
    };

    const wsUrl = buildSafeWebSocketUrl();
    console.log('🌐 URL generada:', wsUrl);

    // 4. CREACIÓN DE CONEXIÓN CON MANEJO DE ERRORES
    let ws;
    try {
        ws = new WebSocket(wsUrl);
    } catch (e) {
        console.error('🚨 Error al crear WebSocket:', e);
        scheduleReconnection();
        return;
    }

    // 5. MANEJADORES DE EVENTOS MEJORADOS
    ws.onopen = (event) => {
        console.log('✅ Conexión establecida con éxito');
        apex.debug.info('WebSocket: Conexión abierta', event);
        
        // Opcional: Enviar mensaje de autenticación si el servidor lo requiere
        const authMessage = JSON.stringify({
            action: 'authenticate',
            token: config.authToken
        });
        ws.send(authMessage);
    };

    ws.onmessage = (event) => {
        console.log('📨 Mensaje recibido:', event.data);
        try {
            const data = JSON.parse(event.data);
            if (data.event === 'chats.update' || data.event === 'messages.upsert') {
                refreshApexRegion('MENSAJE');
            }
        } catch (e) {
            console.warn('⚠️ Mensaje no es JSON válido:', event.data);
        }
    };

    ws.onerror = (error) => {
        // Error real que muestra la consola
        console.error('🔥 Error crítico en WebSocket:', {
            error: error,
            url: wsUrl,
            readyState: ws?.readyState
        });
    };

    ws.onclose = (event) => {
        console.log(`🚪 Conexión cerrada. Código: ${event.code}, Razón: ${event.reason}`);
        if (event.code !== 1000) { // 1000 = cierre normal
            scheduleReconnection();
        }
    };

    // 6. FUNCIONES AUXILIARES
    function scheduleReconnection(delay = 5000) {
        console.log(`⏳ Reconectando en ${delay/1000} segundos...`);
        setTimeout(connectWebSocket, delay);
    }

    function refreshApexRegion(regionId) {
        if (typeof apex !== 'undefined' && apex.region) {
            try {
                apex.region(regionId)?.refresh();
                console.log(`🔄 Región ${regionId} actualizada`);
            } catch (e) {
                console.error(`❌ Error al actualizar región ${regionId}:`, e);
            }
        }
    }
}

// 7. INICIALIZACIÓN SEGURA
document.addEventListener('apexafterload', () => {
    console.log('🚀 Iniciando conexión WebSocket...');
    connectWebSocket();
});

// Fallback para casos donde apexafterload no se dispara
if (document.readyState === 'complete') {
    connectWebSocket();
} else {
    window.addEventListener('load', connectWebSocket);
}