prompt --application/shared_components/user_interface/lovs/lv_moneda_abreviado
begin
--   Manifest
--     LV_MONEDA_ABREVIADO
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
 p_id=>wwv_flow_imp.id(142812134978621442)
,p_lov_name=>'LV_MONEDA_ABREVIADO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_moneda as r',
',abreviatura as d',
'from moneda'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'DESC'
,p_version_scn=>41737271254417
);
wwv_flow_imp.component_end;
end;
/
