prompt --application/pages/page_00183
begin
--   Manifest
--     PAGE: 00183
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
 p_id=>183
,p_name=>'Facturar Ordenes de Trabajo'
,p_alias=>'FACTURAR-OTS'
,p_page_mode=>'MODAL'
,p_step_title=>'Facturar Ordenes de Trabajo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#mascara_fecha#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buscar_nro() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors();',
'    apex.server.process("buscar_nro", {',
'        pageItems: ["P183_TIM_ID_TIMBRADO"',
'        ,"P183_SUC_ID_SUCURSAL"',
'        ,"P183_TCO_ID_TIPO_COMPROBANTE"]',
'    },{',
'        success: function (data) {',
'            if (data.success === true) {',
'                for (var i = 0; i < data.items.length; i++) {',
'                    apex.item(data.items[i].id).setValue(data.items[i].value);',
'                }',
'            } else {',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: "page",',
'                    message: data.message,',
'                    unsafe: false',
'                }]);',
'            }',
'        }',
'    }).always(function () {',
'        waitPopup.remove();',
'    });',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'mascaraFechaRegex("#P183_FECHA_FACTURA");',
'mascaraFechaRegex("#P183_FECHA_VENCIMIENTO");',
'// Funcion para recalcular monto seleccionado',
'window.recalcularMontoOT = function(){',
'    var total = 0;',
'    $("input.ot-check:checked").each(function(){',
'        total += parseFloat($(this).data("monto")) || 0;',
'    });',
'    $("#P183_MONTO_SELECCIONADO_DISPLAY").text(',
'        total.toLocaleString("es-PY", {minimumFractionDigits: 0, maximumFractionDigits: 0})',
'    );',
'};',
'// Evento change en checkboxes',
'$(document).on("change", "input.ot-check", function(){ recalcularMontoOT(); });',
'// Pre-seleccionar la OT que viene de pag 179',
'var idsOt = apex.item("P183_IDS_OT").getValue();',
'if (idsOt) {',
'    var ids = idsOt.split(",");',
'    ids.forEach(function(id) {',
'        $("input.ot-check[value=''" + id.trim() + "'']").prop("checked", true);',
'    });',
'}',
'recalcularMontoOT();'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner{',
'    padding-top: 0px;',
'}',
'.sel-ot-check {',
'    text-align: center;',
'}',
'.sel-ot-check input[type="checkbox"] {',
'    width: 18px;',
'    height: 18px;',
'    cursor: pointer;',
'}',
'',
'.texto-negro {',
'    color:black !important;',
'    opacity: 1 !important;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800183010)
,p_plug_name=>'OTs Finalizadas'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ot.ID_ORDEN_TRABAJO,',
'       ''<input type="checkbox" class="ot-check" value="'' || ot.ID_ORDEN_TRABAJO || ''" data-monto="'' || ot.MONTO_TOTAL || ''" />'' AS SELECCIONAR,',
'       ot.NRO_OT, ot.DESCRIPCION_TRABAJO,',
'       ot.MONTO_TOTAL, ot.FECHA_FINALIZACION, e.NOMBRE AS CLIENTE',
'  FROM CAB_ORDEN_TRABAJO ot, ENTIDAD e',
' WHERE ot.ENT_ID_ENTIDAD = e.ID_ENTIDAD',
'   AND ot.ESTADO = ''FINALIZADO''',
' ORDER BY ot.FECHA_FINALIZACION'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_output=>'N'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(800183015)
,p_name=>'OTs Finalizadas'
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'KMELOT'
,p_internal_uid=>800183015
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800183101)
,p_db_column_name=>'ID_ORDEN_TRABAJO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800183107)
,p_db_column_name=>'SELECCIONAR'
,p_display_order=>15
,p_column_identifier=>'G'
,p_column_label=>'Sel.'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800183102)
,p_db_column_name=>'NRO_OT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nro OT'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800183103)
,p_db_column_name=>'DESCRIPCION_TRABAJO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Descripcion'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800183104)
,p_db_column_name=>'MONTO_TOTAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Monto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800183105)
,p_db_column_name=>'FECHA_FINALIZACION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Finalizada'
,p_column_type=>'DATE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800183106)
,p_db_column_name=>'CLIENTE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Cliente'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(800183200)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'FACT_RPT'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SELECCIONAR:NRO_OT:CLIENTE:DESCRIPCION_TRABAJO:MONTO_TOTAL:FECHA_FINALIZACION'
,p_sum_columns_on_break=>'MONTO_TOTAL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800183020)
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
 p_id=>wwv_flow_imp.id(800183030)
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
 p_id=>wwv_flow_imp.id(800183401)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(800183030)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancelar'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800183402)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(800183030)
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
 p_id=>wwv_flow_imp.id(800183301)
,p_name=>'P183_IDS_OT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(800183020)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800183303)
,p_name=>'P183_NRO_FACTURA'
,p_is_required=>true
,p_item_sequence=>105
,p_item_plug_id=>wwv_flow_imp.id(800183020)
,p_prompt=>'Nro Factura'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800183304)
,p_name=>'P183_CONDICION_VENTA'
,p_is_required=>true
,p_item_sequence=>75
,p_item_plug_id=>wwv_flow_imp.id(800183020)
,p_prompt=>'Condicion de Venta'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CONDICION_FACTURA'
,p_lov=>'.'||wwv_flow_imp.id(204400347809397724)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800183305)
,p_name=>'P183_MONTO_SELECCIONADO'
,p_item_sequence=>15
,p_item_plug_id=>wwv_flow_imp.id(800183020)
,p_prompt=>'Monto a facturar'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800183310)
,p_name=>'P183_FECHA_FACTURA'
,p_item_sequence=>25
,p_item_plug_id=>wwv_flow_imp.id(800183020)
,p_item_default=>'to_char(trunc(current_date,''DD''),''DD-MM-YYYY'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Fecha factura'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>10
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
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
 p_id=>wwv_flow_imp.id(800183311)
,p_name=>'P183_FECHA_VENCIMIENTO'
,p_item_sequence=>85
,p_item_plug_id=>wwv_flow_imp.id(800183020)
,p_prompt=>'Fecha vencimiento'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:CLEAR-BUTTON',
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
 p_id=>wwv_flow_imp.id(800183312)
,p_name=>'P183_TCO_ID_TIPO_COMPROBANTE'
,p_item_sequence=>35
,p_item_plug_id=>wwv_flow_imp.id(800183020)
,p_item_default=>'APP_ID_TIPO_COMP_FACTURA'
,p_item_default_type=>'ITEM'
,p_prompt=>'Tipo comprobante'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TIPO_COMPROBANTE_EN_VENTA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tipo_comprobante r,',
'       descripcion d ',
'  from TIPO_COMPROBANTE',
' where estado = ''ACTIVO'' ',
'   and venta = ''SI'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800183313)
,p_name=>'P183_SUC_ID_SUCURSAL'
,p_item_sequence=>45
,p_item_plug_id=>wwv_flow_imp.id(800183020)
,p_prompt=>'Sucursal'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SUCURSAL_MIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.id_suc_entidad AS r',
'      ,s.descripcion AS d',
'FROM sucursal_entidad s',
'WHERE s.ent_id_entidad = :APP_ID_ENTIDAD'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800183314)
,p_name=>'P183_TIM_ID_TIMBRADO'
,p_is_required=>true
,p_item_sequence=>95
,p_item_plug_id=>wwv_flow_imp.id(800183020)
,p_prompt=>'Punto de expedicion'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT LPad(t.establecimiento,3,''0'')||''-''||LPad(t.punto_expedicion,3,''0'')||'' ''||tc.descripcion||'' ''||t.nro_timbrado',
'      ,t.id_timbrado r',
'FROM usuarios u, entidad e, usuario_punto_expedicion up, timbrado t, tipo_comprobante tc',
'WHERE u.usuario       = Nvl(v(''APP_USER''),USER)',
'AND u.estado          = ''ACTIVO''',
'AND e.usu_id_usuario  = u.id_usuario',
'AND e.estado          = ''ACTIVO''',
'AND up.ent_id_entidad = e.id_entidad',
'AND up.estado         = ''ACTIVO''',
'AND t.id_timbrado     = up.tim_id_timbrado',
'AND t.estado          = ''ACTIVO''',
'AND t.suc_id_sucursal         = :P183_SUC_ID_SUCURSAL',
'AND t.tip_id_tipo_comprobante = :P183_TCO_ID_TIPO_COMPROBANTE',
'AND t.nro_final               > t.nro_utilizado ',
'AND to_date(:P183_FECHA_FACTURA,''DD-MM-YYYY'') BETWEEN trunc(t.fecha_inicio,''DD'') AND trunc(t.fecha_vencimiento,''DD'')',
'AND tc.id_tipo_comprobante   = t.tip_id_tipo_comprobante'))
,p_lov_cascade_parent_items=>'P183_SUC_ID_SUCURSAL,P183_TCO_ID_TIPO_COMPROBANTE,P183_FECHA_FACTURA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(800183601)
,p_name=>'Recopilar OTs y Enviar'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(800183402)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(800183602)
,p_event_id=>wwv_flow_imp.id(800183601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var ids = [];',
'$("input.ot-check:checked").each(function(){',
'    ids.push($(this).val());',
'});',
'if (ids.length === 0) {',
'    apex.message.showErrors([{',
'        type: "error",',
'        location: "page",',
'        message: "Debe seleccionar al menos una Orden de Trabajo."',
'    }]);',
'    return;',
'}',
'apex.item("P183_IDS_OT").setValue(ids.join(","));',
'apex.page.submit({',
'    request: "GENERAR_FACTURA",',
'    showWait: true',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(800183603)
,p_name=>'Cancelar'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(800183401)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(800183604)
,p_event_id=>wwv_flow_imp.id(800183603)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(800183610)
,p_name=>'DefinirVto'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P183_CONDICION_VENTA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(800183611)
,p_event_id=>wwv_flow_imp.id(800183610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'case :P183_CONDICION_VENTA ',
'    when ''CONTADO'' then ',
'        :P183_FECHA_VENCIMIENTO := to_char(trunc(current_date,''DD''),''DD-MM-YYYY'');',
'    when ''CREDITO'' then',
'        :P183_FECHA_VENCIMIENTO := to_char(trunc(current_date,''DD'')+30,''DD-MM-YYYY'');',
'    else',
'        :P183_FECHA_VENCIMIENTO := null;',
'end case;'))
,p_attribute_02=>'P183_CONDICION_VENTA'
,p_attribute_03=>'P183_FECHA_VENCIMIENTO'
,p_attribute_05=>'#SQLERRM#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(132788977785876049)
,p_name=>'buscar nro factura lost'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P183_TIM_ID_TIMBRADO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(132789028860876050)
,p_event_id=>wwv_flow_imp.id(132788977785876049)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buscar_nro()'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(155498143305448606)
,p_name=>'buscar nro factura change'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P183_TIM_ID_TIMBRADO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(155498266973448607)
,p_event_id=>wwv_flow_imp.id(155498143305448606)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buscar_nro()'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800183501)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Factura desde OTs'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    v_id_factura NUMBER; ',
'BEGIN ',
'    PKG_ORDEN_TRABAJO.P_GENERAR_FACTURA_DESDE_OT(',
'        p_ids_orden_trabajo  => :P183_IDS_OT',
'       ,p_id_timbrado        => :P183_TIM_ID_TIMBRADO',
'       ,p_nro_factura        => TO_NUMBER(REPLACE(:P183_NRO_FACTURA,''-'',NULL))',
'       ,p_condicion_venta    => :P183_CONDICION_VENTA',
'       ,p_fecha_factura      => TO_DATE(:P183_FECHA_FACTURA, ''DD-MM-YYYY'')',
'       ,p_fecha_vencimiento  => TO_DATE(:P183_FECHA_VENCIMIENTO, ''DD-MM-YYYY'')',
'       ,p_tip_id_tipo_comp   => :P183_TCO_ID_TIPO_COMPROBANTE',
'       ,p_suc_id_sucursal    => :P183_SUC_ID_SUCURSAL',
'       ,p_id_factura_out     => v_id_factura',
'    ); ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(800183402)
,p_process_success_message=>'Factura generada exitosamente.'
,p_internal_uid=>800183501
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800183502)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_internal_uid=>800183502
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134309077643216001)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'buscar_nro'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  DECLARE',
'    PROCEDURE output_json_item (',
'          p_item_name  IN VARCHAR2',
'        , p_item_value IN VARCHAR2)',
'    AS',
'    BEGIN',
'        apex_json.open_object;',
'        apex_json.write(''id''    , p_item_name);',
'        apex_json.write(''value'' , p_item_value, TRUE);',
'        apex_json.close_object;',
'    END output_json_item;',
'BEGIN',
'    pkg_factura_venta.p_obtener_nro_comprobante(',
'          pi_tim_id_timbrado => :P183_TIM_ID_TIMBRADO',
'        , pi_suc_id_sucursal => :P183_SUC_ID_SUCURSAL',
'        , pi_tip_id_tipo_comprobante => :P183_TCO_ID_TIPO_COMPROBANTE',
'        , pi_usuario => :APP_USER',
'        , pi_fecha_factura => :P183_FECHA_FACTURA',
'        , po_nro_factura => :P183_NRO_FACTURA',
'    );',
'    :P183_NRO_FACTURA := lpad(:P183_NRO_FACTURA,13,0);',
'    :P183_NRO_FACTURA :=    SUBSTR(:P183_NRO_FACTURA, 1, 3) || ''-'' || ',
'                           SUBSTR(:P183_NRO_FACTURA, 4, 3) || ''-'' || ',
'                           SUBSTR(:P183_NRO_FACTURA, 7, 7);',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P183_NRO_FACTURA'', :P183_NRO_FACTURA);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        ROLLBACK;',
'        apex_json.open_object;',
'        apex_json.write(''success'', FALSE);',
'        apex_json.write(''message'', utl_call_stack.error_msg(1));',
'        apex_json.close_object;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>134309077643216001
);
wwv_flow_imp.component_end;
end;
/
