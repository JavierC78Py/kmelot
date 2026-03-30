prompt --application/shared_components/user_interface/lovs/lv_entidad_usuario_all
begin
--   Manifest
--     LV_ENTIDAD_USUARIO_ALL
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
 p_id=>wwv_flow_imp.id(89918895487354677)
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
