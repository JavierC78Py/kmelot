prompt --application/shared_components/user_interface/lovs/lv_instancias_wapi
begin
--   Manifest
--     LV_INSTANCIAS_WAPI
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
 p_id=>wwv_flow_imp.id(186109212417169360)
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
 p_id=>wwv_flow_imp.id(186109694953174862)
,p_query_column_name=>'R'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(186110053316174863)
,p_query_column_name=>'D'
,p_heading=>unistr('N\00FAmero de linea')
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(186110513864174863)
,p_query_column_name=>'KEY'
,p_heading=>'Key'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
