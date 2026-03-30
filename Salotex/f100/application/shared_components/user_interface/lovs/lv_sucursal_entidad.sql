prompt --application/shared_components/user_interface/lovs/lv_sucursal_entidad
begin
--   Manifest
--     LV_SUCURSAL_ENTIDAD
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
 p_id=>wwv_flow_imp.id(35353201424003253)
,p_lov_name=>'LV_SUCURSAL_ENTIDAD'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.id_suc_entidad AS r',
'      ,s.descripcion AS d',
'FROM sucursal_entidad s',
'WHERE s.ent_id_entidad = :APP_ID_ENTIDAD',
'AND s.estado = ''ACTIVO''',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41743237027336
);
wwv_flow_imp.component_end;
end;
/
