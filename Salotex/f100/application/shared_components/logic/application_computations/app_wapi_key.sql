prompt --application/shared_components/logic/application_computations/app_wapi_key
begin
--   Manifest
--     APPLICATION COMPUTATION: APP_WAPI_KEY
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
 p_id=>wwv_flow_imp.id(66862062775311212)
,p_computation_sequence=>18
,p_computation_item=>'APP_WAPI_KEY'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select wapi_key from parametros where id_parametro=1'
,p_computation_error_message=>unistr('Error en la obtenci\00F3n de parametro wapi_key')
,p_version_scn=>39395168600664
);
wwv_flow_imp.component_end;
end;
/
