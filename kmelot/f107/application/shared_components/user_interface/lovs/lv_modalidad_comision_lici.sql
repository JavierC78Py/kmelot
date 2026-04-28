prompt --application/shared_components/user_interface/lovs/lv_modalidad_comision_lici
begin
--   Manifest
--     LV_MODALIDAD_COMISION_LICI
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
 p_id=>wwv_flow_imp.id(145009122754138687)
,p_lov_name=>'LV_MODALIDAD_COMISION_LICI'
,p_lov_query=>'.'||wwv_flow_imp.id(145009122754138687)||'.'
,p_location=>'STATIC'
,p_version_scn=>41737748801648
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(145009408315138688)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Porcentaje'
,p_lov_return_value=>'PORC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(145009795965138689)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Monto fijo'
,p_lov_return_value=>'FIJO'
);
wwv_flow_imp.component_end;
end;
/
