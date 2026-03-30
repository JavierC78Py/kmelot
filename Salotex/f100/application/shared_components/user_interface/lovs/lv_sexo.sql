prompt --application/shared_components/user_interface/lovs/lv_sexo
begin
--   Manifest
--     LV_SEXO
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
 p_id=>wwv_flow_imp.id(132823305171535705)
,p_lov_name=>'LV_SEXO'
,p_lov_query=>'.'||wwv_flow_imp.id(132823305171535705)||'.'
,p_location=>'STATIC'
,p_version_scn=>39383486869887
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(132823526950535709)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'MASCULINO'
,p_lov_return_value=>'M'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(132824007986535710)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'FEMENINO'
,p_lov_return_value=>'F'
);
wwv_flow_imp.component_end;
end;
/
