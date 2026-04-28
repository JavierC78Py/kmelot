prompt --application/shared_components/logic/application_computations/app_id_entidad
begin
--   Manifest
--     APPLICATION COMPUTATION: APP_ID_ENTIDAD
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
 p_id=>wwv_flow_imp.id(151967510453830781)
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
,p_version_scn=>41741524478898
);
wwv_flow_imp.component_end;
end;
/
