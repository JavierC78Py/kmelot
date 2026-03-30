prompt --application/shared_components/user_interface/lovs/lv_producto_descri_art_srv
begin
--   Manifest
--     LV_PRODUCTO_DESCRI_ART_SRV
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
 p_id=>wwv_flow_imp.id(87525104521547661)
,p_lov_name=>'LV_PRODUCTO_DESCRI_ART_SRV'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.id_producto AS r',
'      ,p.descripcion AS d',
'FROM producto p'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'PRODUCTO'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41749654264272
);
wwv_flow_imp.component_end;
end;
/
