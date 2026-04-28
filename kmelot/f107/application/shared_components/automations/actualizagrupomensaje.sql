prompt --application/shared_components/automations/actualizagrupomensaje
begin
--   Manifest
--     AUTOMATION: ActualizaGrupoMensaje
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
 p_id=>wwv_flow_imp.id(214591476565036641)
,p_name=>'ActualizaGrupoMensaje'
,p_static_id=>'actualizagrupomensaje'
,p_trigger_type=>'POLLING'
,p_polling_interval=>'FREQ=HOURLY;INTERVAL=1;BYMINUTE=0'
,p_polling_status=>'DISABLED'
,p_result_type=>'ROWS'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_type=>'SQL'
,p_query_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT g.id_grupo_cola',
'FROM grupo_cola_mensaje g',
'WHERE g.estado = ''ENVIAR'';'))
,p_include_rowid_column=>false
,p_pk_column_name=>'ID_GRUPO_COLA'
,p_commit_each_row=>true
,p_error_handling_type=>'IGNORE'
);
wwv_flow_imp_shared.create_automation_action(
 p_id=>wwv_flow_imp.id(214591813542036648)
,p_automation_id=>wwv_flow_imp.id(214591476565036641)
,p_name=>'VerificarSiHayPendientes'
,p_execution_sequence=>10
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    --apex_automation.log_info(''Entramos'');',
'    principal.marca_grupo_cola(P_ID_GRUPO_COLA => :id_grupo_cola);',
'end;'))
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
);
wwv_flow_imp.component_end;
end;
/
