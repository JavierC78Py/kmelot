prompt --application/shared_components/user_interface/lovs/lv_sucursal
begin
--   Manifest
--     LV_SUCURSAL
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
 p_id=>wwv_flow_imp.id(209413202698658529)
,p_lov_name=>'LV_SUCURSAL'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SUCURSAL_ENTIDAD'
,p_return_column_name=>'ID_SUC_ENTIDAD'
,p_display_column_name=>'DESCRIPCION'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'DESCRIPCION'
,p_default_sort_direction=>'ASC'
,p_version_scn=>39393157589874
);
wwv_flow_imp.component_end;
end;
/
