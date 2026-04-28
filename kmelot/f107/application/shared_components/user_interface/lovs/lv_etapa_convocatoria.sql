prompt --application/shared_components/user_interface/lovs/lv_etapa_convocatoria
begin
--   Manifest
--     LV_ETAPA_CONVOCATORIA
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
 p_id=>wwv_flow_imp.id(136620225377240494)
,p_lov_name=>'LV_ETAPA_CONVOCATORIA'
,p_lov_query=>'.'||wwv_flow_imp.id(136620225377240494)||'.'
,p_location=>'STATIC'
,p_version_scn=>41734841805480
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(136620476684240495)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'CONVOCATORIA'
,p_lov_return_value=>'CONV'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(136620851072240496)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'OFERTANDO'
,p_lov_return_value=>'OFER'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(136621237135240496)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'ADJUDICADO'
,p_lov_return_value=>'ADJU'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(136621663290240496)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'FINIQUITADO'
,p_lov_return_value=>'FINI'
);
wwv_flow_imp.component_end;
end;
/
