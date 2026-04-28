prompt --application/shared_components/user_interface/lovs/lv_sexo
begin
--   Manifest
--     LV_SEXO
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
 p_id=>wwv_flow_imp.id(252056830743191843)
,p_lov_name=>'LV_SEXO'
,p_lov_query=>'.'||wwv_flow_imp.id(252056830743191843)||'.'
,p_location=>'STATIC'
,p_version_scn=>39383486869887
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(252057052522191847)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'MASCULINO'
,p_lov_return_value=>'M'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(252057533558191848)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'FEMENINO'
,p_lov_return_value=>'F'
);
wwv_flow_imp.component_end;
end;
/
