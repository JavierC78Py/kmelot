prompt --application/pages/page_00167
begin
--   Manifest
--     PAGE: 00167
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_page.create_page(
 p_id=>167
,p_name=>'Detalle de la licitacion - costeo'
,p_alias=>'DETALLE-DE-LA-LICITACION-COSTEO'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle de la licitacion - costeo'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(162421101384312504)
,p_plug_name=>'Detalle de la licitacion - costeo'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  x.id_det_licitacion',
'      , x.lote',
'      , x.numero',
'      , x.producto_nombre_convocante',
'      , x.precio_unitario',
'      , x.cantidad',
'      , x.monto',
'      , x.costeo_por_ajuste',
'      , (x.monto - x.costeo_por_ajuste) margen_articulo',
'FROM (',
'  SELECT p.id_det_licitacion',
'        ,p.lote',
'        ,p.numero',
'        ,p.producto_nombre_convocante',
'        ,p.precio_unitario',
'        ,p.cantidad',
'        ,p.monto',
'        ,(',
'          SELECT Nvl(Sum( round(d.precio_unitario * ai.cantidad,0) ),0) AS total_costeado',
'          FROM ajuste_ing_costeo_licitacion ai',
'              ,det_ajuste_inventario d',
'          WHERE ai.lic_id_licitacion = p.lic_id_licitacion',
'          AND ai.det_id_det_licitacion = p.id_det_licitacion',
'          AND d.id_detalle_ajuste = ai.det_id_detalle_ajuste',
'        ) costeo_por_ajuste',
'  FROM licitacion_det_producto p',
'  WHERE p.lic_id_licitacion = :P167_P_ID_LICITACION',
'  AND p.eta_id_etapa = :P167_P_ETAPA ) x',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P167_P_ID_LICITACION,P167_P_ETAPA'
,p_prn_page_header=>'Detalle de la licitacion - costeo'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(162421213095312504)
,p_name=>'Detalle de la licitacion - costeo'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encuentran datos.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>43187687523656366
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162421850997312510)
,p_db_column_name=>'ID_DET_LICITACION'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Det Licitacion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162422226732312511)
,p_db_column_name=>'LOTE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Lote'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162422685540312511)
,p_db_column_name=>'NUMERO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>unistr('N\00FAmero')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162423104583312511)
,p_db_column_name=>'PRODUCTO_NOMBRE_CONVOCANTE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nombre convocante'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162423494262312511)
,p_db_column_name=>'PRECIO_UNITARIO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Precio unitario'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162423860225312512)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162424254672312512)
,p_db_column_name=>'MONTO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Monto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162424644015312512)
,p_db_column_name=>'COSTEO_POR_AJUSTE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Costeo por ajuste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162425100638312512)
,p_db_column_name=>'MARGEN_ARTICULO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Margen articulo '
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(162426946144332771)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'431935'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DET_LICITACION:LOTE:NUMERO:PRODUCTO_NOMBRE_CONVOCANTE:PRECIO_UNITARIO:CANTIDAD:MONTO:COSTEO_POR_AJUSTE:MARGEN_ARTICULO'
,p_sort_column_1=>'NUMERO'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'LOTE'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_sum_columns_on_break=>'MONTO:COSTEO_POR_AJUSTE:MARGEN_ARTICULO'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(159378401153612742)
,p_name=>'P167_P_ID_LICITACION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(162421101384312504)
,p_prompt=>unistr('Licitaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_LICITACIONES_ALL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT l.id_licitacion AS r',
'      ,l.nro_licitacion||'' CC: ''||l.codigo_contratacion||'' ''||l.convocante AS d',
'FROM licitacion l'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(159378655447612745)
,p_name=>'P167_P_ETAPA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(162421101384312504)
,p_prompt=>'Etapa'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp.component_end;
end;
/
