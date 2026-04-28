prompt --application/shared_components/logic/application_computations/app_wapi_url
begin
--   Manifest
--     APPLICATION COMPUTATION: APP_WAPI_URL
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(186095368382962562)
,p_computation_sequence=>17
,p_computation_item=>'APP_WAPI_URL'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select wapi_url from parametros where id_parametro=1'
,p_computation_error_message=>'Error al obtener parametro wapi_url'
,p_version_scn=>39395168559559
);
wwv_flow_imp.component_end;
end;
/
