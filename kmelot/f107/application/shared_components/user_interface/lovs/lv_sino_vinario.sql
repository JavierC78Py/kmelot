prompt --application/shared_components/user_interface/lovs/lv_sino_vinario
begin
--   Manifest
--     LV_SINO_VINARIO
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
 p_id=>wwv_flow_imp.id(184737409633796356)
,p_lov_name=>'LV_SINO_VINARIO'
,p_lov_query=>'.'||wwv_flow_imp.id(184737409633796356)||'.'
,p_location=>'STATIC'
,p_version_scn=>39392978390196
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(184737676201796366)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'SI'
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(184738139322796367)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'NO'
,p_lov_return_value=>'0'
);
wwv_flow_imp.component_end;
end;
/
