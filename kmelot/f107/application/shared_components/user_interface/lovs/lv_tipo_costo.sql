prompt --application/shared_components/user_interface/lovs/lv_tipo_costo
begin
--   Manifest
--     LV_TIPO_COSTO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(168820302182073516)
,p_lov_name=>'LV_TIPO_COSTO'
,p_lov_query=>'.'||wwv_flow_imp.id(168820302182073516)||'.'
,p_location=>'STATIC'
,p_version_scn=>41749980849316
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(168820617736073516)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Fijo por Orden'
,p_lov_return_value=>'FIJO_POR_ORDEN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(168821022277073517)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Variable por Unidad'
,p_lov_return_value=>'VARIABLE_POR_UNIDAD'
);
wwv_flow_imp.component_end;
end;
/
