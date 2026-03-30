prompt --application/pages/page_00084
begin
--   Manifest
--     PAGE: 00084
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
 p_id=>wwv_flow_imp.id(33799088862669539)
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
 p_id=>wwv_flow_imp.id(86450807776289643)
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
 p_id=>wwv_flow_imp.id(88930095004565444)
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
 p_id=>wwv_flow_imp.id(89168835835869541)
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
 p_id=>wwv_flow_imp.id(89176517306869552)
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
 p_id=>wwv_flow_imp.id(89191163083871370)
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
 p_id=>wwv_flow_imp.id(89191290502871371)
,p_plug_name=>'Facturas'
,p_region_name=>'REG_FACTURAS'
,p_parent_plug_id=>wwv_flow_imp.id(89191163083871370)
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
 p_id=>wwv_flow_imp.id(89290878814936242)
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
 p_id=>wwv_flow_imp.id(89290952467936243)
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
,p_lov_id=>wwv_flow_imp.id(88402205979681264)
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
 p_id=>wwv_flow_imp.id(89291024793936244)
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
 p_id=>wwv_flow_imp.id(89291207390936245)
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
 p_id=>wwv_flow_imp.id(89291228742936246)
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
,p_lov_id=>wwv_flow_imp.id(84541326864380916)
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
 p_id=>wwv_flow_imp.id(89291364766936247)
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
 p_id=>wwv_flow_imp.id(89291481904936248)
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
 p_id=>wwv_flow_imp.id(89291603649936249)
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
 p_id=>wwv_flow_imp.id(89291667911936250)
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
 p_id=>wwv_flow_imp.id(89291757712936251)
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
 p_id=>wwv_flow_imp.id(89291840049936252)
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
 p_id=>wwv_flow_imp.id(89292492574936258)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_imp.id(89293020968936264)
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
 p_id=>wwv_flow_imp.id(89293408463936267)
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
 p_id=>wwv_flow_imp.id(90257822235124641)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(90257995986124642)
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
 p_id=>wwv_flow_imp.id(89290742623936241)
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
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(89296659822938198)
,p_interactive_grid_id=>wwv_flow_imp.id(89290742623936241)
,p_static_id=>'155637'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>100
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(89296854072938199)
,p_report_id=>wwv_flow_imp.id(89296659822938198)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(73737879362074495)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(89293020968936264)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89297341070938214)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(89290878814936242)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89298283351938220)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(89290952467936243)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89299159904938223)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(89291024793936244)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89300081963938225)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(89291207390936245)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89300979907938228)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(89291228742936246)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89301902634938231)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(89291364766936247)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89302721170938233)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(89291481904936248)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89303636424938235)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(89291603649936249)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89304604726938237)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(89291667911936250)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89305498729938240)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(89291757712936251)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89306352306938242)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(89291840049936252)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89323043914145134)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(89292492574936258)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89345644492952839)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(89293408463936267)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(90263842973126352)
,p_view_id=>wwv_flow_imp.id(89296854072938199)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(90257822235124641)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(89191510830871373)
,p_plug_name=>'Formas de pago'
,p_parent_plug_id=>wwv_flow_imp.id(89191163083871370)
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
 p_id=>wwv_flow_imp.id(88930209961565445)
,p_plug_name=>'Agregar pagos'
,p_region_name=>'REG_AGREGAR'
,p_parent_plug_id=>wwv_flow_imp.id(89191510830871373)
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
 p_id=>wwv_flow_imp.id(89717144922977646)
,p_plug_name=>'Pagos'
,p_region_name=>'REG_PAGOS'
,p_parent_plug_id=>wwv_flow_imp.id(89191510830871373)
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
 p_id=>wwv_flow_imp.id(89717401107977648)
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
 p_id=>wwv_flow_imp.id(89717447084977649)
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
 p_id=>wwv_flow_imp.id(89717610692977650)
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
 p_id=>wwv_flow_imp.id(89717662354977651)
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
,p_lov_id=>wwv_flow_imp.id(89376176615689277)
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
 p_id=>wwv_flow_imp.id(89717722627977652)
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
,p_lov_id=>wwv_flow_imp.id(84541326864380916)
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
 p_id=>wwv_flow_imp.id(89717836011977653)
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
,p_lov_id=>wwv_flow_imp.id(89381732485320063)
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
 p_id=>wwv_flow_imp.id(89717941453977654)
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
,p_lov_id=>wwv_flow_imp.id(89382340702328435)
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
 p_id=>wwv_flow_imp.id(89718114900977655)
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
 p_id=>wwv_flow_imp.id(89718160013977656)
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
 p_id=>wwv_flow_imp.id(89718238072977657)
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
 p_id=>wwv_flow_imp.id(89718339143977658)
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
 p_id=>wwv_flow_imp.id(89718454313977659)
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
 p_id=>wwv_flow_imp.id(89718617750977660)
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
 p_id=>wwv_flow_imp.id(89718940264977664)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84_ID_COBRO IS NULL',
'OR (:P84_ESTADO = ''ACTIVO'' AND :P84_P_EDITAR_TRANSACC = ''SI'')'))
,p_display_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(89719081926977665)
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
 p_id=>wwv_flow_imp.id(89719237340977667)
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
 p_id=>wwv_flow_imp.id(89719361937977668)
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
 p_id=>wwv_flow_imp.id(89719431579977669)
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
 p_id=>wwv_flow_imp.id(90126412246234052)
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
 p_id=>wwv_flow_imp.id(89717221502977647)
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
 p_id=>wwv_flow_imp.id(89725351920151568)
,p_interactive_grid_id=>wwv_flow_imp.id(89717221502977647)
,p_static_id=>'159924'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(89725540868151568)
,p_report_id=>wwv_flow_imp.id(89725351920151568)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89726103555151574)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(89717401107977648)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89726946298151580)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(89717447084977649)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89727856520151583)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(89717610692977650)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89728789742151585)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(89717662354977651)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89729587105151588)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(89717722627977652)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89730420047151590)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(89717836011977653)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89731406439151592)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(89717941453977654)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89732299521151596)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(89718114900977655)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89733206472151598)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(89718160013977656)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89734089667151600)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(89718238072977657)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89734936869151602)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(89718339143977658)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89735884706151605)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(89718454313977659)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89736801521151607)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(89718617750977660)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89748162910516216)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(89718940264977664)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>10
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89755226851519111)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(89719237340977667)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89757449311579932)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(89719361937977668)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89758356995579934)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(89719431579977669)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(90145459814484506)
,p_view_id=>wwv_flow_imp.id(89725540868151568)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(90126412246234052)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(33798921107669538)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(89168835835869541)
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
,p_security_scheme=>wwv_flow_imp.id(89923396018527044)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(45739665918368404)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(89168835835869541)
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
,p_security_scheme=>wwv_flow_imp.id(89923396018527044)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(89369272213983353)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(88930209961565445)
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
 p_id=>wwv_flow_imp.id(89191684119871375)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(88930095004565444)
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
 p_id=>wwv_flow_imp.id(89869450704986557)
,p_button_sequence=>220
,p_button_plug_id=>wwv_flow_imp.id(88930095004565444)
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
 p_id=>wwv_flow_imp.id(33799296997669541)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(33799088862669539)
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
 p_id=>wwv_flow_imp.id(89176858914869552)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(89176517306869552)
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
 p_id=>wwv_flow_imp.id(33799529141669544)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(33799088862669539)
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
 p_id=>wwv_flow_imp.id(89178287292869555)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(89176517306869552)
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
,p_security_scheme=>wwv_flow_imp.id(89923787216528764)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(89869273751986555)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(89176517306869552)
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
,p_security_scheme=>wwv_flow_imp.id(89923396018527044)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(89178680887869555)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(89176517306869552)
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
 p_id=>wwv_flow_imp.id(89179029676869556)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(89176517306869552)
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
,p_security_scheme=>wwv_flow_imp.id(89923600056527918)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33799102525669540)
,p_name=>'P84_P_NUMERO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(33799088862669539)
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
 p_id=>wwv_flow_imp.id(45739750920368405)
,p_name=>'P84_P_EDITAR_TRANSACC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(86450807776289643)
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
 p_id=>wwv_flow_imp.id(45740114527368409)
,p_name=>'P84_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(89168835835869541)
,p_item_source_plug_id=>wwv_flow_imp.id(89168835835869541)
,p_source=>'ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45740302325368411)
,p_name=>'P84_DEUDA_MONEDA_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(86450807776289643)
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
 p_id=>wwv_flow_imp.id(86450916267289644)
,p_name=>'P84_P_DESCRI_TIMBRADO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(86450807776289643)
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
 p_id=>wwv_flow_imp.id(86450933008289645)
,p_name=>'P84_P_DESCRI_TIPO_COMPROBANTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(86450807776289643)
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
 p_id=>wwv_flow_imp.id(86451082031289646)
,p_name=>'P84_P_TMP_ID_TIMBRADO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(86450807776289643)
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
 p_id=>wwv_flow_imp.id(89169208002869543)
,p_name=>'P84_ID_COBRO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(89168835835869541)
,p_item_source_plug_id=>wwv_flow_imp.id(89168835835869541)
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
 p_id=>wwv_flow_imp.id(89169603963869544)
,p_name=>'P84_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(89168835835869541)
,p_item_source_plug_id=>wwv_flow_imp.id(89168835835869541)
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89170009880869545)
,p_name=>'P84_TIM_ID_TIMBRADO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(89168835835869541)
,p_item_source_plug_id=>wwv_flow_imp.id(89168835835869541)
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
 p_id=>wwv_flow_imp.id(89170354695869545)
,p_name=>'P84_NRO_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(89168835835869541)
,p_item_source_plug_id=>wwv_flow_imp.id(89168835835869541)
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
 p_id=>wwv_flow_imp.id(89170750885869545)
,p_name=>'P84_FECHA'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(89168835835869541)
,p_item_source_plug_id=>wwv_flow_imp.id(89168835835869541)
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
 p_id=>wwv_flow_imp.id(89171588886869546)
,p_name=>'P84_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(88930095004565444)
,p_item_source_plug_id=>wwv_flow_imp.id(89168835835869541)
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
 p_id=>wwv_flow_imp.id(89171935454869546)
,p_name=>'P84_TIPO_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(88930095004565444)
,p_item_source_plug_id=>wwv_flow_imp.id(89168835835869541)
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
 p_id=>wwv_flow_imp.id(89172417062869546)
,p_name=>'P84_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(89168835835869541)
,p_item_source_plug_id=>wwv_flow_imp.id(89168835835869541)
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
 p_id=>wwv_flow_imp.id(89172767848869546)
,p_name=>'P84_REN_ID_RENDICION_CAJA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(89168835835869541)
,p_item_source_plug_id=>wwv_flow_imp.id(89168835835869541)
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
 p_id=>wwv_flow_imp.id(89190015580871358)
,p_name=>'P84_TIP_ID_TIPO_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(89168835835869541)
,p_item_source_plug_id=>wwv_flow_imp.id(89168835835869541)
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
 p_id=>wwv_flow_imp.id(89190031707871359)
,p_name=>'P84_DISPLAY_SUCURSAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(89168835835869541)
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
 p_id=>wwv_flow_imp.id(89292584037936259)
,p_name=>'P84_MONTO_FACTURAS'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(88930095004565444)
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
 p_id=>wwv_flow_imp.id(89292672740936260)
,p_name=>'P84_MONTO_PAGOS'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(88930095004565444)
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
 p_id=>wwv_flow_imp.id(89368405317983344)
,p_name=>'P84_FORMA_PAGO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(88930209961565445)
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
 p_id=>wwv_flow_imp.id(89368449251983345)
,p_name=>'P84_MONEDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(88930209961565445)
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
 p_id=>wwv_flow_imp.id(89368568190983346)
,p_name=>'P84_BANCO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(88930209961565445)
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
 p_id=>wwv_flow_imp.id(89368687867983347)
,p_name=>'P84_EMISOR_TARJ'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(88930209961565445)
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
 p_id=>wwv_flow_imp.id(89368771627983348)
,p_name=>'P84_NUMERO_COMPOBANTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(88930209961565445)
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
 p_id=>wwv_flow_imp.id(89368912619983349)
,p_name=>'P84_FECHA_EMISION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(88930209961565445)
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
 p_id=>wwv_flow_imp.id(89368977495983350)
,p_name=>'P84_FECHA_COBRO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(88930209961565445)
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
 p_id=>wwv_flow_imp.id(89369078525983351)
,p_name=>'P84_IMPORTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(88930209961565445)
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
 p_id=>wwv_flow_imp.id(89369124188983352)
,p_name=>'P84_SALDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(88930209961565445)
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
 p_id=>wwv_flow_imp.id(89369331313983354)
,p_name=>'P84_TIPO_FORMA_PAGO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(88930209961565445)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89372448613983385)
,p_name=>'P84_DIFERENCIA'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(88930095004565444)
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
 p_id=>wwv_flow_imp.id(89770000711979449)
,p_name=>'P84_HABILITAR_GUARDAR'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(89168835835869541)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89834992307662042)
,p_name=>'P84_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(88930095004565444)
,p_item_source_plug_id=>wwv_flow_imp.id(89168835835869541)
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
 p_id=>wwv_flow_imp.id(89868976703986552)
,p_name=>'P84_ENT_ID_ENTIDAD_VER'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(88930095004565444)
,p_item_source_plug_id=>wwv_flow_imp.id(89168835835869541)
,p_prompt=>'Cliente'
,p_source=>'ENT_ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LV_ENTIDAD_CI_NOMBRE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT numero_documento||'' ''||nombre as d, id_entidad as r',
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
 p_id=>wwv_flow_imp.id(89869152492986554)
,p_name=>'P84_MONTO_DE_COBRANZA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(88930095004565444)
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
 p_id=>wwv_flow_imp.id(90011095454664541)
,p_name=>'P84_T_CAMBIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(88930209961565445)
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
 p_id=>wwv_flow_imp.id(90034908869272052)
,p_name=>'P84_DEUDA_MONEDA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(86450807776289643)
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
 p_id=>wwv_flow_imp.id(90034981899272053)
,p_name=>'P84_VALOR_AL_COBRO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(88930209961565445)
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
 p_id=>wwv_flow_imp.id(90035544250272059)
,p_name=>'P84_DESCRI_MONEDA_DEUDA'
,p_item_sequence=>80
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(90126675248234055)
,p_name=>'P84_ID_ENTIDAD_GUARDAR'
,p_item_sequence=>90
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(90218130560987741)
,p_name=>'P84_TIPO_FACS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(89168835835869541)
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
 p_id=>wwv_flow_imp.id(89176931915869552)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(89176858914869552)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89177812529869555)
,p_event_id=>wwv_flow_imp.id(89176931915869552)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89868714129986549)
,p_name=>'SoloVer'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P84_ID_COBRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89868748395986550)
,p_event_id=>wwv_flow_imp.id(89868714129986549)
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
 p_id=>wwv_flow_imp.id(90011776403664548)
,p_event_id=>wwv_flow_imp.id(89868714129986549)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_ENT_ID_ENTIDAD_VER_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89190174993871360)
,p_name=>'Ir A'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P84_ID_COBRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89372721913983388)
,p_event_id=>wwv_flow_imp.id(89190174993871360)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(89191684119871375)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89716647734977641)
,p_event_id=>wwv_flow_imp.id(89190174993871360)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(89191510830871373)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90011687310664547)
,p_event_id=>wwv_flow_imp.id(89190174993871360)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_ENT_ID_ENTIDAD_VER_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89190524405871364)
,p_name=>'Definir moneda'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIP_ID_TIPO_COMPROBANTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89190624583871365)
,p_event_id=>wwv_flow_imp.id(89190524405871364)
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
 p_id=>wwv_flow_imp.id(89190751562871366)
,p_name=>'Ir a p expedicion'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIP_ID_TIPO_COMPROBANTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89190864153871367)
,p_event_id=>wwv_flow_imp.id(89190751562871366)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_TIM_ID_TIMBRADO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89190963621871368)
,p_name=>'Ir a entidad'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIM_ID_TIMBRADO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89191050455871369)
,p_event_id=>wwv_flow_imp.id(89190963621871368)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_END_ID_ENTIDAD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89191765982871376)
,p_name=>'Buscar'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(89191684119871375)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89191889978871377)
,p_event_id=>wwv_flow_imp.id(89191765982871376)
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
 p_id=>wwv_flow_imp.id(89291992990936253)
,p_event_id=>wwv_flow_imp.id(89191765982871376)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(89191290502871371)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89868234676986545)
,p_event_id=>wwv_flow_imp.id(89191765982871376)
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
 p_id=>wwv_flow_imp.id(90011166425664542)
,p_event_id=>wwv_flow_imp.id(89191765982871376)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(89191684119871375)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89293143784936265)
,p_name=>'Sumar'
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(89191290502871371)
,p_triggering_element=>'SELECCION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89293246470936266)
,p_event_id=>wwv_flow_imp.id(89293143784936265)
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
 p_id=>wwv_flow_imp.id(89293480793936268)
,p_name=>'SumarPago'
,p_event_sequence=>90
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(89191290502871371)
,p_triggering_element=>'PAGAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89293568805936269)
,p_event_id=>wwv_flow_imp.id(89293480793936268)
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
 p_id=>wwv_flow_imp.id(89369515267983355)
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
 p_id=>wwv_flow_imp.id(89369570496983356)
,p_event_id=>wwv_flow_imp.id(89369515267983355)
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
 p_id=>wwv_flow_imp.id(90125621412234045)
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
 p_id=>wwv_flow_imp.id(90125796030234046)
,p_event_id=>wwv_flow_imp.id(90125621412234045)
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
 p_id=>wwv_flow_imp.id(89372212016983382)
,p_name=>'Todos'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIPO_FORMA_PAGO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89372232369983383)
,p_event_id=>wwv_flow_imp.id(89372212016983382)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO,P84_EMISOR_TARJ,P84_FECHA_EMISION,P84_FECHA_COBRO,P84_IMPORTE,P84_SALDO,,P84_NUMERO_COMPOBANTE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88930712171565450)
,p_event_id=>wwv_flow_imp.id(89372212016983382)
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
 p_id=>wwv_flow_imp.id(89369628170983357)
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
 p_id=>wwv_flow_imp.id(89369771296983358)
,p_event_id=>wwv_flow_imp.id(89369628170983357)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO,P84_EMISOR_TARJ,P84_NUMERO_COMPOBANTE,P84_FECHA_EMISION,P84_FECHA_COBRO,P84_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89370033275983361)
,p_event_id=>wwv_flow_imp.id(89369628170983357)
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
 p_id=>wwv_flow_imp.id(89370005836983360)
,p_event_id=>wwv_flow_imp.id(89369628170983357)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_IMPORTE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89370127257983362)
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
 p_id=>wwv_flow_imp.id(89370298442983363)
,p_event_id=>wwv_flow_imp.id(89370127257983362)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_FECHA_EMISION,P84_FECHA_COBRO,P84_'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89370401026983364)
,p_event_id=>wwv_flow_imp.id(89370127257983362)
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
 p_id=>wwv_flow_imp.id(89370438470983365)
,p_event_id=>wwv_flow_imp.id(89370127257983362)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89370521513983366)
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
 p_id=>wwv_flow_imp.id(89370712818983367)
,p_event_id=>wwv_flow_imp.id(89370521513983366)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_FECHA_EMISION,P84_FECHA_COBRO,P84_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89370760458983368)
,p_event_id=>wwv_flow_imp.id(89370521513983366)
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
 p_id=>wwv_flow_imp.id(89370834772983369)
,p_event_id=>wwv_flow_imp.id(89370521513983366)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89371003256983370)
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
 p_id=>wwv_flow_imp.id(89371081807983371)
,p_event_id=>wwv_flow_imp.id(89371003256983370)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_EMISOR_TARJ,,P84_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89371147680983372)
,p_event_id=>wwv_flow_imp.id(89371003256983370)
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
 p_id=>wwv_flow_imp.id(89769599951979445)
,p_event_id=>wwv_flow_imp.id(89371003256983370)
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
 p_id=>wwv_flow_imp.id(89371308105983373)
,p_event_id=>wwv_flow_imp.id(89371003256983370)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89371368659983374)
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
 p_id=>wwv_flow_imp.id(89371450185983375)
,p_event_id=>wwv_flow_imp.id(89371368659983374)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_EMISOR_TARJ,P84_FECHA_EMISION,P84_FECHA_COBRO,P84_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89371575670983376)
,p_event_id=>wwv_flow_imp.id(89371368659983374)
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
 p_id=>wwv_flow_imp.id(89371706528983377)
,p_event_id=>wwv_flow_imp.id(89371368659983374)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89371763527983378)
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
 p_id=>wwv_flow_imp.id(89371833596983379)
,p_event_id=>wwv_flow_imp.id(89371763527983378)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_BANCO,P84_EMISOR_TARJ,P84_FECHA_COBRO,P84_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89371997322983380)
,p_event_id=>wwv_flow_imp.id(89371763527983378)
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
 p_id=>wwv_flow_imp.id(89372087518983381)
,p_event_id=>wwv_flow_imp.id(89371763527983378)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_NUMERO_COMPOBANTE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89372547664983386)
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
 p_id=>wwv_flow_imp.id(89372710252983387)
,p_event_id=>wwv_flow_imp.id(89372547664983386)
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
 p_id=>wwv_flow_imp.id(89716800307977642)
,p_event_id=>wwv_flow_imp.id(89372547664983386)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(89191510830871373)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P84_MONTO_FACTURAS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89372914976983389)
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
 p_id=>wwv_flow_imp.id(89372927020983390)
,p_event_id=>wwv_flow_imp.id(89372914976983389)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(89191684119871375)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89718649664977661)
,p_name=>'Agregar pago'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(89369272213983353)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88930747911565451)
,p_event_id=>wwv_flow_imp.id(89718649664977661)
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
 p_id=>wwv_flow_imp.id(90126596527234054)
,p_event_id=>wwv_flow_imp.id(89718649664977661)
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
 p_id=>wwv_flow_imp.id(89718789818977662)
,p_event_id=>wwv_flow_imp.id(89718649664977661)
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
 p_id=>wwv_flow_imp.id(90034381589272047)
,p_event_id=>wwv_flow_imp.id(89718649664977661)
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
 p_id=>wwv_flow_imp.id(89718824021977663)
,p_event_id=>wwv_flow_imp.id(89718649664977661)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(89717144922977646)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89769204675979441)
,p_name=>unistr('Bot\00F3n limpiar eliminados')
,p_event_sequence=>220
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P84_ID_COBRO'
,p_security_scheme=>wwv_flow_imp.id(89923600056527918)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89769312600979442)
,p_event_id=>wwv_flow_imp.id(89769204675979441)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.FOS.INTERACTIVE_GRID_ADD_BUTTON'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(89717144922977646)
,p_attribute_01=>'toolbar-actions4'
,p_attribute_02=>'first'
,p_attribute_05=>'Limpiar registros eliminados'
,p_attribute_07=>'save'
,p_attribute_09=>'do-nothing'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89769328511979443)
,p_name=>'Verificar facturas'
,p_event_sequence=>230
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(89191510830871373)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusin'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89769472779979444)
,p_event_id=>wwv_flow_imp.id(89769328511979443)
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
 p_id=>wwv_flow_imp.id(89770115842979450)
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
 p_id=>wwv_flow_imp.id(89770161616979451)
,p_event_id=>wwv_flow_imp.id(89770115842979450)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(89179029676869556)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89770352590979453)
,p_event_id=>wwv_flow_imp.id(89770115842979450)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(89179029676869556)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88930400024565447)
,p_event_id=>wwv_flow_imp.id(89770115842979450)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#REG_AGREGAR.a-Collapsible.is-expanded'').removeClass(''is-expanded'').addClass(''is-collapsed'');',
'$(''#REG_AGREGAR.a-Collapsible .a-Collapsible-content'').show();'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89868354345986546)
,p_event_id=>wwv_flow_imp.id(89770115842979450)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#REG_AGREGAR.a-Collapsible.is-collapsed'').removeClass(''is-collapsed'').addClass(''is-expanded'');',
'$(''#REG_AGREGAR.a-Collapsible .a-Collapsible-content'').show();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89770601780979455)
,p_name=>'Verifica para habilitar GUARDAR'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_DIFERENCIA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89770676983979456)
,p_event_id=>wwv_flow_imp.id(89770601780979455)
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
 p_id=>wwv_flow_imp.id(89835213866662044)
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
 p_id=>wwv_flow_imp.id(89835222187662045)
,p_event_id=>wwv_flow_imp.id(89835213866662044)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(89191684119871375)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87041885270827372)
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
 p_id=>wwv_flow_imp.id(87041991375827373)
,p_event_id=>wwv_flow_imp.id(87041885270827372)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(89191684119871375)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90033967645272043)
,p_name=>'Buscar TCambio_lose'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_MONEDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90034088855272044)
,p_event_id=>wwv_flow_imp.id(90033967645272043)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buscaCambio();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90035310665272056)
,p_event_id=>wwv_flow_imp.id(90033967645272043)
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
 p_id=>wwv_flow_imp.id(90034517894272048)
,p_event_id=>wwv_flow_imp.id(90033967645272043)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_FORMA_PAGO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45740442732368412)
,p_name=>'Buscar TCambio_change'
,p_event_sequence=>290
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_MONEDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45740538393368413)
,p_event_id=>wwv_flow_imp.id(45740442732368412)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buscaCambio();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45740640819368414)
,p_event_id=>wwv_flow_imp.id(45740442732368412)
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
 p_id=>wwv_flow_imp.id(45740763436368415)
,p_event_id=>wwv_flow_imp.id(45740442732368412)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_FORMA_PAGO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90126008801234048)
,p_name=>'Ver'
,p_event_sequence=>300
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_MONEDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90126084180234049)
,p_event_id=>wwv_flow_imp.id(90126008801234048)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Show P84_VALOR_AL_COBRO'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84_VALOR_AL_COBRO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90035102520272054)
,p_name=>'Obtener valor cobro_lose'
,p_event_sequence=>310
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_IMPORTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90035179135272055)
,p_event_id=>wwv_flow_imp.id(90035102520272054)
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
 p_id=>wwv_flow_imp.id(90126127071234050)
,p_name=>'Obtener valor cobro_change'
,p_event_sequence=>320
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_IMPORTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90126229754234051)
,p_event_id=>wwv_flow_imp.id(90126127071234050)
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
 p_id=>wwv_flow_imp.id(90035852036272062)
,p_name=>'Set moneda formas pago'
,p_event_sequence=>330
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_DESCRI_MONEDA_DEUDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90035935378272063)
,p_event_id=>wwv_flow_imp.id(90035852036272062)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.item("P84_MONEDA").setValue( apex.item("P84_DEUDA_MONEDA").getValue(),apex.item("P84_DESCRI_MONEDA_DEUDA").getValue() );'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90036076999272064)
,p_event_id=>wwv_flow_imp.id(90035852036272062)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(88930209961565445)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90108745462212141)
,p_name=>'Obtener moneda deuda'
,p_event_sequence=>340
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(89191290502871371)
,p_condition_element_type=>'ITEM'
,p_condition_element=>'P84_ENT_ID_ENTIDAD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90108864234212142)
,p_event_id=>wwv_flow_imp.id(90108745462212141)
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
 p_id=>wwv_flow_imp.id(90126816629234056)
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
 p_id=>wwv_flow_imp.id(90126830791234057)
,p_event_id=>wwv_flow_imp.id(90126816629234056)
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
 p_id=>wwv_flow_imp.id(84194333320729990)
,p_name=>'ObtenerDefecto'
,p_event_sequence=>360
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIPO_FACS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(86450611558289641)
,p_event_id=>wwv_flow_imp.id(84194333320729990)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerDefecto()'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(33799349246669542)
,p_name=>'Retorna'
,p_event_sequence=>370
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(33799296997669541)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(33799478217669543)
,p_event_id=>wwv_flow_imp.id(33799349246669542)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(33799088862669539)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(33799612231669545)
,p_name=>'Aplicar numero'
,p_event_sequence=>380
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(33799529141669544)
,p_condition_element=>'P84_P_NUMERO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(33799710917669546)
,p_event_id=>wwv_flow_imp.id(33799612231669545)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('\00BFEsta seguro en aplicar el cambio?')
,p_attribute_02=>'Aplicar'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(33799865253669547)
,p_event_id=>wwv_flow_imp.id(33799612231669545)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CAMBIAR'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(33799959119669548)
,p_name=>'Abrir numerar'
,p_event_sequence=>390
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(33798921107669538)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45739435495368402)
,p_event_id=>wwv_flow_imp.id(33799959119669548)
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
 p_id=>wwv_flow_imp.id(33800098367669549)
,p_event_id=>wwv_flow_imp.id(33799959119669548)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(33799088862669539)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45739814609368406)
,p_name=>'Editar transacc'
,p_event_sequence=>400
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(45739665918368404)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45739975187368407)
,p_event_id=>wwv_flow_imp.id(45739814609368406)
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
 p_id=>wwv_flow_imp.id(45740094859368408)
,p_event_id=>wwv_flow_imp.id(45739814609368406)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'EDITAR_TRANSACC'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(89719202206977666)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(89717144922977646)
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
 p_id=>wwv_flow_imp.id(89834900733662041)
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
 p_id=>wwv_flow_imp.id(89869325302986556)
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
 p_id=>wwv_flow_imp.id(45739547390368403)
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
 p_id=>wwv_flow_imp.id(89179501957869557)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(89168835835869541)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear cobro a factura'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>15446482893862817
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(89189283363871351)
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
 p_id=>wwv_flow_imp.id(89869038795986553)
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
 p_id=>wwv_flow_imp.id(86450621475289642)
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
 p_id=>wwv_flow_imp.id(45740296042368410)
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
 p_id=>wwv_flow_imp.id(33798665061669535)
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
