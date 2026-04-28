prompt --application/shared_components/user_interface/lovs/lv_nivel_jefatura
begin
--   Manifest
--     LV_NIVEL_JEFATURA
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
 p_id=>wwv_flow_imp.id(204011670761273600)
,p_lov_name=>'LV_NIVEL_JEFATURA'
,p_lov_query=>'.'||wwv_flow_imp.id(204011670761273600)||'.'
,p_location=>'STATIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(204012036613273601)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'JEFE'
,p_lov_return_value=>'J'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(204012408819273604)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'GERENTE'
,p_lov_return_value=>'G'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(204012823372273604)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'PRESIDENTE'
,p_lov_return_value=>'P'
);
wwv_flow_imp.component_end;
end;
/
