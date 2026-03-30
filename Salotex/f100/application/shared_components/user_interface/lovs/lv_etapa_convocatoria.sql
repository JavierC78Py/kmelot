prompt --application/shared_components/user_interface/lovs/lv_etapa_convocatoria
begin
--   Manifest
--     LV_ETAPA_CONVOCATORIA
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(17386699805584356)
,p_lov_name=>'LV_ETAPA_CONVOCATORIA'
,p_lov_query=>'.'||wwv_flow_imp.id(17386699805584356)||'.'
,p_location=>'STATIC'
,p_version_scn=>41734841805480
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17386951112584357)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'CONVOCATORIA'
,p_lov_return_value=>'CONV'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17387325500584358)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'OFERTANDO'
,p_lov_return_value=>'OFER'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17387711563584358)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'ADJUDICADO'
,p_lov_return_value=>'ADJU'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17388137718584358)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'FINIQUITADO'
,p_lov_return_value=>'FINI'
);
wwv_flow_imp.component_end;
end;
/
