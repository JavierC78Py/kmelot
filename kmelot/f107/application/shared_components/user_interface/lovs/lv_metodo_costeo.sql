prompt --application/shared_components/user_interface/lovs/lv_metodo_costeo
begin
--   Manifest
--     LV_METODO_COSTEO
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
 p_id=>wwv_flow_imp.id(171383460071886632)
,p_lov_name=>'LV_METODO_COSTEO'
,p_lov_query=>'.'||wwv_flow_imp.id(171383460071886632)||'.'
,p_location=>'STATIC'
,p_version_scn=>41749980742367
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(171383798267886641)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Costo promedio ponderado'
,p_lov_return_value=>'PROMEDIO'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(171384203640886642)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>unistr('Costo \00FAltima compra')
,p_lov_return_value=>'ULTIMA_COMPRA'
);
wwv_flow_imp.component_end;
end;
/
