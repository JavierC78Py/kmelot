prompt --application/shared_components/user_interface/lovs/lv_tipo_costo
begin
--   Manifest
--     LV_TIPO_COSTO
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
 p_id=>wwv_flow_imp.id(49586776610417378)
,p_lov_name=>'LV_TIPO_COSTO'
,p_lov_query=>'.'||wwv_flow_imp.id(49586776610417378)||'.'
,p_location=>'STATIC'
,p_version_scn=>41749980849316
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(49587092164417378)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Fijo por Orden'
,p_lov_return_value=>'FIJO_POR_ORDEN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(49587496705417379)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Variable por Unidad'
,p_lov_return_value=>'VARIABLE_POR_UNIDAD'
);
wwv_flow_imp.component_end;
end;
/
