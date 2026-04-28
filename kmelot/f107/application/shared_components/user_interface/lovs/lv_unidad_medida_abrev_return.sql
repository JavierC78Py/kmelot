prompt --application/shared_components/user_interface/lovs/lv_unidad_medida_abrev_return
begin
--   Manifest
--     LV_UNIDAD_MEDIDA_ABREV_RETURN
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
 p_id=>wwv_flow_imp.id(143778353299371777)
,p_lov_name=>'LV_UNIDAD_MEDIDA_ABREV_RETURN'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select abreviatura as r',
',descripcion||'' (''||abreviatura||'')'' as d',
'from unidad_medida'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41741529871113
);
wwv_flow_imp.component_end;
end;
/
