prompt --application/shared_components/logic/application_processes/timezone
begin
--   Manifest
--     APPLICATION PROCESS: TimeZone
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(89359057354647990)
,p_process_sequence=>1
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TimeZone'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.set_session_time_zone(',
'p_time_zone => ''America/Asuncion''',
');'))
,p_process_clob_language=>'PLSQL'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
