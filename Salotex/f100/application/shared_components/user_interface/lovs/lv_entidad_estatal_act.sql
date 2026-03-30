prompt --application/shared_components/user_interface/lovs/lv_entidad_estatal_act
begin
--   Manifest
--     LV_ENTIDAD_ESTATAL_ACT
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
 p_id=>wwv_flow_imp.id(17384441580519914)
,p_lov_name=>'LV_ENTIDAD_ESTATAL_ACT'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.nombre d',
'       ,e.id_entidad r',
'FROM entidad e, tipo_documento t',
'WHERE e.es_cliente = ''SI''',
'AND e.es_estatal = ''SI''',
'AND e.estado = ''ACTIVO''',
'AND t.id_tipo_documento = e.tip_id_tipo_documento'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41735641639025
);
wwv_flow_imp.component_end;
end;
/
