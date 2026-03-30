prompt --application/shared_components/user_interface/lovs/lv_sino_vinario
begin
--   Manifest
--     LV_SINO_VINARIO
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
 p_id=>wwv_flow_imp.id(65503884062140218)
,p_lov_name=>'LV_SINO_VINARIO'
,p_lov_query=>'.'||wwv_flow_imp.id(65503884062140218)||'.'
,p_location=>'STATIC'
,p_version_scn=>39392978390196
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(65504150630140228)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'SI'
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(65504613751140229)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'NO'
,p_lov_return_value=>'0'
);
wwv_flow_imp.component_end;
end;
/
