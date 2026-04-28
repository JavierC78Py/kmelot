prompt --application/shared_components/user_interface/lovs/lv_disponibilidad
begin
--   Manifest
--     LV_DISPONIBILIDAD
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
 p_id=>wwv_flow_imp.id(242782088970553336)
,p_lov_name=>'LV_DISPONIBILIDAD'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d.descripcion AS d',
'      ,e.nombre AS nombre_entidad',
'      ,d.id_disponibilidad AS r',
'FROM disponibilidad d',
'    ,entidad e',
'WHERE e.id_entidad = d.ent_id_entidad',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(242782920028534190)
,p_query_column_name=>'R'
,p_heading=>'Id disponibilidad'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(242783273478534189)
,p_query_column_name=>'NOMBRE_ENTIDAD'
,p_heading=>'Nombre entidad'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(242783728596534189)
,p_query_column_name=>'D'
,p_heading=>unistr('Descripci\00F3n')
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
