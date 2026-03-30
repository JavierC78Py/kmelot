prompt --application/shared_components/user_interface/lovs/lv_moneda_abrev_return
begin
--   Manifest
--     LV_MONEDA_ABREV_RETURN
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
 p_id=>wwv_flow_imp.id(24545671739766479)
,p_lov_name=>'LV_MONEDA_ABREV_RETURN'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select abreviatura as r',
',abreviatura as d',
'from moneda'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41737272904881
);
wwv_flow_imp.component_end;
end;
/
