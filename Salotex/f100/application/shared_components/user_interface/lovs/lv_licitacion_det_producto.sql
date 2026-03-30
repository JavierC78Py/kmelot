prompt --application/shared_components/user_interface/lovs/lv_licitacion_det_producto
begin
--   Manifest
--     LV_LICITACION_DET_PRODUCTO
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
 p_id=>wwv_flow_imp.id(39972019683340938)
,p_lov_name=>'LV_LICITACION_DET_PRODUCTO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  ''Lote: ''||lote||'', numero: ''||numero||'', Producto: ''||producto_nombre_catalogo||'' >> ''||producto_nombre_convocante||'', ''||',
'unidad_medida||''(''||a_unidad_medida||''), cantidad:''||Trim(To_Char(cantidad,''999g999g999d99''))||'', precio:''||Trim(To_Char(precio_unitario,''999g999g999d99''))',
'||'', monto:''||Trim(To_Char(monto,''999g999g999d99'')) AS D ',
',id_det_licitacion AS R',
'FROM licitacion_det_producto l',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41744342826064
);
wwv_flow_imp.component_end;
end;
/
