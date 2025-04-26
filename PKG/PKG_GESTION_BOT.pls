PROMPT CREATE OR REPLACE PACKAGE principal.pkg_gestion_bot
CREATE OR REPLACE PACKAGE principal.pkg_gestion_bot AS
  -- *****************************************************************
  --
  --    MODIFICADO   (DD/MM/YYYY)
  --    caballerof   04/04/2025 - Creado.
  -- *****************************************************************
  PROCEDURE P_SIGUIENTE_PASO (PI_PARENT_FLOW bot_flows.parent_flow%TYPE);

  PROCEDURE P_GENERA_SEGUIMIENTO (PI_ID_FLOW    IN bot_flows.id%TYPE
                                 ,PO_JSON_FLOW  OUT CLOB
  );

  PROCEDURE P_GENERA_FLOW (PI_ID_FLOW IN bot_flows.id%TYPE);

END pkg_gestion_bot;
/

PROMPT CREATE OR REPLACE PACKAGE BODY principal.pkg_gestion_bot
CREATE OR REPLACE PACKAGE BODY principal.pkg_gestion_bot AS

  PROCEDURE P_SIGUIENTE_PASO (PI_PARENT_FLOW bot_flows.parent_flow%TYPE)
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
      apex_json.WRITE('type','answer');
      apex_json.WRITE('id',n3.id);
      apex_json.WRITE('answer_text',n3.answer_text);
      apex_json.WRITE('capture',n3.capture);
      apex_json.WRITE('capture_option',n3.capture_option);
      apex_json.WRITE('timestamp_send','',TRUE );
      IF n3.capture = 'S' THEN
        apex_json.WRITE('timestamp_capture','',TRUE );
        IF n3.goto_flow IS NOT NULL THEN
          apex_json.open_array('flow');
          PKG_GESTION_BOT.P_GENERA_FLOW(pi_id_flow => n3.goto_flow);
          apex_json.close_array;
        END IF;
      END IF;
      apex_json.close_object;
    END LOOP;
    apex_json.close_array;
  END P_SIGUIENTE_PASO;

  PROCEDURE P_GENERA_SEGUIMIENTO (PI_ID_FLOW    IN bot_flows.id%TYPE
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
      apex_json.WRITE('id',PI_ID_FLOW);
      apex_json.WRITE('flow_name',n1.flow_name);
      apex_json.WRITE('goto_flow',n1.goto_flow);
      apex_json.WRITE('last_timestamp','',TRUE );
      apex_json.WRITE('last_flowId','',TRUE );
      PKG_GESTION_BOT.P_SIGUIENTE_PASO(pi_parent_flow => n1.id);
      apex_json.open_array('flow');
      PKG_GESTION_BOT.P_GENERA_FLOW(pi_id_flow => n1.goto_flow);
      apex_json.close_array;

    END LOOP;
    apex_json.close_object;

    v_clob := apex_json.get_clob_output;
    INSERT INTO tmp_javier VALUES (SYSDATE,v_clob);
    PO_JSON_FLOW := v_clob;
    apex_json.free_output;
    Dbms_Lob.freetemporary(v_clob);
  END P_GENERA_SEGUIMIENTO;

  PROCEDURE P_GENERA_FLOW (PI_ID_FLOW IN bot_flows.id%TYPE)
  IS
  BEGIN
      FOR n1_1 IN(
        SELECT f.*
        FROM bot_flows f
        WHERE f.id = PI_ID_FLOW
        AND f.status = '1'
        ORDER BY f.id ASC
      ) LOOP
        apex_json.open_object;
        apex_json.WRITE('id',n1_1.id);
        apex_json.WRITE('type','flow');
        apex_json.WRITE('flow_name',n1_1.flow_name);
        IF n1_1.goto_flow IS NULL THEN
          P_SIGUIENTE_PASO(pi_parent_flow => n1_1.id);
        END IF;
        apex_json.close_object;
      END LOOP;

  END P_GENERA_FLOW;

END pkg_gestion_bot;
/

DECLARE
  v_clob CLOB;
BEGIN
  pkg_gestion_bot.p_genera_seguimiento(pi_id_flow => 19, po_json_flow => v_clob);
END;
/
DELETE tmp_javier