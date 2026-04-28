prompt --application/pages/page_00189
begin
--   Manifest
--     PAGE: 00189
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
 p_id=>189
,p_name=>'Facturar Recepciones'
,p_alias=>'FACTURAR-RECEPCIONES'
,p_page_mode=>'MODAL'
,p_step_title=>'Facturar Recepciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.recalcularMontoRec = function(){',
'    var total = 0;',
'    $("input.rec-check:checked").each(function(){',
'        total += parseFloat($(this).data("monto")) || 0;',
'    });',
'    $("#P189_MONTO_SELECCIONADO_DISPLAY").text(',
'        total.toLocaleString("es-PY", {minimumFractionDigits: 0, maximumFractionDigits: 0})',
'    );',
'};',
'$(document).on("change", "input.rec-check", function(){ recalcularMontoRec(); });',
'recalcularMontoRec();'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner{',
'    padding-top: 0px;',
'}',
'.sel-rec-check {',
'    text-align: center;',
'}',
'.sel-rec-check input[type="checkbox"] {',
'    width: 18px;',
'    height: 18px;',
'    cursor: pointer;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'1000'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900189010)
,p_plug_name=>'Recepciones Pendientes'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT r.ID_RECEPCION_PROD,',
'       ''<input type="checkbox" class="rec-check" value="'' || r.ID_RECEPCION_PROD || ''" data-monto="'' || NVL(d.TOTAL,0) || ''" />'' AS SELECCIONAR,',
'       r.NRO_RECEPCION,',
'       op.NRO_ORDEN,',
'       p.DESCRIPCION AS PRODUCTO,',
'       e.NOMBRE AS PRODUCTOR,',
'       d.CANTIDAD,',
'       d.TOTAL,',
'       r.FECHA_RECEPCION',
'  FROM CAB_RECEPCION_PRODUCTO r,',
'       (SELECT rec_id_recepcion_prod,',
'               SUM(cantidad) CANTIDAD,',
'               SUM(cantidad * precio_unitario) TOTAL',
'          FROM DET_RECEPCION_PRODUCTO',
'         GROUP BY rec_id_recepcion_prod) d,',
'       CAB_ORDEN_PRODUCCION op,',
'       PRODUCTO p,',
'       ENTIDAD e',
' WHERE r.ORD_ID_ORDEN_PROD = op.ID_ORDEN_PROD',
'   AND d.rec_id_recepcion_prod(+) = r.ID_RECEPCION_PROD',
'   AND p.ID_PRODUCTO = op.PRO_ID_PRODUCTO_FIN',
'   AND e.ID_ENTIDAD = op.ENT_ID_ENTIDAD_PRODUCTOR',
'   AND r.FACTURADO = ''NO''',
'   AND r.ESTADO = ''ACTIVO''',
' ORDER BY r.FECHA_RECEPCION'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_output=>'N'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(900189011)
,p_name=>'Recepciones Pendientes'
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'KMELOT'
,p_internal_uid=>900189011
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900189101)
,p_db_column_name=>'ID_RECEPCION_PROD'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900189102)
,p_db_column_name=>'SELECCIONAR'
,p_display_order=>15
,p_column_identifier=>'B'
,p_column_label=>'Sel.'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900189103)
,p_db_column_name=>'NRO_RECEPCION'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Nro Recepcion'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900189104)
,p_db_column_name=>'NRO_ORDEN'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Nro Orden'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900189105)
,p_db_column_name=>'PRODUCTO'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Producto'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900189106)
,p_db_column_name=>'PRODUCTOR'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Productor'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900189107)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900189108)
,p_db_column_name=>'TOTAL'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900189109)
,p_db_column_name=>'FECHA_RECEPCION'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Fecha Recepcion'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-YYYY'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(900189110)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'FACT_REC_RPT'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SELECCIONAR:NRO_RECEPCION:NRO_ORDEN:PRODUCTOR:PRODUCTO:CANTIDAD:TOTAL:FECHA_RECEPCION'
,p_sum_columns_on_break=>'TOTAL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900189020)
,p_plug_name=>'Datos de Facturacion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900189030)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900189401)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900189030)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancelar'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900189402)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(900189030)
,p_button_name=>'GENERAR_FACTURA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Factura'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900189301)
,p_name=>'P189_IDS_RECEPCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(900189020)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900189302)
,p_name=>'P189_MONTO_SELECCIONADO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(900189020)
,p_prompt=>'Monto seleccionado  :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900189303)
,p_name=>'P189_FECHA_FACTURA'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(900189020)
,p_item_default=>'trunc(current_date)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Fecha factura'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900189304)
,p_name=>'P189_FECHA_VENCIMIENTO'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(900189020)
,p_prompt=>'Fecha vencimiento'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900189305)
,p_name=>'P189_NRO_FACTURA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(900189020)
,p_prompt=>'Nro. Factura'
,p_format_mask=>'999G999G9999999'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>17
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900189306)
,p_name=>'P189_TIMBRADO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(900189020)
,p_prompt=>'Nro. Timbrado'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct c.timbrado',
'FROM cab_factura_compra c',
'WHERE c.ent_id_entidad = :P189_ENT_ID_ENTIDAD'))
,p_lov_cascade_parent_items=>'P189_ENT_ID_ENTIDAD'
,p_ajax_items_to_submit=>'P189_TIMBRADO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'aling_derecha'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'match_type', 'CONTAINS_IGNORE',
  'max_values_in_list', '7',
  'min_chars', '2',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900189307)
,p_name=>'P189_VTO_TIMBRADO'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(900189020)
,p_prompt=>'Vto. Timbrado'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900189308)
,p_name=>'P189_CONDICION_COMPRA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(900189020)
,p_prompt=>unistr('Condici\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CONDICION_FACTURA'
,p_lov=>'.'||wwv_flow_imp.id(204400347809397724)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cHeight=>1
,p_tag_css_classes=>'text-dark'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900189309)
,p_name=>'P189_TIP_ID_TIPO_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(900189020)
,p_item_default=>'APP_ID_TIPO_COMP_FACTURA'
,p_item_default_type=>'ITEM'
,p_prompt=>'Tipo Comprobante'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TIPO_COMPROBANTE_EN_COMPRA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tipo_comprobante r,',
'       descripcion d ',
'  from TIPO_COMPROBANTE',
' where estado = ''ACTIVO'' ',
'   and compra = ''SI'''))
,p_cHeight=>1
,p_tag_css_classes=>'text-dark'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900189310)
,p_name=>'P189_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(900189020)
,p_item_default=>'APP_ID_SUCURSAL'
,p_item_default_type=>'ITEM'
,p_prompt=>'Sucursal'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SUCURSAL'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900189311)
,p_name=>'P189_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(900189020)
,p_item_default=>'1'
,p_prompt=>'Moneda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'text-dark'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900189312)
,p_name=>'P189_TIPO_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(900189020)
,p_item_default=>'1'
,p_prompt=>'Tipo cambio'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'aling_derecha'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900189313)
,p_name=>'P189_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(900189020)
,p_prompt=>'Entidad'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ENTIDAD_DOC_NOMBRE_PROV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT numero_documento||'' ''||nombre as d, id_entidad as r',
'from entidad',
'where es_proveedor = ''SI''',
'order by nombre'))
,p_lov_display_null=>'YES'
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
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(900189701)
,p_validation_name=>'Habilita timbrado'
,p_validation_sequence=>10
,p_validation=>':P189_VTO_TIMBRADO > :P189_FECHA_FACTURA'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'El timbrado ya no tiene vigencia para la fecha de la factura.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_imp.id(900189307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900189601)
,p_name=>'Recopilar y Enviar'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(900189402)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900189602)
,p_event_id=>wwv_flow_imp.id(900189601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var ids = [];',
'$("input.rec-check:checked").each(function(){',
'    ids.push($(this).val());',
'});',
'if (ids.length === 0) {',
'    apex.message.showErrors([{',
'        type: "error",',
'        location: "page",',
'        message: "Debe seleccionar al menos una recepcion."',
'    }]);',
'    return;',
'}',
'apex.item("P189_IDS_RECEPCION").setValue(ids.join(","));',
'apex.page.submit({',
'    request: "GENERAR_FACTURA",',
'    showWait: true',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900189603)
,p_name=>'Cerrar Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(900189401)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900189604)
,p_event_id=>wwv_flow_imp.id(900189603)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900189605)
,p_name=>'Buscar timbrado'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P189_TIMBRADO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900189606)
,p_event_id=>wwv_flow_imp.id(900189605)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    SELECT c.vto_timbrado',
'    INTO :P189_VTO_TIMBRADO',
'    FROM cab_factura_compra c',
'    WHERE c.timbrado = :P189_TIMBRADO',
'    FETCH FIRST 1 ROW ONLY;',
'exception',
'  when no_data_found then ',
'    null;',
'end;    '))
,p_attribute_02=>'P189_TIMBRADO'
,p_attribute_03=>'P189_VTO_TIMBRADO'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900189607)
,p_name=>'SetVto'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P189_CONDICION_COMPRA'
,p_condition_element=>'P189_CONDICION_COMPRA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'CONTADO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900189608)
,p_event_id=>wwv_flow_imp.id(900189607)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P189_FECHA_VENCIMIENTO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':P189_FECHA_FACTURA'
,p_attribute_07=>'P189_FECHA_FACTURA'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900189609)
,p_event_id=>wwv_flow_imp.id(900189607)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P189_FECHA_VENCIMIENTO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'add_months(to_date(:P189_FECHA_FACTURA,''dd/mm/yyyy''),1)'
,p_attribute_07=>'P189_FECHA_FACTURA'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900189610)
,p_name=>'Ir a condicion'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P189_ENT_ID_ENTIDAD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900189611)
,p_event_id=>wwv_flow_imp.id(900189610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P189_CONDICION_COMPRA'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900189612)
,p_name=>'Ir a'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900189613)
,p_event_id=>wwv_flow_imp.id(900189612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P189_ENT_ID_ENTIDAD'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900189501)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Factura Compra'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_id_factura NUMBER;',
'BEGIN',
'    PKG_RECEPCION_PRODUCTO.P_GENERAR_FACTURA_COMPRA(',
'        p_ids_recepcion     => :P189_IDS_RECEPCION',
'       ,p_nro_factura       => TO_NUMBER(:P189_NRO_FACTURA,''999G999G9999999'')',
'       ,p_timbrado          => :P189_TIMBRADO',
'       ,p_vto_timbrado      => TO_DATE(:P189_VTO_TIMBRADO, ''DD-MM-YYYY'')',
'       ,p_condicion_compra  => :P189_CONDICION_COMPRA',
'       ,p_fecha_factura     => TO_DATE(:P189_FECHA_FACTURA, ''DD-MM-YYYY'')',
'       ,p_fecha_vencimiento => TO_DATE(:P189_FECHA_VENCIMIENTO, ''DD-MM-YYYY'')',
'       ,p_tip_id_tipo_comp  => :P189_TIP_ID_TIPO_COMPROBANTE',
'       ,p_suc_id_sucursal   => :P189_SUC_ID_SUCURSAL',
'       ,p_mon_id_moneda     => :P189_MON_ID_MONEDA',
'       ,p_tipo_cambio       => :P189_TIPO_CAMBIO',
'       ,p_ent_id_entidad    => :P189_ENT_ID_ENTIDAD',
'       ,p_id_factura_out    => v_id_factura',
'    );',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(900189402)
,p_process_success_message=>'Factura de compra generada correctamente.'
,p_internal_uid=>900189501
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900189502)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_internal_uid=>900189502
);
wwv_flow_imp.component_end;
end;
/
