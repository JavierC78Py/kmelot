prompt --application/shared_components/user_interface/lovs/lv_prioridad_whatsapp
begin
--   Manifest
--     LV_PRIORIDAD_WHATSAPP
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
 p_id=>wwv_flow_imp.id(214437601356180702)
,p_lov_name=>'LV_PRIORIDAD_WHATSAPP'
,p_lov_query=>'.'||wwv_flow_imp.id(214437601356180702)||'.'
,p_location=>'STATIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(214437920978180708)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Alta'
,p_lov_return_value=>'A'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(214438250944180718)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Baja'
,p_lov_return_value=>'B'
);
wwv_flow_imp.component_end;
end;
/
