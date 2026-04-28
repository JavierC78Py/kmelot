prompt --application/shared_components/user_interface/lovs/lv_entidad_usuario_all
begin
--   Manifest
--     LV_ENTIDAD_USUARIO_ALL
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
 p_id=>wwv_flow_imp.id(209152421059010815)
,p_lov_name=>'LV_ENTIDAD_USUARIO_ALL'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT u.usuario d',
'      ,e.id_entidad r',
'FROM entidad e, usuarios u, sucursal_entidad s',
'WHERE e.es_usuario = ''SI''',
'AND u.id_usuario = e.usu_id_usuario',
'AND s.id_suc_entidad = e.suc_id_sucursal',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41743251217340
);
wwv_flow_imp.component_end;
end;
/
