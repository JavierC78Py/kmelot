/**
 * =============================================
 * CONEXIÓN WEBSOCKET MEDIANTE PROXY (VERSIÓN 2.0)
 * - Control inteligente de reconexiones
 * - Límites de tiempo configurables
 * - Manejo robusto de errores
 * - Compatible con todas las versiones de APEX
 * - Julio 2025 - Javier Caballero/DeepSeek
 * =============================================
 * ACL para db 19.0.0.0.0
 DECLARE
  v_acl VARCHAR2(100) := 'cbc_websocket_acl.xml';
BEGIN
  -- Primero crea la ACL
  DBMS_NETWORK_ACL_ADMIN.CREATE_ACL(
    acl         => v_acl,
    description => 'ACL para WebSocket de CBC',
    principal   => 'CBC',
    is_grant    => TRUE,
    privilege   => 'connect',
    start_date  => NULL,
    end_date    => NULL
  );
  -- Añade privilegio resolve
  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(
    acl        => v_acl,
    principal  => 'CBC',
    is_grant   => TRUE,
    privilege  => 'resolve'
  );
  -- Asigna a tu host específico
  DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL(
    acl        => v_acl,
    host       => 'baileys.kmelot.online',
    lower_port => 443,
    upper_port => 443
  );
  COMMIT;
END;
/
SELECT a.acl, a.host, a.lower_port, a.upper_port, p.principal, p.privilege
FROM dba_network_acls a
JOIN dba_network_acl_privileges p ON a.acl = p.acl
WHERE p.principal = 'CBC' AND a.host = 'baileys.kmelot.online';
/
*/

// ► 1. Configuración (EDITAR ESTOS VALORES)
const WS_CONFIG = {
    sessionId: "39A5A662B4F78908E063E75E000A99BF",      // Session ID de tu conexión
    authToken: "0a580dfc-120b-458a-b6c8-5c288a48ea4f", // Token de autenticación
    apexRegionId: "MENSAJE",                           // ID estático de la región a refrescar
    maxReconnectAttempts: 8,                           // Intentos máximos de reconexión
    initialReconnectDelay: 3000,                       // Primer retardo (ms)
    maxReconnectDelay: 30000,                          // Retardo máximo (ms)
    giveUpAfter: 120000,                               // Tiempo máximo de intentos (ms)
    proxyTimeout: 10000                                // Timeout para respuesta del proxy (ms)
};

// ► 2. Variables de estado
let wsConnection = null;
let reconnectCount = 0;
let isExplicitDisconnect = false;
let isConnectionInProgress = false;
let lastRequestTime = 0;
let connectionStartTime = 0;
let reconnectTimer = null;
let pprObserver = null;

// ► 3. Función Principal (Conectar via Proxy)
async function connectWebSocketViaProxy() {
    // Control de tiempo total
    const now = Date.now();
    if (!connectionStartTime) connectionStartTime = now;
    
    if (now - connectionStartTime > WS_CONFIG.giveUpAfter) {
        console.error("🚫 Tiempo máximo de reconexión alcanzado (2 minutos)");
        return;
    }

    // Control de frecuencia e intentos
    if (reconnectCount >= WS_CONFIG.maxReconnectAttempts) {
        console.error(`🚫 Máximo de reconexiones alcanzado (${WS_CONFIG.maxReconnectAttempts})`);
        return;
    }

    if (isConnectionInProgress || (now - lastRequestTime < 1500)) {
        console.log("⏳ Esperando antes de reconectar...");
        scheduleReconnection();
        return;
    }

    isConnectionInProgress = true;
    lastRequestTime = now;
    reconnectCount++;

    try {
        console.log(`🔁 Intento ${reconnectCount}/${WS_CONFIG.maxReconnectAttempts} - Iniciando conexión...`);

        let ajaxRequest = null;
        const response = await apex.server.process("WEBSOCKET_PROXY", {
            x01: WS_CONFIG.sessionId,
            x02: WS_CONFIG.authToken
        }, {
            dataType: "json",
            beforeSend: function(xhr) {
                ajaxRequest = xhr;
                setTimeout(() => {
                    if (ajaxRequest && ajaxRequest.readyState !== 4) {
                        ajaxRequest.abort();
                        throw new Error("Timeout: El proxy no respondió");
                    }
                }, WS_CONFIG.proxyTimeout);
            },
            success: (data) => data,
            error: (jqXHR, textStatus, errorThrown) => {
                throw new Error(`Error en proxy (${jqXHR.status}): ${textStatus}`);
            }
        });

        if (response.status === "error") throw new Error(response.message);

        console.log("✅ Proxy configurado. URL de WebSocket:", response.wsUrl);
        initializeWebSocket(response.wsUrl);
        resetConnectionState();

    } catch (error) {
        console.error(`❌ Error en conexión (Intento ${reconnectCount}):`, error.message);
        scheduleReconnection();
    } finally {
        isConnectionInProgress = false;
    }
}

// ► 4. Inicializar WebSocket
function initializeWebSocket(websocketUrl) {
    // Cerrar conexión existente
    if (wsConnection) {
        try {
            wsConnection.close();
        } catch (e) {
            console.warn("⚠️ Error al cerrar conexión previa:", e);
        }
    }

    // Crear nueva conexión
    wsConnection = new WebSocket(websocketUrl);

    // Manejadores de eventos
    wsConnection.onopen = () => {
        console.log("✅ WebSocket conectado a través de proxy");
        resetConnectionState();
        apex.debug.info("WebSocket: Conexión establecida");
    };

    wsConnection.onmessage = (event) => {
        try {
            const data = JSON.parse(event.data);
            console.log("📥 Mensaje recibido:", data);

            if (data.event && ["chats.update", "messages.upsert"].includes(data.event)) {
                refreshApexRegion(WS_CONFIG.apexRegionId);
            }
        } catch (e) {
            console.warn("⚠️ Mensaje no es JSON válido:", event.data);
        }
    };

    wsConnection.onerror = (error) => {
        console.error("🔥 Error en WebSocket:", error);
    };

    wsConnection.onclose = (event) => {
        console.log(`🚪 Conexión cerrada. Código: ${event.code}, Razón: ${event.reason}`);
        if (!isExplicitDisconnect && event.code !== 1000) {
            scheduleReconnection();
        }
    };
}

// ► 5. Funciones auxiliares
function refreshApexRegion(regionId) {
    try {
        if (typeof apex !== "undefined" && apex.region) {
            const region = apex.region(regionId);
            if (region?.refresh) {
                console.log(`🔄 Refrescando región ${regionId}`);
                region.refresh();
                return;
            }
        }
        console.warn(`⚠️ Región ${regionId} no encontrada o no tiene método refresh`);
    } catch (e) {
        console.error(`❌ Error al refrescar región ${regionId}:`, e);
    }
}

function scheduleReconnection() {
    if (reconnectTimer) clearTimeout(reconnectTimer);
    
    const delay = Math.min(
        WS_CONFIG.initialReconnectDelay * Math.pow(2, reconnectCount - 1),
        WS_CONFIG.maxReconnectDelay
    );
    
    console.log(`⏳ Próximo intento en ${delay/1000} segundos...`);
    reconnectTimer = setTimeout(connectWebSocketViaProxy, delay);
}

function resetConnectionState() {
    reconnectCount = 0;
    connectionStartTime = 0;
    isExplicitDisconnect = false;
}

function disconnectWebSocket() {
    if (wsConnection && wsConnection.readyState !== WebSocket.CLOSED) {
        isExplicitDisconnect = true;
        try {
            wsConnection.close(1000, "Cierre solicitado por el usuario");
            console.log("🛑 Conexión WebSocket cerrada manualmente");
        } catch (e) {
            console.error("⚠️ Error al cerrar conexión:", e);
        }
    }
}

// ► 6. Manejo de Partial Page Refresh
function handlePageRefresh() {
    if (isConnectionInProgress) return;
    
    console.log("🔄 Cambios en PPR detectados - Reiniciando WebSocket...");
    disconnectWebSocket();
    
    setTimeout(() => {
        if (typeof connectWebSocketViaProxy === "function") {
            connectWebSocketViaProxy();
        }
    }, 500);
}

function setupPPRHandler() {
    if (pprObserver) return;
    
    pprObserver = new MutationObserver((mutations) => {
        for (const mutation of mutations) {
            if (mutation.addedNodes.length > 0) {
                handlePageRefresh();
                break;
            }
        }
    });

    pprObserver.observe(document.body, {
        childList: true,
        subtree: true
    });

    if (typeof apex !== "undefined" && apex.server) {
        const originalProcess = apex.server.process;
        apex.server.process = function() {
            const result = originalProcess.apply(this, arguments);
            result.always(() => setTimeout(handlePageRefresh, 300));
            return result;
        };
    }
}

// ► 7. Inicialización controlada
function initializeWebSocketManager() {
    // Esperar a que APEX esté listo
    if (typeof apex !== "undefined" && apex.util?.onceAfterPageLoad) {
        apex.util.onceAfterPageLoad(() => {
            connectWebSocketViaProxy();
            setupPPRHandler();
        });
    } 
    // Fallback para versiones antiguas
    else if (typeof $ !== "undefined") {
        $(document).ready(() => {
            setTimeout(() => {
                connectWebSocketViaProxy();
                setupPPRHandler();
            }, 1000);
        });
    }
    // Fallback genérico
    else {
        document.addEventListener("DOMContentLoaded", () => {
            setTimeout(() => {
                connectWebSocketViaProxy();
                setupPPRHandler();
            }, 1500);
        });
    }

    // Cerrar conexión al salir
    window.addEventListener("beforeunload", disconnectWebSocket);
}

// ► Iniciar todo
initializeWebSocketManager();