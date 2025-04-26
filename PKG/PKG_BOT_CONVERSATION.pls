PROMPT CREATE OR REPLACE PACKAGE principal.pkg_bot_conversation
CREATE OR REPLACE PACKAGE principal.pkg_bot_conversation AS
  -- Iniciar o recuperar una conversación
  FUNCTION get_conversation(p_phone_number IN VARCHAR2) RETURN CLOB;

  -- Actualizar una conversación con la respuesta del usuario
  PROCEDURE update_conversation(
      p_phone_number  IN VARCHAR2,
      p_user_response IN VARCHAR2,
      p_flow_json     IN CLOB,
      p_updated_json  OUT NOCOPY CLOB
  );

  -- Marcar una conversación como finalizada
  PROCEDURE finish_conversation(p_phone_number IN VARCHAR2);
END pkg_bot_conversation;
/

PROMPT CREATE OR REPLACE PACKAGE BODY principal.pkg_bot_conversation
CREATE OR REPLACE PACKAGE BODY principal.pkg_bot_conversation AS
  -- Iniciar o recuperar una conversación
  FUNCTION get_conversation(p_phone_number IN VARCHAR2) RETURN CLOB IS
    v_conversation_json CLOB;
    v_count NUMBER;
  BEGIN
    -- Verificar si existe una conversación activa
    SELECT COUNT(*)
    INTO v_count
    FROM bot_conversations
    WHERE phone_number = p_phone_number
    AND status = 'ACTIVE';

    IF v_count > 0 THEN
      -- Recuperar la conversación existente
      SELECT conversation_json
      INTO v_conversation_json
      FROM bot_conversations
      WHERE phone_number = p_phone_number
      AND status = 'ACTIVE';
    ELSE
      -- No hay conversación, devolver NULL
      v_conversation_json := NULL;
    END IF;

    RETURN v_conversation_json;
  END get_conversation;

  -- Actualizar una conversación con la respuesta del usuario
  PROCEDURE update_conversation(
    p_phone_number IN VARCHAR2,
    p_user_response IN VARCHAR2,
    p_flow_json IN CLOB,
    p_updated_json OUT NOCOPY CLOB
  ) IS
    v_conversation_id NUMBER;
    v_count NUMBER;

    -- Variables para el procesamiento del flujo
    v_current_flow_id NUMBER;
    v_flow_name VARCHAR2(200);
    v_timestamp VARCHAR2(30) := TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD"T"HH24:MI:SS.FF3"Z"');
    v_has_state NUMBER;

    -- Variables para manipulación de JSON
    v_temp_clob CLOB;
  BEGIN
    -- Inicializar el CLOB de salida
    p_updated_json := p_flow_json;

    -- Verificar si ya existe un estado en el JSON
    SELECT CASE
             WHEN JSON_EXISTS(p_flow_json, '$.current_state') THEN 1
             ELSE 0
           END
    INTO v_has_state
    FROM dual;

    IF v_has_state = 1 THEN
      -- Obtener el ID del flujo actual
      SELECT JSON_VALUE(p_flow_json, '$.current_state.current_flow_id' RETURNING NUMBER)
      INTO v_current_flow_id
      FROM dual;

      -- Agregar la respuesta del usuario al estado existente manualmente
      DECLARE
        v_response_json VARCHAR2(2000);
        v_insert_pos PLS_INTEGER;
        v_responses_end PLS_INTEGER;
        v_responses_array VARCHAR2(100);
        v_user_responses_pos PLS_INTEGER;
      BEGIN
        -- Crear el objeto JSON para la respuesta
        v_response_json := '{"flowId":' || v_current_flow_id ||
                           ',"response":"' || REPLACE(p_user_response, '"', '\"') || '"' ||
                           ',"timestamp":"' || v_timestamp || '"}';

        -- Buscar la posición del array de user_responses
        v_user_responses_pos := DBMS_LOB.INSTR(p_updated_json, '"user_responses"');
        IF v_user_responses_pos > 0 THEN
          -- Buscar el array
          v_responses_array := '"user_responses":';
          v_insert_pos := DBMS_LOB.INSTR(p_updated_json, v_responses_array) + LENGTH(v_responses_array);
          -- Avanzar hasta el inicio del array
          WHILE SUBSTR(DBMS_LOB.SUBSTR(p_updated_json, 1, v_insert_pos), 1, 1) IN (' ', CHR(9), CHR(10), CHR(13)) LOOP
            v_insert_pos := v_insert_pos + 1;
          END LOOP;
          -- Verificar si el array está vacío
          IF SUBSTR(DBMS_LOB.SUBSTR(p_updated_json, 1, v_insert_pos), 1, 1) = '[' THEN
            v_insert_pos := v_insert_pos + 1;
            -- Verificar si el array está vacío o tiene elementos
            IF SUBSTR(DBMS_LOB.SUBSTR(p_updated_json, 10, v_insert_pos), 1, 1) = ']' THEN
                -- Array vacío, insertamos sin coma
                DBMS_LOB.CREATETEMPORARY(v_temp_clob, TRUE);
                DBMS_LOB.COPY(v_temp_clob, p_updated_json, v_insert_pos - 1);
                DBMS_LOB.APPEND(v_temp_clob, v_response_json);
                DBMS_LOB.APPEND(v_temp_clob, DBMS_LOB.SUBSTR(p_updated_json, DBMS_LOB.GETLENGTH(p_updated_json) - v_insert_pos + 1, v_insert_pos));
                p_updated_json := v_temp_clob;
                DBMS_LOB.FREETEMPORARY(v_temp_clob);
            ELSE
              -- Array tiene elementos, buscar el final del array
              v_responses_end := v_insert_pos;
              WHILE SUBSTR(DBMS_LOB.SUBSTR(p_updated_json, 1, v_responses_end), 1, 1) != ']' LOOP
                v_responses_end := v_responses_end + 1;
                IF v_responses_end > DBMS_LOB.GETLENGTH(p_updated_json) THEN
                  EXIT;
                END IF;
              END LOOP;
              -- Insertar antes del cierre del array con una coma
              DBMS_LOB.CREATETEMPORARY(v_temp_clob, TRUE);
              DBMS_LOB.COPY(v_temp_clob, p_updated_json, v_responses_end - 1);
              DBMS_LOB.APPEND(v_temp_clob, ',' || v_response_json);
              DBMS_LOB.APPEND(v_temp_clob, DBMS_LOB.SUBSTR(p_updated_json, DBMS_LOB.GETLENGTH(p_updated_json) - v_responses_end + 1, v_responses_end));
              p_updated_json := v_temp_clob;
              DBMS_LOB.FREETEMPORARY(v_temp_clob);
            END IF;
          END IF;
        END IF;
        -- Actualizar el timestamp de última interacción
        DECLARE
          v_last_pos PLS_INTEGER;
          v_last_end PLS_INTEGER;
        BEGIN
          v_last_pos := DBMS_LOB.INSTR(p_updated_json, '"last_interaction"');
          IF v_last_pos > 0 THEN
            -- Avanzar hasta el valor
            v_last_pos := DBMS_LOB.INSTR(p_updated_json, ':', v_last_pos) + 1;
            -- Buscar el inicio del valor (saltar espacios)
            WHILE SUBSTR(DBMS_LOB.SUBSTR(p_updated_json, 1, v_last_pos), 1, 1) IN (' ', CHR(9), CHR(10), CHR(13)) LOOP
              v_last_pos := v_last_pos + 1;
            END LOOP;
            -- Verificar si es un string (comienza con ")
            IF SUBSTR(DBMS_LOB.SUBSTR(p_updated_json, 1, v_last_pos), 1, 1) = '"' THEN
              v_last_pos := v_last_pos + 1;
              -- Buscar el final del string
              v_last_end := v_last_pos;
              WHILE SUBSTR(DBMS_LOB.SUBSTR(p_updated_json, 1, v_last_end), 1, 1) != '"' LOOP
                v_last_end := v_last_end + 1;
              END LOOP;
              -- Reemplazar el timestamp
              DBMS_LOB.CREATETEMPORARY(v_temp_clob, TRUE);
              DBMS_LOB.COPY(v_temp_clob, p_updated_json, v_last_pos - 1);
              DBMS_LOB.APPEND(v_temp_clob, v_timestamp);
              DBMS_LOB.APPEND(v_temp_clob, DBMS_LOB.SUBSTR(p_updated_json, DBMS_LOB.GETLENGTH(p_updated_json) - v_last_end + 1, v_last_end));
              p_updated_json := v_temp_clob;
              DBMS_LOB.FREETEMPORARY(v_temp_clob);
            END IF;
          END IF;
        END;
      END;
    ELSE
      -- Primera interacción, necesitamos crear el estado
      SELECT JSON_VALUE(p_flow_json, '$.id_flow' RETURNING NUMBER),
             JSON_VALUE(p_flow_json, '$.flow_name')
      INTO v_current_flow_id, v_flow_name
      FROM dual;
      -- Crear el estado inicial como un objeto JSON
      DECLARE
        v_state_json CLOB;
      BEGIN
        -- Construir el estado como string
        v_state_json := '{"current_flow_id":' || v_current_flow_id ||
                       ',"flow_path":[{"id":' || v_current_flow_id ||
                       ',"name":"' || v_flow_name ||
                       '","timestamp":"' || v_timestamp || '"}]' ||
                       ',"user_responses":[]' ||
                       ',"last_interaction":"' || v_timestamp || '"}';

        -- Encontrar el último caracter "}" del JSON
        DECLARE
          v_last_brace PLS_INTEGER;
        BEGIN
          v_last_brace := DBMS_LOB.GETLENGTH(p_updated_json);
          -- Retroceder hasta encontrar "}"
          WHILE v_last_brace > 0 LOOP
            IF SUBSTR(DBMS_LOB.SUBSTR(p_updated_json, 1, v_last_brace), 1, 1) = '}' THEN
              EXIT;
            END IF;
            v_last_brace := v_last_brace - 1;
          END LOOP;
          -- Insertar el estado antes del último "}"
          IF v_last_brace > 0 THEN
            DBMS_LOB.CREATETEMPORARY(v_temp_clob, TRUE);
            DBMS_LOB.COPY(v_temp_clob, p_updated_json, v_last_brace - 1);
            DBMS_LOB.APPEND(v_temp_clob, ',"current_state":' || v_state_json);
            DBMS_LOB.APPEND(v_temp_clob, '}');
            p_updated_json := v_temp_clob;
            DBMS_LOB.FREETEMPORARY(v_temp_clob);
          END IF;
        END;
      END;
    END IF;
    -- Verificar si existe una conversación activa
    SELECT COUNT(*)
    INTO v_count
    FROM bot_conversations
    WHERE phone_number = p_phone_number
    AND status = 'ACTIVE';
    IF v_count > 0 THEN
      -- Actualizar la conversación existente
      UPDATE bot_conversations
      SET conversation_json = p_updated_json,
          last_update = SYSTIMESTAMP
      WHERE phone_number = p_phone_number
      AND status = 'ACTIVE';
    ELSE
      -- Crear una nueva conversación
      SELECT seq_bot_conversation.NEXTVAL
      INTO v_conversation_id
      FROM dual;
      INSERT INTO bot_conversations (
          conversation_id,
          phone_number,
          conversation_json,
          last_update,
          status
      ) VALUES (
          v_conversation_id,
          p_phone_number,
          p_updated_json,
          SYSTIMESTAMP,
          'ACTIVE'
      );
    END IF;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE('Error en update_conversation: ' || SQLERRM);
      RAISE;
  END update_conversation;
  -- Marcar una conversación como finalizada
  PROCEDURE finish_conversation(p_phone_number IN VARCHAR2) IS
  BEGIN
    UPDATE bot_conversations
    SET status = 'COMPLETED',
        last_update = SYSTIMESTAMP
    WHERE phone_number = p_phone_number
    AND status = 'ACTIVE';

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE;
  END finish_conversation;
END pkg_bot_conversation;
/

