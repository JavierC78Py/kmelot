prompt --application/shared_components/user_interface/lovs/lv_condicion_factura
begin
--   Manifest
--     LV_CONDICION_FACTURA
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
 p_id=>wwv_flow_imp.id(85166822237741586)
,p_lov_name=>'LV_CONDICION_FACTURA'
,p_lov_query=>'.'||wwv_flow_imp.id(85166822237741586)||'.'
,p_location=>'STATIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(85167156300741588)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'CONTADO'
,p_lov_return_value=>'CONTADO'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(85167431962741590)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'CREDITO'
,p_lov_return_value=>'CREDITO'
);
wwv_flow_imp.component_end;
end;
/
