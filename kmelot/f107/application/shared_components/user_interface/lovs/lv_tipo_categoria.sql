prompt --application/shared_components/user_interface/lovs/lv_tipo_categoria
begin
--   Manifest
--     LV_TIPO_CATEGORIA
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
 p_id=>wwv_flow_imp.id(206074964432490220)
,p_lov_name=>'LV_TIPO_CATEGORIA'
,p_lov_query=>'.'||wwv_flow_imp.id(206074964432490220)||'.'
,p_location=>'STATIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(206075323376490222)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'GASTOS'
,p_lov_return_value=>'G'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(206075690528490223)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'INGRESOS'
,p_lov_return_value=>'I'
);
wwv_flow_imp.component_end;
end;
/
