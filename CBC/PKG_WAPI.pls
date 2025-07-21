PROMPT CREATE OR REPLACE PACKAGE cbc.pkg_wapi
CREATE OR REPLACE package PKG_WAPI as
    c_modulo CONSTANT VARCHAR2(20) := 'BAILEYS';
    g_port   CONSTANT NUMBER       := NULL;
    EOL      CONSTANT VARCHAR2(2) := '\n';
    g_key    VARCHAR2(255);
    g_url    VARCHAR2(255);

  PROCEDURE inicializar_constantes;

  PROCEDURE logger ( P_MSG    IN VARCHAR2
                    ,P_MODULO IN VARCHAR2);

  FUNCTION base64encode (P_BLOB IN BLOB) RETURN CLOB;

  FUNCTION b2c (PBLOB BLOB) RETURN CLOB;

  FUNCTION create_instance RETURN VARCHAR2;

  FUNCTION start_session (P_SESSION IN VARCHAR2
  ) RETURN CLOB;

  FUNCTION qr_b64 (P_KEY IN VARCHAR2
  ) RETURN CLOB;

  FUNCTION check_instance (P_KEY IN VARCHAR2
  ) RETURN NUMBER;

  FUNCTION check_session (P_KEY IN VARCHAR2
  ) RETURN NUMBER;

  FUNCTION get_instance_info ( P_KEY        IN  VARCHAR2
                              ,P_PUSH_NAME  OUT VARCHAR2
                              ,P_REMOTE_JID OUT VARCHAR2
  ) RETURN NUMBER;

  FUNCTION get_session ( P_KEY        IN  VARCHAR2
                        ,P_PUSH_NAME  OUT VARCHAR2
                        ,P_REMOTE_JID OUT VARCHAR2
  ) RETURN NUMBER;

  FUNCTION send_text ( P_KEY      IN  devices.key%TYPE
                      ,P_NUMBER   IN  VARCHAR2
                      ,P_MESSAGE  IN  VARCHAR2
                      ,P_RESPONSE OUT VARCHAR2
  ) RETURN VARCHAR2;

  PROCEDURE web_socket ( P_BODY    IN  BLOB
                        ,P_MESSAGE OUT VARCHAR2);

  FUNCTION init RETURN CLOB;

  PROCEDURE send_bulk_message;

  FUNCTION send_file ( P_KEY      IN VARCHAR2
                      ,P_NUMBER   IN VARCHAR2
                      ,P_MESSAGE  IN VARCHAR2
                      ,P_FILE     IN CLOB
                      ,P_MIMETYPE IN VARCHAR2
                      ,P_FILENAME IN VARCHAR2
                      ,P_URL      IN VARCHAR2
                      ,P_TYPE     IN VARCHAR2
  ) RETURN VARCHAR2;

  FUNCTION send_file_url  ( P_KEY      IN  VARCHAR2
                           ,P_NUMBER   IN  VARCHAR2
                           ,P_MESSAGE  IN  VARCHAR2
                           ,P_URL      IN  VARCHAR2
                           ,P_TYPE     IN  VARCHAR2
                           ,P_MIMETYPE IN  VARCHAR2
                           ,P_RESPONSE OUT VARCHAR2
  ) RETURN VARCHAR2;

  FUNCTION logout_instance(P_INSTANCE IN VARCHAR2
  ) RETURN VARCHAR2;

  PROCEDURE send_immediate_text_message ( P_ID_DEVICE devices.id%TYPE
                                         ,P_ID_CHAT   chats.id%TYPE
                                         ,P_MENSAJE   VARCHAR2
  );

  PROCEDURE send_new_text_message ( P_REMOTE_JID IN chats.remote_jid%TYPE
                                   ,P_MENSAJE    IN VARCHAR2
                                   ,P_ID_DEVICE  IN devices.id%TYPE
                                   ,P_USER_SEND  IN VARCHAR2 DEFAULT NULL
  );

  PROCEDURE p_bot ( PI_CHAT_ID  IN chats.id%TYPE
                   ,PI_MENSAJE  IN VARCHAR2
                   ,PI_NEW_CHAT IN BOOLEAN
  );

  PROCEDURE p_delete_chat ( PI_CHAT_ID chats.id%type );

  PROCEDURE p_update_group (PI_KEY IN VARCHAR2);

  PROCEDURE p_enviar_recordatorio;

  FUNCTION p_clientes_tel (PI_ID_CHAT NUMBER
  ) RETURN VARCHAR2;

  FUNCTION get_pac_info (PI_TEL IN VARCHAR2
  ) RETURN CLOB;

  PROCEDURE p_enviar_archivo ( PI_ID_DEVICE  IN devices.id%TYPE
                              ,PI_REMOTE_JID IN chats.remote_jid%TYPE
                              ,PI_ID_ARCHIVO IN tmp_file_whatsapp.id_file%TYPE
                              ,PI_MENSAJE    IN VARCHAR2
  );

  FUNCTION check_number ( P_REMOTE_JID IN chats.remote_jid%TYPE
                         ,P_KEY        IN devices.key%TYPE
  ) RETURN BOOLEAN;

  PROCEDURE p_guardar_cola_msg ( PI_JSON IN BLOB );

END PKG_WAPI;
/

PROMPT CREATE OR REPLACE PACKAGE BODY cbc.pkg_wapi
CREATE OR REPLACE PACKAGE BODY CBC.PKG_WAPI AS
  /*

  SELECT json_serialize(json returning VARCHAR2 PRETTY) AS json
  FROM chats_details

  */
  PROCEDURE inicializar_constantes IS
  BEGIN
    IF g_url IS NULL OR g_key IS NULL THEN
      SELECT wapi_url, wapi_key
      INTO g_url, g_key
      FROM parametros
      WHERE id_parametro = 1;
    END IF;
  END inicializar_constantes;

  PROCEDURE logger (P_MSG    IN VARCHAR2
                   ,P_MODULO IN VARCHAR2
  ) AS
  BEGIN
    INSERT INTO LOG_TEMP (
       log
      ,fecha_hora
    ) VALUES (
       P_MSG
      ,SYSDATE
    );
    IF SQL%ROWCOUNT > 0 THEN
      COMMIT;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20099, 'Error al guardar el log: ' || SQLERRM);
  END logger;

  FUNCTION b2c ( PBLOB BLOB
    ) RETURN CLOB IS
    nclob         CLOB;
    nfile_size    INTEGER := DBMS_LOB.LOBMAXSIZE;
    nsrc_offset   INTEGER := 1;
    ndest_offset  INTEGER := 1;
    nblob_csid    NUMBER := DBMS_LOB.DEFAULT_CSID;
    nlang_context NUMBER := DBMS_LOB.DEFAULT_LANG_CTX;
    nwarning      INTEGER;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(NCLOB, TRUE);
    DBMS_LOB.CONVERTTOCLOB(NCLOB, PBLOB, NFILE_SIZE, NDEST_OFFSET, NSRC_OFFSET,NBLOB_CSID, NLANG_CONTEXT, NWARNING);
    RETURN NCLOB;
    DBMS_LOB.FREETEMPORARY(NCLOB);
  END b2c;

  FUNCTION create_instance RETURN VARCHAR2 IS
    l_response CLOB;
    l_message  VARCHAR2(250);
    l_key      VARCHAR2(50);
    l_platform VARCHAR2(50);
  BEGIN
    IF c_modulo = 'BAILEYS' THEN
      l_key := SYS_GUID();
    ELSE
      l_response := apex_web_service.make_rest_request(
          P_URL         => G_URL || '/instance/init'
         ,P_HTTP_METHOD => 'GET'
      );
      apex_json.parse(l_response);
      l_message := apex_json.get_varchar2('message');
      l_key := apex_json.get_varchar2('key');
      l_platform := apex_json.get_varchar2('browser.platform');
      Dbms_Output.put_line('Message: '||l_message|| ' - Key: '|| l_key|| ' - Platform: '|| l_platform);
    END IF;
    RETURN l_key;
  EXCEPTION
    WHEN No_Data_Found THEN
      APEX_DEBUG.WARN(
         P_MESSAGE => 'Error to create new instance. sqlerrm %s'
        ,P0        => SQLERRM
      );
      RAISE;
  END create_instance;

    FUNCTION START_SESSION (
        P_SESSION IN VARCHAR2
    ) RETURN CLOB IS
        L_RESPONSE CLOB;
        L_MESSAGE  VARCHAR2(250);
        L_QR       CLOB;
        L_PLATFORM VARCHAR2(50);
    BEGIN
        L_RESPONSE := APEX_WEB_SERVICE.MAKE_REST_REQUEST(
            P_URL         => G_URL
                     || '/start-session?session='
                     || P_SESSION,
            P_HTTP_METHOD => 'GET'
        );

        APEX_JSON.PARSE(L_RESPONSE);
        L_QR := APEX_JSON.GET_CLOB('data.qr');
        RETURN L_QR;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            APEX_DEBUG.WARN(
                P_MESSAGE => 'Error create new instance: sqlerrm %s',
                P0        => SQLERRM
            );
            RAISE;
    END START_SESSION;

  FUNCTION QR_B64 (P_KEY IN VARCHAR2
  ) RETURN CLOB IS
    l_response      CLOB;
    l_message       VARCHAR2(250);
    l_b64           CLOB;
    l_json_payload  VARCHAR2(4000); -- Cuerpo JSON para el POST
  BEGIN
    l_json_payload := '{"sessionId": "'||P_KEY||'"}';
    apex_web_service.g_request_headers(1).name := 'x-api-key';
    apex_web_service.g_request_headers(1).value := g_key;
    apex_web_service.g_request_headers(2).name := 'Content-Type';
    apex_web_service.g_request_headers(2).value := 'application/json';
    l_response := apex_web_service.make_rest_request(
         p_url         => g_url|| '/sessions/add'
        ,p_http_method => 'POST'
        ,p_body        => l_json_payload -- Pasamos el JSON como cuerpo
    );
    apex_json.parse(l_response);
    l_b64 := apex_json.get_varchar2('qr');
    DBMS_OUTPUT.put_line('B64: '|| l_b64);
    RETURN l_b64;
  EXCEPTION
    WHEN No_Data_Found THEN
      apex_debug.warn(
        p_message => 'Error to get qr code. key %s - sqlerrm %s',
        p0        => P_KEY,
        p1        => SQLERRM
      );

      RAISE;
  END QR_B64;

  FUNCTION CHECK_INSTANCE ( P_KEY IN VARCHAR2
  ) RETURN NUMBER IS
    l_response   CLOB;
    l_message    VARCHAR2(250);
    l_remote_jid VARCHAR2(250);
    l_connected  NUMBER := 0;
    l_error      NUMBER := 0;
  BEGIN
    apex_web_service.g_request_headers(1).name := 'x-api-key';
    apex_web_service.g_request_headers(1).value := g_key;
    l_response := apex_web_service.make_rest_request(
         p_url         => g_url|| '/sessions/'||P_KEY||'/status'
        ,p_http_method => 'GET'
    );
    apex_json.parse(l_response);
    l_connected :=
        CASE WHEN apex_json.get_varchar2('status') = 'connected' THEN 1
        ELSE 0
        END;
    RETURN l_connected;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN 2;
      APEX_DEBUG.WARN(
          P_MESSAGE => 'Error to get instance info. key %s - sqlerrm %s',
          P0        => P_KEY,
          P1        => SQLERRM
      );
      RAISE;
  END CHECK_INSTANCE;

  FUNCTION CHECK_NUMBER ( P_REMOTE_JID IN chats.remote_jid%TYPE
                         ,P_KEY        IN devices.key%TYPE
  ) RETURN BOOLEAN IS
    l_response  CLOB;
    l_existe    BOOLEAN;
  BEGIN
    apex_web_service.g_request_headers(1).name := 'x-api-key';
    apex_web_service.g_request_headers(1).value := g_key;
    apex_web_service.g_request_headers(2).name := 'Content-Type';
    apex_web_service.g_request_headers(2).value := 'application/json';
    l_response := apex_web_service.make_rest_request(
         p_url         => g_url|| '/'||P_KEY||'/contacts/'||P_REMOTE_JID
        ,p_http_method => 'GET'
    );
    apex_json.parse(l_response);
    l_existe := apex_json.get_boolean('exists');
    RETURN l_existe;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN FALSE;
  END CHECK_NUMBER;

  FUNCTION CHECK_SESSION (P_KEY IN VARCHAR2
  ) RETURN NUMBER IS
    l_response   CLOB;
    l_message    VARCHAR2(250);
    l_remote_jid VARCHAR2(250);
    l_connected  NUMBER := 0;
    l_error      NUMBER := 0;
  BEGIN
    apex_web_service.g_request_headers(1).name := 'x-api-key';
    apex_web_service.g_request_headers(1).value := g_key;
    l_response := apex_web_service.make_rest_request(
            p_url => g_url || '/sessions/'|| P_KEY ||'/status',
            p_http_method => 'GET'
    );
    apex_json.parse(l_response);
    l_error :=
        CASE WHEN apex_json.get_boolean('connected') THEN 1
          ELSE 0
        END;
    l_message := apex_json.get_varchar2('message');
    IF l_message = 'Invalid Key' THEN
      RETURN 2;
    END IF;
    l_connected :=
      CASE
        WHEN apex_json.get_varchar2('status')='connected' THEN 1
        ELSE 0
      END;
    RETURN l_connected;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN 2;
      apex_debug.warn(
          P_MESSAGE => 'Error to get instance info. key %s - sqlerrm %s',
          P0        => P_KEY,
          P1        => SQLERRM
      );
      RAISE;
  END CHECK_SESSION;

    FUNCTION GET_INSTANCE_INFO (
        P_KEY        IN VARCHAR2,
        P_PUSH_NAME  OUT VARCHAR2,
        P_REMOTE_JID OUT VARCHAR2
    ) RETURN NUMBER IS

        L_RESPONSE   CLOB;
        L_MESSAGE    VARCHAR2(250);
        L_REMOTE_JID VARCHAR2(250);
        L_CONNECTED  NUMBER := 0;
        L_ERROR      NUMBER := 0;
    BEGIN

        L_RESPONSE := APEX_WEB_SERVICE.MAKE_REST_REQUEST(
            P_URL         => G_URL
                     || '/instance/info?key='
                     || P_KEY,
            P_HTTP_METHOD => 'GET'
        );

        APEX_JSON.PARSE(L_RESPONSE);
        L_ERROR :=
            CASE
                WHEN APEX_JSON.GET_BOOLEAN('instance_data.phone_connected') THEN
                    1
                ELSE 0
            END;
        P_PUSH_NAME := APEX_JSON.GET_VARCHAR2('instance_data.user.name');
        L_REMOTE_JID := APEX_JSON.GET_VARCHAR2('instance_data.user.id');
        P_REMOTE_JID := SUBSTR(L_REMOTE_JID,
                               1,
                               INSTR(L_REMOTE_JID, ':') - 1);

        L_MESSAGE := APEX_JSON.GET_VARCHAR2('message');
        IF L_MESSAGE = 'invalid key supplied' THEN
            RETURN 2;
        END IF;
        L_CONNECTED :=
            CASE
                WHEN APEX_JSON.GET_BOOLEAN('instance_data.phone_connected') THEN
                    1
                ELSE 0
            END;
        RETURN L_CONNECTED;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 2;
            APEX_DEBUG.WARN(
                P_MESSAGE => 'Error to get instance info. key %s - sqlerrm %s',
                P0        => P_KEY,
                P1        => SQLERRM
            );

            RAISE;
    END GET_INSTANCE_INFO;

    FUNCTION GET_SESSION (
        P_KEY        IN VARCHAR2,
        P_PUSH_NAME  OUT VARCHAR2,
        P_REMOTE_JID OUT VARCHAR2
    ) RETURN NUMBER IS

        L_RESPONSE   CLOB;
        L_MESSAGE    VARCHAR2(250);
        L_REMOTE_JID VARCHAR2(250);
        L_CONNECTED  NUMBER := 0;
        L_ERROR      NUMBER := 0;
    BEGIN
        L_RESPONSE := APEX_WEB_SERVICE.MAKE_REST_REQUEST(
            P_URL         => G_URL
                     || '/session?session='
                     || P_KEY
                     || '%='
                     || G_KEY,
            P_HTTP_METHOD => 'GET'
        );

        APEX_JSON.PARSE(L_RESPONSE);
        L_ERROR :=
            CASE
                WHEN APEX_JSON.GET_BOOLEAN('connected') THEN
                    1
                ELSE 0
            END;
        P_PUSH_NAME := APEX_JSON.GET_VARCHAR2('name');
        L_REMOTE_JID := APEX_JSON.GET_VARCHAR2('id');
        P_REMOTE_JID := SUBSTR(L_REMOTE_JID,
                               1,
                               INSTR(L_REMOTE_JID, ':') - 1);

        L_MESSAGE := APEX_JSON.GET_VARCHAR2('message');
        IF L_MESSAGE = 'invalid key supplied' THEN
            RETURN 2;
        END IF;
        L_CONNECTED :=
            CASE
                WHEN APEX_JSON.GET_BOOLEAN('connected') THEN
                    1
                ELSE 0
            END;
        RETURN L_CONNECTED;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 2;
            APEX_DEBUG.WARN(
                P_MESSAGE => 'Error to get instance info. key %s - sqlerrm %s',
                P0        => P_KEY,
                P1        => SQLERRM
            );

            RAISE;
    END GET_SESSION;

  FUNCTION send_text ( P_KEY      IN  devices.key%TYPE
                      ,P_NUMBER   IN  VARCHAR2
                      ,P_MESSAGE  IN  VARCHAR2
                      ,P_RESPONSE OUT VARCHAR2
  ) RETURN VARCHAR2 IS
    l_response     CLOB;
    l_message      VARCHAR2(250);
    l_id           VARCHAR2(250);
    l_connected    NUMBER := 0;
    l_error        NUMBER := 0;
    l_erro_message VARCHAR2(32767);
    l_json_m       CLOB;
    v_error        VARCHAR2(32000);
  BEGIN
    apex_web_service.g_request_headers(1).name  := 'x-api-key';
    apex_web_service.g_request_headers(1).Value := g_key;
    apex_web_service.g_request_headers(2).name  := 'Content-Type';
    apex_web_service.g_request_headers(2).Value := 'application/json';
    l_json_m    := TO_CLOB('{"jid":"'|| P_NUMBER || '","type":"number","message":{ "text":"'|| P_MESSAGE|| '"}}');
    l_response  := apex_web_service.make_rest_request(
       P_URL              => g_url||'/'||P_KEY||'/messages/send',
       P_HTTP_METHOD      => 'POST',
       P_BODY             => l_json_m,
       P_TRANSFER_TIMEOUT => 30);
    apex_json.parse(l_response);
    l_error := CASE WHEN apex_json.get_boolean('error') THEN 1 ELSE 0 END;
    l_id := apex_json.get_varchar2('key.id');
    BEGIN
      INSERT INTO message_id_send (
         message_id
        ,send
        ,send_by
      ) VALUES (
         l_id
        ,( current_timestamp + INTERVAL '1' HOUR )
        ,Nvl(v('APP_USER'),USER)
      );
      COMMIT;
    END;
    RETURN l_id;
  EXCEPTION
    WHEN OTHERS THEN
      v_error := SQLERRM;
      --INSERT INTO log_wapi VALUES (
      --  ( SYSDATE - INTERVAL '3' HOUR )
      -- ,'PKG_WAPI.SEND_TEXT'
      -- ,'Nro:'||P_NUMBER||' P_KEY:'||P_KEY||' error:'||v_error
      -- );
      -- COMMIT;
      -- RETURN NULL;
      Raise_Application_Error(-20999,'ERROR: pkg_wapi.send_text:: '||v_error);
  END send_text;

    FUNCTION SEND_FILE (
        P_KEY      IN VARCHAR2,
        P_NUMBER   IN VARCHAR2,
        P_MESSAGE  IN VARCHAR2,
        P_FILE     IN CLOB,
        P_MIMETYPE IN VARCHAR2,
        P_FILENAME IN VARCHAR2,
        P_URL      IN VARCHAR2,
        P_TYPE     IN VARCHAR2
    ) RETURN VARCHAR2 IS

        L_RESPONSE  CLOB;
        L_MESSAGE   VARCHAR2(250);
        L_ID        VARCHAR2(250);
        L_CONNECTED NUMBER := 0;
        L_ERROR     NUMBER := 0;
        L_JSON      CLOB;
    BEGIN
        APEX_JSON.INITIALIZE_CLOB_OUTPUT;
        -- construir el json
        APEX_JSON.OPEN_OBJECT;
        APEX_JSON.WRITE('id', P_NUMBER);
        APEX_JSON.WRITE('url', P_URL);
        APEX_JSON.WRITE('type', P_TYPE);
        APEX_JSON.WRITE('mimetype', P_MIMETYPE);
        APEX_JSON.WRITE('caption', P_MESSAGE);
        APEX_JSON.CLOSE_OBJECT;
        L_JSON := APEX_JSON.GET_CLOB_OUTPUT;
        APEX_WEB_SERVICE.G_REQUEST_HEADERS(1).NAME := 'Content-Type';
        APEX_WEB_SERVICE.G_REQUEST_HEADERS(1).VALUE := 'application/json';
        --l_response := apex_web_service.make_rest_request(p_url         =>  g_url || '/message/file?key=' ||p_key,
        --                                                 p_body       => l_json);
        APEX_JSON.PARSE(L_RESPONSE);
        L_ERROR :=
            CASE
                WHEN APEX_JSON.GET_BOOLEAN('error') THEN
                    1
                ELSE 0
            END;
        L_ID := APEX_JSON.GET_VARCHAR2('data.key.id');
        RETURN L_ID;
    EXCEPTION
        WHEN OTHERS THEN
            APEX_DEBUG.WARN(
                P_MESSAGE => 'Error to send text message. key %s - sqlerrm %s',
                P0        => P_KEY,
                P1        => SQLERRM
            );

            RAISE;
    END;

  FUNCTION SEND_FILE_URL (
        P_KEY      IN VARCHAR2,
        P_NUMBER   IN VARCHAR2,
        P_MESSAGE  IN VARCHAR2,
        P_URL      IN VARCHAR2,
        P_TYPE     IN VARCHAR2,
        P_MIMETYPE IN VARCHAR2,
        P_RESPONSE OUT VARCHAR2
  ) RETURN VARCHAR2 IS
    l_response  CLOB;
    l_message   VARCHAR2(250);
    l_id        VARCHAR2(250);
    l_connected NUMBER := 0;
    l_error     VARCHAR2(32767);
    l_json      CLOB;
  BEGIN
    apex_web_service.g_request_headers(1).name := 'x-api-key';
    apex_web_service.g_request_headers(1).value := g_key;
    apex_web_service.g_request_headers(2).NAME := 'Content-Type';
    apex_web_service.g_request_headers(2).VALUE := 'application/json';
    l_json := TO_CLOB('{"jid":"'|| P_NUMBER || '", "type": "number", "message": {');
    l_json := l_json||TO_CLOB('"'||P_TYPE||'": {"url": "'||P_URL||'", "mimetype": "'||P_MIMETYPE||'"}');
    IF P_MESSAGE IS NOT NULL THEN
      l_json := l_json||TO_CLOB('"caption": "'||P_MESSAGE||'"');
    END IF;
    l_json := l_json||TO_CLOB('}}');
    l_response := apex_web_service.make_rest_request(
            P_URL               => g_url||'/'||P_KEY||'/messages/send',
            P_HTTP_METHOD       => 'POST',
            P_BODY              => l_json,
            P_TRANSFER_TIMEOUT  => 60
    );
    apex_json.parse(l_response);
    l_error := apex_json.get_varchar2('error');
    IF l_error IS NOT NULL THEN
      Raise_Application_Error(-20999,l_error);
    END IF;
    l_id := apex_json.get_varchar2('key.id');
    RETURN l_id;
  END SEND_FILE_URL;

  PROCEDURE web_socket ( P_BODY    IN BLOB
                        ,P_MESSAGE OUT VARCHAR2
  ) IS
    l_response      CLOB;
    l_json_values   apex_json.t_values;
    l_message       VARCHAR2(32727);
    l_message2      VARCHAR2(32727);
    l_pushname      VARCHAR2(250);
    l_instance_key  VARCHAR2(250);
    l_remote_jid    VARCHAR2(250);
    l_remotejid     VARCHAR2(250);
    l_id            VARCHAR2(250);
    l_connected     NUMBER := 0;
    l_error         NUMBER := 0;
    l_fromme        VARCHAR2(1);
    l_chats         CHATS%ROWTYPE;
    TYPE t_chats_details IS TABLE OF chats_details%ROWTYPE INDEX BY BINARY_INTEGER;
    l_chats_details t_chats_details;
    l_type          VARCHAR2(25);
    v_device_id     NUMBER;
    v_chat_id       NUMBER;
    v_new_chat      BOOLEAN := FALSE;
    l_latitude      NUMBER;
    l_longitude     NUMBER;
    v_bot           NUMBER;
    dummy           NUMBER;
    l_url_audio     VARCHAR2(500);
    l_url_image     VARCHAR2(500);
    l_url_document  VARCHAR2(500);
    v_tipo_audio    NUMBER;
    v_file_length   NUMBER;
    v_url           VARCHAR2(1000);-- := 'https://acceso.clinicasantamaria.com.py/clinica/santamaria/datos_pac/rubro';
    v_response      VARCHAR2(1000);
    v_rubro         VARCHAR2(1);
    v_file_name     VARCHAR2(500);
    v_reaction_to   VARCHAR2(100);
    v_reaction_date TIMESTAMP;
  BEGIN
    l_response := B2C(P_BODY);
--    INSERT INTO tmp_javier VALUES (SYSDATE,l_response);
--    COMMIT;
    apex_json.parse(
        P_VALUES => l_json_values,
        P_SOURCE => l_response
    );
    l_type := apex_json.get_varchar2(
        P_PATH   => 'event',
        P_VALUES => l_json_values
    );
    l_instance_key := apex_json.get_varchar2(
        P_PATH   => 'sessionId',
        P_VALUES => l_json_values
    );
    l_remote_jid := apex_json.get_varchar2(
        P_PATH   => 'data.messages.key.remoteJid',
        P_VALUES => l_json_values
    );
    IF Length(apex_json.get_varchar2(p_path => 'data.messages.message.protocolMessage.type',p_values => l_json_values)) > 1
    OR Length(apex_json.get_varchar2(p_path => 'data.messages.messageStubParameters[1]')) > 1
    THEN
      RETURN;
      /*
      Casos de retorno con error
      PEER_DATA_OPERATION_REQUEST_RESPONSE_MESSAGE
      */
    END IF;
    IF l_type != 'messages.upsert' OR l_remote_jid = 'status@broadcast' THEN
      RETURN;
    END IF;
    IF l_remote_jid LIKE '%@g.us' THEN  /* GRUPOS */
      RETURN;
    ELSE
      l_remotejid := SubStr(l_remote_jid,1,InStr(l_remote_jid, '@') - 1);
      IF InStr(l_remotejid, '.') > 0 THEN
        l_remotejid := SubStr(l_remote_jid,1,InStr(l_remote_jid, '.') - 1);
      END IF;
      IF InStr(l_remotejid, ':') > 0 THEN
        l_remotejid := SubStr(l_remote_jid,1,InStr(l_remote_jid, ':') - 1);
      END IF;
      IF InStr(l_remotejid, '-') > 0 THEN
        l_remotejid := SubStr(l_remote_jid,1,InStr(l_remote_jid, '-') - 1);
      END IF;
    END IF;
    l_fromme :=
        CASE WHEN apex_json.get_boolean(
                P_PATH   => 'data.messages.key.fromMe',
                P_VALUES => l_json_values) THEN 'S' ELSE 'N' END;
    l_pushname := apex_json.get_varchar2(
      P_PATH   => 'data.messages.pushName',
      P_VALUES => l_json_values);
    l_message := apex_json.get_varchar2(
       P_PATH => 'data.messages.message.conversation'
      ,P_VALUES => l_json_values);
    IF l_message IS NULL THEN
      l_message := apex_json.get_varchar2(
         P_PATH => 'data.messages.message.extendedTextMessage.text'
        ,P_VALUES => l_json_values);
    END IF;
    IF l_message IS NULL THEN
      l_message := apex_json.get_varchar2(
         P_PATH => 'data.messages.message.reactionMessage.text'
        ,P_VALUES => l_json_values);
      IF l_message IS NOT NULL THEN
        v_reaction_to :=  apex_json.get_varchar2(
         P_PATH => 'data.messages.message.reactionMessage.key.id'
        ,P_VALUES => l_json_values);
        BEGIN
          SELECT cd.created + INTERVAL '1' SECOND
          INTO v_reaction_date
          FROM chats_details cd
          WHERE cd.message_id = v_reaction_to;
        EXCEPTION
          WHEN No_Data_Found THEN
            RETURN;
        END;
      END IF;
    END IF;
    l_latitude := apex_json.get_varchar2(
        P_PATH   => 'data.messages.message.locationMessage.degreesLatitude',
        P_VALUES => l_json_values);
    l_longitude := apex_json.get_varchar2(
        P_PATH   => 'data.messages.message.locationMessage.degreesLongitude',
        P_VALUES => l_json_values);
    IF l_remotejid IS NULL THEN
        RETURN;
    END IF;
    IF l_id IS NULL THEN
      l_id := apex_json.get_varchar2(
        P_PATH   => 'data.messages.key.id',
        P_VALUES => l_json_values);
    END IF;
    l_url_audio := apex_json.get_varchar2(
        P_PATH   => 'data.messages.message.audioMessage.url',
        P_VALUES => l_json_values);
    l_url_image  := apex_json.get_varchar2(
        P_PATH   => 'data.messages.message.imageMessage.url',
        P_VALUES => l_json_values);
    l_url_document := apex_json.get_varchar2(
        P_PATH   => 'data.messages.message.documentMessage.url',
        P_VALUES => l_json_values);
    BEGIN
      SELECT id,es_bot
      INTO v_device_id, v_bot
      FROM devices
      WHERE key = l_instance_key;
    EXCEPTION
      WHEN No_Data_Found THEN
        v_device_id := 0;
    END;
    IF v_device_id = 0 THEN
      RETURN;
    END IF;
    BEGIN
      SELECT id
      INTO v_chat_id
      FROM chats
      WHERE device_id = v_device_id
      AND remote_jid = l_remotejid
      ;
      UPDATE chats
      SET modified = ( current_timestamp - INTERVAL '3' HOUR )
        ,push_name = CASE l_fromme WHEN 'S' THEN push_name
                      WHEN 'N' THEN l_pushname END
        ,read = 0
      WHERE id = v_chat_id
      ;
    EXCEPTION
      WHEN No_Data_Found THEN
        v_chat_id := seq_chats.NEXTVAL;
        v_new_chat := TRUE;
        INSERT INTO chats (
           ID         --NUMBER(10,0)  NOT NULL,
          ,DEVICE_ID  --NUMBER(10,0)  NOT NULL,
          ,USER_NAME  --VARCHAR2(250) NULL,
          ,NAME       --VARCHAR2(50)  NULL,
          ,CREATED    --DATE          DEFAULT SYSDATE NULL,
          ,MODIFIED   --DATE          DEFAULT SYSDATE NULL,
          ,PUSH_NAME  --VARCHAR2(250) NULL,
          ,REMOTE_JID --VARCHAR2(50)  NULL
          ,READ       --VARCHAR2(1)   NULL
        ) VALUES (
           v_chat_id         --id
          ,v_device_id       --device_id
          ,NULL              --user_name
          ,NULL              --name
          ,( CURRENT_TIMESTAMP - INTERVAL '3' HOUR ) --created
          ,NULL              --modified
          ,l_pushname        --push_name
          ,l_remotejid       --remote_jid
          ,DECODE(l_fromme, 'S', 1, 0) --read
        );
    END;
    COMMIT;
    /*
    Obtención de datos, RUBRO, utilizado en SMaria
    BEGIN
      apex_web_service.g_request_headers.delete;
      apex_web_service.g_request_headers(1).name := 'remote_jid';
      apex_web_service.g_request_headers(1).value := l_remotejid;
      v_response := apex_web_service.make_rest_request(
           p_url         => v_url
          ,p_http_method => 'GET'
      );
      apex_json.parse(v_response);
      v_rubro := NULL;
      IF v_response IS NOT NULL THEN
        v_rubro := apex_json.get_varchar2('rubro');
        IF v_rubro IS NOT NULL THEN
          UPDATE chats c
          SET c.category = v_rubro
          WHERE c.id = v_chat_id;
          COMMIT;
        END IF;
      END IF;
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;*/
    IF v_chat_id IS NOT NULL THEN
      DECLARE
        v_obtener         CLOB;
        v_id_chat_detail  NUMBER;
        v_blob            BLOB;
        v_warning         INTEGER;
        v_dest_offset     INTEGER := 1;
        v_src_offset      INTEGER := 1;
        v_mime_type       chats_details.mime_type%TYPE;
      BEGIN
        l_message2 := l_message; --Translate(l_message, 'ÁÉÍÓÚáéíóú', 'AEIOUaeiou');
        v_id_chat_detail := seq_chats_details.NEXTVAL;
        INSERT INTO chats_details (
            id
           ,chat_id
           ,message
           ,created
           ,owner
           ,username
           ,message_id
         --,json
           ,latitude
           ,longitude
        ) VALUES (
            v_id_chat_detail             --id
           ,v_chat_id                    --chat_id
           ,l_message2                   --message
           ,Nvl(v_reaction_date,current_timestamp - INTERVAL '3' HOUR)      --created v_reaction_date para poner la reaccion un seg. despues del mensaje
           ,l_fromme                     --owner
           ,l_pushname                   --username
           ,l_id                         --message_id
         --,l_response                   --json
           ,l_latitude                   --latitude
           ,l_longitude                  --longitude
        );
        IF l_url_audio IS NOT NULL THEN
          v_file_length := apex_json.get_varchar2(p_path => 'data.messages.message.audioMessage.fileLength', p_values => l_json_values);
          v_obtener :=
'{"id": "' || apex_json.get_varchar2(p_path => 'data.messages.key.id', p_values => l_json_values) || '",
 "key": {
   "id": "' || apex_json.get_varchar2(p_path => 'data.messages.key.id', p_values => l_json_values) || '",
   "fromMe": ' || apex_json.get_varchar2(p_path => 'data.messages.key.fromMe', p_values => l_json_values) || ',
   "remoteJid": "' || apex_json.get_varchar2(p_path => 'data.messages.key.remoteJid', p_values => l_json_values) || '"
 },
 "message": {
   "audioMessage": {
     "url": "' || apex_json.get_varchar2(p_path           => 'data.messages.message.audioMessage.url', p_values => l_json_values) || '",
     "mimetype": "' || apex_json.get_varchar2(p_path      => 'data.messages.message.audioMessage.mimetype', p_values => l_json_values) || '",
     "fileSha256": "' || apex_json.get_varchar2(p_path    => 'data.messages.message.audioMessage.fileSha256', p_values => l_json_values) || '",
     "fileLength": "' || apex_json.get_varchar2(p_path    => 'data.messages.message.audioMessage.fileLength', p_values => l_json_values) || '",
     "seconds": ' || apex_json.get_varchar2(p_path        => 'data.messages.message.audioMessage.seconds', p_values => l_json_values) || ',
     "ptt": ' || apex_json.get_varchar2(p_path            => 'data.messages.message.audioMessage.ptt', p_values => l_json_values) || ',
     "mediaKey": "' || apex_json.get_varchar2(p_path      => 'data.messages.message.audioMessage.mediaKey', p_values => l_json_values) || '",
     "fileEncSha256": "' || apex_json.get_varchar2(p_path => 'data.messages.message.audioMessage.fileEncSha256', p_values => l_json_values) || '",
     "directPath": "' || apex_json.get_varchar2(p_path    => 'data.messages.message.audioMessage.directPath', p_values => l_json_values) || '"
   }
 }
}';
          -- Configuración de headers
          apex_web_service.g_request_headers.delete;
          apex_web_service.g_request_headers(1).name := 'x-api-key';
          apex_web_service.g_request_headers(1).value := g_key;
          apex_web_service.g_request_headers(2).name := 'Content-Type';
          apex_web_service.g_request_headers(2).value := 'application/json';
          apex_web_service.g_request_headers(3).name := 'Accept';
          apex_web_service.g_request_headers(3).value := 'application/octet-stream';
          BEGIN
            -- Inicializar el BLOB
            DBMS_LOB.CREATETEMPORARY(v_blob, TRUE);
            v_blob := apex_web_service.make_rest_request_b(
               p_url         => g_url||'/'||l_instance_key||'/messages/download',
               p_http_method => 'POST',
               p_body        => v_obtener
            );
          END;
          IF DBMS_LOB.GETLENGTH(v_blob) > 0 THEN
            UPDATE chats_details
            SET adjunto = v_blob,
                mime_type = 'audio/ogg; codecs=opus',
                file_length = v_file_length
            WHERE id = v_id_chat_detail;

            IF DBMS_LOB.ISTEMPORARY(v_blob) = 1 THEN
              DBMS_LOB.FREETEMPORARY(v_blob);
            END IF;
            COMMIT;
          ELSE
            ROLLBACK;
          END IF;
        END IF;
        IF l_url_image IS NOT NULL THEN
          v_file_length := apex_json.get_varchar2(p_path => 'data.messages.message.imageMessage.fileLength', p_values => l_json_values);
          IF apex_json.get_varchar2(p_path => 'data.messages.key.fromMe', p_values => l_json_values) = 'false' THEN
            v_obtener :=
'{"id": "' || apex_json.get_varchar2(p_path => 'data.messages.key.id', p_values => l_json_values) || '",
 "key": {
   "id": "' || apex_json.get_varchar2(p_path => 'data.messages.key.id', p_values => l_json_values) || '",
   "fromMe": ' || apex_json.get_varchar2(p_path => 'data.messages.key.fromMe', p_values => l_json_values) || ',
   "remoteJid": "' || apex_json.get_varchar2(p_path => 'data.messages.key.remoteJid', p_values => l_json_values) || '"
 },
 "message": {
   "imageMessage": {
     "url": "' || apex_json.get_varchar2(p_path              => 'data.messages.message.imageMessage.url', p_values => l_json_values) || '",
     "width": '|| apex_json.get_varchar2(p_path              => 'data.messages.message.imageMessage.width', p_values => l_json_values) || ',
     "height": '|| apex_json.get_varchar2(p_path             => 'data.messages.message.imageMessage.height', p_values => l_json_values) || ',
     "mediaKey": "' || apex_json.get_varchar2(p_path         => 'data.messages.message.imageMessage.mediaKey', p_values => l_json_values) || '",
     "mimetype": "' || apex_json.get_varchar2(p_path         => 'data.messages.message.imageMessage.mimetype', p_values => l_json_values) || '",
     "directPath": "' || apex_json.get_varchar2(p_path       => 'data.messages.message.imageMessage.directPath', p_values => l_json_values) || '",
     "fileLength": "' || apex_json.get_varchar2(p_path       => 'data.messages.message.imageMessage.fileLength', p_values => l_json_values) || '",
     "fileSha256": "' || apex_json.get_varchar2(p_path       => 'data.messages.message.imageMessage.fileSha256', p_values => l_json_values) || '",
     "fileEncSha256": "' || apex_json.get_varchar2(p_path    => 'data.messages.message.imageMessage.fileEncSha256', p_values => l_json_values) || '",
     "mediaKeyTimestamp": "' || apex_json.get_varchar2(p_path => 'data.messages.message.imageMessage.mediaKeyTimestamp', p_values => l_json_values) || '"
   }
 }
}';
          ELSE
            v_obtener :=
'{"id": "' || apex_json.get_varchar2(p_path => 'data.messages.key.id', p_values => l_json_values) || '",
 "key": {
   "id": "' || apex_json.get_varchar2(p_path => 'data.messages.key.id', p_values => l_json_values) || '",
   "fromMe": ' || apex_json.get_varchar2(p_path => 'data.messages.key.fromMe', p_values => l_json_values) || ',
   "remoteJid": "' || apex_json.get_varchar2(p_path => 'data.messages.key.remoteJid', p_values => l_json_values) || '"
 },
 "message": {
   "imageMessage": {
     "url": "' || apex_json.get_varchar2(p_path              => 'data.messages.message.imageMessage.url', p_values => l_json_values) || '",
     "mediaKey": "' || apex_json.get_varchar2(p_path         => 'data.messages.message.imageMessage.mediaKey', p_values => l_json_values) || '",
     "mimetype": "' || apex_json.get_varchar2(p_path         => 'data.messages.message.imageMessage.mimetype', p_values => l_json_values) || '",
     "directPath": "' || apex_json.get_varchar2(p_path       => 'data.messages.message.imageMessage.directPath', p_values => l_json_values) || '",
     "fileLength": "' || apex_json.get_varchar2(p_path       => 'data.messages.message.imageMessage.fileLength', p_values => l_json_values) || '",
     "fileSha256": "' || apex_json.get_varchar2(p_path       => 'data.messages.message.imageMessage.fileSha256', p_values => l_json_values) || '",
     "fileEncSha256": "' || apex_json.get_varchar2(p_path    => 'data.messages.message.imageMessage.fileEncSha256', p_values => l_json_values) || '",
     "mediaKeyTimestamp": "' || apex_json.get_varchar2(p_path => 'data.messages.message.imageMessage.mediaKeyTimestamp', p_values => l_json_values) || '"
   }
 }
}';
          END IF;
          -- Configuración de headers
          apex_web_service.g_request_headers.delete;
          apex_web_service.g_request_headers(1).name := 'x-api-key';
          apex_web_service.g_request_headers(1).value := g_key;
          apex_web_service.g_request_headers(2).name := 'Content-Type';
          apex_web_service.g_request_headers(2).value := 'application/json';
          apex_web_service.g_request_headers(3).name := 'Accept';
          apex_web_service.g_request_headers(3).value := 'image/jpeg';
          BEGIN
            -- Inicializar el BLOB
            DBMS_LOB.CREATETEMPORARY(v_blob, TRUE);
            v_blob := apex_web_service.make_rest_request_b(
               p_url         => g_url||'/'||l_instance_key||'/messages/download',
               p_http_method => 'POST',
               p_body        => v_obtener
            );
          END;
          IF DBMS_LOB.GETLENGTH(v_blob) > 0 THEN
            UPDATE chats_details
            SET adjunto = v_blob,
                mime_type = 'image/jpeg',
                file_length = v_file_length
            WHERE id = v_id_chat_detail;

            IF DBMS_LOB.ISTEMPORARY(v_blob) = 1 THEN
              DBMS_LOB.FREETEMPORARY(v_blob);
            END IF;
            COMMIT;
          ELSE
            ROLLBACK;
          END IF;
        END IF;
        IF l_url_document IS NOT NULL THEN
          v_file_length := apex_json.get_varchar2(p_path => 'data.messages.message.documentMessage.fileLength', p_values => l_json_values);
          v_mime_type   := apex_json.get_varchar2(p_path => 'data.messages.message.documentMessage.mimetype', p_values => l_json_values);
          v_file_name   := apex_json.get_varchar2(p_path => 'data.messages.message.documentMessage.fileName', p_values => l_json_values);
          v_obtener :=
'{"id": "' || apex_json.get_varchar2(p_path => 'data.messages.key.id', p_values => l_json_values) || '",
 "key": {
   "id": "' || apex_json.get_varchar2(p_path => 'data.messages.key.id', p_values => l_json_values) || '",
   "fromMe": ' || apex_json.get_varchar2(p_path => 'data.messages.key.fromMe', p_values => l_json_values) || ',
   "remoteJid": "' || apex_json.get_varchar2(p_path => 'data.messages.key.remoteJid', p_values => l_json_values) || '"
 },
 "message": {
   "documentMessage": {
     "url": "' || apex_json.get_varchar2(p_path              => 'data.messages.message.documentMessage.url', p_values => l_json_values) || '",
     "mimetype": "' || apex_json.get_varchar2(p_path         => 'data.messages.message.documentMessage.mimetype', p_values => l_json_values) || '",
     "fileSha256": "' || apex_json.get_varchar2(p_path       => 'data.messages.message.documentMessage.fileSha256', p_values => l_json_values) || '",
     "fileLength": "' || apex_json.get_varchar2(p_path       => 'data.messages.message.documentMessage.fileLength', p_values => l_json_values) || '",
     "mediaKey": "' || apex_json.get_varchar2(p_path         => 'data.messages.message.documentMessage.mediaKey', p_values => l_json_values) || '",
     "fileName": "' || apex_json.get_varchar2(p_path         => 'data.messages.message.documentMessage.fileName', p_values => l_json_values) || '",
     "fileEncSha256": "' || apex_json.get_varchar2(p_path    => 'data.messages.message.documentMessage.fileEncSha256', p_values => l_json_values) || '",
     "mediaKeyTimestamp": "' || apex_json.get_varchar2(p_path=> 'data.messages.message.documentMessage.mediaKeyTimestamp', p_values => l_json_values) || '",
     "directPath": "' || apex_json.get_varchar2(p_path       => 'data.messages.message.documentMessage.directPath', p_values => l_json_values) || '"
   }
 }
}';
          -- Configuración de headers
          apex_web_service.g_request_headers.delete;
          apex_web_service.g_request_headers(1).name := 'x-api-key';
          apex_web_service.g_request_headers(1).value := g_key;
          apex_web_service.g_request_headers(2).name := 'Content-Type';
          apex_web_service.g_request_headers(2).value := 'application/json';
          apex_web_service.g_request_headers(3).name := 'Accept';
          apex_web_service.g_request_headers(3).value := 'application/pdf';
          BEGIN
            -- Inicializar el BLOB
            DBMS_LOB.CREATETEMPORARY(v_blob, TRUE);
            v_blob := apex_web_service.make_rest_request_b(
               p_url         => g_url||'/'||l_instance_key||'/messages/download',
               p_http_method => 'POST',
               p_body        => v_obtener
            );
          END;
          IF DBMS_LOB.GETLENGTH(v_blob) > 0 THEN
            UPDATE chats_details
            SET adjunto = v_blob,
                mime_type = v_mime_type,
                file_length = v_file_length,
                file_name = v_file_name
            WHERE id = v_id_chat_detail;
            IF DBMS_LOB.ISTEMPORARY(v_blob) = 1 THEN
              DBMS_LOB.FREETEMPORARY(v_blob);
            END IF;
            COMMIT;
          ELSE
            ROLLBACK;
          END IF;
        END IF;
        --KmeBot
        IF (l_url_audio IS NULL AND l_url_image IS NULL AND l_url_document IS NULL) OR v_new_chat THEN
          IF v_bot = 1 AND l_fromme = 'N' THEN
            p_bot( PI_CHAT_ID => v_chat_id
                  ,PI_MENSAJE => l_message
                  ,PI_NEW_CHAT => v_new_chat);
          END IF;
        END IF;
      EXCEPTION
        WHEN OTHERS THEN
          p_message := 'ERROR AL INSERTAR EL MENSAJE DE WEBSOCKET: ' || SQLERRM;
          RETURN;
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      p_message := 'ERROR AL EJECUTAR EL WEBSOCKET: ' || SQLERRM;
      RETURN;
  END web_socket;

    FUNCTION INIT RETURN CLOB IS
        V_KEY VARCHAR2(250);
        V_QR  CLOB;
    BEGIN
        V_KEY := CREATE_INSTANCE;
        IF V_KEY IS NOT NULL THEN
            V_QR := QR_B64(V_KEY);
            IF V_QR IS NOT NULL THEN
                RETURN V_QR;
            END IF;
        ELSE
            V_QR := 'Cannot get QR code';
        END IF;

        RETURN V_QR;
    EXCEPTION
        WHEN OTHERS THEN
            V_QR := 'ERROR al ejecutar el WebSocket' || SQLERRM;
            RETURN V_QR;
    END;

  PROCEDURE SEND_BULK_MESSAGE IS
    l_response      CLOB;
    l_json_values   apex_json.t_values;
    l_message       VARCHAR2(32727);
    l_pushname      VARCHAR2(250);
    l_instance_key  VARCHAR2(250);
    l_remote_jid    VARCHAR2(250);
    l_remotejid     VARCHAR2(250);
    l_id            VARCHAR2(250);
    l_connected     NUMBER := 0;
    l_error         VARCHAR2(32767);
    l_fromme        NUMBER := 0;
    l_chats         CHATS%ROWTYPE;
    TYPE t_chats_details IS TABLE OF chats_details%rowtype INDEX BY BINARY_INTEGER;
    l_chats_details t_chats_details;
    l_type          VARCHAR2(25);
    v_device_id     NUMBER;
    v_chat_id       NUMBER;
    l_enviado       NUMBER := 0;

    v_select        VARCHAR2(1000);
    v_id_device     devices.id%TYPE;
    v_key           devices.key%TYPE;
    v_message_id    cola_mensaje.message_id%TYPE;
    v_retorno       VARCHAR2(100);
    v_number        cola_mensaje.cuenta_envio%TYPE;
  BEGIN
    v_select :=
q'[
SELECT d.id
      ,d.suc_id_sucursal
      ,NULL
      ,NULL
      ,NULL

      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL

      ,d.key
      ,normalizar_celular(d.phone_number) phone_number
FROM devices d
WHERE pkg_wapi.check_instance(d.key) = 1
]';
    apex_collection.create_collection_from_query_b(p_collection_name    => 'COLL_INSTANCIAS'
                                                  ,p_query              => v_select
                                                  ,p_max_row_count      => NULL
                                                  ,p_truncate_if_exists => 'YES');
    FOR reg IN (
      SELECT  cm.id_cola_mensaje
            , cm.gru_id_grupo_cola
            , cm.destinatario
            , cm.mensaje
            , cm.fecha_alta
            , cm.fecha_enviar
            , cm.fecha_enviado
            , cm.prioridad
            , cm.usuario
            , cm.cuenta_enviar
            , cm.cuenta_envio
            , cm.fecha_error
            , cm.error
            , cm.suc_id_sucursal
      FROM cola_mensaje cm
      WHERE cm.prioridad IS NOT NULL
      AND (cm.fecha_enviar IS NULL OR cm.fecha_enviar <= SYSDATE)
      AND cm.fecha_enviado IS NULL
      AND cm.error IS NULL
      ORDER BY cm.prioridad ASC, cm.fecha_enviar ASC NULLS FIRST
      FETCH FIRST 5 ROW ONLY
    ) LOOP
      IF reg.cuenta_enviar IS NOT NULL THEN
        BEGIN
          SELECT c.n001
                ,c.c001
                ,c.c002
          INTO v_id_device
              ,v_key
              ,v_number
          FROM apex_collections c
          WHERE c.collection_name = 'COLL_INSTANCIAS'
          AND c.c002 = reg.cuenta_enviar;
          BEGIN
            v_message_id :=
              send_text(P_KEY      => v_key
                       ,P_NUMBER   => reg.destinatario
                       ,P_MESSAGE  => reg.mensaje
                       ,P_RESPONSE => v_retorno
              );
            IF v_message_id IS NOT NULL THEN
              UPDATE cola_mensaje c
              SET c.fecha_enviado = SYSDATE
                 ,c.cuenta_envio = v_number
                 ,c.message_id = v_message_id
              WHERE c.id_cola_mensaje = reg.id_cola_mensaje;
              COMMIT;
            END IF;
          EXCEPTION
            WHEN OTHERS THEN
              v_retorno := SQLERRM;
              UPDATE cola_mensaje c
              SET c.fecha_error = SYSDATE
                 ,c.error = v_retorno
              WHERE c.id_cola_mensaje = reg.id_cola_mensaje;
              COMMIT;
          END;
        EXCEPTION
          WHEN No_Data_Found THEN
            UPDATE cola_mensaje c
            SET c.fecha_error = SYSDATE
               ,c.error = 'Instancia no activa.'
            WHERE c.id_cola_mensaje = reg.id_cola_mensaje;
            COMMIT;
        END;
      ELSE
        BEGIN
          SELECT c.n001
                ,c.c001
                ,c.c002
          INTO v_id_device
              ,v_key
              ,v_number
          FROM apex_collections c
          WHERE c.collection_name = 'COLL_INSTANCIAS'
          AND c.n002 = reg.suc_id_sucursal
          FETCH FIRST 1 ROW ONLY;
          BEGIN
            v_message_id :=
              send_text(P_KEY      => v_key
                       ,P_NUMBER   => reg.destinatario
                       ,P_MESSAGE  => reg.mensaje
                       ,P_RESPONSE => v_retorno
              );
            IF v_message_id IS NOT NULL THEN
              UPDATE cola_mensaje c
              SET c.fecha_enviado = SYSDATE
                 ,c.cuenta_envio = v_number
                 ,c.message_id = v_message_id
              WHERE c.id_cola_mensaje = reg.id_cola_mensaje;
              COMMIT;
            END IF;
          EXCEPTION
            WHEN OTHERS THEN
              v_retorno := SQLERRM;
              UPDATE cola_mensaje c
              SET c.fecha_error = SYSDATE
                 ,c.error = v_retorno
              WHERE c.id_cola_mensaje = reg.id_cola_mensaje;
              COMMIT;
          END;
        EXCEPTION
          WHEN No_Data_Found THEN
            UPDATE cola_mensaje c
            SET c.fecha_error = SYSDATE
               ,c.error = 'Instancia sucursal no activa.'
            WHERE c.id_cola_mensaje = reg.id_cola_mensaje;
            COMMIT;
        END;
      END IF;
      DBMS_SESSION.SLEEP(5);
    END LOOP;
  EXCEPTION
    WHEN OTHERS THEN
      Raise_Application_Error(-20099,'Error al ejecutar el send bulk messages: '|| SQLERRM|| CHR(10)|| 'Trace: '||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE());
  END SEND_BULK_MESSAGE;

    FUNCTION BASE64ENCODE (
        P_BLOB IN BLOB
    ) RETURN CLOB
    -- -----------------------------------------------------------------------------------
        -- file name    : http://oracle-base.com/dba/miscellaneous/base64encode.sql
        -- author       : tim hall
        -- description  : encodes a blob into a base64 clob.
        -- last modified: 09/11/2011
        -- -----------------------------------------------------------------------------------
     IS
        L_CLOB CLOB;
        L_STEP PLS_INTEGER := 12000; -- make sure you set a multiple of 3 not higher than 24573
    BEGIN
        FOR I IN 0..TRUNC((DBMS_LOB.GETLENGTH(P_BLOB) - 1) / L_STEP) LOOP
            L_CLOB := L_CLOB
                      || UTL_RAW.CAST_TO_VARCHAR2(UTL_ENCODE.BASE64_ENCODE(DBMS_LOB.SUBSTR(P_BLOB, L_STEP, I * L_STEP + 1)));
        END LOOP;

        RETURN L_CLOB;
    END;

  FUNCTION LOGOUT_INSTANCE (P_INSTANCE IN VARCHAR2
  ) RETURN VARCHAR2 IS
    l_response CLOB;
    l_message  VARCHAR2(250);
    l_key      VARCHAR2(50);
    l_platform VARCHAR2(50);
    l_error    NUMBER;
  BEGIN
    apex_web_service.g_request_headers(1).name := 'x-api-key';
    apex_web_service.g_request_headers(1).value := g_key;
    l_response := apex_web_service.make_rest_request(
            p_url => g_url|| '/sessions/'|| P_INSTANCE,
            p_http_method => 'DELETE'
    );
    apex_json.parse(l_response);
    l_message := apex_json.get_varchar2('message');
    l_error := CASE WHEN apex_json.get_boolean('error') THEN 1
               ELSE 0 END;
    l_message :=
            CASE l_message
                WHEN 'Session deleted' THEN
                    'Sesión cerrada correctamente.'
                WHEN 'invalid key supplied' THEN
                    'No se encontró una sesión iniciada para la instancia: ' || P_INSTANCE
                ELSE L_MESSAGE
            END;
    RETURN L_MESSAGE;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      APEX_DEBUG.WARN(
                P_MESSAGE => 'Error to logout instance. sqlerrm %s',
                P0        => SQLERRM
            );
      RAISE;
  END LOGOUT_INSTANCE;

  PROCEDURE send_immediate_text_message (
        P_ID_DEVICE devices.id%TYPE,
        P_ID_CHAT   chats.id%type,
        P_MENSAJE   VARCHAR2
  ) IS
    v_destinatario CHATS.REMOTE_JID%TYPE;
    l_error        VARCHAR2(32767);
    v_message_id   VARCHAR2(250);
    v_chat_id      NUMBER;
    v_key          devices.KEY%TYPE;
  BEGIN
    BEGIN
      SELECT d.key
      INTO v_key
      FROM devices d
      WHERE d.id = P_ID_DEVICE;
      IF pkg_wapi.check_instance(v_key) != 1 THEN
        Raise_Application_Error(-20999,'Dispositivo no cuenta con instancia activa.');
      END IF;
    EXCEPTION
      WHEN No_Data_Found THEN
        Raise_Application_Error(-20999,'No se encuentra DISPOSITIVO, favor verificar.');
      WHEN Too_Many_Rows THEN
        Raise_Application_Error(-20999,'Error en la busqueda, varios registros encontrados. Informar :'||P_ID_DEVICE);
    END;
    BEGIN
      SELECT c.remote_jid, c.id
      INTO v_destinatario, v_chat_id
      FROM chats c
      WHERE c.id = P_ID_CHAT;
    EXCEPTION
      WHEN No_Data_Found THEN
        RAISE_APPLICATION_ERROR(-20999, 'No se encuetra ID CHAT:' || P_ID_CHAT);
    END;
    v_message_id := send_text(
              P_KEY      => v_key,
              P_NUMBER   => v_destinatario,
              P_MESSAGE  => P_MENSAJE,
              P_RESPONSE => l_error);
    IF v_message_id IS NOT NULL THEN
      UPDATE chats
      SET modified = current_timestamp
      WHERE id = P_ID_CHAT;
      COMMIT;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      Raise_Application_Error(-20099,
                                    'Error al realizar SEND MESSAGES: '
                                    || SQLERRM
                                    || CHR(10)
                                    || 'Trace: '
                                    || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE());
  END send_immediate_text_message;

  PROCEDURE send_new_text_message ( P_REMOTE_JID IN chats.remote_jid%TYPE
                                   ,P_MENSAJE    IN VARCHAR2
                                   ,P_ID_DEVICE  IN devices.id%TYPE
                                   ,P_USER_SEND  IN VARCHAR2 DEFAULT NULL
  ) IS
    v_destinatario chats.remote_jid%TYPE;
    l_error        VARCHAR2(32767);
    v_message_id   VARCHAR2(250);
    v_chat_id      NUMBER;
    v_device_id    devices.id%TYPE;
    v_key          devices.key%TYPE;
    v_remote_jid   chats.remote_jid%TYPE := normalizar_celular(P_REMOTE_JID);
  BEGIN
    SELECT d.id
          ,d.key
    INTO v_device_id
        ,v_key
    FROM devices d
    WHERE d.id = P_ID_DEVICE
    AND pkg_wapi.check_instance(d.key) = 1
    ;
    BEGIN
      SELECT c.remote_jid, c.id
      INTO v_destinatario, v_chat_id
      FROM chats c
      WHERE c.remote_jid = v_remote_jid
      AND c.device_id = v_device_id;
    EXCEPTION
      WHEN No_Data_Found THEN
        IF check_number(p_remote_jid => v_remote_jid, p_key => v_key ) THEN
          v_chat_id := seq_chats.NEXTVAL;
          INSERT INTO chats (
            id          --NUMBER(10,0)  NOT NULL,
           ,device_id   --NUMBER(10,0)  NOT NULL,
           ,user_name   --VARCHAR2(250) NULL,
           ,name        --VARCHAR2(50)  NULL,
           ,created     --DATE          DEFAULT SYSDATE NULL,
           ,modified    --DATE          DEFAULT SYSDATE NULL,
           ,push_name   --VARCHAR2(250) NULL,
           ,remote_jid  --VARCHAR2(50)  NULL
           ,read        --VARCHAR2(1)   NULL
          ) VALUES (
            v_chat_id         --id
           ,v_device_id       --device_id
           ,NULL              --user_name
           ,NULL              --name
           ,( CURRENT_TIMESTAMP - INTERVAL '3' HOUR ) --created
           ,NULL              --modified
           ,NULL              --push_name
           ,v_remote_jid      --remote_jid
           ,1                 --read
          );
        ELSE
          Raise_Application_Error(-20999,'Número no registrado en whatsapp');
        END IF;
    END;
    v_message_id := send_text(
          P_KEY      => v_key,
          P_NUMBER   => v_remote_jid,
          P_MESSAGE  => P_MENSAJE,
          P_RESPONSE => l_error);
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20099,'Error SEND_NEW_TEXT_MESSAGE: '|| SQLERRM); --|| CHR(10)|| 'Trace: '|| DBMS_UTILITY.FORMAT_ERROR_BACKTRACE());
  END send_new_text_message;

  PROCEDURE p_bot ( PI_CHAT_ID  IN chats.id%TYPE
                   ,PI_MENSAJE  IN VARCHAR2
                   ,PI_NEW_CHAT IN BOOLEAN
  ) IS
    v_nombre          chats.push_name%TYPE;
    v_remote_jid      chats.remote_jid%TYPE;
    v_convers_id      bot_conversations.conversation_id%TYPE;
    v_convers_json    bot_conversations.conversation_json%TYPE;
    v_flow_actual     bot_flows.id%TYPE;
    v_ancho_capture   NUMBER;
    v_captured        NUMBER := 0;
    v_device_bot      devices.id%TYPE;
    v_message_id      VARCHAR2(250);
    v_key             devices.KEY%TYPE;
    l_error           VARCHAR2(2);
    v_error           VARCHAR2(2000);
    v_id_sucursal     sucursal_entidad.id_suc_entidad%TYPE;
    v_mensaje         chats_details.message%TYPE;
  BEGIN
    SELECT d.id
          ,d.KEY
          ,d.suc_id_sucursal
    INTO v_device_bot
        ,v_key
        ,v_id_sucursal
    FROM devices d
    WHERE d.es_bot = 1
    ;
    BEGIN
      SELECT c.push_name
            ,c.remote_jid
      INTO v_nombre
          ,v_remote_jid
      FROM chats c
      WHERE c.id = PI_CHAT_ID
      ;
      SELECT b.conversation_id
            ,b.conversation_json
      INTO v_convers_id
          ,v_convers_json
      FROM bot_conversations b
      WHERE b.chat_id = PI_CHAT_ID
      AND b.status = 'ACTIVO'
      ;
    EXCEPTION
      WHEN No_Data_Found THEN
        IF PI_NEW_CHAT THEN
          /*
          Se busca respuesta automatica para nuevos chats
          */
          BEGIN
            SELECT a.answer_text
            INTO v_mensaje
            FROM bot_flows f
                ,bot_answers a
            WHERE f.suc_id_sucursal = v_id_sucursal
            AND f.start_chat = 'S'
            AND f.status = 1
            AND a.flow_id = f.id
            AND a.capture = 'N'
            FETCH FIRST 1 ROW ONLY
            ;
            v_mensaje := REPLACE(v_mensaje,'#SALTO#',EOL);
            v_message_id := send_text(
                  P_KEY      => v_key
                 ,P_NUMBER   => v_remote_jid
                 ,P_MESSAGE  => v_mensaje
                 ,P_RESPONSE => l_error);
            IF v_message_id IS NOT NULL THEN
              UPDATE chats
              SET modified = current_timestamp
              WHERE id = PI_CHAT_ID
              ;
              COMMIT;
            END IF;
          END;
        END IF;
    END;
    FOR msg IN (
      SELECT
          j.table_name
         ,j.id_pk
         ,j.remote_jid
         ,j.id_flow_superior
         ,j.id_flow
         ,j.type
         ,j.flow_name
         ,j.id_answer
         ,j.answer_text
         ,j.answer_capture
         ,j.capture_option
         ,j.captured_option
         ,j.timestamp_send
         ,j.timestamp_capture
         ,j.answer_response
         ,j.timestamp_send_response
      FROM JSON_TABLE(v_convers_json, '$'
              COLUMNS (
                  id_flow_superior  VARCHAR2(100) PATH '$.flow'
                 ,id_flow           VARCHAR2(100) PATH '$.id'
                 ,type              VARCHAR2(10)  PATH '$.type'
                 ,flow_name         VARCHAR2(100) PATH '$.flow_name'
                 ,table_name        VARCHAR2(100) PATH '$.table_name'
                 ,id_pk             NUMBER(10)    PATH '$.id_pk'
                 ,remote_jid        VARCHAR2(20)  PATH '$.remote_jid'
                 ,NESTED PATH '$.answers[*]' COLUMNS (
                    id_answer         NUMBER(10)      PATH '$.id'
                   ,answer_text       VARCHAR2(4000)  PATH '$.answer_text'
                   ,answer_capture    VARCHAR2(1)     PATH '$.capture'
                   ,capture_option    VARCHAR2(100)   PATH '$.capture_option'
                   ,captured_option   VARCHAR2(100)   PATH '$.captured_option'
                   ,timestamp_send    VARCHAR2(30)    PATH '$.timestamp_send'
                   ,timestamp_capture VARCHAR2(30)    PATH '$.timestamp_capture'
                   ,NESTED PATH '$.flows.answers[*]' COLUMNS (
                     answer_response         VARCHAR2(4000) PATH '$.answer_text'
                    ,timestamp_send_response VARCHAR2(30)   PATH '$.timestamp_send'
                    )
                  )
              )
          ) j
      UNION ALL
      SELECT
          k.table_name
         ,k.id_pk
         ,k.remote_jid
         ,j.id_flow_superior
         ,j.id_flow
         ,j.type
         ,j.flow_name
         ,j.id_answer
         ,j.answer_text
         ,j.answer_capture
         ,j.capture_option
         ,j.captured_option
         ,j.timestamp_send
         ,j.timestamp_capture
         ,j.answer_response
         ,j.timestamp_send_response
      FROM JSON_TABLE(v_convers_json, '$.flows[*]'
              COLUMNS (
                  id_flow_superior  VARCHAR2(100) PATH '$.flow'
                 ,id_flow           VARCHAR2(100) PATH '$.id'
                 ,type              VARCHAR2(10)  PATH '$.type'
                 ,flow_name         VARCHAR2(100) PATH '$.flow_name'
                 ,NESTED PATH '$.answers[*]' COLUMNS (
                    id_answer         NUMBER(10)      PATH '$.id'
                   ,answer_text       VARCHAR2(4000)  PATH '$.answer_text'
                   ,answer_capture    VARCHAR2(1)     PATH '$.capture'
                   ,capture_option    VARCHAR2(100)   PATH '$.capture_option'
                   ,captured_option   VARCHAR2(100)   PATH '$.captured_option'
                   ,timestamp_send    VARCHAR2(30)    PATH '$.timestamp_send'
                   ,timestamp_capture VARCHAR2(30)    PATH '$.timestamp_capture'
                   ,NESTED PATH '$.flows.answers[*]' COLUMNS (
                     answer_response          VARCHAR2(4000)  PATH '$.answer_text'
                    ,timestamp_send_response  VARCHAR2(30)    PATH '$.timestamp_send'
                    )
                  )
              )
          ) j,
          JSON_TABLE(v_convers_json, '$'
              COLUMNS (
                  table_name  VARCHAR2(100)  PATH '$.table_name'
                 ,id_pk       NUMBER(10)     PATH '$.id_pk'
                 ,remote_jid  VARCHAR2(20)   PATH '$.remote_jid'
              )
          ) k
    ) LOOP
      IF Upper(SubStr(PI_MENSAJE,1,v_ancho_capture)) = 'A' THEN /*ANULAR*/
        v_captured := 1;
        v_message_id := send_text(
              P_KEY      => v_key
             ,P_NUMBER   => v_remote_jid
             ,P_MESSAGE  => 'La gestión automática a sigo anulada.'
             ,P_RESPONSE => l_error
        );
        IF v_message_id IS NOT NULL THEN
          UPDATE bot_conversations b
          SET b.last_update = SYSDATE,
              b.status = 'ANULADO'
          WHERE b.conversation_id = v_convers_id
          ;
          UPDATE chats
          SET modified = current_timestamp
          WHERE id = PI_CHAT_ID
          ;
          COMMIT;
        END IF;
        EXIT;
      END IF;
      IF msg.answer_capture = 'N' AND msg.timestamp_send IS NOT NULL THEN
        v_flow_actual := msg.id_flow;
        Dbms_Output.Put_Line('msg.answer_capture = N');
      ELSE
        IF msg.id_flow_superior = v_flow_actual THEN
          IF msg.answer_capture = 'S' AND msg.timestamp_capture IS NULL THEN
            v_ancho_capture := Length(msg.capture_option);
            Dbms_Output.Put_Line('msg.capture_option:'||msg.capture_option);
            IF Upper(msg.capture_option) = Upper(SubStr(PI_MENSAJE,1,v_ancho_capture)) THEN
              v_captured := 1;
              IF msg.answer_response IS NOT NULL THEN
                v_message_id := send_text(
                      P_KEY      => v_key
                     ,P_NUMBER   => v_remote_jid
                     ,P_MESSAGE  => msg.answer_response
                     ,P_RESPONSE => l_error
                );
                IF v_message_id IS NOT NULL THEN
                  BEGIN
                    UPDATE chats
                    SET modified = current_timestamp
                    WHERE id = PI_CHAT_ID
                    ;
                    /*
                    Actualizar json
                    */
                    DECLARE
                        l_obj             JSON_OBJECT_T;
                        l_flows_arr       JSON_ARRAY_T;
                        l_flow_obj        JSON_OBJECT_T;
                        l_answers_arr     JSON_ARRAY_T;
                        l_answer_obj      JSON_OBJECT_T;
                        l_inner_flows_arr JSON_ARRAY_T;
                        v_timestamp       VARCHAR2(30);
                        l_inner_flow_obj  JSON_OBJECT_T;
                        l_inner_answers   JSON_ARRAY_T;
                        l_inner_answer    JSON_OBJECT_T;
                    BEGIN
                      l_obj := JSON_OBJECT_T.parse(v_convers_json);
                      l_flows_arr := l_obj.get_Array('flows');
                      l_flow_obj := TREAT(l_flows_arr.get(0) AS JSON_OBJECT_T);
                      l_answers_arr := l_flow_obj.get_Array('answers');
                      v_timestamp := To_Char(current_timestamp - INTERVAL '3' HOUR, 'DD.MM.YY HH24:MI:SS.FF3');
                      -- Iterar a través de cada respuesta en 'answers'
                      FOR i IN 0..l_answers_arr.get_size - 1 LOOP
                        l_answer_obj := TREAT(l_answers_arr.get(i) AS JSON_OBJECT_T);
                        -- Verificar si la respuesta tiene capture = 'S'
                        IF l_answer_obj.get_String('capture') = 'S' THEN
                          -- Si la respuesta tiene el valor de capture_option que coincide con PI_MENSAJE
                          IF l_answer_obj.get_String('capture_option') = Upper(SubStr(PI_MENSAJE,1,v_ancho_capture)) THEN
                            -- Actualizar los campos marcados
                            l_answer_obj.put('timestamp_send', v_timestamp );
                            l_answer_obj.put('timestamp_capture', v_timestamp );
                            l_answer_obj.put('captured_option', PI_MENSAJE);
                            -- Verificamos si tiene el array 'flows' interno
                            IF l_answer_obj.has('flows') THEN
                                l_inner_flows_arr := l_answer_obj.get_Array('flows');
                                -- Recorrer cada flow interno
                                FOR j IN 0..l_inner_flows_arr.get_size - 1 LOOP
                                    l_inner_flow_obj := TREAT(l_inner_flows_arr.get(j) AS JSON_OBJECT_T);
                                    -- Verificar si el flow tiene answers
                                    IF l_inner_flow_obj.has('answers') THEN
                                        l_inner_answers := l_inner_flow_obj.get_Array('answers');
                                        -- Recorrer cada answer dentro del flow interno
                                        FOR k IN 0..l_inner_answers.get_size - 1 LOOP
                                            l_inner_answer := TREAT(l_inner_answers.get(k) AS JSON_OBJECT_T);
                                            -- Actualizar el timestamp_send en este nivel también
                                            l_inner_answer.put('timestamp_send', v_timestamp );
                                        END LOOP;
                                    END IF;
                                END LOOP;
                            END IF;
                          END IF;
                        END IF;
                      END LOOP;
                      -- Convertir el objeto JSON actualizado a CLOB
                      v_convers_json := l_obj.to_clob;
                      -- Actualizar la tabla con el JSON modificado
                      UPDATE bot_conversations b
                      SET b.conversation_json = v_convers_json,
                          b.last_update = (SYSDATE - INTERVAL '3' HOUR) ,
                          b.status = 'FINALIZADO'
                      WHERE b.conversation_id = v_convers_id
                      ;
                    END;
                    COMMIT;
                  EXCEPTION
                    WHEN OTHERS THEN
                      v_error := SQLERRM;
                      INSERT INTO log_wapi (
                         fecha_hora
                        ,origen
                        ,dato
                      ) VALUES (
                         SYSDATE
                        ,'BOT_REPONSE'
                        ,v_error
                      );
                      COMMIT;
                  END;
                END IF;
              END IF;
            END IF;
          END IF;
        END IF;
      END IF;
    END LOOP;
    IF v_captured = 0 THEN
      v_message_id := send_text(
            P_KEY      => v_key
           ,P_NUMBER   => v_remote_jid
           ,P_MESSAGE  => 'No encontre tu retorno como opciones posibles, vuelve a intentar o bien ANULAR para descartar.'
           ,P_RESPONSE => l_error
      );
      IF v_message_id IS NOT NULL THEN
        UPDATE chats
        SET modified = current_timestamp
        WHERE id = PI_CHAT_ID
        ;
        COMMIT;
      END IF;
    END IF;
    apex_json.free_output;
  END p_bot;

    PROCEDURE P_DELETE_CHAT (
        PI_CHAT_ID CHATS.ID%TYPE
    ) IS
    BEGIN
        DELETE CHATS_DETAILS D
        WHERE
            D.CHAT_ID = PI_CHAT_ID;

        DELETE CHATS C
        WHERE
            C.ID = PI_CHAT_ID;

    END P_DELETE_CHAT;

  PROCEDURE p_update_group ( PI_KEY IN VARCHAR2
  ) IS
    l_response   CLOB;
    l_message    VARCHAR2(250);
    l_remote_jid VARCHAR2(250);
    l_connected  NUMBER := 0;
    l_error      NUMBER := 0;
  BEGIN
    l_response := apex_web_service.make_rest_request(
      P_URL => g_url|| '/group/getallgroups?key='|| pi_key,
      P_HTTP_METHOD => 'GET'
    );
    apex_json.parse(l_response);
    FOR I IN (
      SELECT jt.id_value
            ,jt.subject_value
      FROM json_table ( l_response, '$.instance_data.*'
                        COLUMNS (
                            id_value      VARCHAR2 ( 100 ) PATH '$.id',
                            subject_value VARCHAR2 ( 100 ) PATH '$.subject'
                        )
                      ) jt
    ) LOOP
      Dbms_Output.PUT_LINE('nro.:'|| I.ID_VALUE|| '      nombre:'|| I.SUBJECT_VALUE);
      UPDATE chats c
      SET c.push_name = i.subject_value
      WHERE i.id_value LIKE c.remote_jid || '%';
      COMMIT;
    END LOOP;
  EXCEPTION
    WHEN OTHERS THEN
      NULL;
  END p_update_group;

    PROCEDURE P_ENVIAR_RECORDATORIO IS

        V_KEY             DEVICES.KEY%TYPE;
        V_CHAT_ID         CHATS.ID%TYPE;
        V_DEVICE_ID       DEVICES.ID%TYPE;
        V_ERROR           VARCHAR2(32767);
        V_MESSAGE_ID      VARCHAR2(250);
        V_PHONE_NUMBER    DEVICES.PHONE_NUMBER%TYPE;
        V_SIGUIENTE_FLOW  BOT_FLOWS.ID%TYPE;
        V_INICIO          NUMBER := 1;
        V_MENSAJE_RETORNO VARCHAR2(32767);
        V_JSON_BOT        CLOB;
    BEGIN
        SELECT
            D.KEY,
            D.ID,
            D.PHONE_NUMBER
        INTO
            V_KEY,
            V_DEVICE_ID,
            V_PHONE_NUMBER
        FROM
            DEVICES D
        WHERE
                PKG_WAPI.CHECK_INSTANCE(D.KEY) = 1
            AND D.ES_BOT = 1
        FETCH FIRST 1 ROW ONLY;

        FOR I IN (
            SELECT
                S.ID_REGISTRO,
                S.TELEFONO,
                S.MENSAJE
            FROM
                aviso_reservas S
            WHERE
                S.FECHA_ENVIADO IS NULL
                AND S.FECHA_ENVIAR <= ( CURRENT_DATE - INTERVAL '3' HOUR )
        ) LOOP
            SELECT
                NVL(F.GOTO_FLOW, A.GOTO_FLOW)
            INTO V_SIGUIENTE_FLOW
            FROM
                BOT_FLOWS   F,
                BOT_ANSWERS A
            WHERE
                F.PARENT_FLOW IS NULL
                AND F.STATUS = '1'
                AND A.FLOW_ID = F.ID;

            FOR I IN (
                SELECT
                    B.ID                     AS ID_FLUJO,
                    B.FLOW_NAME,
                    B.PARENT_FLOW,
                    B.GOTO_FLOW              GOTO_FLOW_CAB,
                    P.ID                     ID_PREGUNTA,
                    P.ANSWER_TEXT || CHR(10) AS ANSWER_TEXT,
                    P.CAPTURE,
                    P.GOTO_FLOW,
                    P.CAPTURE_OPTION
                FROM
                    BOT_FLOWS   B,
                    BOT_ANSWERS P
                WHERE
                        B.STATUS = 1
                    AND B.PARENT_FLOW IS NULL
                    AND V_INICIO = 1
                    AND P.FLOW_ID = B.ID
                UNION ALL
                SELECT
                    B.ID        AS ID_FLUJO,
                    B.FLOW_NAME,
                    B.PARENT_FLOW,
                    B.GOTO_FLOW GOTO_FLOW_CAB,
                    P.ID        ID_PREGUNTA,
                    P.ANSWER_TEXT,
                    P.CAPTURE,
                    P.GOTO_FLOW,
                    P.CAPTURE_OPTION
                FROM
                    BOT_FLOWS   B,
                    BOT_ANSWERS P
                WHERE
                        B.STATUS = 1
                    AND B.ID = V_SIGUIENTE_FLOW
                    AND P.FLOW_ID = B.ID
                ORDER BY
                    ID_PREGUNTA ASC
            ) LOOP
                V_MENSAJE_RETORNO := V_MENSAJE_RETORNO
                                     || I.ANSWER_TEXT
                                     || CHR(10);
            END LOOP;
        --Se reemplaza en mensaje enviado.
            V_MENSAJE_RETORNO := REPLACE(V_MENSAJE_RETORNO,
                                         '#MENSAJE#',
                                         TRIM(I.MENSAJE));
            V_MESSAGE_ID := SEND_TEXT(
                P_KEY      => V_KEY,
                P_NUMBER   => I.TELEFONO,
                P_MESSAGE  => V_MENSAJE_RETORNO,
                P_RESPONSE => V_ERROR
            );

            APEX_JSON.INITIALIZE_CLOB_OUTPUT;
            APEX_JSON.OPEN_OBJECT;
            APEX_JSON.OPEN_OBJECT('atributos');
            APEX_JSON.WRITE('id_flujo', V_SIGUIENTE_FLOW);
            APEX_JSON.CLOSE_OBJECT;
            APEX_JSON.CLOSE_OBJECT;
            V_JSON_BOT := APEX_JSON.GET_CLOB_OUTPUT;
            APEX_JSON.FREE_OUTPUT;
            IF V_MESSAGE_ID IS NOT NULL THEN
                BEGIN
                    SELECT
                        CH.ID
                    INTO V_CHAT_ID
                    FROM
                        CHATS CH
                    WHERE
                            CH.REMOTE_JID = I.TELEFONO
                        AND CH.DEVICE_ID = V_DEVICE_ID;

                EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                        V_CHAT_ID := SEQ_CHATS.NEXTVAL;
                        INSERT INTO CHATS (
                            DEVICE_ID,
                            ID,
                            CREATED,
                            REMOTE_JID
                        ) VALUES ( V_DEVICE_ID          --device_id
                        ,
                                   V_CHAT_ID            --id
                                   ,
                                   CURRENT_TIMESTAMP    --created
                                   ,
                                   I.TELEFONO           --remote_jid
                                    );

                END;

                INSERT INTO CHATS_DETAILS (
                    CHAT_ID,
                    MESSAGE,
                    CREATED,
                    OWNER,
                    MESSAGE_ID,
                    USERNAME
                ) VALUES ( V_CHAT_ID               --chat_id
                ,
                           I.MENSAJE               --message
                           ,
                           CURRENT_TIMESTAMP      --created
                           ,
                           'S'                    --owner
                           ,
                           V_MESSAGE_ID           --message_id
                           ,
                           'BOT'                  --username
                            );

                UPDATE aviso_reservas S
                SET
                    S.TELEFONO_ENVIADO = V_PHONE_NUMBER,
                    S.FECHA_ENVIADO = ( CURRENT_DATE - INTERVAL '3' HOUR )
                WHERE
                    S.ID_REGISTRO = I.ID_REGISTRO;

                COMMIT;
            END IF;

        END LOOP;

    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20099,
                                    'Error al realizar SEND MESSAGES: '
                                    || SQLERRM
                                    || CHR(10)
                                    || 'Trace: '
                                    || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE());
    END P_ENVIAR_RECORDATORIO;

  FUNCTION p_clientes_tel (PI_ID_CHAT NUMBER
  ) RETURN VARCHAR2
  IS
    v_remote_jid chats.remote_jid%TYPE;
    v_clob       CLOB;
  BEGIN
    SELECT SubStr(c.remote_jid,4,12)
    INTO v_remote_jid
    FROM chats c
    WHERE c.id = PI_ID_CHAT;
    /*
    v_clob := get_pac_info(pi_tel => v_remote_jid);
    */
    RETURN v_clob;
  EXCEPTION
    WHEN No_Data_Found THEN
      Raise_Application_Error(-20999,'Error en la busqueda de datos del chat.');
  END p_clientes_tel;

  FUNCTION get_pac_info (PI_TEL IN VARCHAR2
  ) RETURN CLOB
  IS
    v_url       VARCHAR2(1000);-- := 'https://acceso.clinicasantamaria.com.py/clinica/santamaria/datos_pac/info';
    v_response  CLOB;
  BEGIN
    apex_web_service.g_request_headers(1).name := 'tel';
    apex_web_service.g_request_headers(1).value := PI_TEL;
    v_response := apex_web_service.make_rest_request(
         p_url         => v_url
        ,p_http_method => 'GET'
    );
    RETURN Nvl(v_response,'{}');
  END get_pac_info;

  PROCEDURE p_enviar_archivo (
      PI_ID_DEVICE  IN devices.id%TYPE,
      PI_REMOTE_JID IN chats.remote_jid%TYPE,
      PI_ID_ARCHIVO IN tmp_file_whatsapp.id_file%TYPE,
      PI_MENSAJE    IN varchar2
  ) IS
    v_key        DEVICES.KEY%TYPE;
    v_mime       VARCHAR2(100);
    v_nombre     VARCHAR2(200);
    v_tipo       VARCHAR2(10);
    v_url        VARCHAR2(1000);
    v_message_id VARCHAR2(250);
    v_error      VARCHAR2(4000);
    v_remote_jid chats.remote_jid%TYPE;
  BEGIN
    SELECT d.key
    INTO v_key
    FROM devices d
    WHERE d.id = PI_ID_DEVICE;
    IF pkg_wapi.check_instance(v_key) != 1 THEN
      raise_application_error(-20001, 'Instancia no conectada.');
    END IF;
    SELECT c.remote_jid
    INTO v_remote_jid
    FROM chats c
    WHERE c.id = PI_REMOTE_JID
    AND c.device_id = PI_ID_DEVICE;
    SELECT t.file_name, t.file_mime_type
    INTO v_nombre, v_mime
    FROM tmp_file_whatsapp t
    WHERE t.id_file = PI_ID_ARCHIVO;
    v_url := 'https://gc42a911feb841d-w7aqdhe7w3lgqyut.adb.sa-santiago-1.oraclecloudapps.com/ords/cbc/wga_img/' || PI_ID_ARCHIVO;
    v_tipo := CASE
        WHEN v_mime LIKE 'image/%' THEN 'image'
        WHEN v_mime = 'application/pdf' THEN 'document'
        ELSE 'document'
    END;
    v_message_id := pkg_wapi.send_file_url(
        p_key      => v_key,
        p_number   => v_remote_jid,
        p_message  => PI_MENSAJE,
        p_url      => v_url,
        p_type     => v_tipo,
        p_mimetype => v_mime,
        p_response => v_error
    );
    --pkg_wapi.logger('Archivo enviado: ' || v_nombre || ' - mensaje_id: ' || v_message_id, 'P_ENVIAR_ARCHIVO');
  EXCEPTION
    WHEN OTHERS THEN
      Raise_Application_Error(-20099, 'Error al enviar archivo: ' || SQLERRM);
  END p_enviar_archivo;

  PROCEDURE p_guardar_cola_msg ( PI_JSON IN BLOB
  ) IS
  v_mensaje         cola_mensaje.mensaje%TYPE;
  v_fecha_enviar    cola_mensaje.fecha_enviar%TYPE;
  v_prioridad       cola_mensaje.prioridad%TYPE;
  v_usuario         cola_mensaje.usuario%TYPE;
  v_cuenta_enviar   cola_mensaje.cuenta_enviar%TYPE;
  v_suc_id_sucursal cola_mensaje.suc_id_sucursal%TYPE;
  v_destinatario    cola_mensaje.destinatario%TYPE;
  v_json            CLOB;
  v_json_values     apex_json.t_values;
  BEGIN
    v_json := B2C(PI_JSON);
    apex_json.parse(
      p_values => v_json_values,
      p_source => v_json
    );
    v_mensaje := apex_json.get_varchar2(
      p_path   => 'mensaje',
      p_values => v_json_values);
    v_fecha_enviar := apex_json.get_date(
      p_path => 'fecha_enviar',
      p_format => 'DD-MM-YYYY HH24:MI');
    v_prioridad := apex_json.get_varchar2(
      p_path   => 'prioridad',
      p_values => v_json_values);
    v_usuario := apex_json.get_varchar2(
      p_path   => 'usuario',
      p_values => v_json_values);
    v_cuenta_enviar := apex_json.get_varchar2(
      p_path   => 'celular_salida',
      p_values => v_json_values);
    v_suc_id_sucursal := apex_json.get_number(
      p_path   => 'id_sucursal',
      p_values => v_json_values);
    v_destinatario := apex_json.get_varchar2(
      p_path   => 'destinatario',
      p_values => v_json_values);
    IF v_mensaje IS NULL THEN
      Raise_Application_Error(-20002,'No se recibio texto a enviar.');
    END IF;
    IF v_destinatario IS NULL THEN
      Raise_Application_Error(-20002,'No se recibio destinatario del mensaje a enviar.');
    END IF;
    IF v_suc_id_sucursal IS NULL AND v_cuenta_enviar IS NULL THEN
      Raise_Application_Error(-20002,'Debe definir, cuenta a enviar o sucursal a la que corresponde.');
    END IF;
    v_destinatario := normalizar_celular(v_destinatario);
    INSERT INTO cola_mensaje (
        id_cola_mensaje
      , gru_id_grupo_cola
      , destinatario
      , mensaje
      , fecha_alta
      , fecha_enviar
      , fecha_enviado
      , prioridad
      , usuario
      , cuenta_enviar
      , cuenta_envio
      , fecha_error
      , error
      , suc_id_sucursal
    ) VALUES (
        NULL          --id_cola_mensaje
      , NULL          --gru_id_grupo_cola
      , v_destinatario--destinatario
      , v_mensaje     --mensaje
      , SYSDATE       --fecha_alta
      , v_fecha_enviar--fecha_enviar
      , NULL          --fecha_enviado
      , v_prioridad   --prioridad
      , v_usuario     --usuario
      , v_cuenta_enviar--cuenta_enviar
      , NULL  --cuenta_envio
      , NULL  --fecha_error
      , NULL  --error
      , v_suc_id_sucursal--suc_id_sucursal
    );
    COMMIT;
  END p_guardar_cola_msg;

  BEGIN
    inicializar_constantes;

END PKG_WAPI;
/
