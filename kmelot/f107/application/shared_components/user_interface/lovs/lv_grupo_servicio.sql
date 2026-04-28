prompt --application/shared_components/user_interface/lovs/lv_grupo_servicio
begin
--   Manifest
--     LV_GRUPO_SERVICIO
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
 p_id=>wwv_flow_imp.id(253441701815291083)
,p_lov_name=>'LV_GRUPO_SERVICIO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT id_grupo AS r',
'      ,descripcion AS d',
'FROM grupo_producto',
'WHERE tipo = ''SRV'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>39384215248250
);
wwv_flow_imp.component_end;
end;
/
