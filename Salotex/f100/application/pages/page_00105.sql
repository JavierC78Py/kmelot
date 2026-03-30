prompt --application/pages/page_00105
begin
--   Manifest
--     PAGE: 00105
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_page.create_page(
 p_id=>105
,p_name=>'Chats'
,p_alias=>'CHATS1'
,p_step_title=>'Chats'
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>'https://cdn.socket.io/4.7.4/socket.io.min.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const WS_CONFIG = {',
'    serverUrl: apex.item("P105_P_WAPI_URL").getValue()+''/?session_id='',',
'    apiKey: apex.item("P105_P_WAPI_KEY").getValue(),',
'    sessionId: apex.item("P105_P_SESSION").getValue(),',
'    reconnectDelay: 3000, // 3 segundos entre reconexiones',
unistr('    maxReconnectAttempts: 5 // M\00E1ximo de intentos de reconexi\00F3n'),
'};',
'let socket = null;',
'let reconnectAttempts = 0;',
'let reconnectTimer = null;',
'let isManualDisconnect = false;',
'',
'/**',
unistr(' * Establece una nueva conexi\00F3n WebSocket'),
' * @returns {Socket} Instancia del socket conectado',
' */',
'function connectWebSocket() {',
unistr('    // Si ya hay una conexi\00F3n activa, la cerramos primero'),
'    if (socket && socket.connected) {',
unistr('        console.log(''Conexi\00F3n existente encontrada, cerrando...'');'),
'        disconnectWebSocket();',
'    }',
unistr('    console.log(''Iniciando nueva conexi\00F3n WebSocket...'');'),
unistr('    // Resetear estado de reconexi\00F3n'),
'    isManualDisconnect = false;',
'    reconnectAttempts = 0;',
'    socket = io(WS_CONFIG.serverUrl + WS_CONFIG.sessionId, {',
'        transports: [''websocket''],',
'        auth: {',
'            token: WS_CONFIG.apiKey',
'        },',
'        query: {',
'            api_key: WS_CONFIG.apiKey,',
'            client_type: ''web'',',
unistr('            timestamp: Date.now() // Evitar cach\00E9'),
'        },',
unistr('        reconnection: false // Gestionamos la reconexi\00F3n manualmente'),
'    });',
'    // Configurar manejadores de eventos',
'    setupSocketHandlers();    ',
'    return socket;',
'}',
'/**',
unistr(' * Cierra la conexi\00F3n WebSocket actual'),
' */',
'function disconnectWebSocket() {',
'    if (socket) {',
'        console.log(''Desconectando WebSocket...'');',
'        isManualDisconnect = true;',
'        socket.disconnect();',
'        socket = null;',
unistr('        // Limpiar temporizador de reconexi\00F3n si existe'),
'        if (reconnectTimer) {',
'            clearTimeout(reconnectTimer);',
'            reconnectTimer = null;',
'        }',
'    }',
'}',
'/**',
' * Configura los manejadores de eventos del socket',
' */',
'function setupSocketHandlers() {',
'    socket.on(''connect'', () => {',
unistr('        console.log(''\2705 Conectado al servidor WebSocket'');'),
'        reconnectAttempts = 0;',
'        // Mostrar estado en la UI si es necesario',
'        updateConnectionStatus(''connected'');',
'    });',
'    socket.on(''disconnect'', (reason) => {',
unistr('        console.log(`\26A0\FE0F Desconectado: ${reason}`);'),
'        updateConnectionStatus(''disconnected''); ',
'        if (!isManualDisconnect) {',
'            attemptReconnection(reason);',
'        }',
'    });',
'    socket.on(''connect_error'', (error) => {',
unistr('        console.error(''\274C Error de conexi\00F3n:'', error.message);'),
'        updateConnectionStatus(''error''); ',
'        // Intentar reconectar en caso de error',
'        if (!isManualDisconnect) {',
'            attemptReconnection(''connect_error'');',
'        }',
'    });',
'    socket.on(''chats.update'', (data) => {',
unistr('        console.log(''\D83D\DCAC Nuevo mensaje recibido:'', data);'),
'        updateChatUI(data);',
'    });',
'    socket.on(''messages.upsert'', (data) => {',
unistr('        console.log(''\D83D\DCAC Nuevo chat recibido:'', data);'),
'        updateListChat(data);',
'    });',
unistr('    // Heartbeat para mantener la conexi\00F3n activa'),
'    socket.on(''ping'', () => {',
unistr('        console.debug(''\D83C\DFD3 Ping recibido'');'),
'        socket.emit(''pong'');',
'    });',
'}',
'/**',
' * Intenta reconectar al servidor',
unistr(' * @param {string} reason - Raz\00F3n de la desconexi\00F3n'),
' */',
'function attemptReconnection(reason) {',
'    if (reconnectTimer) {',
'        clearTimeout(reconnectTimer);',
'    }   ',
unistr('    // Verificar si hemos excedido el m\00E1ximo de intentos'),
'    if (reconnectAttempts >= WS_CONFIG.maxReconnectAttempts) {',
unistr('        console.error(''\D83D\DEAB M\00E1ximo de intentos de reconexi\00F3n alcanzado'');'),
'        updateConnectionStatus(''connection_lost'');',
'        return;',
'    }    ',
'    reconnectAttempts++;',
'    const delay = calculateReconnectDelay();',
unistr('    console.log(`\D83D\DD01 Intentando reconexi\00F3n #${reconnectAttempts} en ${delay/1000} segundos...`);'),
'    reconnectTimer = setTimeout(() => {',
'        if (shouldCreateNewConnection(reason)) {',
'            connectWebSocket();',
'        } else {',
'            socket.connect();',
'        }',
'    }, delay);',
'}',
'/**',
unistr(' * Calcula el retraso para la reconexi\00F3n (backoff exponencial)'),
' */',
'function calculateReconnectDelay() {',
'    return Math.min(',
'        WS_CONFIG.reconnectDelay * Math.pow(2, reconnectAttempts - 1),',
unistr('        30000 // M\00E1ximo 30 segundos'),
'    );',
'}',
'/**',
unistr(' * Determina si se debe crear una nueva conexi\00F3n'),
' */',
'function shouldCreateNewConnection(reason) {',
'    return reason.includes(''transport close'') || ',
'           reason.includes(''ping timeout'') ||',
'           !socket;',
'}',
'/**',
unistr(' * Actualiza el estado de la conexi\00F3n en la UI'),
' */',
'function updateConnectionStatus(status) {',
unistr('    console.log(`Actualizando estado de conexi\00F3n: ${status}`);'),
'}',
'/**',
' * Actualiza la interfaz con nuevos mensajes',
' */',
'function updateChatUI(data) {',
'    try {',
'        if (!data || typeof data !== ''object'') {',
unistr('            console.error(''Datos de mensaje no v\00E1lidos:'', data);'),
'            return;',
'        }',
unistr('        // Mostrar estructura completa para depuraci\00F3n'),
'        console.debug(''Datos completos recibidos:'', JSON.parse(JSON.stringify(data)));',
unistr('        // Extracci\00F3n del ID seg\00FAn la estructura real mostrada en los logs'),
'        const messageId = data?.data?.data?.chats?.id;',
'        // Usar el ID encontrado (con prioridad a la estructura anidada)',
'        const finalId = messageId.split(''@'')[0];',
'        if (!finalId) {',
'            console.warn(''No se pudo extraer el ID del mensaje'', data);',
'            return;',
'        }',
unistr('        console.log(''\D83D\DCE9 Mensaje recibido con ID:'', finalId);'),
unistr('        console.log(''\D83D\DCE9 mensajes chat actual ID:'', apex.item("P105_P_JID").getValue());'),
'        if (apex.item("P105_P_JID").getValue() == finalId){',
unistr('            console.log(''\2705  Refrescar el chat'');'),
'            setTimeout(function(){',
'                apex.region("chat-messages").refresh();',
'            },1500);            ',
'        } else {',
unistr('            console.log(''\2705  Refrescar chats'');'),
'            setTimeout(function(){',
'                apex.region("REG_MASTER").refresh();',
'            },1500);            ',
'        }',
'    } catch (error) {',
'        console.error(''Error al procesar mensaje:'', error);',
'        /*apex.message.showErrors([{',
'            type: ''error'',',
'            location: ''page'',',
'            message: ''Error al procesar mensaje'',',
'            unsafe: false',
'        }]);*/',
'    }',
'}',
'function updateListChat(data) {',
'    try {',
'        if (!data || typeof data !== ''object'') {',
unistr('            console.error(''Datos de mensaje no v\00E1lidos:'', data);'),
'            return;',
'        }',
unistr('        // Mostrar estructura completa para depuraci\00F3n'),
'        console.debug(''Datos completos recibidos:'', JSON.parse(JSON.stringify(data)));',
unistr('        // Extracci\00F3n del ID seg\00FAn la estructura real mostrada en los logs'),
'        const messageId = data?.data?.data?.messages?.key?.remoteJid;',
'        // Usar el ID encontrado (con prioridad a la estructura anidada)',
'        const finalId = messageId.split(''@'')[0];',
'        if (!finalId) {',
'            console.warn(''No se pudo extraer el ID del mensaje'', data);',
'            return;',
'        }',
unistr('        console.log(''\D83D\DCE9 Mensaje recibido con ID:'', finalId);'),
unistr('        console.log(''\D83D\DCE9 mensajes chat actual ID:'', apex.item("P105_P_JID").getValue());'),
'        if (apex.item("P105_P_JID").getValue() == finalId){',
unistr('            console.log(''\2705  Refrescar el chat'');'),
'            setTimeout(function(){',
'                apex.region("chat-messages").refresh();',
'            },1500);            ',
'        } else {',
unistr('            console.log(''\2705  Refrescar chats'');'),
'            setTimeout(function(){',
'                apex.region("REG_MASTER").refresh();',
'            },1500);            ',
'        }',
'    } catch (error) {',
'        console.error(''Error al procesar mensaje:'', error);',
'        apex.message.showErrors([{',
'            type: ''error'',',
'            location: ''page'',',
'            message: ''Error al procesar mensaje'',',
'            unsafe: false',
'        }]);',
'    }',
'}',
'',
'function dispara(idReserva) {',
'    apex.message.clearErrors(); ',
'    apex.server.process("obtenerUrl",',
'    {x01: idReserva     ',
'    },',
'    {  ',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                let url = $v("P105_P_URL");',
'                apex.navigation.redirect(url);',
'            } else {      ',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }       ',
'        }',
'    }).always( function() {',
'    });                ',
'}',
'function habilitarRefresh(){',
'    setInterval(() =>{',
'        if (apex.item("P105_REFRESH").getValue()==''NO'') {',
'            apex.item("P105_REFRESH").setValue(''SI'');',
'        }',
'    }, 180000) //3minutos',
'}',
'function obtenerDocum(docId,docName) {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("obtenerBlob", {',
'        x01: docId',
'    },',
'    {',
'        success: function(data) {',
'            if (data.success === true) {',
'                console.log(''Preparando descarga del documento ID:'', docId);',
'',
'                // Crear un enlace temporal para descargar el archivo',
'                var downloadLink = document.createElement(''a'');',
'                downloadLink.href = "data:application/pdf;base64," + data.v_clob;',
'                downloadLink.download = docName;',
'',
'                // Simular clic para iniciar la descarga',
'                document.body.appendChild(downloadLink);',
'                downloadLink.click();',
'                document.body.removeChild(downloadLink);',
'                ',
'            } else {',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: "page",',
'                    message: data.message || "No se pudo obtener el documento.",',
'                    unsafe: false',
'                }]);',
'            }',
'        }',
'    }).always(function() {',
'        waitPopup.remove();',
'    });',
'}',
'function obtenerImg(imagenId) {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("obtenerBlob", {',
'        x01: imagenId',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
unistr('                console.log(''Iniciando visualizaci\00F3n imagen ID:'', imagenId);'),
unistr('                // Obtener el bot\00F3n'),
'                var button = document.querySelector(''.imagen-btn[data-id="'' + imagenId + ''"]'');',
'                if (!button) {',
unistr('                    console.error(''No se encontr\00F3 el bot\00F3n para la imagen ID:'', imagenId);'),
'                    return;',
'                }',
'                var icon = button.querySelector(''.fa'');',
'                // Verificar si ya existe un contenedor',
'                var existingContainer = document.getElementById(''imagen-container-'' + imagenId);',
'                if (existingContainer) {',
'                    // Si existe, simplemente lo mostramos/ocultamos',
'                    if (existingContainer.style.display === ''none'') {',
'                        console.log('' sin refresh '');',
'                        apex.item("P105_REFRESH").setValue(''NO'');',
'                        habilitarRefresh();',
'                        existingContainer.style.display = ''block'';',
'                    } else {',
'                        console.log('' con refresh '');',
'                        apex.item("P105_REFRESH").setValue(''SI'');',
'                        existingContainer.style.display = ''none'';',
'                    }',
'                    return;',
'                }',
'                // Mostrar indicador de carga',
'                icon.classList.remove(''fa-image'');',
'                icon.classList.add(''fa-spinner'');',
'                icon.classList.add(''fa-spin'');',
'                // URL para BLOB_CONTENT',
'                var blobUrl = data.v_clob;',
'                // Crear contenedor para la imagen',
'                var container = document.createElement(''div'');',
'                container.id = ''imagen-container-'' + imagenId;',
'                container.style.padding = ''10px'';',
'                container.style.border = ''1px solid #ccc'';',
'                container.style.borderRadius = ''5px'';',
'                container.style.marginTop = ''10px'';',
'                container.style.backgroundColor = ''#f9f9f9'';',
'                // Crear elemento de imagen',
'                var imgElement = document.createElement(''img'');',
'                imgElement.style.width = ''100%'';',
unistr('                imgElement.style.maxWidth = ''500px''; // Limitar el tama\00F1o m\00E1ximo'),
'                imgElement.style.marginBottom = ''10px'';',
'                imgElement.style.display = ''block'';',
'                imgElement.style.margin = ''0 auto''; // Centrar la imagen',
'                // Establecer la fuente de la imagen',
'                imgElement.src = "data:image/jpeg;base64, " + blobUrl;',
'                imgElement.alt = ''Imagen '' + imagenId;',
'                // Mensaje sobre posible compatibilidad',
'                var compatMsg = document.createElement(''div'');',
unistr('                compatMsg.textContent = ''Si la imagen no se visualiza correctamente, utiliza el bot\00F3n de descarga a continuaci\00F3n.'';'),
'                compatMsg.style.fontSize = ''12px'';',
'                compatMsg.style.marginBottom = ''10px'';',
'                compatMsg.style.textAlign = ''center'';',
unistr('                // Bot\00F3n de descarga como alternativa'),
'                var downloadButton = document.createElement(''a'');',
'                downloadButton.href = "data:image/jpeg;base64, " + blobUrl;',
'                downloadButton.className = ''t-Button t-Button--hot'';',
'                downloadButton.innerHTML = ''<span class="fa fa-download"></span> Descargar imagen'';',
'                downloadButton.download = ''imagen_'' + imagenId + ''.jpg'';',
'                downloadButton.style.display = ''block'';',
'                downloadButton.style.textAlign = ''center'';',
'                downloadButton.style.margin = ''0 auto'';',
'                downloadButton.style.width = ''fit-content'';',
unistr('                // A\00F1adir elementos al contenedor'),
'                container.appendChild(imgElement);',
'                container.appendChild(compatMsg);',
'                container.appendChild(downloadButton);',
unistr('                // Insertar el contenedor despu\00E9s del bot\00F3n'),
'                button.parentNode.insertBefore(container, button.nextSibling);',
'                // Manejar eventos de carga de imagen',
'                imgElement.addEventListener(''load'', function() {',
'                    icon.classList.remove(''fa-spinner'', ''fa-spin'');',
'                    icon.classList.add(''fa-eye'');',
'                });                ',
'                imgElement.addEventListener(''error'', function(e) {',
'                    console.error(''Error al cargar la imagen:'', e);',
unistr('                    // Resaltar el bot\00F3n de descarga'),
'                    downloadButton.style.fontWeight = ''bold'';',
unistr('                    compatMsg.textContent = ''No se pudo cargar la imagen. Por favor, utiliza el bot\00F3n de descarga.'';'),
'                    compatMsg.style.color = ''red'';',
'                    // Cambiar el icono',
'                    icon.classList.remove(''fa-spinner'', ''fa-spin'');',
'                    icon.classList.add(''fa-image'');',
'                });',
unistr('                // Si no se ha cargado despu\00E9s de un tiempo'),
'                console.log('' sin refresh '');',
'                apex.item("P105_REFRESH").setValue(''NO'');',
'                habilitarRefresh();                ',
'                setTimeout(function() {',
'                    if (icon.classList.contains(''fa-spinner'')) {',
'                        icon.classList.remove(''fa-spinner'', ''fa-spin'');',
'                        icon.classList.add(''fa-image'');',
'                    }',
'                }, 3000);',
'            } else {',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }       ',
'        }',
'    }).always( function() {',
'        waitPopup.remove();',
'    });',
'}',
'function obtenerBlob(audioId) {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("obtenerBlob", {',
'        x01: audioId',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
unistr('                // Obtener el bot\00F3n'),
'                var button = document.querySelector(''.audio-btn[data-id="'' + audioId + ''"]'');',
'                if (!button) {',
unistr('                    console.error(''No se encontr\00F3 el bot\00F3n para el audio ID:'', audioId);'),
'                    return;',
'                }',
'                var icon = button.querySelector(''.fa'');',
'                // Verificar si ya existe un contenedor',
'                var existingContainer = document.getElementById(''audio-container-'' + audioId);',
'                if (existingContainer) {',
'                    // Si existe, simplemente lo mostramos/ocultamos',
'                    if (existingContainer.style.display === ''none'') {',
'                        existingContainer.style.display = ''block'';',
'                        console.log('' sin refresh '');',
'                        apex.item("P105_REFRESH").setValue(''NO'');',
'                        habilitarRefresh();                        ',
'                    } else {',
'                        existingContainer.style.display = ''none'';',
'                        console.log('' con refresh '');',
'                        apex.item("P105_REFRESH").setValue(''SI'');',
'                    }',
'                    return;',
'                }',
'                // Mostrar indicador de carga',
'                icon.classList.remove(''fa-play'');',
'                icon.classList.add(''fa-spinner'');',
'                icon.classList.add(''fa-spin'');',
'                // URL para BLOB_CONTENT',
'                var blobUrl = data.v_clob;',
'                // Crear contenedor simple',
'                var container = document.createElement(''div'');',
'                container.id = ''audio-container-'' + audioId;',
'                container.style.padding = ''10px'';',
'                container.style.border = ''1px solid #ccc'';',
'                container.style.borderRadius = ''5px'';',
'                container.style.marginTop = ''10px'';',
'                container.style.backgroundColor = ''#f9f9f9'';',
'                // Intentar con un reproductor de audio',
'                var audioPlayer = document.createElement(''audio'');',
'                audioPlayer.controls = true;',
'                audioPlayer.style.width = ''100%'';',
'                audioPlayer.style.marginBottom = ''10px'';',
'                // Usar el tipo MIME exacto',
'                var source = document.createElement(''source'');',
'                source.src = "data:audio/ogg;base64, "+blobUrl;',
'                source.type = ''audio/ogg; codecs=opus'';',
'                audioPlayer.appendChild(source);',
'                // Mensaje sobre posible compatibilidad',
'                var compatMsg = document.createElement(''div'');',
unistr('                compatMsg.textContent = ''Si el audio no se reproduce, utiliza el bot\00F3n de descarga a continuaci\00F3n.'';'),
'                compatMsg.style.fontSize = ''12px'';',
'                compatMsg.style.marginBottom = ''10px'';',
unistr('                // Bot\00F3n de descarga como alternativa'),
'                var downloadButton = document.createElement(''a'');',
'                downloadButton.href = "data:audio/ogg;base64, "+blobUrl;',
'                downloadButton.className = ''t-Button t-Button--hot'';',
'                downloadButton.innerHTML = ''<span class="fa fa-download"></span> Descargar audio'';',
'                downloadButton.download = ''audio_'' + audioId + ''.ogg'';',
'                downloadButton.style.display = ''block'';',
'                downloadButton.style.textAlign = ''center'';',
unistr('                // A\00F1adir elementos al contenedor'),
'                container.appendChild(audioPlayer);',
'                container.appendChild(compatMsg);',
'                container.appendChild(downloadButton);',
unistr('                // Insertar el contenedor despu\00E9s del bot\00F3n'),
'                button.parentNode.insertBefore(container, button.nextSibling);',
'                // Manejar eventos del reproductor',
'                audioPlayer.addEventListener(''play'', function() {',
'                    icon.classList.remove(''fa-spinner'', ''fa-spin'');',
'                    icon.classList.add(''fa-volume-up'');',
'                });',
'                audioPlayer.addEventListener(''error'', function(e) {',
'                    console.error(''Error al reproducir:'', e);',
unistr('                    // Resaltar el bot\00F3n de descarga'),
'                    downloadButton.style.fontWeight = ''bold'';',
'                    // Cambiar el icono',
'                    icon.classList.remove(''fa-spinner'', ''fa-spin'');',
'                    icon.classList.add(''fa-play'');',
'                });',
'                console.log('' sin refresh '');',
'                apex.item("P105_REFRESH").setValue(''NO'');',
'                habilitarRefresh();                ',
unistr('                // Si no se ha reproducido despu\00E9s de un tiempo'),
'                setTimeout(function() {',
'                    if (icon.classList.contains(''fa-spinner'')) {',
'                    icon.classList.remove(''fa-spinner'', ''fa-spin'');',
'                    icon.classList.add(''fa-play'');',
'                    }',
'                }, 3000);',
'            } else {      ',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }       ',
'        }',
'    }).always( function() {',
'        waitPopup.remove();',
'    });',
'}',
'function base64ToBlob(base64, mimeType) {',
'    const byteCharacters = atob(base64);',
'    const byteNumbers = new Array(byteCharacters.length);',
'    ',
'    for (let i = 0; i < byteCharacters.length; i++) {',
'        byteNumbers[i] = byteCharacters.charCodeAt(i);',
'    }',
'    ',
'    const byteArray = new Uint8Array(byteNumbers);',
'    return new Blob([byteArray], { type: mimeType });',
'}',
'',
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function responder(){',
'    apex.theme.openRegion(''REG_RESPONDER'');',
'}',
'function enviarmensaje() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("EnviarAjax",',
'    {',
'        pageItems: [',
'            "P105_ID"',
'           ,"P105_RESPONDER"',
'           ,"P105_ID_DEVICE"',
'        ]',
'    },',
'    {  ',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.region(''REG_CHATS'').refresh();',
'                apex.region(''chat-messages'').refresh();',
'                setTimeout(function(){',
'                    apex.item("P105_RESPONDER").setFocus();',
'                },500);               ',
'            } else {      ',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }       ',
'        }',
'    }).always( function() {',
'        waitPopup.remove();        ',
'    });',
'}',
'function n_enviarmensaje() {',
'   //var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("EnviarNewAjax",',
'    {',
'        pageItems: [',
'            "P105_N_NUMERO"',
'           ,"P105_N_RESPONDER"',
'           ,"P105_ID_DEVICE"',
'        ]',
'    },',
'    {  ',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.theme.closeRegion(''REG_NUEVO_MSG'');',
'                apex.region(''REG_CHATS'').refresh();',
'                apex.region(''chat-messages'').refresh();',
'                setTimeout(function(){',
'                    apex.item("P105_RESPONDER").setFocus();',
'                },500);               ',
'            } else {      ',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }       ',
'        }',
'    }).always( function() {',
'        //waitPopup.remove();',
'    });',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'connectWebSocket(); ',
'/*setInterval(() =>{',
'    if (apex.item("P105_REFRESH").getValue()==''SI'') {',
'        apex.region("REG_MASTER").refresh();',
'        if (!apex.item("P105_ID").isEmpty()){',
'            apex.region("REG_CHATS").refresh();',
'            apex.region("chat-messages").refresh();',
'        }',
'    }',
'}, 2500)*/'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('/* Selector extremadamente espec\00EDfico */'),
'div[id="BTN_RESP_MSG"], ',
'div[id="BTN_PLANTILLA_MSG"], ',
'div[id="BTN_ARCHIVO_MSG"],',
'#BTN_RESP_MSG, ',
'#BTN_PLANTILLA_MSG, ',
'#BTN_ARCHIVO_MSG,',
'button[id="BTN_RESP_MSG"], ',
'button[id="BTN_PLANTILLA_MSG"], ',
'button[id="BTN_ARCHIVO_MSG"] {',
'    flex-basis: auto !important;',
'    max-width: none !important;',
'    width: auto !important;',
'    min-width: 95px !important;',
'}',
'',
unistr('/* Anular tambi\00E9n para los contenedores padre */'),
'div[id="BTN_RESP_MSG"] .t-Button,',
'div[id="BTN_PLANTILLA_MSG"] .t-Button,',
'div[id="BTN_ARCHIVO_MSG"] .t-Button,',
'#BTN_RESP_MSG .t-Button,',
'#BTN_PLANTILLA_MSG .t-Button,',
'#BTN_ARCHIVO_MSG .t-Button {',
'    width: auto !important;',
'    max-width: none !important;',
'}',
'',
unistr('/* Anular cualquier restricci\00F3n en los contenedores padre */'),
'.col-1[id^="BTN_"],',
'.col.col-1[id^="BTN_"],',
'div.col.col-1[id^="BTN_"] {',
'    flex-basis: auto !important;',
'    max-width: none !important;',
'    width: auto !important;',
'}',
'',
'.audio-btn {',
'  cursor: pointer;',
'}',
'.audio-btn:hover {',
'  opacity: 0.8;',
'}',
'',
'#t_Footer {',
'    display: none!important',
'}',
'',
'.t-BreadcrumbRegion {',
'    padding: 0px;',
'}',
'',
'.t-Body-content {',
'    background-image: url(#WORKSPACE_FILES#fondoWha.png);',
'    background-color: hsl(120, 3%, 25%);',
'}',
'',
'.t-Body-side {',
'    display: flex;',
'    flex-direction: column;',
'    overflow: hidden;',
'}',
'',
'.t-MediaList-itemWrap {',
'    padding-left: 0px;',
'    padding-right: 0px;',
'    padding-bottom: 8px;',
'    padding-top: 8px;',
'    grid-gap: 0;',
'}',
'',
'.search-results {',
'    flex: 1;',
'    overflow: auto;',
'}',
'',
'.search-region {',
'    border-bottom: 1px solid rgba(0,0,0,.1);',
'    flex-shrink: 0;',
'}',
'',
'button#post-message-btn {',
'    top: 8px;',
'}',
'',
'.t-Comments-userIcon {',
'    display: none;',
'}',
'',
'.t-Chat .t-Chat--own .t-Comments-icon {',
'  margin-right: 0;',
'  margin-left: 12px;',
'}',
'',
'.t-ContentBlock-header {',
'    margin-bottom: 0px; ',
'}',
'    ',
'.t-Chat .t-Chat--own {',
'  flex-direction: row-reverse;',
'}',
' ',
'.t-Chat .t-Chat--own .t-Comments-body {',
'  align-items: flex-end;',
'}',
'/* ',
'.t-Chat .t-Chat--own .t-Comments-comment:after {',
'  border-left-color: hsl(152, 79%, 23%); ',
'  border-right-color: rgb(0,0,0,0); ',
'  right: none;',
'  left: 100%;',
'}',
'*/',
'.t-Comments--chat .t-Comments-comment:after {',
'    border-right-color:hsl(150, 5%, 40%); ',
'}',
'',
'.t-Comments--chat .t-Comments-comment {',
'    background-color:hsl(150, 5%, 40%); ',
'    color: aliceblue;',
'}',
'',
'#chat-messages,',
'#REG_DET_CHATS {',
'  background-color: rgba(255, 255, 255, 0.5); /* Fondo blanco con 50% de opacidad */',
'  border: none; /* Elimina el borde si lo tiene */',
'}',
'',
'#REG_CHATS {',
'  background-color: rgba(255, 255, 255, 0.85); /* Fondo blanco con 50% de opacidad */',
'  border: none; /* Elimina el borde si lo tiene */',
'}',
'',
'.t-Comments--chat .t-Chat--own .t-Comments-comment:after {',
'    border-right-color:#0c693e; ',
'}',
'',
'.t-Comments--chat .t-Chat--own .t-Comments-comment {',
'    background-color:#0c693e; ',
'    color: aliceblue;',
'}',
'',
'.t-Chat .t-Chat--own .t-Comments-comment:after {',
'  border-left-color: #0c693e; ',
'  border-right-color: #00000000; ',
'  right: none;',
'  left: 100%;',
'}',
'',
'#REMOTE_JID {',
'    display: none;',
'}',
'',
'#main div.t-Body-contentInner {',
'    padding-left: 15px;',
'    padding-right: 15px;',
'    padding-top: 15px;',
'    padding-bottom: 15px;',
'}'))
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://cdn.socket.io/4.7.4/socket.io.min.js',
'#APP_FILES#websocket-proxy#MIN#.js',
''))
,p_page_component_map=>'27'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(78890529113537483)
,p_plug_name=>'Master Records'
,p_region_name=>'REG_MASTER'
,p_region_css_classes=>'search-results'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_02'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID",',
'    null LINK_CLASS,',
'    apex_page.get_url(p_items => ''P105_ID'', p_values => "ID") LINK,',
'    CASE WHEN x.read = 0 THEN ''fa fa-check'' ELSE ''fa fa-fw'' END ICON_CLASS,',
'    null LINK_ATTR,',
'    CASE WHEN x.read = 0 THEN ''u-color-success'' ELSE ''u-color-transparent'' END ICON_COLOR_CLASS,',
'    case when coalesce(:P105_ID,''0'') = "ID"',
'      then ''is-active'' ',
'      else '' ''',
'    end LIST_CLASS,',
'    CASE WHEN SubStr(remote_jid,1,3) = ''595'' AND InStr(remote_jid,''-'') = 0 THEN',
'        Translate( To_Char(remote_jid,''000g000g000000''),'',.'',''--'')',
'    ELSE',
'        remote_jid',
'    END LIST_TITLE,',
'    (substr("PUSH_NAME", 1, 50)||( case when length("PUSH_NAME") > 50 then ''...'' else '''' end )) LIST_TEXT,',
'    null LIST_BADGE,',
'    x.READ,',
'    x.CATEGORY,',
'    CASE WHEN x.READ = 0 THEN ''success'' ELSE NULL END AS STATE,',
'    NULL READ_CLASS,',
'    x.MODIFIED',
'from "CHATS" x',
'where :P105_P_TIENE_ACCESO = ''SI''',
'and x.device_id = :P105_ID_DEVICE',
'and (:P105_SEARCH is null',
'        or upper(x."REMOTE_JID") like ''%''||upper(:P105_SEARCH)||''%''',
'        or upper(x."PUSH_NAME") like ''%''||upper(:P105_SEARCH)||''%''',
'    )',
'--and (NVL(:P105_RUBRO,''X'') = ''X'' OR (x.CATEGORY = :P105_RUBRO OR x.CATEGORY IS NULL) )',
'and (:APP_ID_INFORMATICA = :P105_P_ID_DEPARTAMENTO OR (x.sec_id_seccion = :P105_SECCION OR x.sec_id_seccion IS NULL))'))
,p_query_order_by_type=>'STATIC'
,p_query_order_by=>'READ ASC , MODIFIED DESC'
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$MEDIA_LIST'
,p_ajax_items_to_submit=>'P105_SEARCH,P105_ID_DEVICE,P105_RUBRO,P105_P_TIENE_ACCESO,P105_SECCION'
,p_plug_query_num_rows=>2000
,p_plug_query_num_rows_type=>'SET'
,p_plug_query_no_data_found=>'<div class="u-tC">Sin chats.</div>'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_row_selection_type=>'FOCUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'N',
  'AVATAR_INITIALS', 'CATEGORY',
  'AVATAR_SHAPE', 't-Avatar--rounded',
  'AVATAR_TYPE', 'initials',
  'BADGE_LABEL', 'Leido',
  'BADGE_LABEL_DISPLAY', 'N',
  'BADGE_STATE', 'STATE',
  'BADGE_VALUE', 'READ_CLASS',
  'DESCRIPTION', 'LIST_TEXT',
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'Y',
  'TITLE', 'LIST_TITLE')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79346635769184144)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79346775143184145)
,p_name=>'LINK_CLASS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LINK_CLASS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79346798314184146)
,p_name=>'LINK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LINK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79346930519184147)
,p_name=>'ICON_CLASS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ICON_CLASS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79346998090184148)
,p_name=>'LINK_ATTR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LINK_ATTR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79347161684184149)
,p_name=>'ICON_COLOR_CLASS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ICON_COLOR_CLASS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>60
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79347270264184150)
,p_name=>'LIST_CLASS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LIST_CLASS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>70
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79347312677184151)
,p_name=>'LIST_TITLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LIST_TITLE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>80
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79347431927184152)
,p_name=>'LIST_TEXT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LIST_TEXT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>90
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79347544494184153)
,p_name=>'LIST_BADGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LIST_BADGE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>100
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79347602994184154)
,p_name=>'READ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'READ'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>110
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79347696080184155)
,p_name=>'CATEGORY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CATEGORY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>120
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79347857053184156)
,p_name=>'STATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>130
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79347900800184157)
,p_name=>'MODIFIED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MODIFIED'
,p_data_type=>'TIMESTAMP'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>140
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(79347992964184158)
,p_name=>'READ_CLASS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'READ_CLASS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>150
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(79348754842184165)
,p_plug_name=>'Resumen sin leer'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>110
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.descripcion AS rubro',
'      ,Count(*) cantidad',
'FROM chats c',
'    ,seccion s',
'WHERE c.device_id = :P105_ID_DEVICE',
'AND s.id_seccion = c.sec_id_seccion',
'AND c.read = 0',
'GROUP BY s.descripcion',
'UNION ALL ',
'SELECT ''Sin definir'' AS rubro',
'      ,Count(*) cantidad',
'FROM chats c',
'WHERE c.device_id = :P105_ID_DEVICE',
'AND c.sec_id_seccion IS NULL ',
'AND c.read = 0'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P105_ID_DEVICE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(79348793363184166)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>14422103069295932
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(79348940452184167)
,p_db_column_name=>'RUBRO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Rubro'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(79349060299184168)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(79380896885160045)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'144543'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RUBRO:CANTIDAD'
,p_sum_columns_on_break=>'CANTIDAD'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(81711619225615239)
,p_plug_name=>'Enviar archivo'
,p_region_name=>'REG_ENVIAR_ARCHIVO'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:t-DialogRegion--noPadding:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>120
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87692667932655947)
,p_plug_name=>'Plantilla mensaje'
,p_region_name=>'REG_PLANTILLA'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>100
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(101030651131354374)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(86947038457749062)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(101032051865354195)
,p_plug_name=>'Search'
,p_region_css_classes=>'search-region padding-md'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(101037420387353883)
,p_name=>'&P105_NUMERO.'
,p_region_name=>'REG_CHATS'
,p_template=>2322115667525957943
,p_display_sequence=>10
,p_region_css_classes=>'js-master-region'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h1:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       DEVICE_ID,',
'       USER_NAME,',
'       NAME,',
'       CREATED,',
'       MODIFIED,',
'       PUSH_NAME,',
'       CASE WHEN SubStr(remote_jid,1,3) = ''595'' AND InStr(remote_jid,''-'') = 0 THEN',
'            Translate( To_Char(remote_jid,''000g000g000000''),'',.'',''--'')',
'       ELSE',
'            remote_jid',
'       END REMOTE_JID',
'  from CHATS',
' where "ID" = :P105_ID'))
,p_display_when_condition=>'P105_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P105_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>unistr('>No selecciono una conversaci\00F3n</')
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101038089082353882)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Id'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "CHATS"',
'where "ID" is not null',
'and "ID" = :P105_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101038473441353881)
,p_query_column_id=>2
,p_column_alias=>'DEVICE_ID'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "CHATS"',
'where "DEVICE_ID" is not null',
'and "ID" = :P105_ID'))
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101038854834353881)
,p_query_column_id=>3
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'User Name'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "CHATS"',
'where "USER_NAME" is not null',
'and "ID" = :P105_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101039314884353881)
,p_query_column_id=>4
,p_column_alias=>'NAME'
,p_column_display_sequence=>4
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "CHATS"',
'where "NAME" is not null',
'and "ID" = :P105_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101039621798353881)
,p_query_column_id=>5
,p_column_alias=>'CREATED'
,p_column_display_sequence=>5
,p_column_heading=>'Creado'
,p_column_format=>'DD-MM-YYYY HH24:MI:SS'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'NEVER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101040040410353881)
,p_query_column_id=>6
,p_column_alias=>'MODIFIED'
,p_column_display_sequence=>6
,p_column_heading=>'Ultimo chat'
,p_column_format=>'DD-MM-YYYY HH24:MI:SS'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'NEVER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101040428835353880)
,p_query_column_id=>7
,p_column_alias=>'PUSH_NAME'
,p_column_display_sequence=>7
,p_column_heading=>'Nombre'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'NEVER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101040878899353880)
,p_query_column_id=>8
,p_column_alias=>'REMOTE_JID'
,p_column_display_sequence=>8
,p_column_heading=>'Remote Jid'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "CHATS"',
'where "REMOTE_JID" is not null',
'and "ID" = :P105_ID'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(101046780035353872)
,p_plug_name=>'Region Display Selector'
,p_region_css_classes=>'js-detail-rds'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P105_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(101071361417353719)
,p_plug_name=>'No Record Selected'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>60
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P105_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(112378451852363459)
,p_plug_name=>'Detalle chats'
,p_region_name=>'REG_DET_CHATS'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P105_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(101047153029353871)
,p_name=>'Detalle de chats'
,p_region_name=>'chat-messages'
,p_parent_plug_id=>wwv_flow_imp.id(112378451852363459)
,p_template=>3371237801798025892
,p_display_sequence=>40
,p_region_css_classes=>'t-Chat'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Comments--chat'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select C.USERNAME user_name,',
'       CASE ',
'       WHEN C.MIME_TYPE = ''audio/ogg; codecs=opus'' THEN',
'            TO_CLOB(''<button type="button" onclick="obtenerBlob('' || C.ID || '')" class="t-Button t-Button--icon t-Button--normal t-Button--noUI t-Button--iconLeft audio-btn" data-id="'' || C.ID || ''"><span aria-hidden="true" class="t-Icon t-Icon--left'
||' fa fa-play"></span>Audio</button>'')',
'       WHEN MIME_TYPE = ''image/jpeg'' THEN',
'            TO_CLOB(''<button type="button" onclick="obtenerImg('' || C.ID || '')" class="t-Button t-Button--icon t-Button--normal t-Button--noUI t-Button--iconLeft imagen-btn" data-id="'' || C.ID || ''"><span aria-hidden="true" class="t-Icon t-Icon--left'
||' fa fa-image"></span>Imagen</button>'')',
'       WHEN MIME_TYPE = ''application/pdf'' THEN',
'            TO_CLOB(''<button type="button" onclick="obtenerDocum('' || C.ID ||'',''||''''''''||C.FILE_NAME||''''''''||'')" class="t-Button t-Button--icon t-Button--normal t-Button--noUI t-Button--iconLeft pdf-btn" data-id="'' || C.ID || ''"><span aria-hidden="true'
||'" class="t-Icon t-Icon--left fa fa-file-pdf-o"></span>PDF</button>'')',
'       ELSE',
'            C.MESSAGE',
'       END comment_text,',
'       CASE WHEN trunc(C.CREATED,''DD'') = trunc(SYSDATE,''DD'') THEN ',
'            to_char(C.CREATED,''hh24:mi'')',
'       ELSE',
'            to_char(C.CREATED,''dd-mm-yyyy hh24:mi'')',
unistr('       END || CASE WHEN C.OWNER = ''S'' THEN NULL ELSE '' >> le\00EDdo ''||'),
'           CASE WHEN trunc(C.READ,''DD'') = trunc(SYSDATE,''DD'') THEN ',
'                to_char(C.READ,''hh24:mi'')',
'           ELSE',
'                to_char(C.READ,''dd-mm-yyyy hh24:mi'')',
'           END ||'' (''||C.READ_BY||'')''',
'       END ||CASE WHEN M.SEND_BY IS NOT NULL THEN ''>>'' ELSE NULL END|| M.SEND_BY comment_date,',
'       apex_string.get_initials(C.USERNAME) user_icon,',
'       NULL AS actions,',
'       NULL AS attribute_1,',
'       NULL AS attribute_2,',
'       NULL AS attribute_3,',
'       NULL AS attribute_4,',
'       CASE C.OWNER WHEN ''S'' THEN ''t-Chat--own'' ELSE NULL END comment_modifiers',
'  from CHATS_DETAILS C, MESSAGE_ID_SEND M',
' where C.CHAT_ID = :P105_ID',
'   and M.MESSAGE_ID(+) = C.MESSAGE_ID',
'  order by C.CREATED DESC'))
,p_display_when_condition=>'P105_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P105_ID'
,p_lazy_loading=>false
,p_query_row_template=>2613168815517880001
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No se encuentran chats.'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_query_row_count_max=>200
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112377427026363449)
,p_query_column_id=>1
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>10
,p_column_heading=>'User Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112377556795363450)
,p_query_column_id=>2
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>20
,p_column_heading=>'Comment Text'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112377698569363451)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>30
,p_column_heading=>'Comment Date'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112377755419363452)
,p_query_column_id=>4
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>40
,p_column_heading=>'User Icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112377844551363453)
,p_query_column_id=>5
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>50
,p_column_heading=>'Actions'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112377926427363454)
,p_query_column_id=>6
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>60
,p_column_heading=>'Attribute 1'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112378096153363455)
,p_query_column_id=>7
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>70
,p_column_heading=>'Attribute 2'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112378120832363456)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>80
,p_column_heading=>'Attribute 3'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112378237363363457)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>90
,p_column_heading=>'Attribute 4'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112378366911363458)
,p_query_column_id=>10
,p_column_alias=>'COMMENT_MODIFIERS'
,p_column_display_sequence=>100
,p_column_heading=>'Comment Modifiers'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(113530389622267843)
,p_plug_name=>'Responder'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody:margin-top-sm:margin-bottom-none'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P105_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(120412734970711841)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>70
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(121759143121017953)
,p_plug_name=>'Nuevo mensaje'
,p_region_name=>'REG_NUEVO_MSG'
,p_region_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--md'
,p_plug_template=>1660973136434625155
,p_plug_display_sequence=>80
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(135817684167990373)
,p_plug_name=>unistr('Informaci\00F3n cliente')
,p_region_name=>'REG_CLIENTE'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>90
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT jt.*',
'FROM dual,',
'   JSON_TABLE(',
'       pkg_wapi.p_clientes_tel(:P105_ID),',
'       ''$.cliente[*]'' COLUMNS (',
'           ID_PACIENTE NUMBER PATH ''$.ID_PACIENTE'',',
'           CI VARCHAR2(20) PATH ''$.CI'',',
'           NOMBRE VARCHAR2(100) PATH ''$.NOMBRE''',
'       )',
'   ) jt',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P105_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_plug_footer=>unistr('Clientes que cuentan con este n\00FAmero de tel\00E9fono')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(135817799103990374)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>62084780039983634
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(135817905347990375)
,p_db_column_name=>'ID_PACIENTE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Paciente'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(135817973886990376)
,p_db_column_name=>'CI'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Ci'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(135818116157990377)
,p_db_column_name=>'NOMBRE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(142055801414137603)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'683228'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_PACIENTE:CI:NOMBRE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(101417107354766341)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(113530389622267843)
,p_button_name=>'RESPONDER'
,p_button_static_id=>'BTN_RESP_MSG'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--gapTop'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Enviar mensaje'
,p_button_redirect_url=>'javascript:enviarmensaje()'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-paper-plane'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_security_scheme=>wwv_flow_imp.id(113261615741307790)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(87692870785655949)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(113530389622267843)
,p_button_name=>'PLANTILLA'
,p_button_static_id=>'BTN_PLANTILLA_MSG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--gapTop'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Plantilla mensaje'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-signature'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_security_scheme=>wwv_flow_imp.id(113261615741307790)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(121759349094017955)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(121759143121017953)
,p_button_name=>'N_RESPONDER'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--gapTop'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Enviar mensaje'
,p_button_redirect_url=>'javascript:n_enviarmensaje()'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-paper-plane'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_security_scheme=>wwv_flow_imp.id(113261615741307790)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(81711304750615236)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(113530389622267843)
,p_button_name=>'ARCHIVO'
,p_button_static_id=>'BTN_ARCHIVO_MSG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--gapTop'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Enviar archivo'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-search'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_security_scheme=>wwv_flow_imp.id(113261615741307790)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(135818462437990381)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(135817684167990373)
,p_button_name=>'BTN_RETORNAR_CLI'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(81711814395615241)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(81711619225615239)
,p_button_name=>'BTN_ARCHIVO_RETORNAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(81712124677615244)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(81711619225615239)
,p_button_name=>'BTN_ENVIAR_ARCHIVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enviar'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
,p_show_processing=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(87693217148655952)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(87692667932655947)
,p_button_name=>'Utilizar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Utilizar'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(113582667816365541)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(101037420387353883)
,p_button_name=>'DELETE'
,p_button_static_id=>'BTN_ELIMINAR_CHAT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--danger:t-Button--link'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Eliminar'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-trash-o'
,p_button_cattributes=>'title=''Eliminar chat'''
,p_security_scheme=>wwv_flow_imp.id(113261742705306785)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(135817535060990372)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(101037420387353883)
,p_button_name=>'INFO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--danger:t-Button--link'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>unistr('Informaci\00F3n')
,p_button_position=>'EDIT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-info'
,p_button_cattributes=>unistr('title=''Informaci\00F3n del cliente/paciente''')
,p_security_scheme=>wwv_flow_imp.id(113261346546309040)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(101071830427353718)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(101037420387353883)
,p_button_name=>'EDIT'
,p_button_static_id=>'edit_master_btn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Editar'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:106:&APP_SESSION.::&DEBUG.:RP,106:P106_ID:&P105_ID.'
,p_icon_css_classes=>'fa-pencil-square-o'
,p_security_scheme=>wwv_flow_imp.id(113261346546309040)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(79349595851184174)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(101037420387353883)
,p_button_name=>'BTN_NO_LEIDO'
,p_button_static_id=>'BTN_NO_LEIDO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>unistr('Marcar como no le\00EDdo')
,p_button_position=>'EDIT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-low-vision'
,p_security_scheme=>wwv_flow_imp.id(113261346546309040)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(121758986565017951)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(101030651131354374)
,p_button_name=>'SEND'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--noUI:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Nuevo'
,p_button_position=>'NEXT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P105_P_TIENE_ACCESO'
,p_button_condition2=>'SI'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-send-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(101031325709354195)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(101030651131354374)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--noUI:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Resetear'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:105:&APP_SESSION.:RESET:&DEBUG.:RP,105::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(79349136107184169)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(101030651131354374)
,p_button_name=>'BTN_VER_SIN_LEER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Resumen sin leer'
,p_button_position=>'PREVIOUS'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-polar-chart'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(65343284538574960)
,p_name=>'P105_P_ID_DEPARTAMENTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(120412734970711841)
,p_prompt=>'P Id Departamento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(65343334317574961)
,p_name=>'P105_P_ID_SECCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(120412734970711841)
,p_prompt=>'P Id Seccion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(65343446734574962)
,p_name=>'P105_P_TIENE_ACCESO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(120412734970711841)
,p_prompt=>'P Tiene Acceso'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(65343553238574963)
,p_name=>'P105_SECCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(101030651131354374)
,p_item_display_point=>'NEXT'
,p_prompt=>unistr('Secci\00F3n (cola)')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.descripcion AS d',
'      ,s.id_seccion AS r',
'FROM seccion s',
'WHERE (:P105_P_ID_DEPARTAMENTO = :APP_ID_INFORMATICA',
'OR s.id_seccion = :P105_P_ID_SECCION)',
'AND s.cola_bot = 1'))
,p_lov_cascade_parent_items=>'P105_P_ID_DEPARTAMENTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_tag_attributes=>'style="font-size: 11px;"'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'N',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(65344093269574968)
,p_name=>'P105_P_JID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(120412734970711841)
,p_prompt=>'P Jid'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66863046683414740)
,p_name=>'P105_P_WAPI_URL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(120412734970711841)
,p_item_default=>'APP_WAPI_URL'
,p_item_default_type=>'ITEM'
,p_prompt=>'P Wapi Url'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66863220959414741)
,p_name=>'P105_P_WAPI_KEY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(120412734970711841)
,p_item_default=>'APP_WAPI_KEY'
,p_item_default_type=>'ITEM'
,p_prompt=>'P Wapi Key'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66863281920414742)
,p_name=>'P105_P_SESSION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(120412734970711841)
,p_prompt=>'P Session'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(79348357961184161)
,p_name=>'P105_P_URL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(120412734970711841)
,p_prompt=>'P Url'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(79348464810184162)
,p_name=>'P105_RUBRO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(101030651131354374)
,p_item_display_point=>'NEXT'
,p_item_default=>'X'
,p_prompt=>'Rubro'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Urgencia;U,Consulta;C,Todos;X,Laboratorio;L'
,p_cHeight=>1
,p_tag_attributes=>'style="font-size: 11px;"'
,p_display_when_type=>'NEVER'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'N',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(81711732014615240)
,p_name=>'P105_NEW_ARCHIVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(81711619225615239)
,p_display_as=>'NATIVE_FILE'
,p_cSize=>300
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_multiple_files', 'N',
  'display_as', 'DROPZONE_INLINE',
  'max_file_size', '10000',
  'purge_file_at', 'REQUEST',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(87692739438655948)
,p_name=>'P105_P_PLANTILLA_MENSAJE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(87692667932655947)
,p_prompt=>'Mensaje'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT texto as d, texto as r',
'FROM wha_plantilla_msg',
'WHERE estado = ''ACTIVO'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88736666223245241)
,p_name=>'P105_ID_DEVICE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(101030651131354374)
,p_item_display_point=>'NEXT'
,p_prompt=>'Device'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_INSTANCIAS_WAPI'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT phone_number||'' ''||name AS d',
'       ,id AS r',
'       ,key',
'FROM devices',
'WHERE pkg_wapi.check_instance(key) = 1',
'AND suc_id_sucursal = :APP_ID_SUCURSAL',
''))
,p_cHeight=>1
,p_tag_attributes=>'style="font-size: 11px;"'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89531871607599550)
,p_name=>'P105_P_ID_CHAT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(120412734970711841)
,p_item_default=>'23315'
,p_prompt=>'P Id Chat'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(101032551548354194)
,p_name=>'P105_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(101032051865354195)
,p_prompt=>'Buscar'
,p_placeholder=>'Buscar...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(101046461800353872)
,p_name=>'P105_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(101037420387353883)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(113530449591267844)
,p_name=>'P105_RESPONDER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(113530389622267843)
,p_placeholder=>'Escribe un mensaje'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>3000
,p_cMaxlength=>500
,p_grid_label_column_span=>0
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(120412877551711842)
,p_name=>'P105_NUMERO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(120412734970711841)
,p_prompt=>'Numero'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(121759249900017954)
,p_name=>'P105_N_RESPONDER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(121759143121017953)
,p_prompt=>'N Responder'
,p_placeholder=>'Escribe un mensaje'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>200
,p_cMaxlength=>200
,p_colspan=>4
,p_grid_label_column_span=>0
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(121759716890017958)
,p_name=>'P105_N_NUMERO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(121759143121017953)
,p_prompt=>unistr('N\00FAmero')
,p_placeholder=>'595981429971'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(134584507166309154)
,p_name=>'P105_CHAT_DETAIL_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(120412734970711841)
,p_prompt=>'Chat Detail Id'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(135815983728990356)
,p_name=>'P105_REFRESH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(120412734970711841)
,p_item_default=>'NO'
,p_prompt=>'Refresh'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(101072125066353718)
,p_name=>'Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(101037420387353883)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(101072813761353718)
,p_event_id=>wwv_flow_imp.id(101072125066353718)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(101037420387353883)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(101073243670353717)
,p_event_id=>wwv_flow_imp.id(101072125066353718)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Chats row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(101047233568353871)
,p_name=>'Dialog Closed'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(101047153029353871)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(101056958203353746)
,p_event_id=>wwv_flow_imp.id(101047233568353871)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(101047153029353871)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(101057489725353745)
,p_event_id=>wwv_flow_imp.id(101047233568353871)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Chats Details row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(101072310848353718)
,p_name=>'Perform Search'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P105_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(101074526733353716)
,p_event_id=>wwv_flow_imp.id(101072310848353718)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(113531201673267851)
,p_name=>'Refresca '
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(101071830427353718)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(113531269039267852)
,p_event_id=>wwv_flow_imp.id(113531201673267851)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(101037420387353883)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(113531414361267853)
,p_event_id=>wwv_flow_imp.id(113531201673267851)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(101047153029353871)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(121724592976481146)
,p_name=>'Responder'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P105_RESPONDER'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.keyCode===13&&!apex.item("P105_RESPONDER").isEmpty()'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(121724670436481147)
,p_event_id=>wwv_flow_imp.id(121724592976481146)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'enviarmensaje()'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(121759801557017959)
,p_name=>'N_Responder'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P105_N_RESPONDER'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.keyCode===13&&!apex.item("P105_N_RESPONDER").isEmpty()'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(121759872188017960)
,p_event_id=>wwv_flow_imp.id(121759801557017959)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'n_enviarmensaje()'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(121724971669481150)
,p_name=>'Al refrescar'
,p_event_sequence=>190
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(101047153029353871)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(121725105400481151)
,p_event_id=>wwv_flow_imp.id(121724971669481150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE chats c',
'SET c.read = 1',
'   ,c.modified = ( CURRENT_TIMESTAMP + INTERVAL ''1'' HOUR )',
'WHERE c.id = :P105_ID',
'AND c.read = 0;',
'IF SQL%rowcount > 0 THEN',
'    COMMIT;',
'END IF;'))
,p_attribute_02=>'P105_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(121759473042017956)
,p_name=>'Enviar nuevo'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(121758986565017951)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(121759540515017957)
,p_event_id=>wwv_flow_imp.id(121759473042017956)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(121759143121017953)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(135818206827990378)
,p_name=>'Ver region data clie'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(135817535060990372)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(135818375290990380)
,p_event_id=>wwv_flow_imp.id(135818206827990378)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(135817684167990373)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(135818235721990379)
,p_event_id=>wwv_flow_imp.id(135818206827990378)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(135817684167990373)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(135818544198990382)
,p_name=>'Regresar cli'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(135818462437990381)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(135818699888990383)
,p_event_id=>wwv_flow_imp.id(135818544198990382)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(135817684167990373)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87692981404655950)
,p_name=>'IrPlantilla'
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(87692870785655949)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87693052821655951)
,p_event_id=>wwv_flow_imp.id(87692981404655950)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(87692667932655947)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87693254004655953)
,p_name=>'SetPlantilla'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(87693217148655952)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87693625751655957)
,p_event_id=>wwv_flow_imp.id(87693254004655953)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item("P105_RESPONDER").setValue( apex.item("P105_P_PLANTILLA_MENSAJE").getValue() );',
'apex.theme.closeRegion("REG_PLANTILLA");',
'apex.item("P105_RESPONDER").setFocus();',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(79349202105184170)
,p_name=>'VerResumenSinLectura'
,p_event_sequence=>250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(79349136107184169)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(79349424774184172)
,p_event_id=>wwv_flow_imp.id(79349202105184170)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(79348754842184165)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(79349298201184171)
,p_event_id=>wwv_flow_imp.id(79349202105184170)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(79348754842184165)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(79349725514184175)
,p_name=>'MarcarNoLeido'
,p_event_sequence=>260
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(79349595851184174)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(79349847396184176)
,p_event_id=>wwv_flow_imp.id(79349725514184175)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.submit( { request: "MARCA_SIN_LEER", showWait: true} );'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(81711413851615237)
,p_name=>'EnviarArchivo'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(81711304750615236)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(81711531041615238)
,p_event_id=>wwv_flow_imp.id(81711413851615237)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(81711619225615239)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(81711943714615242)
,p_name=>'Arch_retornar'
,p_event_sequence=>280
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(81711814395615241)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(81712064530615243)
,p_event_id=>wwv_flow_imp.id(81711943714615242)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(81711619225615239)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(113582748647365542)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_wapi.p_delete_chat( pi_chat_id => :P105_ID);',
':P105_ID := NULL;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(113582667816365541)
,p_internal_uid=>39849729583358802
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(79349969717184177)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Marcar sin leer'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update chats',
'set read = 0',
'where id = :P105_ID;',
':P105_ID := NULL;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'MARCA_SIN_LEER'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>14423279423295943
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(81711208921615235)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Enviar archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    dummy       number;',
'    v_id_arch   number;',
'BEGIN',
'    select 1',
'    into dummy',
'    from apex_application_temp_files',
'    fetch first 1 row only;',
'    FOR i IN (',
'        select *',
'        from apex_application_temp_files',
'        fetch first 1 row only        ',
'    ) LOOP',
'        INSERT INTO tmp_file_whatsapp (',
'              id_file',
'            , chat_id',
'            , file_name',
'            , file_mime_type',
'            , file_length',
'            , file_blob',
'            , load_day',
'        ) VALUES (',
'             NULL           --id_file',
'            ,:P105_ID       --chat_id',
'            ,i.filename     --file_name',
'            ,i.mime_type    --file_mime_type',
'            ,NULL           --file_length',
'            ,i.blob_content --file_blob',
'            ,SYSDATE        --load_day',
'        ) RETURNING id_file INTO v_id_arch;',
'        COMMIT;',
'        pkg_wapi.p_enviar_archivo(',
'            pi_id_device    => :P105_ID_DEVICE ',
'          , pi_remote_jid   => :P105_ID',
'          , pi_id_archivo   => v_id_arch ',
'          , pi_mensaje      => :P105_RESPONDER',
'        );',
'    END LOOP;',
'EXCEPTION',
'    WHEN NO_DATA_FOUND THEN',
'        RAISE_APPLICATION_ERROR(-20000,''No existe archivo a enviar, favor seleccione.'');    ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(81712124677615244)
,p_internal_uid=>16784518627727001
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(120413517751711848)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P105_ID_DEVICE IS NULL THEN',
'    BEGIN',
'        SELECT id, key',
'        INTO :P105_ID_DEVICE, :P105_P_SESSION',
'        FROM devices',
'        WHERE pkg_wapi.check_instance(key) = 1',
'        FETCH FIRST 1 ROW ONLY;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            :P105_ID := NULL;',
'            :P105_P_SESSION := NULL;',
'            :P105_NUMERO := NULL;',
'            :P105_P_TIENE_ACCESO := ''NO'';',
'            :P105_REFRESH := ''NO'';',
'    END;',
'ELSE',
'    BEGIN',
'        SELECT key',
'        INTO :P105_P_SESSION',
'        FROM devices',
'        WHERE id = :P105_ID_DEVICE',
'        FETCH FIRST 1 ROW ONLY;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            :P105_P_SESSION := NULL;',
'    END;',
'END IF;',
'IF :APP_ES_COLABORADOR = ''SI'' AND :P105_P_ID_DEPARTAMENTO IS NULL AND :P105_ID_DEVICE IS NOT NULL THEN',
'    BEGIN',
'        SELECT c.dep_id_departamento',
'              ,c.sec_id_seccion',
'        INTO :P105_P_ID_DEPARTAMENTO',
'            ,:P105_P_ID_SECCION  ',
'        FROM colaborador c',
'        WHERE c.ent_id_entidad = :APP_MI_ID_ENTIDAD',
'        AND c.estado = ''ACTIVO'';',
'        :P105_P_TIENE_ACCESO := ''SI'';',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            :P105_REFRESH := ''NO'';',
'            RAISE_APPLICATION_ERROR(-20000,''Parametros de departamento no definido para el usuario. Favor verificar.'');',
'        WHEN TOO_MANY_ROWS THEN',
'            :P105_REFRESH := ''NO'';',
'            RAISE_APPLICATION_ERROR(-20000,''Varios parametros de departamentos definidos para el usuario. Favor verificar.'');',
'    END;',
'END IF;        ',
'IF :P105_ID IS NOT NULL THEN ',
'    SELECT Nvl(c.push_name,c.remote_jid), c.remote_jid',
'    INTO :P105_NUMERO, :P105_P_JID',
'    FROM chats c',
'    WHERE c.id = :P105_ID',
'    ;',
'    UPDATE chats c',
'    SET c.read = 1',
'       ,c.modified = ( CURRENT_TIMESTAMP  + INTERVAL ''1'' HOUR )',
'    WHERE c.id = :P105_ID',
'    AND c.read = 0;',
'    COMMIT;',
'END IF;    '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>46680498687705108
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(120413584797711849)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'EnviarAjax'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'BEGIN',
'    IF :P105_RESPONDER IS NOT NULL THEN ',
'        pkg_wapi.send_immediate_text_message(',
'            p_id_device => :P105_ID_DEVICE',
'           ,p_id_chat => :P105_ID',
'           ,p_mensaje => :P105_RESPONDER',
'        );',
'        :P105_RESPONDER := NULL;',
'    END IF;    ',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P105_RESPONDER'', :P105_RESPONDER);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;   ',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>46680565733705109
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(121759934297017961)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'EnviarNewAjax'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'BEGIN',
'',
'    IF :P105_N_RESPONDER IS NOT NULL THEN ',
'        pkg_wapi.send_new_text_message(',
'              P_REMOTE_JID => :P105_N_NUMERO',
'            , P_MENSAJE => :P105_N_RESPONDER',
'            , P_ID_DEVICE => :P105_ID_DEVICE',
'        );',
'        :P105_N_RESPONDER := NULL;',
'    END IF;    ',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P105_N_RESPONDER'', :P105_N_RESPONDER);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;   ',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>48026915233011221
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(135815887811990355)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'obtenerBlob'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_blob          chats_details.adjunto%type;',
'    v_mime_type     chats_details.mime_type%type;',
'    v_file_length   chats_details.file_length%type;',
'    l_base64        CLOB;',
'PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'BEGIN',
'    SELECT adjunto',
'          ,mime_type',
'          ,file_length',
'    INTO v_blob',
'        ,v_mime_type',
'        ,v_file_length',
'    FROM chats_details',
'    WHERE id = apex_application.g_x01;',
'',
'    l_base64 := apex_web_service.blob2clobbase64(v_blob);',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.write(''v_clob'', l_base64);',
'    apex_json.write(''v_mime_type'', v_mime_type);',
'    apex_json.write(''v_file_length'', v_file_length);',
'    apex_json.close_object;  ',
'',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;   ',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>62082868747983615
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(79348216242184160)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'obtenerUrl'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'BEGIN',
'     :P105_P_URL := apex_page.get_url(',
'        p_page   => 105,',
'        p_items  => ''P105_ID'',',
'        p_values => apex_application.g_x01',
'    );',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P105_P_URL'', :P105_P_URL);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>14421525948295926
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(79348182542184159)
,p_region_id=>wwv_flow_imp.id(78890529113537483)
,p_position_id=>354086328093939142
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'javascript: dispara(''&ID.'')'
);
wwv_flow_imp.component_end;
end;
/
