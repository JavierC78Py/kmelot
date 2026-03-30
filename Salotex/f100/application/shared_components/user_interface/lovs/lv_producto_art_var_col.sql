prompt --application/shared_components/user_interface/lovs/lv_producto_art_var_col
begin
--   Manifest
--     LV_PRODUCTO_ART_VAR_COL
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
 p_id=>wwv_flow_imp.id(39750224904475773)
,p_lov_name=>'LV_PRODUCTO_ART_VAR_COL'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT P.ID_PRODUCTO||'' - ''||P.DESCRIPCION D',
'      ,P.ID_PRODUCTO R',
'      ,P.TIPO',
'FROM PRODUCTO P',
'WHERE P.ESTADO = ''ACTIVO''',
'AND P.TIPO = ''ART''',
'ORDER BY P.DESCRIPCION ASC'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41744307353530
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(39750582012475779)
,p_query_column_name=>'R'
,p_heading=>'Id'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(39750942477475780)
,p_query_column_name=>'D'
,p_heading=>unistr('Descripci\00F3n')
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(39751307138475780)
,p_query_column_name=>'TIPO'
,p_heading=>'Tipo'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
