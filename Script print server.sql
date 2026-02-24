-- =============================================================================
-- SCRIPT DE INSTALACIÓN: WEBHOOK PARA IMPRESIÓN REMOTA
-- =============================================================================
-- Este script reemplaza la cola de impresión por una llamada directa HTTP POST.
--
-- PRE-REQUISITOS:
-- 1. ACL: En Autonomous Database, debes agregar la URL de tu agente (Ngrok) a la ACL.
--    (Ver sección ACL abajo).
-- 2. Tabla TURNOS existente.

-- -----------------------------------------------------------------------------
-- 1. PROCEDIMIENTO PARA LLAMAR AL AGENTE (ASÍNCRONO)
-- -----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE p_send_print_job(p_turno_id IN NUMBER) IS
    l_url         VARCHAR2(4000) := 'https://bowen-conventually-alternately.ngrok-free.dev/print';
    l_body        CLOB;
    l_response    CLOB;
BEGIN
    -- Construir JSON body
    l_body := '{"turnoId": ' || p_turno_id || '}';

    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := 'application/json';

    l_response := apex_web_service.make_rest_request(
        p_url         => l_url,
        p_http_method => 'POST',
        p_body        => l_body
    );
EXCEPTION WHEN OTHERS THEN
    NULL;
END;
/

-- -----------------------------------------------------------------------------
-- 2. JOB WRAPPER (PARA DESACOPLAR)
-- -----------------------------------------------------------------------------
-- No queremos que la inserción de turno falle si la impresora está apagada.
-- Usamos DBMS_SCHEDULER para lanzar la petición HTTP en background.

CREATE OR REPLACE PROCEDURE p_enqueue_print_job(p_turno_id IN NUMBER) IS
BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name   => 'PRINT_JOB_' || p_turno_id || '_' || TO_CHAR(SYSTIMESTAMP, 'FF'),
        job_type   => 'PLSQL_BLOCK',
        job_action => 'BEGIN p_send_print_job(' || p_turno_id || '); END;',
        start_date => SYSTIMESTAMP, -- Ejecutar YA
        enabled    => TRUE,
        auto_drop  => TRUE, -- Borrarse al terminar
        comments   => 'Llamada async a impresora para turno ' || p_turno_id
    );
END;
/

-- -----------------------------------------------------------------------------
-- 3. TRIGGER UPDATE
-- -----------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER trg_turnos_after_insert
AFTER INSERT ON turnos
FOR EACH ROW
BEGIN
    -- Llamamos al wrapper que crea el Job
    prc_enqueue_print_job(:NEW.id);
END;
/

-- -----------------------------------------------------------------------------
-- NOTA IMPORTANTE SOBRE ACL (NETWORK ACCESS) EN AUTONOMOUS DB
-- -----------------------------------------------------------------------------
-- Para que APEX_WEB_SERVICE pueda salir a Internet (a tu Ngrok), necesitas
-- añadir el host a la lista de control de acceso.
-- Ejecuta esto como ADMIN (usuario ADMIN de la base de datos):
BEGIN
    DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
        host => '*.ngrok-free.app',
        ace  => xs$ace_type(privilege_list => xs$name_list('http'),
                            principal_name => 'SALOTEX',
                            principal_type => xs_acl.ptype_db)
    );
END;
/


