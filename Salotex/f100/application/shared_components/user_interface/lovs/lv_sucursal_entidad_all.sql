prompt --application/shared_components/user_interface/lovs/lv_sucursal_entidad_all
begin
--   Manifest
--     LV_SUCURSAL_ENTIDAD_ALL
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
 p_id=>wwv_flow_imp.id(134564062086284179)
,p_lov_name=>'LV_SUCURSAL_ENTIDAD_ALL'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SUCURSAL_ENTIDAD'
,p_return_column_name=>'ID_SUC_ENTIDAD'
,p_display_column_name=>'DESCRIPCION'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'DESCRIPCION'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41743236948491
);
wwv_flow_imp.component_end;
end;
/
