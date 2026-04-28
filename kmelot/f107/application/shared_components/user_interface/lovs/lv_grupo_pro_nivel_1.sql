prompt --application/shared_components/user_interface/lovs/lv_grupo_pro_nivel_1
begin
--   Manifest
--     LV_GRUPO_PRO_NIVEL_1
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
 p_id=>wwv_flow_imp.id(201154627923493815)
,p_lov_name=>'LV_GRUPO_PRO_NIVEL_1'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select grupo_nivel_1 r, descripcion d',
'from grupo_producto',
'where estado = ''ACTIVO''',
'and tipo = ''ART''',
'and grupo_nivel_2 is null',
'and grupo_nivel_3 is null',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>39384215256938
);
wwv_flow_imp.component_end;
end;
/
