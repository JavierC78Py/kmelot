prompt --application/shared_components/logic/application_computations/app_nombre_empresa
begin
--   Manifest
--     APPLICATION COMPUTATION: APP_NOMBRE_EMPRESA
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
 p_id=>wwv_flow_imp.id(143773743903534354)
,p_computation_sequence=>10
,p_computation_item=>'APP_NOMBRE_EMPRESA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT razon_social',
'FROM parametros'))
,p_computation_error_message=>unistr('Error en obtenci\00F3n de empresa.')
,p_version_scn=>39414695586646
);
wwv_flow_imp.component_end;
end;
/
