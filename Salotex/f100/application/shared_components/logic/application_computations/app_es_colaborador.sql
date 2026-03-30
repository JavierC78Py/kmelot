prompt --application/shared_components/logic/application_computations/app_es_colaborador
begin
--   Manifest
--     APPLICATION COMPUTATION: APP_ES_COLABORADOR
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(112141242380550877)
,p_computation_sequence=>14
,p_computation_item=>'APP_ES_COLABORADOR'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'f_es_mi_colaborador(p_usuario => :APP_USER );'
,p_computation_error_message=>'No es posible definir si es colaborador. Favor informar.'
,p_version_scn=>39279720880548
);
wwv_flow_imp.component_end;
end;
/
