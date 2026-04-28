prompt --application/shared_components/automations/colamensaje
begin
--   Manifest
--     AUTOMATION: ColaMensaje
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_automation(
 p_id=>wwv_flow_imp.id(186092712361456168)
,p_name=>'ColaMensaje'
,p_static_id=>'colamensaje'
,p_trigger_type=>'POLLING'
,p_polling_interval=>'FREQ=MINUTELY;INTERVAL=3'
,p_polling_status=>'DISABLED'
,p_result_type=>'ALWAYS'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_include_rowid_column=>false
,p_commit_each_row=>false
,p_error_handling_type=>'IGNORE'
);
wwv_flow_imp_shared.create_automation_action(
 p_id=>wwv_flow_imp.id(186093039755456183)
,p_automation_id=>wwv_flow_imp.id(186092712361456168)
,p_name=>'Enviar cola mensaje'
,p_execution_sequence=>10
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    PKG_WAPI.SEND_BULK_MESSAGE;',
'end;'))
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>false
);
wwv_flow_imp.component_end;
end;
/
