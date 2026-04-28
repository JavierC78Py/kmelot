prompt --application/pages/page_00084
begin
--   Manifest
--     PAGE: 00084
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
 p_id=>84
,p_name=>'Crear cobro a factura'
,p_alias=>'CREAR-COBRO-A-FACTURA'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear cobro a factura'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buscaCambio() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors();',
'    apex.server.process("busca_cambio", {',
'       pageItems: [ "P84_FECHA",',
'       "P84_DEUDA_MONEDA",',
'       "P84_MONEDA"',
'       ]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                } ',
'            } else {      ',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }       ',
'        }',
'    }).always( function() {',
'        waitPopup.remove();',
'    });',
'}',
'function urlVerPDF(){',
'    apex.navigation.openInNewWindow(',
'        apex.server.url( {',
'            p_request: "application_process=ver_pdf",',
'            x01: apex.item("P84_ID_COBRO").getValue()',
'        })',
'    );',
'}',
'function obtenerDefecto() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors();',
'    apex.server.process("obtener_valor_defecto", {',
'       pageItems: [',
'         "P84_TIPO_FACS"',
'        ,"P84_SUC_ID_SUCURSAL"',
'       ]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                } ',
'                apex.item("P84_TIP_ID_TIPO_COMPROBANTE").setValue( apex.item("P84_TIP_ID_TIPO_COMPROBANTE").getValue(), apex.item("P84_P_DESCRI_TIPO_COMPROBANTE").getValue() );',
'                setTimeout(function() {',
'                    apex.item("P84_TIM_ID_TIMBRADO").setValue( apex.item("P84_P_TMP_ID_TIMBRADO").getValue(), apex.item("P84_P_DESCRI_TIMBRADO").getValue() );',
'                }, 500);',
'            } else {      ',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }       ',
'        }',
'    }).always( function() {',
'        waitPopup.remove();',
'    });',
'}',
'(function($) {',
'    function update(model) {',
'        var salKey = model.getFieldKey("SUMAR_PAGO"),',
'            total = 0;',
'        console.log(">> starting sum SUMAR_PAGO column")',
'        model.forEach(function(record, index, id) {',
'            var sal = parseFloat(record[salKey]), ',
'                meta = model.getRecordMetadata(id);',
'',
'            if (!isNaN(sal) && !meta.deleted && !meta.agg) {',
'                total += sal;',
'            }',
'        });',
'        console.log(">> setting sum SUMAR_PAGO column to " + total)',
'        $s("P84_MONTO_FACTURAS", total);',
'    }',
'    $(function() {',
'        $("#REG_FACTURAS").on("interactivegridviewmodelcreate", function(event, ui) {',
'            var sid,',
'                model = ui.model;',
'            if ( ui.viewId === "grid" ) {',
'                sid = model.subscribe( {',
'                    onChange: function(type, change) {',
'                        console.log(">> model changed ", type, change);',
'                        if ( type === "set" ) {',
'                             if (change.field === "SUMAR_PAGO" ) {',
'                                update( model );',
'                            }',
'                        } else if (type !== "move" && type !== "metaChange") {',
'                          update( model );',
'                        }',
'                    },',
'                    progressView: $("#P84_MONTO_FACTURAS") ',
'                } );',
'                 update( model );           ',
'                model.fetchAll(function() {});',
'            }',
'        });',
'',
'    });',
'',
'})(apex.jQuery);',
'//-----------------------------------',
'(function($) {',
'    function update(model) {',
'        var salKey = model.getFieldKey("VALOR_COBRO_MONEDA_FACTURA"),',
'            total = 0;',
'        console.log(">> starting sum VALOR_COBRO_MONEDA_FACTURA column")',
'        model.forEach(function(record, index, id) {',
'            var sal = parseFloat(record[salKey]), ',
'                meta = model.getRecordMetadata(id);',
'',
'            if (!isNaN(sal) && !meta.deleted && !meta.agg) {',
'                total += sal;',
'            }',
'        });',
'        console.log(">> setting sum VALOR_COBRO_MONEDA_FACTURA column to " + total)',
'        $s("P84_MONTO_PAGOS", total);',
'    }',
'    $(function() {',
'        $("#REG_PAGOS").on("interactivegridviewmodelcreate", function(event, ui) {',
'            var sid,',
'                model = ui.model;',
'            if ( ui.viewId === "grid" ) {',
'                sid = model.subscribe( {',
'                    onChange: function(type, change) {',
'                        console.log(">> model changed ", type, change);',
'                        if ( type === "set" ) {',
'                             if (change.field === "VALOR_COBRO_MONEDA_FACTURA" ) {',
'                                update( model );',
'                            }',
'                        } else if (type !== "move" && type !== "metaChange") {',
'                          update( model );',
'                        }',
'                    },',
'                    progressView: $("#P84_MONTO_PAGOS") ',
'                } );',
'                 update( model );           ',
'                model.fetchAll(function() {});',
'            }',
'        });',
'',
'    });',
'})(apex.jQuery);'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P84_ID_COBRO").prop( ''readOnly'', true);',
'$("#P84_FECHA").prop( ''readOnly'', true);',
'$("#P84_REN_ID_RENDICION_CAJA").prop( ''readOnly'', true);',
'$("#P84_TIPO_CAMBIO").prop( ''readOnly'', true);',
'$("#P84_ESTADO").prop( ''readOnly'', true);',
'$("#P84_MONTO_FACTURAS").prop( ''readOnly'', true);',
'$("#P84_MONTO_PAGOS").prop( ''readOnly'', true);',
'$("#P84_DIFERENCIA").prop( ''readOnly'', true);',
'$("#P84_SALDO").prop( ''readOnly'', true);',
'$("#P84_MONTO_DE_COBRANZA").prop( ''readOnly'', true);',
'$("#P84_T_CAMBIO").prop( ''readOnly'', true);',
'$("#P84_VALOR_AL_COBRO").prop( ''readOnly'', true);',
'',
'var ig$ = apex.region("REG_FACTURAS").widget();',
'ig$.interactiveGrid("getActions").set("edit", true);',
'',
'setTimeout(() => {',
'    $("#P84_ESTADO").addClass($("#P84_ESTADO").val()) ',
'},200);',
'',
'setTimeout(() => {',
'    if (apex.item("P84_TIPO_FACS").getValue()=="CO" ',
'        && apex.item("P84_TIP_ID_TIPO_COMPROBANTE").getValue()==3){',
'            apex.item("btn_buscar").enable();',
'            apex.item("btn_buscar").setFocus();',
'    } else {',
'        apex.item("P84_TIPO_FACS").setFocus();',
'    }',
'},800);',
''))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Dialog-body {',
'    padding-top: 2px;',
'}',
'',
'#P84_ID_COBRO{',
'    background-color: rgb(190, 190, 190);',
'    color :rgb(0, 0, 0);',
'    text-align: center;',
'}',
'',
'',
'#P84_ESTADO.ACTIVO {',
'    background-color: rgb(117, 206, 105);',
'    text-align: center;',
'}',
'',
'#P84_ESTADO.ANULADO {',
'    background-color: rgb(206, 105, 105);',
'    color :white;',
'    text-align: center;',
'}',
'',
'',
'#P84_TIP_ID_TIPO_COMPROBANTE,#P84_TIM_ID_TIMBRADO,#P84_ENT_ID_ENTIDAD {',
'    background-color: rgb(240, 215, 102);',
'}',
'',
'#btn_buscar, #btn_agregar_pago, #btn_ver_pdf {    ',
'    margin-top: 17px;',
'    }',
'',
'.t-fht-thead{',
'  overflow: auto !important;',
'}',
'',
'.text-dark {',
'    color:black !important;',
'    opacity: 1 !important;',
'}',
''))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(153032614434325677)
,p_plug_name=>unistr('Cambiar n\00FAmero')
,p_region_name=>'REG_CAMBIAR_NRO'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>50
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(205684333347945781)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>5
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(208163620576221582)
,p_plug_name=>'Datos entidad'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(208402361407525679)
,p_plug_name=>'Cabecera del cobro'
,p_region_name=>'REG_CABECERA'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-expanded:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_COBRO,',
'       SUC_ID_SUCURSAL,',
'       TIP_ID_TIPO_COMPROBANTE,',
'       TIM_ID_TIMBRADO,',
'       NRO_COMPROBANTE,',
'       FECHA,',
'       ENT_ID_ENTIDAD,',
'       MON_ID_MONEDA,',
'       TIPO_CAMBIO,',
'       ESTADO,',
'       REN_ID_RENDICION_CAJA,',
'       MON_ID_MONEDA AS ID_MONEDA',
'  from CAB_COBRO'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(208410042878525690)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(208424688655527508)
,p_plug_name=>'Regiones'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'NO')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(208424816074527509)
,p_plug_name=>'Facturas'
,p_region_name=>'REG_FACTURAS'
,p_parent_plug_id=>wwv_flow_imp.id(208424688655527508)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT a.c001 fecha_factura',
'      ,To_Number(a.c002) tip_id_tipo_comprobante',
'      ,a.c003 condicion_venta',
'      ,To_Char(To_Number(a.c004),''999G999G9999999'') nro_factura',
'      ,To_Number(a.c005) mon_id_moneda',
'      ,To_Number(a.c006) id_detalle_cuenta',
'      ,To_Number(a.c007) item',
'      ,a.c008 fecha_vencimiento',
'      ,To_Number(a.c009) importe',
'      ,To_Number(a.c010) saldo',
'      ,To_Number(a.c011) pagar',
'      ,a.seq_id',
'      ,a.c012 seleccion',
'      ,a.c013 sumar_pago',
'FROM apex_collections a',
'WHERE a.collection_name = ''COLL_DETALLE_PENDIENTES''',
'AND (a.c003 = case :P84_TIPO_FACS when ''CO'' then ''CONTADO'' when ''CR'' then ''CREDITO'' end',
'OR (:P84_TIPO_FACS IS NULL AND :P84_ID_COBRO IS NOT NULL))'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P84_TIPO_FACS'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Facturas pendientes'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208524404386592380)
,p_name=>'FECHA_FACTURA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_FACTURA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Fecha factura'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208524478039592381)
,p_name=>'TIP_ID_TIPO_COMPROBANTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIP_ID_TIPO_COMPROBANTE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(207635731551337402)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208524550365592382)
,p_name=>'CONDICION_VENTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CONDICION_VENTA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Condici\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208524732962592383)
,p_name=>'NRO_FACTURA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NRO_FACTURA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nro. Factura'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>16
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208524754314592384)
,p_name=>'MON_ID_MONEDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MON_ID_MONEDA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Moneda'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(203774852436037054)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208524890338592385)
,p_name=>'ID_DETALLE_CUENTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DETALLE_CUENTA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208525007476592386)
,p_name=>'ITEM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEM'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cuota'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208525129221592387)
,p_name=>'FECHA_VENCIMIENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_VENCIMIENTO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_width=>12
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208525193483592388)
,p_name=>'IMPORTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPORTE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Importe'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208525283284592389)
,p_name=>'SALDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo doc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208525365621592390)
,p_name=>'PAGAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGAR'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'A pagar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D99'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ITEM_IS_NOT_NULL'
,p_readonly_condition=>'P84_ID_COBRO'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208526018146592396)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208526546540592402)
,p_name=>'SELECCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELECCION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>unistr('Selecci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'SI',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ITEM_IS_NOT_NULL'
,p_readonly_condition=>'P84_ID_COBRO'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208526934035592405)
,p_name=>'SUMAR_PAGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SUMAR_PAGO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(209491347806780779)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(209491521557780780)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(208524268195592379)
,p_internal_uid=>15557723559929501
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>false
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(208530185394594336)
,p_interactive_grid_id=>wwv_flow_imp.id(208524268195592379)
,p_static_id=>'155637'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>100
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(208530379644594337)
,p_report_id=>wwv_flow_imp.id(208530185394594336)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(192971404933730633)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(208526546540592402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208530866642594352)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(208524404386592380)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208531808923594358)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(208524478039592381)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208532685476594361)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(208524550365592382)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208533607535594363)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(208524732962592383)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208534505479594366)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(208524754314592384)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208535428206594369)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(208524890338592385)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208536246742594371)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(208525007476592386)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208537161996594373)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(208525129221592387)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208538130298594375)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(208525193483592388)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208539024301594378)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(208525283284592389)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208539877878594380)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(208525365621592390)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208556569485801272)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(208526018146592396)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208579170064608977)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(208526934035592405)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(209497368544782490)
,p_view_id=>wwv_flow_imp.id(208530379644594337)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(209491347806780779)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(208425036402527511)
,p_plug_name=>'Formas de pago'
,p_parent_plug_id=>wwv_flow_imp.id(208424688655527508)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(208163735533221583)
,p_plug_name=>'Agregar pagos'
,p_region_name=>'REG_AGREGAR'
,p_parent_plug_id=>wwv_flow_imp.id(208425036402527511)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-expanded:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>5
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84_ID_COBRO IS NULL OR ',
'(:P84_ESTADO = ''ACTIVO'' AND :P84_P_EDITAR_TRANSACC = ''SI'')'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(208950670494633784)
,p_plug_name=>'Pagos'
,p_region_name=>'REG_PAGOS'
,p_parent_plug_id=>wwv_flow_imp.id(208425036402527511)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  To_Number(c001)            id_transaccion',
' ,c002                       tipo_transaccion',
' ,To_Date(c003,''dd/mm/yyyy'') fecha_transaccion',
' ,To_Number(c004)            for_id_forma_pago',
' ,To_Number(c005)            mon_id_moneda',
' ,To_Number(c006)            ban_id_banco',
' ,To_Number(c007)            emi_id_emisor_tarjeta',
' ,To_Number(c008)            nro_comprobante',
' ,To_Date(c009,''dd/mm/yyyy'') fecha_emision',
' ,To_Date(c010,''dd/mm/yyyy'') fecha_cobro',
' ,To_Number(c011)            importe',
' ,To_Number(c012)            saldo',
' ,c013                       estado',
' ,c014                       tipo_forma_pago',
' ,c015                       sumar_forma_pago',
' ,c016                       valor_cobro_moneda_factura',
' ,seq_id',
'FROM apex_collections a',
'WHERE a.collection_name = ''COLL_DETALLE_PAGOS''',
';',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Pagos'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208950926679633786)
,p_name=>'ID_TRANSACCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TRANSACCION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208950972656633787)
,p_name=>'TIPO_TRANSACCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_TRANSACCION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208951136264633788)
,p_name=>'FECHA_TRANSACCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_TRANSACCION'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208951187926633789)
,p_name=>'FOR_ID_FORMA_PAGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOR_ID_FORMA_PAGO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Forma de pago'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(208609702187345415)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208951248199633790)
,p_name=>'MON_ID_MONEDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MON_ID_MONEDA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Moneda'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(203774852436037054)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208951361583633791)
,p_name=>'BAN_ID_BANCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BAN_ID_BANCO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Banco'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(208615258056976201)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208951467025633792)
,p_name=>'EMI_ID_EMISOR_TARJETA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMI_ID_EMISOR_TARJETA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Emisor tarjeta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(208615866273984573)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208951640472633793)
,p_name=>'NRO_COMPROBANTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NRO_COMPROBANTE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Nro comprobante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208951685585633794)
,p_name=>'FECHA_EMISION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_EMISION'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha emisi\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208951763644633795)
,p_name=>'FECHA_COBRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_COBRO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha cobro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208951864715633796)
,p_name=>'IMPORTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPORTE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Importe'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208951979885633797)
,p_name=>'SALDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo for. pago'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208952143322633798)
,p_name=>'ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208952465836633802)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84_ID_COBRO IS NULL',
'OR (:P84_ESTADO = ''ACTIVO'' AND :P84_P_EDITAR_TRANSACC = ''SI'')'))
,p_display_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208952607498633803)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'Y',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208952762912633805)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208952887509633806)
,p_name=>'TIPO_FORMA_PAGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_FORMA_PAGO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208952957151633807)
,p_name=>'SUMAR_FORMA_PAGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SUMAR_FORMA_PAGO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(209359937817890190)
,p_name=>'VALOR_COBRO_MONEDA_FACTURA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALOR_COBRO_MONEDA_FACTURA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor moneda fact.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(208950747074633785)
,p_internal_uid=>15984202438970907
,p_is_editable=>true
,p_edit_operations=>'d'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_no_data_found_message=>'No se encuentran pagos.'
,p_show_toolbar=>true
,p_toolbar_buttons=>'SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    var $ = apex.jQuery,',
'        toolbarData = $.apex.interactiveGrid.copyDefaultToolbar(),',
'        reportsGroupControls = toolbarData.toolbarFind( "actions4" ).controls;',
'    toolbarData.toolbarRemove( "actions2" );',
'    options.toolbarData = toolbarData;',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(208958877491807706)
,p_interactive_grid_id=>wwv_flow_imp.id(208950747074633785)
,p_static_id=>'159924'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(208959066439807706)
,p_report_id=>wwv_flow_imp.id(208958877491807706)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208959629126807712)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(208950926679633786)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208960471869807718)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(208950972656633787)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208961382091807721)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(208951136264633788)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208962315313807723)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(208951187926633789)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208963112676807726)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(208951248199633790)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208963945618807728)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(208951361583633791)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208964932010807730)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(208951467025633792)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208965825092807734)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(208951640472633793)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208966732043807736)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(208951685585633794)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208967615238807738)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(208951763644633795)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208968462440807740)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(208951864715633796)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208969410277807743)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(208951979885633797)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208970327092807745)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(208952143322633798)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208981688482172354)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(208952465836633802)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>10
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208988752423175249)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(208952762912633805)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208990974883236070)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(208952887509633806)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208991882567236072)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(208952957151633807)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(209378985386140644)
,p_view_id=>wwv_flow_imp.id(208959066439807706)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(209359937817890190)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(153032446679325676)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_button_name=>'BTN_NUMERAR'
,p_button_static_id=>'BTN_NUMERAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--simple:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Cambiar n\00FAmero')
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84_ESTADO = ''ACTIVO'' ',
'AND :P84_ID_COBRO IS NOT NULL',
'AND :P84_P_EDITAR_TRANSACC = ''NO'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
,p_security_scheme=>wwv_flow_imp.id(209156921590183182)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(164973191490024542)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_button_name=>'BTN_EDITAR_TRANSAC'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--simple:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cambiar formas pago'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84_ESTADO = ''ACTIVO'' ',
'AND :P84_ID_COBRO IS NOT NULL',
'AND :P84_P_EDITAR_TRANSACC = ''NO'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
,p_security_scheme=>wwv_flow_imp.id(209156921590183182)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(208602797785639491)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(208163735533221583)
,p_button_name=>'Agregar'
,p_button_static_id=>'btn_agregar_pago'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-money'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(208425209691527513)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(208163620576221582)
,p_button_name=>'Buscar'
,p_button_static_id=>'btn_buscar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Buscar'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P84_ID_COBRO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-search'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(209102976276642695)
,p_button_sequence=>220
,p_button_plug_id=>wwv_flow_imp.id(208163620576221582)
,p_button_name=>'VerPDF'
,p_button_static_id=>'btn_ver_pdf'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--simple:t-Button--iconLeft:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Ver'
,p_button_redirect_url=>'javascript: urlVerPDF();'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84_ID_COBRO IS NOT NULL ',
'AND :P84_ESTADO = ''ACTIVO''',
'AND :P84_P_EDITAR_TRANSACC = ''NO'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(153032822569325679)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(153032614434325677)
,p_button_name=>'BTN_RETORNAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(208410384486525690)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(208410042878525690)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(153033054713325682)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(153032614434325677)
,p_button_name=>'BTN_APLICAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(208411812864525693)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(208410042878525690)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>':P84_ID_COBRO IS NOT NULL AND :P84_ESTADO = ''ANULADO'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(209157312788184902)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(209102799323642693)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(208410042878525690)
,p_button_name=>'ANULAR'
,p_button_static_id=>'btn_anular'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Anular cobro'
,p_button_position=>'NEXT'
,p_button_execute_validations=>'N'
,p_confirm_message=>unistr('&APP_TEXT$DELETE_MSG!RAW. (**  Las transacciones que est\00E9n compartidas con otro cobro quedaran pendientes, las dem\00E1s ser\00E1n anuladas.  **)')
,p_confirm_style=>'danger'
,p_button_condition=>':P84_ID_COBRO IS NOT NULL AND :P84_ESTADO = ''ACTIVO'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_cattributes=>unistr('title="Las transacciones que est\00E9n compartidas con otro cobro quedaran pendientes, las dem\00E1s ser\00E1n anuladas."')
,p_security_scheme=>wwv_flow_imp.id(209156921590183182)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(208412206459525693)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(208410042878525690)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition_type=>'NEVER'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(208412555248525694)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(208410042878525690)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear cobro'
,p_button_position=>'NEXT'
,p_button_execute_validations=>'N'
,p_button_condition=>'P84_ID_COBRO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(209157125628184056)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(153032628097325678)
,p_name=>'P84_P_NUMERO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(153032614434325677)
,p_prompt=>unistr('N\00FAmero de comprobante')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(164973276492024543)
,p_name=>'P84_P_EDITAR_TRANSACC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(205684333347945781)
,p_prompt=>'P Editar Transacc'
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
 p_id=>wwv_flow_imp.id(164973640099024547)
,p_name=>'P84_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_item_source_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_source=>'ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(164973827897024549)
,p_name=>'P84_DEUDA_MONEDA_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(205684333347945781)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MONEDA_DEUDA'
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
 p_id=>wwv_flow_imp.id(205684441838945782)
,p_name=>'P84_P_DESCRI_TIMBRADO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(205684333347945781)
,p_prompt=>'P Descri Timbrado'
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
 p_id=>wwv_flow_imp.id(205684458579945783)
,p_name=>'P84_P_DESCRI_TIPO_COMPROBANTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(205684333347945781)
,p_prompt=>'P Descri Tipo Comprobante'
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
 p_id=>wwv_flow_imp.id(205684607602945784)
,p_name=>'P84_P_TMP_ID_TIMBRADO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(205684333347945781)
,p_prompt=>'P Tmp Id Timbrado'
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
 p_id=>wwv_flow_imp.id(208402733574525681)
,p_name=>'P84_ID_COBRO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_item_source_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_prompt=>'Id Cobro'
,p_source=>'ID_COBRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208403129535525682)
,p_name=>'P84_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_item_source_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208403535452525683)
,p_name=>'P84_TIM_ID_TIMBRADO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_item_source_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_prompt=>unistr('Punto de expedici\00F3n')
,p_source=>'TIM_ID_TIMBRADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT LPad(t.establecimiento,3,''0'')||''-''||LPad(t.punto_expedicion,3,''0'')||'' ''||tc.descripcion ',
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
'AND t.suc_id_sucursal         = :P84_SUC_ID_SUCURSAL',
'AND t.tip_id_tipo_comprobante = :P84_TIP_ID_TIPO_COMPROBANTE',
'AND t.nro_final               > t.nro_utilizado ',
'AND trunc(CURRENT_DATE,''DD'') BETWEEN trunc(t.fecha_inicio,''DD'') AND trunc(t.fecha_vencimiento,''DD'')',
'AND tc.id_tipo_comprobante   = t.tip_id_tipo_comprobante',
''))
,p_lov_cascade_parent_items=>'P84_SUC_ID_SUCURSAL,P84_TIP_ID_TIPO_COMPROBANTE'
,p_ajax_items_to_submit=>'P84_TIM_ID_TIMBRADO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P84_ID_COBRO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208403880267525683)
,p_name=>'P84_NRO_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_item_source_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_prompt=>'Nro comprobante'
,p_format_mask=>'999G999G9999999'
,p_source=>'NRO_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P84_ID_COBRO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208404276457525683)
,p_name=>'P84_FECHA'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_item_source_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_prompt=>'Fecha cobro'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_source=>'FECHA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208405114458525684)
,p_name=>'P84_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(208163620576221582)
,p_item_source_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_prompt=>'Moneda'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LV_MONEDA'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P84_ID_COBRO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'LOV',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208405461026525684)
,p_name=>'P84_TIPO_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(208163620576221582)
,p_item_source_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_prompt=>'Tipo cambio'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'TIPO_CAMBIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_display_when=>'P84_ID_COBRO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208405942634525684)
,p_name=>'P84_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_item_source_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_item_default=>'ACTIVO'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P84_ID_COBRO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208406293420525684)
,p_name=>'P84_REN_ID_RENDICION_CAJA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_item_source_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_prompt=>unistr('Id Rendici\00F3n')
,p_source=>'REN_ID_RENDICION_CAJA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>50
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'center',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208423541152527496)
,p_name=>'P84_TIP_ID_TIPO_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_item_source_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_prompt=>'Tipo comprobante'
,p_source=>'TIP_ID_TIPO_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select descripcion d, ',
'       id_tipo_comprobante r',
'  from TIPO_COMPROBANTE',
' where estado = ''ACTIVO'' ',
'   and cobro = ''SI''',
'   and :P84_TIPO_FACS is not null',
'   and descripcion like (case ',
'                           when :P84_TIPO_FACS = ''CO'' then',
'                             ''%CONTADO%''',
'                           else',
'                             descripcion',
'                        end)',
'  and descripcion not like (case ',
'                       when :P84_TIPO_FACS != ''CO'' then',
'                         ''%CONTADO%''',
'                       else',
'                         ''XX''',
'                    end)',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_lov_cascade_parent_items=>'P84_TIPO_FACS'
,p_ajax_items_to_submit=>'P84_TIP_ID_TIPO_COMPROBANTE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P84_ID_COBRO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208423557279527497)
,p_name=>'P84_DISPLAY_SUCURSAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_prompt=>'Sucursal'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SUCURSAL_ENTIDAD_ALL'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column_css_classes=>'apex_disabled'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'tabindex="-1"'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208526109609592397)
,p_name=>'P84_MONTO_FACTURAS'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(208163620576221582)
,p_prompt=>'A pagar facturas'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P84_ID_COBRO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208526198312592398)
,p_name=>'P84_MONTO_PAGOS'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(208163620576221582)
,p_prompt=>'Monto pago'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P84_ID_COBRO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208601930889639482)
,p_name=>'P84_FORMA_PAGO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(208163735533221583)
,p_prompt=>'Forma pago'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_FORMA_PAGO_DESCRIP_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_forma_pago r',
'      ,descripcion d',
'from forma_pago',
'where estado = ''ACTIVO''      '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
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
 p_id=>wwv_flow_imp.id(208601974823639483)
,p_name=>'P84_MONEDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(208163735533221583)
,p_prompt=>'Moneda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208602093762639484)
,p_name=>'P84_BANCO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(208163735533221583)
,p_prompt=>'Banco'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_BANCO_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_banco r',
'      ,descripcion d',
'from banco',
'where estado = ''ACTIVO''',
'order by descripcion      '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208602213439639485)
,p_name=>'P84_EMISOR_TARJ'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(208163735533221583)
,p_prompt=>'Emisor tarjeta'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_EMISOR_TARJETA_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_emisor_tarjeta r',
'      ,descripcion d',
'from emisor_tarjeta',
'where estado = ''ACTIVO''      '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208602297199639486)
,p_name=>'P84_NUMERO_COMPOBANTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(208163735533221583)
,p_prompt=>'Nro. comprobante'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208602438191639487)
,p_name=>'P84_FECHA_EMISION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(208163735533221583)
,p_prompt=>unistr('Fecha emisi\00F3n')
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>20
,p_cMaxlength=>20
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
 p_id=>wwv_flow_imp.id(208602503067639488)
,p_name=>'P84_FECHA_COBRO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(208163735533221583)
,p_prompt=>'Fecha cobro'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>20
,p_cMaxlength=>20
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
 p_id=>wwv_flow_imp.id(208602604097639489)
,p_name=>'P84_IMPORTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(208163735533221583)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Importe'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208602649760639490)
,p_name=>'P84_SALDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(208163735533221583)
,p_prompt=>'Saldo'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208602856885639492)
,p_name=>'P84_TIPO_FORMA_PAGO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(208163735533221583)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208605974185639523)
,p_name=>'P84_DIFERENCIA'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(208163620576221582)
,p_prompt=>'Diferencia'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P84_ID_COBRO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209003526283635587)
,p_name=>'P84_HABILITAR_GUARDAR'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209068517879318180)
,p_name=>'P84_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(208163620576221582)
,p_item_source_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_prompt=>'Cliente'
,p_source=>'ENT_ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.numero_documento||'' ''||e.nombre as d, e.id_entidad as r',
'FROM entidad e',
'WHERE EXISTS (',
'          SELECT 1',
'          FROM det_cuenta_venta d, cab_factura_venta c',
'          WHERE d.saldo > 0',
'          AND c.id_factura_venta = d.fac_id_factura_venta',
'          AND c.ent_id_entidad = e.id_entidad',
'          AND c.estado = ''ACTIVO''',
'          FETCH FIRST 1 ROW ONLY',
'             )',
'ORDER BY e.nombre;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cSize=>30
,p_tag_css_classes=>'text-dark'
,p_colspan=>5
,p_display_when=>'P84_ID_COBRO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209102502275642690)
,p_name=>'P84_ENT_ID_ENTIDAD_VER'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(208163620576221582)
,p_item_source_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_prompt=>'Cliente'
,p_source=>'ENT_ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LV_ENTIDAD_CI_NOMBRE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT nombre as d, id_entidad as r',
'from entidad',
'order by nombre'))
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_display_when=>'P84_ID_COBRO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'LOV',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209102678064642692)
,p_name=>'P84_MONTO_DE_COBRANZA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(208163620576221582)
,p_prompt=>'Monto pago'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P84_ID_COBRO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209244621026320679)
,p_name=>'P84_T_CAMBIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(208163735533221583)
,p_prompt=>'Tipo cambio'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209268434440928190)
,p_name=>'P84_DEUDA_MONEDA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(205684333347945781)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MONEDA_DEUDA'
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
 p_id=>wwv_flow_imp.id(209268507470928191)
,p_name=>'P84_VALOR_AL_COBRO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(208163735533221583)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor en moneda factura'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209269069821928197)
,p_name=>'P84_DESCRI_MONEDA_DEUDA'
,p_item_sequence=>80
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209360200819890193)
,p_name=>'P84_ID_ENTIDAD_GUARDAR'
,p_item_sequence=>90
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209451656132643879)
,p_name=>'P84_TIPO_FACS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(208402361407525679)
,p_prompt=>'Tipo factura'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC:Contado;CO,Cr\00E9dito ;CR')
,p_colspan=>3
,p_grid_label_column_span=>1
,p_display_when=>'P84_ID_COBRO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208410457487525690)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(208410384486525690)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208411338101525693)
,p_event_id=>wwv_flow_imp.id(208410457487525690)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209102239701642687)
,p_name=>'SoloVer'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P84_ID_COBRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209102273967642688)
,p_event_id=>wwv_flow_imp.id(209102239701642687)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#P84_ESTADO'').prop(''readonly'', true);',
'$(''#P84_NRO_COMPROBANTE'').prop(''readonly'', true);',
'',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209245301975320686)
,p_event_id=>wwv_flow_imp.id(209102239701642687)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_ENT_ID_ENTIDAD_VER_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208423700565527498)
,p_name=>'Ir A'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P84_ID_COBRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208606247485639526)
,p_event_id=>wwv_flow_imp.id(208423700565527498)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(208425209691527513)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208950173306633779)
,p_event_id=>wwv_flow_imp.id(208423700565527498)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(208425036402527511)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209245212882320685)
,p_event_id=>wwv_flow_imp.id(208423700565527498)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_ENT_ID_ENTIDAD_VER_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208424049977527502)
,p_name=>'Definir moneda'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIP_ID_TIPO_COMPROBANTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208424150155527503)
,p_event_id=>wwv_flow_imp.id(208424049977527502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_MON_ID_MONEDA'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':APP_ID_MONEDA_PRINCIPAL'
,p_attribute_07=>'APP_ID_MONEDA_PRINCIPAL'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208424277134527504)
,p_name=>'Ir a p expedicion'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIP_ID_TIPO_COMPROBANTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208424389725527505)
,p_event_id=>wwv_flow_imp.id(208424277134527504)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_TIM_ID_TIMBRADO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208424489193527506)
,p_name=>'Ir a entidad'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIM_ID_TIMBRADO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208424576027527507)
,p_event_id=>wwv_flow_imp.id(208424489193527506)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_END_ID_ENTIDAD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208425291554527514)
,p_name=>'Buscar'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(208425209691527513)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208425415550527515)
,p_event_id=>wwv_flow_imp.id(208425291554527514)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'  v_select VARCHAR2(32000);',
'BEGIN ',
'    if :P84_TIP_ID_TIPO_COMPROBANTE is null then',
'        raise_application_error(-20000,''Favor seleccione el tipo de comprobante.'');',
'    end if;',
'    if :P84_TIM_ID_TIMBRADO is null then',
unistr('        raise_application_error(-20000,''Favor seleccione el punto de expedici\00F3n del comprobante.'');'),
'    end if;',
'  v_select := q''[',
'SELECT c.fecha_factura',
'      ,c.tip_id_tipo_comprobante',
'      ,c.condicion_venta',
'      ,c.nro_factura',
'      ,c.mon_id_moneda',
'      ,dc.id_detalle_cuenta',
'      ,dc.item',
'      ,dc.fecha_vencimiento',
'      ,dc.importe',
'      ,dc.saldo',
'      ,0 pagar',
'      ,''NO'' seleccion',
'FROM cab_factura_venta c',
'    ,det_cuenta_venta dc',
'WHERE c.ent_id_entidad = ]''||:P84_ENT_ID_ENTIDAD||q''[',
'AND c.estado = ''ACTIVO''',
'AND dc.fac_id_factura_venta = c.id_factura_venta',
'AND dc.saldo > 0',
'ORDER BY dc.fecha_vencimiento]''',
' ;',
'    if :P84_ENT_ID_ENTIDAD is not null then',
'      ',
'        P_CARGA_COLECCION (',
'          P_SELECT     => v_select',
'         ,P_COLLECTION => ''COLL_DETALLE_PENDIENTES''',
'         );',
'        :P84_ID_ENTIDAD_GUARDAR := :P84_ENT_ID_ENTIDAD;',
'    else',
'        :P84_ID_ENTIDAD_GUARDAR := NULL;  ',
'    end if;',
'END;',
''))
,p_attribute_02=>'P84_TIP_ID_TIPO_COMPROBANTE,P84_TIM_ID_TIMBRADO,P84_ENT_ID_ENTIDAD'
,p_attribute_03=>'P84_ID_ENTIDAD_GUARDAR'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208525518562592391)
,p_event_id=>wwv_flow_imp.id(208425291554527514)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(208424816074527509)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209101760248642683)
,p_event_id=>wwv_flow_imp.id(208425291554527514)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#REG_CABECERA.a-Collapsible.is-expanded'').removeClass(''is-expanded'').addClass(''is-collapsed'');',
'$(''#REG_CABECERA.a-Collapsible .a-Collapsible-content'').show();',
'$(''#P84_ENT_ID_ENTIDAD'').attr(''disabled'', true);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209244691997320680)
,p_event_id=>wwv_flow_imp.id(208425291554527514)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(208425209691527513)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208526669356592403)
,p_name=>'Sumar'
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(208424816074527509)
,p_triggering_element=>'SELECCION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208526772042592404)
,p_event_id=>wwv_flow_imp.id(208526669356592403)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :SELECCION = ''SI'' then ',
'    :PAGAR := :SALDO;',
'else',
'    :PAGAR := 0;',
'end if;',
'begin',
'    APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'    p_collection_name => ''COLL_DETALLE_PENDIENTES'',',
'    p_seq             => :seq_id,',
'    p_attr_number     => 12,',
'    p_attr_value      => :seleccion',
'    );',
'end;'))
,p_attribute_02=>'SEQ_ID,SELECCION,SALDO,PAGAR'
,p_attribute_03=>'PAGAR'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208527006365592406)
,p_name=>'SumarPago'
,p_event_sequence=>90
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(208424816074527509)
,p_triggering_element=>'PAGAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208527094377592407)
,p_event_id=>wwv_flow_imp.id(208527006365592406)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if to_number(:PAGAR,''999G999G999D99'') > 0 then ',
'    if to_number(:PAGAR,''999G999G999D99'') != to_number(:SALDO,''999G999G999D99'') and :CONDICION_VENTA = ''CONTADO'' then',
'        raise_application_error(-20000,''Factura contado debe ser PAGADA EN SU TOTALIDAD.'');',
'    end if;',
'    if to_number(:PAGAR,''999G999G999D99'') > to_number(:SALDO,''999G999G999D99'') then',
'      raise_application_error(-20000,''El monto a abonar no puede ser mayor al saldo.'');',
'    end if;',
'    :SUMAR_PAGO := to_number(:PAGAR,''999G999G999D99'');',
'    begin',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''COLL_DETALLE_PENDIENTES'',',
'        p_seq             => :seq_id,',
'        p_attr_number     => 13,',
'        p_attr_value      => :SUMAR_PAGO',
'        );',
'    end;    ',
'end if;    '))
,p_attribute_02=>'PAGAR,SALDO,CONDICION_VENTA,SEQ_ID'
,p_attribute_03=>'SUMAR_PAGO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208603040839639493)
,p_name=>'Buscar valores_change'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_FORMA_PAGO'
,p_condition_element=>'P84_FORMA_PAGO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208603096068639494)
,p_event_id=>wwv_flow_imp.id(208603040839639493)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select f.tipo_tipo',
'    into :P84_TIPO_FORMA_PAGO',
'    from forma_pago f',
'    where f.id_forma_pago = :P84_FORMA_PAGO;',
'exception',
'    when no_data_found then',
'        raise_application_error(-20000,''Error en la busqueda de forma de pago, favor informe'');    ',
'end;    '))
,p_attribute_02=>'P84_FORMA_PAGO'
,p_attribute_03=>'P84_TIPO_FORMA_PAGO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209359146983890183)
,p_name=>'Buscar valores_lose'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_FORMA_PAGO'
,p_condition_element=>'P84_FORMA_PAGO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209359321601890184)
,p_event_id=>wwv_flow_imp.id(209359146983890183)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select f.tipo_tipo',
'    into :P84_TIPO_FORMA_PAGO',
'    from forma_pago f',
'    where f.id_forma_pago = :P84_FORMA_PAGO;',
'exception',
'    when no_data_found then',
'        raise_application_error(-20000,''Error en la busqueda de forma de pago, favor informe'');    ',
'end;    '))
,p_attribute_02=>'P84_FORMA_PAGO'
,p_attribute_03=>'P84_TIPO_FORMA_PAGO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208605737588639520)
,p_name=>'Todos'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIPO_FORMA_PAGO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208605757941639521)
,p_event_id=>wwv_flow_imp.id(208605737588639520)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO,P84_EMISOR_TARJ,P84_FECHA_EMISION,P84_FECHA_COBRO,P84_IMPORTE,P84_SALDO,,P84_NUMERO_COMPOBANTE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208164237743221588)
,p_event_id=>wwv_flow_imp.id(208605737588639520)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO,P84_EMISOR_TARJ,P84_NUMERO_COMPOBANTE,P84_FECHA_EMISION,P84_FECHA_COBRO,P84_IMPORTE,P84_SALDO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208603153742639495)
,p_name=>'EF'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIPO_FORMA_PAGO'
,p_condition_element=>'P84_TIPO_FORMA_PAGO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'EF'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208603296868639496)
,p_event_id=>wwv_flow_imp.id(208603153742639495)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO,P84_EMISOR_TARJ,P84_NUMERO_COMPOBANTE,P84_FECHA_EMISION,P84_FECHA_COBRO,P84_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208603558847639499)
,p_event_id=>wwv_flow_imp.id(208603153742639495)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_IMPORTE'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_retorno number(18,2);',
'begin ',
'    if :P84_DEUDA_MONEDA != :P84_MONEDA then',
'        if :P84_DEUDA_MONEDA = :APP_ID_MONEDA_PRINCIPAL then',
'            v_retorno := round((to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00'')) / to_number(:P84_T_CAMBIO,''999G999D99''),2);',
'        else',
'            v_retorno := round((to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00'')) * to_number(:P84_T_CAMBIO,''999G999D99''),0);',
'        end if;',
'    else',
'      v_retorno := (to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00''));',
'    end if;',
'    return v_retorno;',
' end;'))
,p_attribute_07=>'P84_DEUDA_MONEDA ,P84_MONEDA,APP_ID_MONEDA_PRINCIPAL,P84_MONTO_FACTURAS,P84_MONTO_PAGOS,P84_T_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208603531408639498)
,p_event_id=>wwv_flow_imp.id(208603153742639495)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_IMPORTE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208603652829639500)
,p_name=>'TC'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIPO_FORMA_PAGO'
,p_condition_element=>'P84_TIPO_FORMA_PAGO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'TC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208603824014639501)
,p_event_id=>wwv_flow_imp.id(208603652829639500)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_FECHA_EMISION,P84_FECHA_COBRO,P84_'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208603926598639502)
,p_event_id=>wwv_flow_imp.id(208603652829639500)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_IMPORTE'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_retorno number(18,2);',
'begin ',
'    if :P84_DEUDA_MONEDA != :P84_MONEDA then',
'        if :P84_DEUDA_MONEDA = :APP_ID_MONEDA_PRINCIPAL then',
'            v_retorno := round((to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00'')) / to_number(:P84_T_CAMBIO,''999G999D99''),2);',
'        else',
'            v_retorno := round((to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00'')) * to_number(:P84_T_CAMBIO,''999G999D99''),0);',
'        end if;',
'    else',
'      v_retorno := (to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00''));',
'    end if;',
'    return v_retorno;',
' end;'))
,p_attribute_07=>'P84_DEUDA_MONEDA ,P84_MONEDA,APP_ID_MONEDA_PRINCIPAL,P84_MONTO_FACTURAS,P84_MONTO_PAGOS,P84_T_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208603964042639503)
,p_event_id=>wwv_flow_imp.id(208603652829639500)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208604047085639504)
,p_name=>'TD'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIPO_FORMA_PAGO'
,p_condition_element=>'P84_TIPO_FORMA_PAGO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'TD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208604238390639505)
,p_event_id=>wwv_flow_imp.id(208604047085639504)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_FECHA_EMISION,P84_FECHA_COBRO,P84_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208604286030639506)
,p_event_id=>wwv_flow_imp.id(208604047085639504)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_IMPORTE'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_retorno number(18,2);',
'begin ',
'    if :P84_DEUDA_MONEDA != :P84_MONEDA then',
'        if :P84_DEUDA_MONEDA = :APP_ID_MONEDA_PRINCIPAL then',
'            v_retorno := round((to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00'')) / to_number(:P84_T_CAMBIO,''999G999D99''),2);',
'        else',
'            v_retorno := round((to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00'')) * to_number(:P84_T_CAMBIO,''999G999D99''),0);',
'        end if;',
'    else',
'      v_retorno := (to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00''));',
'    end if;',
'    return v_retorno;',
' end;'))
,p_attribute_07=>'P84_DEUDA_MONEDA ,P84_MONEDA,APP_ID_MONEDA_PRINCIPAL,P84_MONTO_FACTURAS,P84_MONTO_PAGOS,P84_T_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208604360344639507)
,p_event_id=>wwv_flow_imp.id(208604047085639504)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208604528828639508)
,p_name=>'CH'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIPO_FORMA_PAGO'
,p_condition_element=>'P84_TIPO_FORMA_PAGO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'CH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208604607379639509)
,p_event_id=>wwv_flow_imp.id(208604528828639508)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_EMISOR_TARJ,,P84_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208604673252639510)
,p_event_id=>wwv_flow_imp.id(208604528828639508)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_IMPORTE'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_retorno number(18,2);',
'begin ',
'    if :P84_DEUDA_MONEDA != :P84_MONEDA then',
'        if :P84_DEUDA_MONEDA = :APP_ID_MONEDA_PRINCIPAL then',
'            v_retorno := round((to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00'')) / to_number(:P84_T_CAMBIO,''999G999D99''),2);',
'        else',
'            v_retorno := round((to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00'')) * to_number(:P84_T_CAMBIO,''999G999D99''),0);',
'        end if;',
'    else',
'      v_retorno := (to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00''));',
'    end if;',
'    return v_retorno;',
' end;'))
,p_attribute_07=>'P84_DEUDA_MONEDA ,P84_MONEDA,APP_ID_MONEDA_PRINCIPAL,P84_MONTO_FACTURAS,P84_MONTO_PAGOS,P84_T_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209003125523635583)
,p_event_id=>wwv_flow_imp.id(208604528828639508)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_FECHA_EMISION,P84_FECHA_COBRO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'trunc(current_date,''DD'')'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208604833677639511)
,p_event_id=>wwv_flow_imp.id(208604528828639508)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208604894231639512)
,p_name=>'DE'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIPO_FORMA_PAGO'
,p_condition_element=>'P84_TIPO_FORMA_PAGO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'DE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208604975757639513)
,p_event_id=>wwv_flow_imp.id(208604894231639512)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_EMISOR_TARJ,P84_FECHA_EMISION,P84_FECHA_COBRO,P84_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208605101242639514)
,p_event_id=>wwv_flow_imp.id(208604894231639512)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_IMPORTE'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_retorno number(18,2);',
'begin ',
'    if :P84_DEUDA_MONEDA != :P84_MONEDA then',
'        if :P84_DEUDA_MONEDA = :APP_ID_MONEDA_PRINCIPAL then',
'            v_retorno := round((to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00'')) / to_number(:P84_T_CAMBIO,''999G999D99''),2);',
'        else',
'            v_retorno := round((to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00'')) * to_number(:P84_T_CAMBIO,''999G999D99''),0);',
'        end if;',
'    else',
'      v_retorno := (to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00''));',
'    end if;',
'    return v_retorno;',
' end;'))
,p_attribute_07=>'P84_DEUDA_MONEDA ,P84_MONEDA,APP_ID_MONEDA_PRINCIPAL,P84_MONTO_FACTURAS,P84_MONTO_PAGOS,P84_T_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208605232100639515)
,p_event_id=>wwv_flow_imp.id(208604894231639512)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208605289099639516)
,p_name=>'RT'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIPO_FORMA_PAGO'
,p_condition_element=>'P84_TIPO_FORMA_PAGO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'RT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208605359168639517)
,p_event_id=>wwv_flow_imp.id(208605289099639516)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO,P84_EMISOR_TARJ,P84_FECHA_COBRO,P84_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208605522894639518)
,p_event_id=>wwv_flow_imp.id(208605289099639516)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_IMPORTE'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_retorno number(18,2);',
'begin ',
'    if :P84_DEUDA_MONEDA != :P84_MONEDA then',
'        if :P84_DEUDA_MONEDA = :APP_ID_MONEDA_PRINCIPAL then',
'            v_retorno := round((to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00'')) / to_number(:P84_T_CAMBIO,''999G999D99''),2);',
'        else',
'            v_retorno := round((to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00'')) * to_number(:P84_T_CAMBIO,''999G999D99''),0);',
'        end if;',
'    else',
'      v_retorno := (to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00''));',
'    end if;',
'    return v_retorno;',
' end;'))
,p_attribute_07=>'P84_DEUDA_MONEDA ,P84_MONEDA,APP_ID_MONEDA_PRINCIPAL,P84_MONTO_FACTURAS,P84_MONTO_PAGOS,P84_T_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208605613090639519)
,p_event_id=>wwv_flow_imp.id(208605289099639516)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_NUMERO_COMPOBANTE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208606073236639524)
,p_name=>'VerDiferencia'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_MONTO_FACTURAS,P84_MONTO_PAGOS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P84_ID_COBRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208606235824639525)
,p_event_id=>wwv_flow_imp.id(208606073236639524)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_DIFERENCIA'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'to_number(:P84_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P84_MONTO_PAGOS,0),''999G999G999D00'')'
,p_attribute_07=>'P84_MONTO_FACTURAS,P84_MONTO_PAGOS'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'ITEM_IS_NULL'
,p_server_condition_expr1=>'P84_ID_COBRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208950325879633780)
,p_event_id=>wwv_flow_imp.id(208606073236639524)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(208425036402527511)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P84_MONTO_FACTURAS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208606440548639527)
,p_name=>'Habilitar buscar'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_END_ID_ENTIDAD'
,p_condition_element=>'P84_END_ID_ENTIDAD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208606452592639528)
,p_event_id=>wwv_flow_imp.id(208606440548639527)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(208425209691527513)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208952175236633799)
,p_name=>'Agregar pago'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(208602797785639491)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208164273483221589)
,p_event_id=>wwv_flow_imp.id(208952175236633799)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Verificar forma de pago y valor'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P84_TIPO_FORMA_PAGO in (''EF'',''RT'') then',
'  if :P84_VALOR_AL_COBRO > to_number(:P84_DIFERENCIA,''999G999G999D99'') then ',
'    raise_application_error(-20000,''Valor a cobrar no puede ser superior al saldo en esta forma de pago.'');',
'  end if;',
'end if;'))
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209360122098890192)
,p_event_id=>wwv_flow_imp.id(208952175236633799)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P84_DEUDA_MONEDA != :P84_MONEDA then',
'    if :P84_DEUDA_MONEDA = :APP_ID_MONEDA_PRINCIPAL then',
'        :P84_VALOR_AL_COBRO := round(to_number(:P84_IMPORTE,''999G999G999D99'') * to_number(:P84_T_CAMBIO,''999G999D99''),0);',
'        if :P84_VALOR_AL_COBRO > to_number(:P84_DIFERENCIA,''999G999G999D99'') then',
'          :P84_VALOR_AL_COBRO := to_number(:P84_DIFERENCIA,''999G999G999D99'');',
'          :P84_SALDO          := to_number(:P84_IMPORTE,''999G999G999D99'') - (to_number(:P84_DIFERENCIA,''999G999G999D99'') / to_number(:P84_T_CAMBIO,''999G999D99''));',
'        end if;',
'    else',
'        :P84_VALOR_AL_COBRO := round(to_number(:P84_IMPORTE,''999G999G999D99'') / to_number(:P84_T_CAMBIO,''999G999D99''),2);',
'        if :P84_VALOR_AL_COBRO > to_number(:P84_DIFERENCIA,''999G999G999D99'') then',
'          :P84_VALOR_AL_COBRO := to_number(:P84_DIFERENCIA,''999G999G999D99'');',
'          :P84_SALDO          := to_number(:P84_IMPORTE,''999G999G999D99'') - (to_number(:P84_DIFERENCIA,''999G999G999D99'') * to_number(:P84_T_CAMBIO,''999G999D99''));',
'        end if;',
'    end if;',
'',
'else',
'    :P84_VALOR_AL_COBRO := to_number(:P84_IMPORTE,''999G999G999D99'');',
'    if :P84_VALOR_AL_COBRO > to_number(:P84_DIFERENCIA,''999G999G999D99'') then',
'      :P84_VALOR_AL_COBRO := to_number(:P84_DIFERENCIA,''999G999G999D99'');',
'      :P84_SALDO          := to_number(:P84_IMPORTE,''999G999G999D99'') - to_number(:P84_DIFERENCIA,''999G999G999D99'');',
'    end if;',
'end if;',
''))
,p_attribute_02=>'P84_MONEDA,P84_DEUDA_MONEDA,P84_T_CAMBIO,P84_IMPORTE,P84_DIFERENCIA'
,p_attribute_03=>'P84_VALOR_AL_COBRO,P84_SALDO'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208952315390633800)
,p_event_id=>wwv_flow_imp.id(208952175236633799)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P84_MONEDA is null then ',
'        raise_application_error(-20000,''Favor seleccione moneda del pago.'');',
'    end if;',
'    if :P84_BANCO is null and :P84_TIPO_FORMA_PAGO in (''CH'') then ',
'        raise_application_error(-20000,''Seleccione BANCO emisor.'');',
'    end if;',
'    if :P84_EMISOR_TARJ is null and :P84_TIPO_FORMA_PAGO in (''TC'',''TD'') then',
'        raise_application_error(-20000,''Seleccione EMISOR de la tarjeta.'');',
'    end if;',
'    if :P84_NUMERO_COMPOBANTE is null and :P84_TIPO_FORMA_PAGO in (''TC'',''TD'',''CH'',''DE'',''RT'') then ',
unistr('        raise_application_error(-20000,''Ingrese n\00FAmero de comprobante.'');'),
'    end if;',
'    if :P84_FECHA_EMISION is null and :P84_TIPO_FORMA_PAGO in (''CH'',''RT'') then ',
unistr('        raise_application_error(-20000,''Fecha de emisi\00F3n del comprobante es requerido.'');'),
'    end if;',
'    if :P84_FECHA_COBRO is null and :P84_TIPO_FORMA_PAGO in (''CH'') then',
'        raise_application_error(-20000,''Ingrese fecha del cobro EFECTIVO del comprobante ingresado.'');',
'    end if;',
'    if nvl(to_number(:P84_IMPORTE,''999G999G999D99''),0) = 0 then',
'        raise_application_error(-20000,''Ingrese valor del cobro que se ingresa.'');',
'    end if;',
'    APEX_COLLECTION.ADD_MEMBER (',
'        p_collection_name => ''COLL_DETALLE_PAGOS''',
'       ,p_c001 => NULL',
'       ,p_c002 => NULL',
'       ,p_c003 => NULL',
'       ,p_c004 => to_char(:P84_FORMA_PAGO)',
'       ,p_c005 => to_char(:P84_MONEDA)',
'       ,p_c006 => to_char(:P84_BANCO)',
'       ,p_c007 => to_char(:P84_EMISOR_TARJ)',
'       ,p_c008 => to_char(:P84_NUMERO_COMPOBANTE)',
'       ,p_c009 => :P84_FECHA_EMISION',
'       ,p_c010 => :P84_FECHA_COBRO',
'       ,p_c011 => to_number(:P84_IMPORTE,''999G999G999D99'')',
'       ,p_c012 => nvl(to_number(:P84_SALDO,''999G999G999D99''),0)',
'       ,p_c013 => ''ACTIVO''',
'       ,p_c014 => :P84_TIPO_FORMA_PAGO',
'       ,p_c015 => to_number(:P84_IMPORTE,''999G999G999D99'')',
'       ,p_c016 => to_number(:P84_VALOR_AL_COBRO,''999G999G999D99'')',
'            );',
'    :P84_FORMA_PAGO         := NULL;',
'    :P84_BANCO              := NULL;',
'    :P84_EMISOR_TARJ        := NULL;',
'    :P84_NUMERO_COMPOBANTE  := NULL;',
'    :P84_FECHA_EMISION      := NULL;',
'    :P84_FECHA_COBRO        := NULL;',
'    :P84_IMPORTE            := NULL;',
'    :P84_SALDO              := NULL;',
'    :P84_TIPO_FORMA_PAGO    := NULL;',
'    :P84_VALOR_AL_COBRO     := NULL;',
'',
'end;'))
,p_attribute_02=>'P84_FORMA_PAGO,P84_MONEDA,P84_BANCO,P84_EMISOR_TARJ,P84_NUMERO_COMPOBANTE,P84_FECHA_EMISION,P84_FECHA_COBRO,P84_IMPORTE,P84_SALDO,P84_TIPO_FORMA_PAGO,P84_VALOR_AL_COBRO'
,p_attribute_03=>'P84_FORMA_PAGO,P84_BANCO,P84_EMISOR_TARJ,P84_NUMERO_COMPOBANTE,P84_FECHA_EMISION,P84_FECHA_COBRO,P84_IMPORTE,P84_SALDO,P84_TIPO_FORMA_PAGO,P84_VALOR_AL_COBRO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209267907160928185)
,p_event_id=>wwv_flow_imp.id(208952175236633799)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P84_MONEDA").prop( ''readOnly'', true);',
'setTimeout(function(){',
'    apex.region("REG_PAGOS").refresh();',
'}, 700);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208952349593633801)
,p_event_id=>wwv_flow_imp.id(208952175236633799)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(208950670494633784)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209002730247635579)
,p_name=>unistr('Bot\00F3n limpiar eliminados')
,p_event_sequence=>220
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P84_ID_COBRO'
,p_security_scheme=>wwv_flow_imp.id(209157125628184056)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209002838172635580)
,p_event_id=>wwv_flow_imp.id(209002730247635579)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.FOS.INTERACTIVE_GRID_ADD_BUTTON'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(208950670494633784)
,p_attribute_01=>'toolbar-actions4'
,p_attribute_02=>'first'
,p_attribute_05=>'Limpiar registros eliminados'
,p_attribute_07=>'save'
,p_attribute_09=>'do-nothing'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209002854083635581)
,p_name=>'Verificar facturas'
,p_event_sequence=>230
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(208425036402527511)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusin'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209002998351635582)
,p_event_id=>wwv_flow_imp.id(209002854083635581)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_cantidad number;',
'begin',
'    SELECT count(distinct a.c005) mon_id_moneda',
'    INTO v_cantidad',
'    FROM apex_collections a',
'    WHERE a.collection_name = ''COLL_DETALLE_PENDIENTES''',
'    AND a.c012 = ''SI'';',
'    if v_cantidad > 1 then',
unistr('        raise_application_error(-20000,''Seleccion\00F3 cuotas/facturas con distintas monedas, favor solo selecione deudas con la misma moneda por cobranza.'');'),
'    end if;',
'',
'    SELECT count(distinct a.c002) tip_id_tipo_comprobante',
'    INTO v_cantidad',
'    FROM apex_collections a',
'    WHERE a.collection_name = ''COLL_DETALLE_PENDIENTES''',
'    AND a.c012 = ''SI'';',
'    if v_cantidad > 1 then',
unistr('        raise_application_error(-20000,''Seleccion\00F3 facturas de tipo CONTADO y CREDITO, favor solo selecione el mismo tipo por cobranza.'');'),
'    end if;',
'',
'    if to_number(:P84_MONTO_FACTURAS,''999G999G999D99'') = 0 then',
'        raise_application_error(-20000,''Seleccione cuotas/facturas para realizar el cobro.'');',
'    end if;',
'end;'))
,p_attribute_02=>'P84_MONTO_FACTURAS'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209003641414635588)
,p_name=>'Habilitar'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_HABILITAR_GUARDAR'
,p_condition_element=>'P84_HABILITAR_GUARDAR'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SI'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209003687188635589)
,p_event_id=>wwv_flow_imp.id(209003641414635588)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(208412555248525694)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209003878162635591)
,p_event_id=>wwv_flow_imp.id(209003641414635588)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(208412555248525694)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208163925596221585)
,p_event_id=>wwv_flow_imp.id(209003641414635588)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#REG_AGREGAR.a-Collapsible.is-expanded'').removeClass(''is-expanded'').addClass(''is-collapsed'');',
'$(''#REG_AGREGAR.a-Collapsible .a-Collapsible-content'').show();'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209101879917642684)
,p_event_id=>wwv_flow_imp.id(209003641414635588)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#REG_AGREGAR.a-Collapsible.is-collapsed'').removeClass(''is-collapsed'').addClass(''is-expanded'');',
'$(''#REG_AGREGAR.a-Collapsible .a-Collapsible-content'').show();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209004127352635593)
,p_name=>'Verifica para habilitar GUARDAR'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_DIFERENCIA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209004202555635594)
,p_event_id=>wwv_flow_imp.id(209004127352635593)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if to_number(:P84_MONTO_FACTURAS,''999G999G999D99'') > 0 and to_number(:P84_DIFERENCIA,''999G999G999D99'') = 0 then',
'        :P84_HABILITAR_GUARDAR := ''SI'';',
'    else',
'        :P84_HABILITAR_GUARDAR := ''NO'';',
'    end if;',
'end;',
''))
,p_attribute_02=>'P84_MONTO_FACTURAS,P84_DIFERENCIA'
,p_attribute_03=>'P84_HABILITAR_GUARDAR'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209068739438318182)
,p_name=>'Activar buscar change'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_ENT_ID_ENTIDAD'
,p_condition_element=>'P84_ENT_ID_ENTIDAD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209068747759318183)
,p_event_id=>wwv_flow_imp.id(209068739438318182)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(208425209691527513)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(206275410842483510)
,p_name=>'Activar buscar lose'
,p_event_sequence=>270
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_ENT_ID_ENTIDAD'
,p_condition_element=>'P84_ENT_ID_ENTIDAD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206275516947483511)
,p_event_id=>wwv_flow_imp.id(206275410842483510)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(208425209691527513)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209267493216928181)
,p_name=>'Buscar TCambio_lose'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_MONEDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209267614426928182)
,p_event_id=>wwv_flow_imp.id(209267493216928181)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buscaCambio();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209268836236928194)
,p_event_id=>wwv_flow_imp.id(209267493216928181)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Hide P84_VALOR_AL_COBRO'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_VALOR_AL_COBRO'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item("P84_DEUDA_MONEDA").getValue() == apex.item("P84_MONEDA").getValue()'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209268043465928186)
,p_event_id=>wwv_flow_imp.id(209267493216928181)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_FORMA_PAGO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(164973968304024550)
,p_name=>'Buscar TCambio_change'
,p_event_sequence=>290
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_MONEDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(164974063965024551)
,p_event_id=>wwv_flow_imp.id(164973968304024550)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buscaCambio();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(164974166391024552)
,p_event_id=>wwv_flow_imp.id(164973968304024550)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Hide P84_VALOR_AL_COBRO'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_VALOR_AL_COBRO'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item("P84_DEUDA_MONEDA").getValue() == apex.item("P84_MONEDA").getValue()'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(164974289008024553)
,p_event_id=>wwv_flow_imp.id(164973968304024550)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_FORMA_PAGO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209359534372890186)
,p_name=>'Ver'
,p_event_sequence=>300
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_MONEDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209359609751890187)
,p_event_id=>wwv_flow_imp.id(209359534372890186)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Show P84_VALOR_AL_COBRO'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_VALOR_AL_COBRO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209268628091928192)
,p_name=>'Obtener valor cobro_lose'
,p_event_sequence=>310
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_IMPORTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209268704706928193)
,p_event_id=>wwv_flow_imp.id(209268628091928192)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if to_number(nvl(:P84_SALDO,0),''999G999G999D99'') > 0 then',
'    if to_number(:P84_SALDO,''999G999G999D99'') < to_number(:P84_IMPORTE,''999G999G999D99'') then',
'        raise_application_error(-20000,''El valor a cobrar no puede ser superior al saldo del doc. de cobro.'');',
'    end if;',
'end if;',
'if :P84_DEUDA_MONEDA != :P84_MONEDA then',
'    if :P84_DEUDA_MONEDA = :APP_ID_MONEDA_PRINCIPAL then',
'        :P84_VALOR_AL_COBRO := round(to_number(:P84_IMPORTE,''999G999G999D99'') * to_number(:P84_T_CAMBIO,''999G999D99''),0);',
'    else',
'        :P84_VALOR_AL_COBRO := round(to_number(:P84_IMPORTE,''999G999G999D99'') / to_number(:P84_T_CAMBIO,''999G999D99''),2);',
'    end if;',
'else',
'  :P84_VALOR_AL_COBRO := to_number(:P84_IMPORTE,''999G999G999D99'');',
'end if;'))
,p_attribute_02=>'P84_MONEDA,P84_DEUDA_MONEDA,P84_T_CAMBIO,P84_IMPORTE'
,p_attribute_03=>'P84_VALOR_AL_COBRO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209359652642890188)
,p_name=>'Obtener valor cobro_change'
,p_event_sequence=>320
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_IMPORTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209359755325890189)
,p_event_id=>wwv_flow_imp.id(209359652642890188)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if to_number(nvl(:P84_SALDO,0),''999G999G999D99'') > 0 then',
'    if to_number(:P84_SALDO,''999G999G999D99'') < to_number(:P84_IMPORTE,''999G999G999D99'') then',
'        raise_application_error(-20000,''El valor a cobrar no puede ser superior al saldo del doc. de cobro.'');',
'    end if;',
'end if;',
'if :P84_DEUDA_MONEDA != :P84_MONEDA then',
'    if :P84_DEUDA_MONEDA = :APP_ID_MONEDA_PRINCIPAL then',
'        :P84_VALOR_AL_COBRO := round(to_number(:P84_IMPORTE,''999G999G999D99'') * to_number(:P84_T_CAMBIO,''999G999D99''),0);',
'    else',
'        :P84_VALOR_AL_COBRO := round(to_number(:P84_IMPORTE,''999G999G999D99'') / to_number(:P84_T_CAMBIO,''999G999D99''),2);',
'    end if;',
'else',
'  :P84_VALOR_AL_COBRO := to_number(:P84_IMPORTE,''999G999G999D99'');',
'end if;'))
,p_attribute_02=>'P84_MONEDA,P84_DEUDA_MONEDA,P84_T_CAMBIO,P84_IMPORTE'
,p_attribute_03=>'P84_VALOR_AL_COBRO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209269377607928200)
,p_name=>'Set moneda formas pago'
,p_event_sequence=>330
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_DESCRI_MONEDA_DEUDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209269460949928201)
,p_event_id=>wwv_flow_imp.id(209269377607928200)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.item("P84_MONEDA").setValue( apex.item("P84_DEUDA_MONEDA").getValue(),apex.item("P84_DESCRI_MONEDA_DEUDA").getValue() );'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209269602570928202)
,p_event_id=>wwv_flow_imp.id(209269377607928200)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(208163735533221583)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209342271033868279)
,p_name=>'Obtener moneda deuda'
,p_event_sequence=>340
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(208424816074527509)
,p_condition_element_type=>'ITEM'
,p_condition_element=>'P84_ENT_ID_ENTIDAD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209342389805868280)
,p_event_id=>wwv_flow_imp.id(209342271033868279)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_cantidad number;',
'begin',
'    :P84_DESCRI_MONEDA_DEUDA := NULL;',
'    SELECT count(distinct a.c005) mon_id_moneda',
'    INTO v_cantidad',
'    FROM apex_collections a',
'    WHERE a.collection_name = ''COLL_DETALLE_PENDIENTES''',
'    AND a.c012 = ''SI'';',
'    if v_cantidad > 1 then',
unistr('        raise_application_error(-20000,''Seleccion\00F3 cuotas/facturas con distintas monedas, favor solo selecione deudas con la misma moneda por cobranza.'');'),
'    elsif v_cantidad = 1 then',
'        SELECT a.c005 mon_id_moneda',
'        INTO :P84_DEUDA_MONEDA',
'        FROM apex_collections a',
'        WHERE a.collection_name = ''COLL_DETALLE_PENDIENTES''',
'        AND a.c012 = ''SI''',
'        FETCH FIRST 1 ROW ONLY;',
'    else',
'        :P84_DEUDA_MONEDA := NULL;',
'    end if;',
'    if :P84_MONEDA is null then ',
'        select m.descripcion',
'        into :P84_DESCRI_MONEDA_DEUDA',
'        from moneda m',
'        where m.id_moneda = :P84_DEUDA_MONEDA;',
'    end if ;',
'exception',
'    when no_data_found then ',
'        null;    ',
'end;'))
,p_attribute_02=>'P84_MONEDA'
,p_attribute_03=>'P84_DEUDA_MONEDA,P84_DESCRI_MONEDA_DEUDA'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209360342200890194)
,p_name=>'Buscar doc con saldo'
,p_event_sequence=>350
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_NUMERO_COMPOBANTE'
,p_condition_element=>'P84_NUMERO_COMPOBANTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P84_ID_COBRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209360356362890195)
,p_event_id=>wwv_flow_imp.id(209360342200890194)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_importe number;',
'begin ',
'    if :P84_TIPO_FORMA_PAGO in (''TC'',''TD'',''CH'',''DE'') then ',
'        v_importe := to_number(:P84_IMPORTE,''999G999G999D99'');',
'        p_buscar_documento_cobro (',
'           P_TIPO_TRANSACCION        => ''COBRO''',
'          ,P_NRO_COMPROBANTE         => :P84_NUMERO_COMPOBANTE',
'          ,P_FOR_ID_FORMA_PAGO       => :P84_FORMA_PAGO',
'          ,P_MON_ID_MONEDA           => :P84_MONEDA',
'          ,P_BAN_ID_BANCO            => :P84_BANCO',
'          ,P_EMI_ID_EMISOR_TARJETA   => :P84_EMISOR_TARJ',
'          ,P_FECHA_EMISION           => :P84_FECHA_EMISION',
'          ,P_FECHA_COBRO             => :P84_FECHA_COBRO',
'          ,P_IMPORTE                 => v_importe',
'          ,P_SALDO                   => :P84_SALDO',
'        );',
'        if v_importe is not null then',
'          :P84_IMPORTE := v_importe;',
'        end if;',
'    end if;',
'end;  '))
,p_attribute_02=>'P84_NUMERO_COMPOBANTE,P84_FORMA_PAGO,P84_MONEDA,P84_BANCO,P84_EMISOR_TARJ,P84_TIPO_FORMA_PAGO'
,p_attribute_03=>'P84_FECHA_EMISION,P84_FECHA_COBRO,P84_IMPORTE,P84_SALDO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(203427858892386128)
,p_name=>'ObtenerDefecto'
,p_event_sequence=>360
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIPO_FACS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(205684137129945779)
,p_event_id=>wwv_flow_imp.id(203427858892386128)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerDefecto()'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(153032874818325680)
,p_name=>'Retorna'
,p_event_sequence=>370
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(153032822569325679)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(153033003789325681)
,p_event_id=>wwv_flow_imp.id(153032874818325680)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(153032614434325677)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(153033137803325683)
,p_name=>'Aplicar numero'
,p_event_sequence=>380
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(153033054713325682)
,p_condition_element=>'P84_P_NUMERO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(153033236489325684)
,p_event_id=>wwv_flow_imp.id(153033137803325683)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('\00BFEsta seguro en aplicar el cambio?')
,p_attribute_02=>'Aplicar'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(153033390825325685)
,p_event_id=>wwv_flow_imp.id(153033137803325683)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CAMBIAR'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(153033484691325686)
,p_name=>'Abrir numerar'
,p_event_sequence=>390
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(153032446679325676)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(164972961067024540)
,p_event_id=>wwv_flow_imp.id(153033484691325686)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_P_NUMERO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'TO_NUMBER(:P84_NRO_COMPROBANTE,''999G999G9999999'')'
,p_attribute_07=>'P84_NRO_COMPROBANTE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(153033623939325687)
,p_event_id=>wwv_flow_imp.id(153033484691325686)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(153032614434325677)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(164973340181024544)
,p_name=>'Editar transacc'
,p_event_sequence=>400
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(164973191490024542)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(164973500759024545)
,p_event_id=>wwv_flow_imp.id(164973340181024544)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_P_EDITAR_TRANSACC'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'SI'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(164973620431024546)
,p_event_id=>wwv_flow_imp.id(164973340181024544)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'EDITAR_TRANSACC'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(208952727778633804)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(208950670494633784)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Pagos - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    case :APEX$ROW_STATUS',
'    when ''C'' then',
'        null;',
'    when ''U'' then',
'        null;',
'    when ''D'' then',
'        APEX_COLLECTION.DELETE_MEMBER (',
'        p_collection_name => ''COLL_DETALLE_PAGOS'',',
'        p_seq             => :seq_id);',
'    end case;',
'end;'))
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ANULAR'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_exec_cond_for_each_row=>'Y'
,p_internal_uid=>15986183142970926
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(209068426305318179)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar cobro'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    p_guarda_cobro_venta (',
'        P_ID_COBRO                => :P84_ID_COBRO',
'       ,P_NRO_COMPROBANTE         => :P84_NRO_COMPROBANTE',
'       ,P_SUC_ID_SUCURSAL         => :P84_SUC_ID_SUCURSAL',
'       ,P_TIP_ID_TIPO_COMPROBANTE => :P84_TIP_ID_TIPO_COMPROBANTE',
'       ,P_TIM_ID_TIMBRADO         => :P84_TIM_ID_TIMBRADO',
'       ,P_FECHA                   => to_date(to_char(CURRENT_DATE,''dd/mm/yyyy hh24:mi:ss''),''dd/mm/yyyy hh24:mi:ss'')',
'       ,P_ENT_ID_ENTIDAD          => :P84_ID_ENTIDAD_GUARDAR',
'       ,P_MON_ID_MONEDA           => :P84_MONEDA',
'       ,P_TIPO_CAMBIO             => :P84_T_CAMBIO',
'       ,P_ESTADO                  => ''ACTIVO''',
'       ,P_REN_ID_RENDICION_CAJA   => :P84_REN_ID_RENDICION_CAJA',
'               );',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Cobro generado correctamente. Doc. Nro. &P84_NRO_COMPROBANTE.'
,p_internal_uid=>16101881669655301
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(209102850874642694)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Anular'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    p_anular_cobro_venta (P_ID_COBRO => :P84_ID_COBRO);',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ANULAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>unistr('Anulaci\00F3n realizada correctamente.')
,p_internal_uid=>16136306238979816
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(164973072962024541)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cambiar numero'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P84_P_NUMERO IS NULL THEN',
unistr('        RAISE_APPLICATION_ERROR(-20000,''N\00FAmero de recibo no se ingreso, favor verificar.'');'),
'    END IF;',
'    UPDATE cab_cobro',
'    SET nro_comprobante = :P84_P_NUMERO',
'    WHERE id_cobro = :P84_ID_COBRO;',
'END;    '))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CAMBIAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>45739547390368403
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(208413027529525695)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(208402361407525679)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear cobro a factura'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>15446482893862817
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(208422808935527489)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valores iniciales'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_compra moneda.tc_compra%type;',
'v_venta  moneda.tc_venta%type;',
'begin ',
'    if :P84_P_EDITAR_TRANSACC is null then',
'        :P84_P_EDITAR_TRANSACC := ''NO'';',
'    end if;',
'    apex_collection.create_or_truncate_collection(p_collection_name=>''COLL_DETALLE_PENDIENTES'');',
'    apex_collection.create_or_truncate_collection(p_collection_name=>''COLL_DETALLE_PAGOS'');',
'    if :P84_ID_COBRO is null then ',
'        begin',
'            SELECT e.suc_id_sucursal ',
'            INTO :P84_SUC_ID_SUCURSAL',
'            FROM entidad e',
'            WHERE e.id_entidad = f_id_entidad(v(''APP_USER''))',
'            AND e.estado = ''ACTIVO''',
'            ;',
'            :P84_DISPLAY_SUCURSAL := :P84_SUC_ID_SUCURSAL;',
'        exception',
'            when no_data_found then ',
'                raise_application_error(-20000,''NO SE IDENTIFICA SUCURSAL DEL USUARIO, FAVOR SOLICITAR VERIFICACION...'');    ',
'        end;',
'        begin ',
'            SELECT r.id_rendicion_caja',
'            INTO :P84_REN_ID_RENDICION_CAJA',
'            FROM rendicion_caja r',
'            WHERE r.ent_id_entidad = f_id_entidad(v(''APP_USER''))',
'            AND r.fecha_hasta >= CURRENT_DATE ',
'            AND r.estado = ''ABIERTO'' ',
'            ;',
'        exception ',
'            when no_data_found then ',
'                :P84_REN_ID_RENDICION_CAJA := null;    ',
'        end; ',
'    end if;',
'    :P84_FECHA := to_char(current_date,''DD/MM/YYYY HH24:MI'');',
'    :P84_DISPLAY_SUCURSAL := :P84_SUC_ID_SUCURSAL;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>15456264299864611
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(209102564367642691)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valores de registro existente'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_select     varchar2(32700);',
'v_select_fc  varchar2(32700);',
'begin ',
'    SELECT nvl(Sum(c.importe),0)',
'    INTO :P84_MONTO_DE_COBRANZA',
'    FROM det_cobro c',
'    WHERE c.cob_id_cobro = :P84_ID_COBRO;',
'    ',
'    :P84_DEUDA_MONEDA := :P84_ID_MONEDA;',
'    :P84_MONEDA := :P84_ID_MONEDA;',
'    ',
'  v_select := q''[',
'SELECT c.fecha_factura',
'      ,c.tip_id_tipo_comprobante',
'      ,c.condicion_venta',
'      ,c.nro_factura',
'      ,c.mon_id_moneda',
'      ,dc.id_detalle_cuenta',
'      ,dc.item',
'      ,dc.fecha_vencimiento',
'      ,dc.importe',
'      ,NULL saldo',
'      ,d.importe pagar',
'      ,''SI'' seleccion',
'FROM det_cobro d',
'    ,det_cuenta_venta dc',
'    ,cab_factura_venta c',
'WHERE d.cob_id_cobro = ]''||:P84_ID_COBRO||q''[',
'AND dc.id_detalle_cuenta = d.det_id_detalle_cuenta',
'AND c.id_factura_venta = dc.fac_id_factura_venta ',
'ORDER BY dc.fecha_vencimiento]''',
' ;',
'    P_CARGA_COLECCION (',
'      P_SELECT     => v_select',
'     ,P_COLLECTION => ''COLL_DETALLE_PENDIENTES''',
'     );',
'',
'  v_select_fc := q''[',
'SELECT ',
' t.id_transaccion        ',
',t.tipo_transaccion      ',
',t.fecha_transaccion     ',
',t.for_id_forma_pago     ',
',t.mon_id_moneda         ',
',t.ban_id_banco          ',
',t.emi_id_emisor_tarjeta ',
',t.nro_comprobante       ',
',t.fecha_emision         ',
',t.fecha_cobro           ',
',t.importe               ',
',NULL saldo                 ',
',t.estado                ',
',NULL tipo_forma_pago       ',
',NULL sumar_forma_pago',
',df.valor_moneda_factura      ',
'FROM det_formas_cobro df',
'    ,transaccion t',
'WHERE df.cob_id_cobro = ]''||:P84_ID_COBRO||q''[',
'AND t.id_transaccion = df.tran_id_transaccion',
'AND t.estado = ''ACTIVO'']''',
';',
'    P_CARGA_COLECCION (',
'      P_SELECT     => v_select_fc',
'     ,P_COLLECTION => ''COLL_DETALLE_PAGOS''',
'     );',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P84_ID_COBRO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>16136019731979813
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(205684147046945780)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'obtener_valor_defecto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'  AS',
'  BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'  END output_json_item;',
'BEGIN',
'    BEGIN',
'        select r.id_tipo_comprobante r, r.descripcion',
'        into :P84_TIP_ID_TIPO_COMPROBANTE, :P84_P_DESCRI_TIPO_COMPROBANTE',
'        from TIPO_COMPROBANTE r',
'        where estado = ''ACTIVO'' ',
'        and cobro = ''SI''',
'        and :P84_TIPO_FACS is not null',
'        and descripcion like (case ',
'                                when :P84_TIPO_FACS = ''CO'' then',
'                                    ''%CONTADO%''',
'                                else',
'                                    descripcion',
'                                end)',
'        and descripcion not like (case ',
'                            when :P84_TIPO_FACS != ''CO'' then',
'                                ''%CONTADO%''',
'                            else',
'                                ''XX''',
'                            end)',
'        FETCH FIRST 1 ROW ONLY',
'        ;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            :P84_TIP_ID_TIPO_COMPROBANTE := NULL;',
'            :P84_P_DESCRI_TIPO_COMPROBANTE := NULL;',
'    END;',
'    BEGIN',
'        SELECT t.id_timbrado r, LPad(t.establecimiento,3,''0'')||''-''||LPad(t.punto_expedicion,3,''0'')||'' ''||tc.descripcion ',
'        INTO :P84_P_TMP_ID_TIMBRADO, :P84_P_DESCRI_TIMBRADO',
'        FROM usuarios u, entidad e, usuario_punto_expedicion up, timbrado t, tipo_comprobante tc',
'        WHERE u.usuario       = Nvl(v(''APP_USER''),USER)',
'        AND u.estado          = ''ACTIVO''',
'        AND e.usu_id_usuario  = u.id_usuario',
'        AND e.estado          = ''ACTIVO''',
'        AND up.ent_id_entidad = e.id_entidad',
'        AND up.estado         = ''ACTIVO''',
'        AND t.id_timbrado     = up.tim_id_timbrado',
'        AND t.estado          = ''ACTIVO''',
'        AND t.suc_id_sucursal         = :P84_SUC_ID_SUCURSAL',
'        AND t.tip_id_tipo_comprobante = :P84_TIP_ID_TIPO_COMPROBANTE',
'        AND t.nro_final               > t.nro_utilizado ',
'        AND trunc(CURRENT_DATE,''DD'') BETWEEN trunc(t.fecha_inicio,''DD'') AND trunc(t.fecha_vencimiento,''DD'')',
'        AND tc.id_tipo_comprobante   = t.tip_id_tipo_comprobante',
'        FETCH FIRST 1 ROW ONLY;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            :P84_P_TMP_ID_TIMBRADO := NULL;',
'            :P84_P_DESCRI_TIMBRADO := NULL;',
'    END;',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P84_TIP_ID_TIPO_COMPROBANTE'', :P84_TIP_ID_TIPO_COMPROBANTE);',
'    output_json_item(''P84_P_TMP_ID_TIMBRADO'', :P84_P_TMP_ID_TIMBRADO);',
'    output_json_item(''P84_P_DESCRI_TIPO_COMPROBANTE'', :P84_P_DESCRI_TIPO_COMPROBANTE);',
'    output_json_item(''P84_P_DESCRI_TIMBRADO'', :P84_P_DESCRI_TIMBRADO);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>12717602411282902
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(164973821614024548)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'busca_cambio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_compra moneda.tc_compra%type;',
'    v_venta  moneda.tc_venta%type;',
'    PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'    AS',
'    BEGIN',
'        apex_json.open_object;',
'        apex_json.write(''id''    , p_item_name);',
'        apex_json.write(''value'' , p_item_value, TRUE);',
'        apex_json.close_object;',
'    END output_json_item;',
'BEGIN',
'    begin ',
'        p_devuelve_tipo_cambio ( P_FECHA     => to_date(:P84_FECHA,''dd/mm/yyyy hh24:mi'')',
'                                ,P_ID_MONEDA => NVL(:P84_DEUDA_MONEDA,:P84_MONEDA)',
'                                ,P_COMPRA    => v_compra',
'                                ,P_VENTA     => v_venta',
'        );',
'        if :P84_DEUDA_MONEDA != :P84_MONEDA then ',
'            if :APP_ID_MONEDA_PRINCIPAL != :P84_DEUDA_MONEDA then',
'                :P84_T_CAMBIO := v_venta;',
'            else',
'                :P84_T_CAMBIO := v_compra;',
'            end if;',
'        else',
'            :P84_T_CAMBIO := 1;',
'        end if;',
'    end;',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P84_T_CAMBIO'', :P84_T_CAMBIO);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>45740296042368410
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(153032190633325673)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ver_pdf'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  vl_vNomReporte VARCHAR2(255);',
'BEGIN',
'  vl_vNomReporte := ''RECIBO_DINERO'';',
'',
'  pkg_jasperreports_server.descarga_reporte(p_vNomReporte  => vl_vNomReporte',
'                                           ,p_aNomParams   => apex_util.string_to_table(''P_ID_COBRO'')',
'                                           ,p_aValParams   => apex_util.string_to_table(apex_application.g_x01)',
'                                            );',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>33798665061669535
);
wwv_flow_imp.component_end;
end;
/
