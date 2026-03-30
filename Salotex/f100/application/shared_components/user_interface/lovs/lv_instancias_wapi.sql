prompt --application/shared_components/user_interface/lovs/lv_instancias_wapi
begin
--   Manifest
--     LV_INSTANCIAS_WAPI
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
 p_id=>wwv_flow_imp.id(66875686845513222)
,p_lov_name=>'LV_INSTANCIAS_WAPI'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT phone_number||'' ''||name AS d',
'       ,id AS r',
'       ,key',
'FROM devices',
'WHERE pkg_wapi.check_instance(key) = 1',
'AND suc_id_sucursal = :APP_ID_SUCURSAL',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>39395174049033
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(66876169381518724)
,p_query_column_name=>'R'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(66876527744518725)
,p_query_column_name=>'D'
,p_heading=>unistr('N\00FAmero de linea')
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(66876988292518725)
,p_query_column_name=>'KEY'
,p_heading=>'Key'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
