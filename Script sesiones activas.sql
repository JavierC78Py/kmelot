SELECT
    s.sid,
    s.serial#,
    s.username,
    s.status,
    s.osuser,
    s.machine,
    s.program,
    s.module,
    ( s.logon_time - INTERVAL '3' HOUR ) logon_time
FROM
    v$session s
WHERE
    s.type = 'USER'
ORDER BY
    s.logon_time;
/
SELECT
    se.sid,
    se.serial#,
    se.username,
    se.osuser,
    se.machine,
    se.program,
    pr.spid AS "PID",
    se.status,
    se.module,
    se.action,
    st.event,
    ROUND(st.seconds_in_wait/60) AS "Minutos esperando",
    se.blocking_session
FROM
    v$session se,
    v$process pr,
    v$session_wait st
WHERE
    se.paddr = pr.addr
    AND st.sid = se.sid
    AND se.type = 'USER'
ORDER BY
    st.seconds_in_wait DESC;
/
SELECT
    username,
    status,
    COUNT(*) AS sesiones,
    MAX(TO_CHAR(logon_time, 'DD-MON-YYYY HH24:MI:SS')) AS ultimo_login
FROM
    v$session
WHERE
    username IS NOT NULL
GROUP BY
    username, status
ORDER BY
    sesiones DESC;
/
-- Primero identifica la sesión
SELECT sid, serial#, username, status FROM v$session WHERE username = 'USUARIO_PROBLEMA';

-- Luego ejecuta este comando para terminarla (requiere privilegios)
ALTER SYSTEM KILL SESSION 'SID,SERIAL#' IMMEDIATE;
/
/*
CON TIEMPO DE INACTIVIDAD
*/
SELECT
    s.sid,
    s.serial#,
    s.username,
    s.status,
    s.machine,
    s.program,
    Round(s.last_call_et/60,2) AS "Minutos Inactiva",
    TO_CHAR( (s.logon_time - INTERVAL '3' HOUR ), 'DD-MON-YYYY HH24:MI:SS') AS logon_time
FROM
    v$session s
WHERE
    s.username IS NOT NULL
ORDER BY
    s.last_call_et DESC;
    /
SELECT
    s.sid,
    s.serial#,
    s.username AS db_username,
    s.module,
    s.action,
    s.client_info
FROM
    v$session s
WHERE
    s.module LIKE 'APEX%'
    OR s.program LIKE '%ORDS%'
ORDER BY
    s.logon_time DESC;
/
SELECT
    p.profile,
    p.resource_name,
    p.limit
FROM
    dba_profiles p
WHERE
    p.resource_name = 'IDLE_TIME'
ORDER BY
    p.profile;
/
SELECT
    username,
    profile
FROM
    dba_users
WHERE
    username IN ('ORDS_PUBLIC_USER', 'ORDS_PLSQL_GATEWAY', 'CLINICASM', 'ADMIN');
/



SELECT username, profile FROM dba_users WHERE username = 'CLINICASM';
/
CREATE PROFILE min3_profile LIMIT
  IDLE_TIME 3
  SESSIONS_PER_USER 10
  CONNECT_TIME 240;
/
ALTER USER CLINICASM PROFILE min3_profile;
/




/
SELECT
    name,
    value
FROM
    v$parameter
WHERE
    name LIKE '%_idle_timeout%';