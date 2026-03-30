prompt --application/shared_components/user_interface/lovs/lv_timbrado_vigente_all
begin
--   Manifest
--     LV_TIMBRADO_VIGENTE_ALL
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
 p_id=>wwv_flow_imp.id(86918680840122489)
,p_lov_name=>'LV_TIMBRADO_VIGENTE_ALL'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Timbrado ''||t.nro_timbrado||'' Sucursal:''||s.descripcion||'' - ''||c.descripcion||'' ''||LPad(t.establecimiento,3,''0'')||''-''||LPad(t.punto_expedicion,3,''0'') d',
'      ,t.id_timbrado r',
'FROM timbrado t, sucursal_entidad s, tipo_comprobante c',
'WHERE t.fecha_vencimiento >= Trunc(CURRENT_DATE,''DD'')',
'AND t.estado = ''ACTIVO''',
'AND s.id_suc_entidad = t.suc_id_sucursal',
'AND c.id_tipo_comprobante = t.tip_id_tipo_comprobante',
'AND c.estado = ''ACTIVO'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41740467755109
);
wwv_flow_imp.component_end;
end;
/
