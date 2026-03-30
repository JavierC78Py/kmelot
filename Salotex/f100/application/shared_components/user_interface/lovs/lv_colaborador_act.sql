prompt --application/shared_components/user_interface/lovs/lv_colaborador_act
begin
--   Manifest
--     LV_COLABORADOR_ACT
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
 p_id=>wwv_flow_imp.id(84784804930688572)
,p_lov_name=>'LV_COLABORADOR_ACT'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT c.id_colaborador, e.nombre',
'FROM colaborador c, entidad e',
'WHERE e.id_entidad  = c.ent_id_entidad ',
'AND   e.es_empleado = ''SI''',
'AND   e.estado      = ''ACTIVO''',
'AND   c.estado      = ''ACTIVO''',
'order by nombre'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'ENTIDAD'
,p_return_column_name=>'ID_COLABORADOR'
,p_display_column_name=>'NOMBRE'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
