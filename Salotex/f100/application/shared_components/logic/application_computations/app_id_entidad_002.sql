prompt --application/shared_components/logic/application_computations/app_id_entidad_002
begin
--   Manifest
--     APPLICATION COMPUTATION: APP_ID_ENTIDAD
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
 p_id=>wwv_flow_imp.id(32734189761174699)
,p_computation_sequence=>10
,p_computation_item=>'APP_ID_ENTIDAD'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.ent_id_entidad',
'FROM parametros p',
'WHERE p.estado = ''ACTIVO''',
'FETCH FIRST 1 ROW ONLY'))
,p_version_scn=>41741524589437
);
wwv_flow_imp.component_end;
end;
/
