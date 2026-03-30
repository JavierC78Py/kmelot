prompt --application/shared_components/logic/application_computations/app_id_sucursal
begin
--   Manifest
--     APPLICATION COMPUTATION: APP_ID_SUCURSAL
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
 p_id=>wwv_flow_imp.id(86737242695694554)
,p_computation_sequence=>11
,p_computation_item=>'APP_ID_SUCURSAL'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.suc_id_sucursal',
'FROM usuarios u, entidad e',
'WHERE u.usuario = :APP_USER',
'AND u.estado = ''ACTIVO''',
'AND e.es_usuario = ''SI''',
'AND e.usu_id_usuario = u.id_usuario',
''))
,p_computation_error_message=>unistr('Error en la definici\00F3n de SUCURSAL del usuario, favor solicite verificaci\00F3n')
,p_version_scn=>39279353275915
);
wwv_flow_imp.component_end;
end;
/
