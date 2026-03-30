prompt --application/shared_components/user_interface/lovs/lv_tipo_categoria
begin
--   Manifest
--     LV_TIPO_CATEGORIA
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
 p_id=>wwv_flow_imp.id(86841438860834082)
,p_lov_name=>'LV_TIPO_CATEGORIA'
,p_lov_query=>'.'||wwv_flow_imp.id(86841438860834082)||'.'
,p_location=>'STATIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(86841797804834084)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'GASTOS'
,p_lov_return_value=>'G'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(86842164956834085)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'INGRESOS'
,p_lov_return_value=>'I'
);
wwv_flow_imp.component_end;
end;
/
