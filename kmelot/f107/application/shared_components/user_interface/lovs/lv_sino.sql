prompt --application/shared_components/user_interface/lovs/lv_sino
begin
--   Manifest
--     LV_SINO
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
 p_id=>wwv_flow_imp.id(208529498774285907)
,p_lov_name=>'LV_SINO'
,p_lov_query=>'.'||wwv_flow_imp.id(208529498774285907)||'.'
,p_location=>'STATIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(208529702699285910)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'SI'
,p_lov_return_value=>'SI'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(208530182998285912)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'NO'
,p_lov_return_value=>'NO'
);
wwv_flow_imp.component_end;
end;
/
