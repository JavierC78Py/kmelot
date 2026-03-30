prompt --application/pages/page_00073
begin
--   Manifest
--     PAGE: 00073
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_page.create_page(
 p_id=>73
,p_name=>unistr('Movimiento producto dep\00F3sito')
,p_alias=>unistr('MOVIMIENTO-PRODUCTO-DEP\00D3SITO')
,p_step_title=>unistr('Movimiento producto dep\00F3sito')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(103732521929363025)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(86947038457749062)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(103733090925363031)
,p_plug_name=>'Movimiento de producto'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TIPO,',
'       FECHA_EVENTO,',
'       ID_TRANSACCION,',
'       TIP_ID_TIPO_COMPROBANTE,',
'       NRO_COMPROBANTE,',
'       ID_DETALLE_TRANSACCION,',
'       PRO_ID_PRODUCTO,',
'       UNI_ID_UNIDAD_MEDIDA,',
'       CANTIDAD,',
'       DEP_ID_DEPOSITO,',
'       ORDEN,',
'       STOCK,',
'       NOMBRE_ENTIDAD',
'  from V_MOVIMIENTO_PRODUCTO_DEPOSITO',
' where PRO_ID_PRODUCTO = :P73_ID_PRODUCTO',
'   and (:P73_DEPOSITO is null or DEP_ID_DEPOSITO = :P73_DEPOSITO)',
' order by ORDEN'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P73_ID_PRODUCTO,P73_DEPOSITO'
,p_prn_page_header=>'Movimiento de producto'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(103733159605363031)
,p_name=>'Movimiento de producto'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encuentran productos.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_filter=>'N'
,p_show_sort=>'N'
,p_show_highlight=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>30000140541356291
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88745882446542217)
,p_db_column_name=>'TIPO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Tipo movimiento'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88746250333542218)
,p_db_column_name=>'FECHA_EVENTO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Fecha evento'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88746714729542218)
,p_db_column_name=>'ID_TRANSACCION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Id Transaccion'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88747058087542218)
,p_db_column_name=>'TIP_ID_TIPO_COMPROBANTE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Tipo Comprobante'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88747514269542218)
,p_db_column_name=>'NRO_COMPROBANTE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Nro. Comprobante'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G9999999'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88747892437542219)
,p_db_column_name=>'ID_DETALLE_TRANSACCION'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Id Detalle Transaccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88748241804542219)
,p_db_column_name=>'PRO_ID_PRODUCTO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Pro Id Producto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88748677896542219)
,p_db_column_name=>'UNI_ID_UNIDAD_MEDIDA'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Unidad medida'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(90414763095478669)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88749069464542219)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Cantidad'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88749475078542220)
,p_db_column_name=>'DEP_ID_DEPOSITO'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>unistr('Dep\00F3sito')
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(87767137282040737)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88749819516542220)
,p_db_column_name=>'ORDEN'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Orden'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88752925473544842)
,p_db_column_name=>'STOCK'
,p_display_order=>21
,p_column_identifier=>'O'
,p_column_label=>'Stock'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88753109736544843)
,p_db_column_name=>'NOMBRE_ENTIDAD'
,p_display_order=>31
,p_column_identifier=>'P'
,p_column_label=>'Nombre Entidad'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(103738287155363856)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'149942'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FECHA_EVENTO:TIPO:NRO_COMPROBANTE:ID_TRANSACCION:UNI_ID_UNIDAD_MEDIDA:DEP_ID_DEPOSITO:CANTIDAD:ORDEN'
,p_break_on=>'DEP_ID_DEPOSITO:0:0:0:0:0'
,p_break_enabled_on=>'DEP_ID_DEPOSITO:0:0:0:0:0'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(88761674675574295)
,p_report_id=>wwv_flow_imp.id(103738287155363856)
,p_name=>'SALIDAS'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CANTIDAD'
,p_operator=>'<'
,p_expr=>'0'
,p_condition_sql=>' (case when ("CANTIDAD" < to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# < #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#ffd6d2'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88750997815542225)
,p_name=>'P73_ID_PRODUCTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(103733090925363031)
,p_prompt=>'Producto'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_PRODUCTO_ID_UNI_MEDI_ACTIVO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT P.ID_PRODUCTO||'' - ''||P.DESCRIPCION||'' (''||U.ABREVIATURA||'')'' D',
'      ,P.ID_PRODUCTO R',
'FROM PRODUCTO P, UNIDAD_MEDIDA U',
'WHERE P.ESTADO = ''ACTIVO''',
'AND U.ID_UNIDAD_MEDIDA = P.UNI_ID_UNIDAD_MEDIDA',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cSize=>30
,p_colspan=>7
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88752827502544841)
,p_name=>'P73_DEPOSITO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(103733090925363031)
,p_prompt=>unistr('Dep\00F3sito')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_DEPOSITO'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Todos'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88751631041542230)
,p_name=>'Refrescar'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P73_ID_PRODUCTO,P73_DEPOSITO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88752141920542232)
,p_event_id=>wwv_flow_imp.id(88751631041542230)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(103733090925363031)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
