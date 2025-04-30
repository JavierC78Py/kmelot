PROMPT CREATE OR REPLACE PACKAGE principal.pkg_gestion_bot
CREATE OR REPLACE PACKAGE principal.pkg_gestion_bot AS
  -- *****************************************************************
  --
  --    MODIFICADO   (DD/MM/YYYY)
  --    caballerof   04/04/2025 - Creado.
  -- *****************************************************************
  PROCEDURE P_SIGUIENTE_PASO (PI_PARENT_FLOW bot_flows.parent_flow%TYPE
                             ,PI_FLOW        VARCHAR2
  );

  PROCEDURE P_GENERA_SEGUIMIENTO (PI_ID_FLOW    IN bot_flows.id%TYPE
                                 ,PI_NOMBRE_PK  IN VARCHAR2
                                 ,PI_ID_PK      IN NUMBER
                                 ,PI_REMOTE_JID IN VARCHAR2
                                 ,PO_JSON_FLOW  OUT CLOB
  );

  PROCEDURE P_GENERA_FLOW (PI_ID_FLOW IN bot_flows.id%TYPE
                          ,PI_FLOW        VARCHAR2
  );

  PROCEDURE P_OBT_RESERVAS_PEND;

  PROCEDURE P_INICIAR_BOT;

END pkg_gestion_bot;
/

PROMPT CREATE OR REPLACE PACKAGE BODY principal.pkg_gestion_bot
CREATE OR REPLACE PACKAGE BODY principal.pkg_gestion_bot AS

  PROCEDURE P_SIGUIENTE_PASO (PI_PARENT_FLOW bot_flows.parent_flow%TYPE
                             ,PI_FLOW        VARCHAR2
  )
  IS
  BEGIN
    apex_json.open_array('answers');
    FOR n3 IN (
      SELECT f.*
      FROM bot_answers f
      WHERE f.flow_id = PI_PARENT_FLOW
      ORDER BY id ASC
    ) LOOP
      apex_json.open_object;
      apex_json.WRITE('flow',PI_FLOW);
      apex_json.WRITE('id',n3.id);
      apex_json.WRITE('type','answer');
      apex_json.WRITE('name','',TRUE);
      apex_json.WRITE('answer_text',n3.answer_text);
      apex_json.WRITE('capture',n3.capture);
      apex_json.WRITE('capture_option',n3.capture_option);
      apex_json.WRITE('timestamp_send','',TRUE );
      IF n3.capture = 'S' THEN
        apex_json.WRITE('timestamp_capture','',TRUE );
        IF n3.goto_flow IS NOT NULL THEN
          apex_json.open_array('flows');
          PKG_GESTION_BOT.P_GENERA_FLOW(pi_id_flow => n3.goto_flow
                                       ,pi_flow => PI_FLOW
                                     --,pi_flow => PI_FLOW||'.'||n3.id
          );
          apex_json.close_array;
        END IF;
      END IF;
      apex_json.close_object;
    END LOOP;
    apex_json.close_array;
  END P_SIGUIENTE_PASO;

  PROCEDURE P_GENERA_SEGUIMIENTO (PI_ID_FLOW    IN bot_flows.id%TYPE
                                 ,PI_NOMBRE_PK  IN VARCHAR2
                                 ,PI_ID_PK      IN NUMBER
                                 ,PI_REMOTE_JID IN VARCHAR2
                                 ,PO_JSON_FLOW  OUT CLOB
  )
  IS
    v_clob    CLOB;
  BEGIN
    -- Inicializar el CLOB
    Dbms_Lob.createtemporary(v_clob, FALSE);
    -- Construir el JSON usando APEX_JSON
    apex_json.initialize_clob_output(p_preserve=>TRUE);

    apex_json.open_object;
    FOR n1 IN (
      SELECT f.*
      FROM bot_flows f
      WHERE f.id = PI_ID_FLOW
      AND f.status = '1'
    ) LOOP
      apex_json.WRITE('flow','',TRUE);
      apex_json.WRITE('id',PI_ID_FLOW);
      apex_json.WRITE('type','flow');
      apex_json.WRITE('flow_name',n1.flow_name);
      apex_json.WRITE('table_name',PI_NOMBRE_PK);
      apex_json.WRITE('id_pk',PI_ID_PK);
      apex_json.WRITE('remote_jid',PI_REMOTE_JID);
      PKG_GESTION_BOT.P_SIGUIENTE_PASO(pi_parent_flow => n1.id
                                      ,pi_flow => PI_ID_FLOW
      );
      apex_json.open_array('flows');
      PKG_GESTION_BOT.P_GENERA_FLOW(pi_id_flow => n1.goto_flow
                                   ,pi_flow => PI_ID_FLOW
      );
      apex_json.close_array;

    END LOOP;
    apex_json.close_object;

    v_clob := apex_json.get_clob_output;
    INSERT INTO tmp_javier VALUES (SYSDATE,v_clob);
    PO_JSON_FLOW := v_clob;
    apex_json.free_output;
    Dbms_Lob.freetemporary(v_clob);
  END P_GENERA_SEGUIMIENTO;

  PROCEDURE P_GENERA_FLOW (PI_ID_FLOW IN bot_flows.id%TYPE
                          ,PI_FLOW        VARCHAR2
  ) IS
  BEGIN
      FOR n1_1 IN(
        SELECT f.*
        FROM bot_flows f
        WHERE f.id = PI_ID_FLOW
        AND f.status = '1'
        ORDER BY f.id ASC
      ) LOOP
        apex_json.open_object;
        apex_json.WRITE('flow',PI_FLOW);
        apex_json.WRITE('id',n1_1.id);
        apex_json.WRITE('type','flow');
        apex_json.WRITE('flow_name',n1_1.flow_name);
        IF n1_1.goto_flow IS NULL THEN
          P_SIGUIENTE_PASO(pi_parent_flow => n1_1.id
                          ,pi_flow => n1_1.id
          );
        END IF;
        apex_json.close_object;
      END LOOP;
  END P_GENERA_FLOW;

  PROCEDURE P_OBT_RESERVAS_PEND
  IS
    v_url         VARCHAR2(1000) := 'https://acceso.clinicasantamaria.com.py/clinica/santamaria/datos_pac/msg_agendar_bot';
    v_url_put     VARCHAR2(1000) := 'https://acceso.clinicasantamaria.com.py/clinica/santamaria/datos_pac/marca_reser_agendado';
    v_response    CLOB;
    v_respon_put  CLOB;
    v_id_flow     NUMBER := 19;
    v_bot_name    VARCHAR2(50) := 'RESERVA_CONSULTA_PREPAGA';
    v_json_flow   CLOB;
  BEGIN
    v_response := apex_web_service.make_rest_request(
         p_url         => v_url
        ,p_http_method => 'GET'
    );
    IF v_response IS NULL OR v_response = Empty_Clob() THEN
      RETURN;
    END IF;
    FOR reg IN (
      SELECT j.id_reserva_consulta
            ,To_Date(j.fecha_turno,'dd-mm-yyyy hh24:mi') AS fecha_turno
            ,j.id_prestador
            ,j.nombre_prestador
            ,j.nombre_paciente
            ,j.nro_celular
      FROM JSON_TABLE(v_response, '$.reservas[*]'
              COLUMNS (
                  id_reserva_consulta NUMBER(10)    PATH '$.ID_RESERVA_CONSULTA'
                 ,fecha_turno         VARCHAR2(20)  PATH '$.FECHA_TURNO'
                 ,id_prestador        NUMBER(10)    PATH '$.ID_PRESTADOR'
                 ,nombre_prestador    VARCHAR2(200) PATH '$.NOMBRE_PRESTADOR'
                 ,nombre_paciente     VARCHAR2(200) PATH '$.NOMBRE_PACIENTE'
                 ,nro_celular         VARCHAR2(20)  PATH '$.NRO_CELULAR'
              )
          ) j
    ) LOOP
      p_genera_seguimiento(
          pi_id_flow    => v_id_flow
        , pi_nombre_pk  => v_bot_name
        , pi_id_pk      => reg.id_reserva_consulta
        , pi_remote_jid => reg.nro_celular
        , po_json_flow  => v_json_flow);
      v_json_flow := REPLACE(v_json_flow,'#NOMBRE_PAC#',reg.nombre_paciente);
      v_json_flow := REPLACE(v_json_flow,'#DIA#',To_Char(reg.fecha_turno,'dd-MON-yyyy'));
      v_json_flow := REPLACE(v_json_flow,'#HORA#',To_Char(reg.fecha_turno,'hh24:mi'));
      v_json_flow := REPLACE(v_json_flow,'#PRESTADOR#',reg.nombre_prestador);
      INSERT INTO bot_conversations (
          conversation_id
        , chat_id
        , bot_name
        , bot_id_pk
        , conversation_json
        , start_date
        , last_update
        , status
      ) VALUES (
          NULL        --conversation_id
        , NULL        --chat_id
        , v_bot_name  --bot_name
        , reg.id_reserva_consulta     --bot_id_pk
        , v_json_flow --conversation_json
        , reg.fecha_turno --start_date
        , NULL        --last_update
        , 'ACTIVO'    --status
      );
      COMMIT;
      apex_web_service.g_request_headers(1).name := 'id_reserva';
      apex_web_service.g_request_headers(1).value := reg.id_reserva_consulta;
      v_respon_put := apex_web_service.make_rest_request(
           p_url         => v_url_put
          ,p_http_method => 'PUT'
      );
      IF apex_web_service.g_status_code = 200 THEN
        apex_json.parse(v_respon_put);
      END IF;
    END LOOP;
  END P_OBT_RESERVAS_PEND;

  PROCEDURE P_INICIAR_BOT
  IS
    TYPE t_tabla_records IS TABLE OF bot_conversations%ROWTYPE;
    l_registros t_tabla_records;
    l_tamano_lote CONSTANT PLS_INTEGER := 5;
    v_device_bot devices.id%TYPE;
    EOL CONSTANT VARCHAR2(2) := '\n';
  BEGIN
  /*
    Iniciar el chat para nuevas conversaciones
    START_DATE = hora desde la cual enviar si LAST_UPDATE = NULL
    y status = ACTIVO
  */
    BEGIN
      SELECT d.id
      INTO v_device_bot
      FROM devices d
      WHERE d.es_bot = 1
      AND pkg_wapi.check_instance(d.key) = 1;
    EXCEPTION
      WHEN No_Data_Found THEN
        RETURN;
    END;
    Dbms_Output.Put_Line('Encontrado.');
    SELECT  *
    BULK COLLECT
    INTO l_registros
    FROM bot_conversations b
    WHERE /*b.start_date <= SYSDATE
    AND*/ b.last_update IS NULL
    AND b.status = 'ACTIVO'
    FETCH FIRST l_tamano_lote ROWS ONLY;
    IF l_registros.COUNT = 0 THEN
      RETURN;
    END IF;
    FOR i IN 1..l_registros.COUNT LOOP
    Dbms_Output.Put_Line('registro:'||l_registros(i).conversation_id);
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
           ,j.timestamp_send
           ,j.timestamp_capture
           ,j.answer_reponse
           ,j.timestamp_send_response
        FROM JSON_TABLE(l_registros(i).conversation_json, '$'
                COLUMNS (
                    id_flow_superior  VARCHAR2(100) PATH '$.flow'
                   ,id_flow           VARCHAR2(100) PATH '$.id'
                   ,type        VARCHAR2(10)  PATH '$.type'
                   ,flow_name   VARCHAR2(100) PATH '$.flow_name'
                   ,table_name  VARCHAR2(100) PATH '$.table_name'
                   ,id_pk       NUMBER(10)    PATH '$.id_pk'
                   ,remote_jid  VARCHAR2(20)  PATH '$.remote_jid'
                   ,NESTED PATH '$.answers[*]' COLUMNS (
                      id_answer   NUMBER(10) PATH '$.id'
                     ,answer_text     VARCHAR2(4000)  PATH '$.answer_text'
                     ,answer_capture  VARCHAR2(1)     PATH '$.capture'
                     ,capture_option  VARCHAR2(100)   PATH '$.capture_option'
                     ,timestamp_send  TIMESTAMP   PATH '$.timestamp_send'
                     ,timestamp_capture TIMESTAMP PATH '$.timestamp_capture'
                     ,NESTED PATH '$.flows.answers[*]' COLUMNS (
                       answer_reponse           VARCHAR2(4000) PATH '$.answer_text'
                      ,timestamp_send_response  TIMESTAMP PATH '$.timestamp_send'
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
           ,j.timestamp_send
           ,j.timestamp_capture
           ,j.answer_reponse
           ,j.timestamp_send_response
        FROM JSON_TABLE(l_registros(i).conversation_json, '$.flows[*]'
                COLUMNS (
                    id_flow_superior VARCHAR2(100) PATH '$.flow'
                   ,id_flow   VARCHAR2(100) PATH '$.id'
                   ,type      VARCHAR2(10)  PATH '$.type'
                   ,flow_name VARCHAR2(100) PATH '$.flow_name'
                   ,NESTED PATH '$.answers[*]' COLUMNS (
                      id_answer   NUMBER(10)      PATH '$.id'
                     ,answer_text VARCHAR2(4000)  PATH '$.answer_text'
                     ,answer_capture VARCHAR2(1)  PATH '$.capture'
                     ,capture_option VARCHAR2(100) PATH '$.capture_option'
                     ,timestamp_send TIMESTAMP    PATH '$.timestamp_send'
                     ,timestamp_capture TIMESTAMP PATH '$.timestamp_capture'
                     ,NESTED PATH '$.flows.answers[*]' COLUMNS (
                       answer_reponse VARCHAR2(4000)      PATH '$.answer_text'
                      ,timestamp_send_response TIMESTAMP  PATH '$.timestamp_send'
                      )
                    )
                )
            ) j,
            JSON_TABLE(l_registros(i).conversation_json, '$'
                COLUMNS (
                    table_name VARCHAR2(100) PATH '$.table_name'
                   ,id_pk NUMBER(10) PATH '$.id_pk'
                   ,remote_jid VARCHAR2(20) PATH '$.remote_jid'
                )
            ) k
      ) LOOP
        IF msg.answer_capture = 'N' THEN
          msg.answer_text := REPLACE(msg.answer_text,'#SALTO#',EOL);
          pkg_wapi.send_new_text_message(
              p_remote_jid => '595981429971'--msg.remote_jid
            , p_mensaje => msg.answer_text
            , p_id_device => v_device_bot
          );
--          l_registros(i).conversation_json := json_transform(
--                l_registros(i).conversation_json,
--                SET '$.answers[0].'
--BEGIN
--  UPDATE tmp_javier t
--  SET retorno = JSON_TRANSFORM(
--      t.retorno,
--      SET '$.answers[0].timestamp_send' = TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD"T"HH24:MI:SS.FF3"Z"')
--  )
--  WHERE
--      JSON_VALUE(t.retorno, '$.id' RETURNING NUMBER) = 19 AND
--      JSON_EXISTS(t.retorno, '$.answers[0]?(@.id == 34)');
--    --COMMIT;
--END;


          mi_sleep(3);
        END IF;
      END LOOP;
    END LOOP;
  END P_INICIAR_BOT;

END pkg_gestion_bot;
/
SELECT *
FROM bot_flows
/
SELECT *
FROM bot_answers
/
pkg_wapi
/
SELECT *
FROM v_reservas_bot v
--WHERE v.fecha_turno BETWEEN Trunc((SYSDATE + (18/24)),'HH') AND Trunc((SYSDATE + (20/24)),'HH')
WHERE v.fecha_turno BETWEEN To_Date('01-05-2025 09:00','dd-mm-yyyy hh24:mi') AND To_Date('01-05-2025 10:00','dd-mm-yyyy hh24:mi')
/
DELETE tmp_javier
/
DELETE bot_conversations
/
BEGIN
pkg_gestion_bot.p_iniciar_bot;
END;
/
BEGIN
pkg_gestion_bot.p_obt_reservas_pend;
END;

/
DECLARE
  v_json_flow CLOB;
BEGIN
  pkg_gestion_bot.p_genera_seguimiento(
      pi_id_flow => 19
    , pi_nombre_pk => 'RESERVA_CONSULTA_PREPAGA'
    , pi_id_pk => 22465
    , po_json_flow => v_json_flow);
END;
/
SELECT *
FROM tmp_javier
/
DELETE tmp_javier
/
SELECT *
FROM bot_answers
/
SELECT *
FROM chats
/
SELECT *
FROM chats_details
/
SELECT *
FROM bot_conversations