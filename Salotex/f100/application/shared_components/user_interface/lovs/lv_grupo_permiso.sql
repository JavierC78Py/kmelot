prompt --application/shared_components/user_interface/lovs/lv_grupo_permiso
begin
--   Manifest
--     LV_GRUPO_PERMISO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(85117714733916837)
,p_lov_name=>'LV_GRUPO_PERMISO'
,p_lov_query=>'.'||wwv_flow_imp.id(85117714733916837)||'.'
,p_location=>'STATIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(85117944896916838)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'DEFINICIONES'
,p_lov_return_value=>'DEFINICIONES'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(85118414572916839)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'PROCESOS'
,p_lov_return_value=>'PROCESOS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(85118783936916840)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'REPORTES'
,p_lov_return_value=>'REPORTES'
);
wwv_flow_imp.component_end;
end;
/
