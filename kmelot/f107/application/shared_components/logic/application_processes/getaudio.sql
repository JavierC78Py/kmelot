prompt --application/shared_components/logic/application_processes/getaudio
begin
--   Manifest
--     APPLICATION PROCESS: getaudio
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(255043250046621817)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'getaudio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  pkg_wapi.get_audio(TO_NUMBER(:REQUEST_VALUE));',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_version_scn=>39384890378575
);
wwv_flow_imp.component_end;
end;
/
