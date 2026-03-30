prompt --application/shared_components/user_interface/lovs/lv_centro_costo_act
begin
--   Manifest
--     LV_CENTRO_COSTO_ACT
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
 p_id=>wwv_flow_imp.id(85708386146458860)
,p_lov_name=>'LV_CENTRO_COSTO_ACT'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_CENTRO_COSTO R, DESCRIPCION D ',
'from CENTRO_COSTO',
'where ESTADO = ''ACTIVO'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'CENTRO_COSTO'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
