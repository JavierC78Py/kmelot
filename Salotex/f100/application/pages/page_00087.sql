prompt --application/pages/page_00087
begin
--   Manifest
--     PAGE: 00087
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
 p_id=>87
,p_name=>'Crear pago a factura'
,p_alias=>'CREAR-PAGO-A-FACTURA'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear pago a factura'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function verPDF(){',
'    apex.navigation.openInNewWindow(',
'    apex.server.url( {',
'        p_request: "application_process=ver_PDF",',
'         x01: apex.item("P87_P_ID_PAGO").getValue()',
'        })',
'    );',
'}',
'function actualizarRec() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("actualiza_rec", {',
'        pageItems: [',
'             "P87_R_NRO_RECIBO"',
'            ,"P87_R_TIPO_COMPROBANTE"',
'            ,"P87_P_ID_PAGO"',
'    ]},',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.theme.closeRegion("REG_RECIBO");',
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
'function agregarRecibo() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("obtener_tipo_doc", {},',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.item("P87_R_TIPO_COMPROBANTE").setValue( apex.item("P87_P_TIPO_DOCUMENTO").getValue(), apex.item("P87_P_DESCRIP_DOCUMENTO").getValue() );',
'                apex.theme.openRegion("REG_RECIBO");',
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
'    });    ',
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
'        $s("P87_MONTO_FACTURAS", total);',
'    }',
'    $(function() {      ',
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
'                    progressView: $("#P87_MONTO_FACTURAS") ',
'                } );',
'                 update( model );           ',
'                model.fetchAll(function() {});',
'            }',
'        });',
'    });',
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
'            if (!isNaN(sal) && !meta.deleted && !meta.agg) {',
'                total += sal;',
'            }',
'        });',
'        console.log(">> setting sum VALOR_COBRO_MONEDA_FACTURA column to " + total)',
'        $s("P87_MONTO_PAGOS", total);',
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
'                    progressView: $("#P87_MONTO_PAGOS") ',
'                } );',
'                 update( model );           ',
'                model.fetchAll(function() {});',
'            }',
'        });',
'    });',
'})(apex.jQuery);',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P87_ID_PAGO").prop( ''readOnly'', true);',
'$("#P87_FECHA").prop( ''readOnly'', true);',
'$("#P87_REN_ID_RENDICION_CAJA").prop( ''readOnly'', true);',
'$("#P87_TIPO_CAMBIO").prop( ''readOnly'', true);',
'$("#P87_ESTADO").prop( ''readOnly'', true);',
'$("#P87_MONTO_FACTURAS").prop( ''readOnly'', true);',
'$("#P87_MONTO_PAGOS").prop( ''readOnly'', true);',
'$("#P87_MONTO_TOTAL_FACTURAS").prop( ''readOnly'', true);',
'$("#P87_DIFERENCIA").prop( ''readOnly'', true);',
'$("#P87_SALDO").prop( ''readOnly'', true);',
'$("#P87_MONTO_DE_COBRANZA").prop( ''readOnly'', true);',
'$("#P87_T_CAMBIO").prop( ''readOnly'', true);',
'$("#P87_VALOR_AL_COBRO").prop( ''readOnly'', true);',
'',
'var ig$ = apex.region("REG_FACTURAS").widget();',
'ig$.interactiveGrid("getActions").set("edit", true);',
'',
'setTimeout(() => {',
'    $("#P87_ESTADO").addClass($("#P87_ESTADO").val()) ',
'},200);',
''))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P87_ID_PAGO{',
'    background-color: rgb(190, 190, 190);',
'    color :rgb(0, 0, 0);',
'    text-align: center;',
'}',
'',
'',
'#P87_ESTADO.ACTIVO {',
'    background-color: rgb(117, 206, 105);',
'    text-align: center;',
'}',
'',
'#P87_ESTADO.ANULADO {',
'    background-color: rgb(206, 105, 105);',
'    color :white;',
'    text-align: center;',
'}',
'',
'',
'#P87_TIP_ID_TIPO_COMPROBANTE,#P87_TIM_ID_TIMBRADO,#P87_ENT_ID_ENTIDAD {',
'    background-color: rgb(240, 215, 102);',
'}',
'',
'#btn_buscar, #btn_agregar_pago, #BTN_VER_PDF, #BTN_RECIBO {    ',
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
,p_required_role=>wwv_flow_imp.id(86480401161569098)
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86451312570289648)
,p_plug_name=>'NRO RECIBO'
,p_region_name=>'REG_RECIBO'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>40
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86451792726289653)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>50
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(107329190894400166)
,p_plug_name=>'Datos entidad'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(107567931725704263)
,p_plug_name=>'Cabecera del pago'
,p_region_name=>'REG_CABECERA'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-expanded:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_PAGO,',
'       SUC_ID_SUCURSAL,',
'       TIP_ID_TIPO_COMPROBANTE,',
'       NULL TIM_ID_TIMBRADO,',
'       NRO_COMPROBANTE,',
'       FECHA,',
'       ENT_ID_ENTIDAD,',
'       MON_ID_MONEDA,',
'       TIPO_CAMBIO,',
'       ESTADO,',
'       REN_ID_RENDICION_CAJA',
'  from CAB_PAGO'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(107575613196704274)
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
 p_id=>wwv_flow_imp.id(107590258973706092)
,p_plug_name=>'Regiones'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_imp.id(107590386392706093)
,p_plug_name=>'Facturas'
,p_region_name=>'REG_FACTURAS'
,p_parent_plug_id=>wwv_flow_imp.id(107590258973706092)
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
''))
,p_plug_source_type=>'NATIVE_IG'
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
 p_id=>wwv_flow_imp.id(107689974704770964)
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
 p_id=>wwv_flow_imp.id(107690048357770965)
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
 p_id=>wwv_flow_imp.id(107690120683770966)
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
 p_id=>wwv_flow_imp.id(107690303280770967)
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
 p_id=>wwv_flow_imp.id(107690324632770968)
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
 p_id=>wwv_flow_imp.id(107690460656770969)
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
 p_id=>wwv_flow_imp.id(107690577794770970)
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
 p_id=>wwv_flow_imp.id(107690699539770971)
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
 p_id=>wwv_flow_imp.id(107690763801770972)
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
 p_id=>wwv_flow_imp.id(107690853602770973)
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
 p_id=>wwv_flow_imp.id(107690935939770974)
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
,p_readonly_condition=>'P87_ID_PAGO'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(107691588464770980)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(107692116858770986)
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
,p_readonly_condition=>'P87_ID_PAGO'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(107692504353770989)
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
 p_id=>wwv_flow_imp.id(108656918124959363)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(108657091875959364)
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
 p_id=>wwv_flow_imp.id(107689838513770963)
,p_internal_uid=>33956819449764223
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>false
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_imp.id(107695755712772920)
,p_interactive_grid_id=>wwv_flow_imp.id(107689838513770963)
,p_static_id=>'155637'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(107695949962772921)
,p_report_id=>wwv_flow_imp.id(107695755712772920)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(92136975251909217)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(107692116858770986)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(107696436960772936)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(107689974704770964)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(107697379241772942)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(107690048357770965)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(107698255794772945)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(107690120683770966)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(107699177853772947)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(107690303280770967)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(107700075797772950)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(107690324632770968)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(107700998524772953)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(107690460656770969)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(107701817060772955)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(107690577794770970)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(107702732314772957)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(107690699539770971)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(107703700616772959)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(107690763801770972)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(107704594619772962)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(107690853602770973)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(107705448196772964)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(107690935939770974)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(107722139803979856)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(107691588464770980)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(107744740382787561)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(107692504353770989)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108662938862961074)
,p_view_id=>wwv_flow_imp.id(107695949962772921)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(108656918124959363)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(107590606720706095)
,p_plug_name=>'Formas de pago'
,p_parent_plug_id=>wwv_flow_imp.id(107590258973706092)
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
 p_id=>wwv_flow_imp.id(107329305851400167)
,p_plug_name=>'Agregar pagos'
,p_region_name=>'REG_AGREGAR'
,p_parent_plug_id=>wwv_flow_imp.id(107590606720706095)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-expanded:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>5
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P87_ID_PAGO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(108116240812812368)
,p_plug_name=>'Pagos'
,p_region_name=>'REG_PAGOS'
,p_parent_plug_id=>wwv_flow_imp.id(107590606720706095)
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
 p_id=>wwv_flow_imp.id(108116496997812370)
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
 p_id=>wwv_flow_imp.id(108116542974812371)
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
 p_id=>wwv_flow_imp.id(108116706582812372)
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
 p_id=>wwv_flow_imp.id(108116758244812373)
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
 p_id=>wwv_flow_imp.id(108116818517812374)
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
 p_id=>wwv_flow_imp.id(108116931901812375)
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
 p_id=>wwv_flow_imp.id(108117037343812376)
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
 p_id=>wwv_flow_imp.id(108117210790812377)
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
 p_id=>wwv_flow_imp.id(108117255903812378)
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
 p_id=>wwv_flow_imp.id(108117333962812379)
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
 p_id=>wwv_flow_imp.id(108117435033812380)
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
 p_id=>wwv_flow_imp.id(108117550203812381)
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
 p_id=>wwv_flow_imp.id(108117713640812382)
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
 p_id=>wwv_flow_imp.id(108118036154812386)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_display_condition_type=>'ITEM_IS_NULL'
,p_display_condition=>'P87_ID_PAGO'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(108118177816812387)
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
 p_id=>wwv_flow_imp.id(108118333230812389)
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
 p_id=>wwv_flow_imp.id(108118457827812390)
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
 p_id=>wwv_flow_imp.id(108118527469812391)
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
 p_id=>wwv_flow_imp.id(108525508136068774)
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
 p_id=>wwv_flow_imp.id(108116317392812369)
,p_internal_uid=>34383298328805629
,p_is_editable=>true
,p_edit_operations=>'d'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>false
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
 p_id=>wwv_flow_imp.id(108124447809986290)
,p_interactive_grid_id=>wwv_flow_imp.id(108116317392812369)
,p_static_id=>'159924'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(108124636757986290)
,p_report_id=>wwv_flow_imp.id(108124447809986290)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108125199444986296)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(108116496997812370)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108126042187986302)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(108116542974812371)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108126952409986305)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(108116706582812372)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108127885631986307)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(108116758244812373)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108128682994986310)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(108116818517812374)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108129515936986312)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(108116931901812375)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108130502328986314)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(108117037343812376)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108131395410986318)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(108117210790812377)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108132302361986320)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(108117255903812378)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108133185556986322)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(108117333962812379)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108134032758986324)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(108117435033812380)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108134980595986327)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(108117550203812381)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108135897410986329)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(108117713640812382)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108147258800350938)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(108118036154812386)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108154322741353833)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(108118333230812389)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108156545201414654)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(108118457827812390)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108157452885414656)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(108118527469812391)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(108544555704319228)
,p_view_id=>wwv_flow_imp.id(108124636757986290)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(108525508136068774)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(92165321132841507)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(107329305851400167)
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
 p_id=>wwv_flow_imp.id(92142886723841477)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(107329190894400166)
,p_button_name=>'Buscar'
,p_button_static_id=>'btn_buscar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--stretch'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Buscar'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P87_ID_PAGO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-search'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(92142497648841477)
,p_button_sequence=>220
,p_button_plug_id=>wwv_flow_imp.id(107329190894400166)
,p_button_name=>'VerPDF'
,p_button_static_id=>'BTN_VER_PDF'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Ver'
,p_button_redirect_url=>'javascript: verPDF()'
,p_button_condition=>':P87_ID_PAGO IS NOT NULL AND :P87_ESTADO = ''ACTIVO'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_button_cattributes=>'title = "PDF de orden de pago"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(86451205523289647)
,p_button_sequence=>230
,p_button_plug_id=>wwv_flow_imp.id(107329190894400166)
,p_button_name=>'CargarRecibo'
,p_button_static_id=>'BTN_RECIBO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Recibo'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P87_ID_PAGO IS NOT NULL AND :P87_ESTADO = ''ACTIVO'' AND :P87_NRO_COMPROBANTE IS NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-text-o'
,p_button_cattributes=>'title = "Asignar NRO. DE RECIBO recibido por el PROVEEDOR/PRESTADOR"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(86452284828289658)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(86451312570289648)
,p_button_name=>'Guardar'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript: actualizarRec()'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(92140557859841476)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(107575613196704274)
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
 p_id=>wwv_flow_imp.id(92140960591841476)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(107575613196704274)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>':P87_ID_PAGO IS NOT NULL AND :P87_ESTADO = ''ANULADO'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(86480972331573401)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(92140171545841473)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(107575613196704274)
,p_button_name=>'ANULAR'
,p_button_static_id=>'btn_anular'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'ANULAR pago'
,p_button_position=>'NEXT'
,p_button_execute_validations=>'N'
,p_confirm_message=>unistr('&APP_TEXT$DELETE_MSG!RAW. (**  Las transacciones que est\00E9n compartidas con otro cobro quedaran pendientes, las dem\00E1s ser\00E1n anuladas.  **)')
,p_confirm_style=>'danger'
,p_button_condition=>':P87_ID_PAGO IS NOT NULL AND :P87_ESTADO = ''ACTIVO'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_cattributes=>unistr('title="Las transacciones que est\00E9n compartidas con otro cobro quedaran pendientes, las dem\00E1s ser\00E1n anuladas."')
,p_security_scheme=>wwv_flow_imp.id(86480584035570576)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(92141327345841476)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(107575613196704274)
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
 p_id=>wwv_flow_imp.id(92141815865841476)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(107575613196704274)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear pago'
,p_button_position=>'NEXT'
,p_button_execute_validations=>'N'
,p_button_condition=>'P87_ID_PAGO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(86480788384571743)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86451386600289649)
,p_name=>'P87_R_TIPO_COMPROBANTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(86451312570289648)
,p_prompt=>'Tipo Comprobante'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select descripcion d, ',
'       id_tipo_comprobante r',
'  from TIPO_COMPROBANTE',
' where estado = ''ACTIVO'' ',
'   and pago = ''SI''',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86451880889289654)
,p_name=>'P87_P_TIPO_DOCUMENTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(86451792726289653)
,p_prompt=>'P Tipo Documento'
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
 p_id=>wwv_flow_imp.id(86451993870289655)
,p_name=>'P87_P_DESCRIP_DOCUMENTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(86451792726289653)
,p_prompt=>'P Descrip Documento'
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
 p_id=>wwv_flow_imp.id(86452052580289656)
,p_name=>'P87_R_NRO_RECIBO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(86451312570289648)
,p_prompt=>'Nro. Recibo'
,p_format_mask=>'999G999G9999999'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86452500394289660)
,p_name=>'P87_P_ID_PAGO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(86451792726289653)
,p_use_cache_before_default=>'NO'
,p_item_default=>'P87_ID_PAGO'
,p_item_default_type=>'ITEM'
,p_prompt=>'P Id Pago'
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
 p_id=>wwv_flow_imp.id(92124351973781443)
,p_name=>'P87_ID_PAGO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_item_source_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_prompt=>'Id Pago'
,p_source=>'ID_PAGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92133074254841466)
,p_name=>'P87_FECHA'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_item_source_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_prompt=>'Fecha'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_source=>'FECHA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92133492757841466)
,p_name=>'P87_DISPLAY_SUCURSAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_prompt=>'Sucursal'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LV_SUCURSAL'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'LOV',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92134223957841467)
,p_name=>'P87_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_item_source_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92134646424841467)
,p_name=>'P87_TIP_ID_TIPO_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_item_source_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_prompt=>'Tipo Comprobante'
,p_source=>'TIP_ID_TIPO_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select descripcion d, ',
'       id_tipo_comprobante r',
'  from TIPO_COMPROBANTE',
' where estado = ''ACTIVO'' ',
'   and pago = ''SI''',
''))
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P87_TIP_ID_TIPO_COMPROBANTE'
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
 p_id=>wwv_flow_imp.id(92135099027841468)
,p_name=>'P87_NRO_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_item_source_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_prompt=>'Nro Comprobante'
,p_format_mask=>'999G999G9999999'
,p_source=>'NRO_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P87_NRO_COMPROBANTE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92135894378841469)
,p_name=>'P87_REN_ID_RENDICION_CAJA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_item_source_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_prompt=>unistr('Id Rendici\00F3n')
,p_source=>'REN_ID_RENDICION_CAJA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'center',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92136282525841469)
,p_name=>'P87_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_item_source_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_item_default=>'ACTIVO'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P87_ID_PAGO'
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
 p_id=>wwv_flow_imp.id(92136636495841469)
,p_name=>'P87_HABILITAR_GUARDAR'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92143308791841477)
,p_name=>'P87_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(107329190894400166)
,p_item_source_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_prompt=>'Proveedor'
,p_source=>'ENT_ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.numero_documento||'' ''||e.nombre as d, e.id_entidad as r',
'FROM entidad e',
'WHERE EXISTS (',
'          SELECT /*+ INDEX(d DET_CUENTA_COMPRA_IDX1) INDEX(c CAB_FACTURA_COMPRA_IDX1)*/1',
'          FROM det_cuenta_compra d',
'             , cab_factura_compra c',
'          WHERE d.saldo > 0',
'          AND c.id_factura_compra = d.fac_id_factura_compra',
'          AND c.ent_id_entidad = e.id_entidad',
'          FETCH FIRST 1 ROW ONLY',
'             )',
'ORDER BY e.nombre;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cSize=>30
,p_tag_css_classes=>'text-dark'
,p_colspan=>5
,p_display_when=>'P87_ID_PAGO'
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
 p_id=>wwv_flow_imp.id(92143691739841477)
,p_name=>'P87_ENT_ID_ENTIDAD_VER'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(107329190894400166)
,p_item_source_plug_id=>wwv_flow_imp.id(107567931725704263)
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
,p_display_when=>'P87_ID_PAGO'
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
 p_id=>wwv_flow_imp.id(92144080711841478)
,p_name=>'P87_MONTO_FACTURAS'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(107329190894400166)
,p_prompt=>'A pagar facturas'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P87_ID_PAGO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92144514882841478)
,p_name=>'P87_MONTO_PAGOS'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(107329190894400166)
,p_prompt=>'Monto pago'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P87_ID_PAGO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92144852433841478)
,p_name=>'P87_MONTO_DE_COBRANZA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(107329190894400166)
,p_prompt=>'Monto pago'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P87_ID_PAGO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92145305472841478)
,p_name=>'P87_DIFERENCIA'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(107329190894400166)
,p_prompt=>'Diferencia'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P87_ID_PAGO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92145697942841479)
,p_name=>'P87_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(107329190894400166)
,p_item_source_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_prompt=>'Moneda'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LV_MONEDA'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P87_ID_PAGO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609122147107268652
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
 p_id=>wwv_flow_imp.id(92146054519841479)
,p_name=>'P87_TIPO_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(107329190894400166)
,p_item_source_plug_id=>wwv_flow_imp.id(107567931725704263)
,p_prompt=>'Tipo cambio'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'TIPO_CAMBIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_display_when=>'P87_ID_PAGO'
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
 p_id=>wwv_flow_imp.id(92165723806841508)
,p_name=>'P87_MONEDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(107329305851400167)
,p_prompt=>'Moneda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92166217807841508)
,p_name=>'P87_T_CAMBIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(107329305851400167)
,p_prompt=>'Cambio'
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
 p_id=>wwv_flow_imp.id(92166521745841508)
,p_name=>'P87_FORMA_PAGO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(107329305851400167)
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
 p_id=>wwv_flow_imp.id(92166961789841508)
,p_name=>'P87_BANCO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(107329305851400167)
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
 p_id=>wwv_flow_imp.id(92167327747841509)
,p_name=>'P87_EMISOR_TARJ'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(107329305851400167)
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
 p_id=>wwv_flow_imp.id(92167810658841509)
,p_name=>'P87_NUMERO_COMPOBANTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(107329305851400167)
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
 p_id=>wwv_flow_imp.id(92168119343841509)
,p_name=>'P87_FECHA_EMISION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(107329305851400167)
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
 p_id=>wwv_flow_imp.id(92168542638841509)
,p_name=>'P87_FECHA_COBRO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(107329305851400167)
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
 p_id=>wwv_flow_imp.id(92168924817841509)
,p_name=>'P87_IMPORTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(107329305851400167)
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
 p_id=>wwv_flow_imp.id(92169372610841510)
,p_name=>'P87_SALDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(107329305851400167)
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
 p_id=>wwv_flow_imp.id(92169817085841510)
,p_name=>'P87_TIPO_FORMA_PAGO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(107329305851400167)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92170151456841510)
,p_name=>'P87_VALOR_AL_COBRO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(107329305851400167)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor en moneda factura'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92170523498841520)
,p_name=>'P87_MONEDA_DEUDA'
,p_item_sequence=>60
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92170925244841520)
,p_name=>'P87_DESCRI_MONEDA_DEUDA'
,p_item_sequence=>70
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92171352986841520)
,p_name=>'P87_ID_ENTIDAD_GUARDAR'
,p_item_sequence=>80
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92173762710841522)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(92140557859841476)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92174286311841523)
,p_event_id=>wwv_flow_imp.id(92173762710841522)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92198903977841537)
,p_name=>'SoloVer'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P87_ID_PAGO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92199854356841537)
,p_event_id=>wwv_flow_imp.id(92198903977841537)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#P87_ESTADO'').prop(''readonly'', true);',
'$(''#P87_NRO_COMPROBANTE'').prop(''readonly'', true);',
'',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92199332156841537)
,p_event_id=>wwv_flow_imp.id(92198903977841537)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_ENT_ID_ENTIDAD_VER_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92174657607841523)
,p_name=>'Ir A'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P87_ID_PAGO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92176630918841525)
,p_event_id=>wwv_flow_imp.id(92174657607841523)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_TIP_ID_TIPO_COMPROBANTE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92175175374841524)
,p_event_id=>wwv_flow_imp.id(92174657607841523)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(92142886723841477)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92175637189841524)
,p_event_id=>wwv_flow_imp.id(92174657607841523)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(107590606720706095)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92176182256841525)
,p_event_id=>wwv_flow_imp.id(92174657607841523)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_ENT_ID_ENTIDAD_VER_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92214068623841544)
,p_name=>'Ir a entidad'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_TIM_ID_TIMBRADO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92214528220841544)
,p_event_id=>wwv_flow_imp.id(92214068623841544)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_END_ID_ENTIDAD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92211623771841543)
,p_name=>'Buscar'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(92142886723841477)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92213701556841544)
,p_event_id=>wwv_flow_imp.id(92211623771841543)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'  v_select VARCHAR2(32000);',
'BEGIN ',
'  v_select := q''[',
'SELECT c.fecha_factura',
'      ,c.tip_id_tipo_comprobante',
'      ,c.condicion_compra',
'      ,c.nro_factura',
'      ,c.mon_id_moneda',
'      ,dc.id_detalle_cuenta',
'      ,dc.item',
'      ,dc.fecha_vencimiento',
'      ,dc.importe',
'      ,dc.saldo',
'      ,0 pagar',
'      ,''NO'' seleccion',
'FROM cab_factura_compra c',
'    ,det_cuenta_compra dc',
'WHERE c.ent_id_entidad = ]''||:P87_ENT_ID_ENTIDAD||q''[',
'AND dc.fac_id_factura_compra = c.id_factura_compra',
'AND dc.saldo > 0',
'ORDER BY dc.fecha_vencimiento]''',
' ;',
'    if :P87_ENT_ID_ENTIDAD is not null then',
'        P_CARGA_COLECCION (',
'          P_SELECT     => v_select',
'         ,P_COLLECTION => ''COLL_DETALLE_PENDIENTES''',
'         );',
'        :P87_ID_ENTIDAD_GUARDAR := :P87_ENT_ID_ENTIDAD;',
'    else',
'        :P87_ID_ENTIDAD_GUARDAR := NULL;  ',
'    end if;',
'END;',
''))
,p_attribute_02=>'P87_TIP_ID_TIPO_COMPROBANTE,P87_ENT_ID_ENTIDAD'
,p_attribute_03=>'P87_ID_ENTIDAD_GUARDAR'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92213133040841543)
,p_event_id=>wwv_flow_imp.id(92211623771841543)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(107590386392706093)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92212170452841543)
,p_event_id=>wwv_flow_imp.id(92211623771841543)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#REG_CABECERA.a-Collapsible.is-expanded'').removeClass(''is-expanded'').addClass(''is-collapsed'');',
'$(''#REG_CABECERA.a-Collapsible .a-Collapsible-content'').show();',
'$(''#P87_ENT_ID_ENTIDAD'').attr(''disabled'', true);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92212684683841543)
,p_event_id=>wwv_flow_imp.id(92211623771841543)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(92142886723841477)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92218537963841546)
,p_name=>'Sumar'
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(107590386392706093)
,p_triggering_element=>'SELECCION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92219104721841546)
,p_event_id=>wwv_flow_imp.id(92218537963841546)
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
 p_id=>wwv_flow_imp.id(92219428843841546)
,p_name=>'SumarPago'
,p_event_sequence=>90
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(107590386392706093)
,p_triggering_element=>'PAGAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92219966806841547)
,p_event_id=>wwv_flow_imp.id(92219428843841546)
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
 p_id=>wwv_flow_imp.id(92210789057841542)
,p_name=>'Buscar valores_change'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_FORMA_PAGO'
,p_condition_element=>'P87_FORMA_PAGO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92211310926841543)
,p_event_id=>wwv_flow_imp.id(92210789057841542)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select f.tipo_tipo',
'    into :P87_TIPO_FORMA_PAGO',
'    from forma_pago f',
'    where f.id_forma_pago = :P87_FORMA_PAGO;',
'exception',
'    when no_data_found then',
'        raise_application_error(-20000,''Error en la busqueda de forma de pago, favor informe'');    ',
'end;    '))
,p_attribute_02=>'P87_FORMA_PAGO'
,p_attribute_03=>'P87_TIPO_FORMA_PAGO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92204476015841539)
,p_name=>'Buscar valores_lose'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_FORMA_PAGO'
,p_condition_element=>'P87_FORMA_PAGO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92205001262841540)
,p_event_id=>wwv_flow_imp.id(92204476015841539)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select f.tipo_tipo',
'    into :P87_TIPO_FORMA_PAGO',
'    from forma_pago f',
'    where f.id_forma_pago = :P87_FORMA_PAGO;',
'exception',
'    when no_data_found then',
'        raise_application_error(-20000,''Error en la busqueda de forma de pago, favor informe'');    ',
'end;    '))
,p_attribute_02=>'P87_FORMA_PAGO'
,p_attribute_03=>'P87_TIPO_FORMA_PAGO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92188937818841531)
,p_name=>'Todos'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_TIPO_FORMA_PAGO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92189955268841532)
,p_event_id=>wwv_flow_imp.id(92188937818841531)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_BANCO,P87_EMISOR_TARJ,P87_FECHA_EMISION,P87_FECHA_COBRO,P87_IMPORTE,P87_SALDO,,P87_NUMERO_COMPOBANTE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92189488436841531)
,p_event_id=>wwv_flow_imp.id(92188937818841531)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_BANCO,P87_EMISOR_TARJ,P87_NUMERO_COMPOBANTE,P87_FECHA_EMISION,P87_FECHA_COBRO,P87_IMPORTE,P87_SALDO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92177103108841525)
,p_name=>'EF'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_TIPO_FORMA_PAGO'
,p_condition_element=>'P87_TIPO_FORMA_PAGO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'EF'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92178537052841526)
,p_event_id=>wwv_flow_imp.id(92177103108841525)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_BANCO,P87_EMISOR_TARJ,P87_NUMERO_COMPOBANTE,P87_FECHA_EMISION,P87_FECHA_COBRO,P87_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92177527763841525)
,p_event_id=>wwv_flow_imp.id(92177103108841525)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_IMPORTE'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_retorno number(18,2);',
'begin ',
'    if :P87_MONEDA_DEUDA != :P87_MONEDA then',
'        if :P87_MONEDA_DEUDA = :APP_ID_MONEDA_PRINCIPAL then',
'            v_retorno := round((to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00'')) / to_number(:P87_T_CAMBIO,''999G999D99''),2);',
'        else',
'            v_retorno := round((to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00'')) * to_number(:P87_T_CAMBIO,''999G999D99''),0);',
'        end if;',
'    else',
'      v_retorno := (to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00''));',
'    end if;',
'    return v_retorno;',
' end;'))
,p_attribute_07=>'P87_MONEDA_DEUDA ,P87_MONEDA,APP_ID_MONEDA_PRINCIPAL,P87_MONTO_FACTURAS,P87_MONTO_PAGOS,P87_T_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92178116782841526)
,p_event_id=>wwv_flow_imp.id(92177103108841525)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_IMPORTE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92178987121841526)
,p_name=>'TC'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_TIPO_FORMA_PAGO'
,p_condition_element=>'P87_TIPO_FORMA_PAGO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'TC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92179491803841527)
,p_event_id=>wwv_flow_imp.id(92178987121841526)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_FECHA_EMISION,P87_FECHA_COBRO,P87_'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92179921615841527)
,p_event_id=>wwv_flow_imp.id(92178987121841526)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_IMPORTE'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_retorno number(18,2);',
'begin ',
'    if :P87_MONEDA_DEUDA != :P87_MONEDA then',
'        if :P87_MONEDA_DEUDA = :APP_ID_MONEDA_PRINCIPAL then',
'            v_retorno := round((to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00'')) / to_number(:P87_T_CAMBIO,''999G999D99''),2);',
'        else',
'            v_retorno := round((to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00'')) * to_number(:P87_T_CAMBIO,''999G999D99''),0);',
'        end if;',
'    else',
'      v_retorno := (to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00''));',
'    end if;',
'    return v_retorno;',
' end;'))
,p_attribute_07=>'P87_MONEDA_DEUDA ,P87_MONEDA,APP_ID_MONEDA_PRINCIPAL,P87_MONTO_FACTURAS,P87_MONTO_PAGOS,P87_T_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92180434100841527)
,p_event_id=>wwv_flow_imp.id(92178987121841526)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_BANCO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92180857416841527)
,p_name=>'TD'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_TIPO_FORMA_PAGO'
,p_condition_element=>'P87_TIPO_FORMA_PAGO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'TD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92181372303841527)
,p_event_id=>wwv_flow_imp.id(92180857416841527)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_FECHA_EMISION,P87_FECHA_COBRO,P87_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92181881645841528)
,p_event_id=>wwv_flow_imp.id(92180857416841527)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_IMPORTE'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_retorno number(18,2);',
'begin ',
'    if :P87_MONEDA_DEUDA != :P87_MONEDA then',
'        if :P87_MONEDA_DEUDA = :APP_ID_MONEDA_PRINCIPAL then',
'            v_retorno := round((to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00'')) / to_number(:P87_T_CAMBIO,''999G999D99''),2);',
'        else',
'            v_retorno := round((to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00'')) * to_number(:P87_T_CAMBIO,''999G999D99''),0);',
'        end if;',
'    else',
'      v_retorno := (to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00''));',
'    end if;',
'    return v_retorno;',
' end;'))
,p_attribute_07=>'P87_MONEDA_DEUDA ,P87_MONEDA,APP_ID_MONEDA_PRINCIPAL,P87_MONTO_FACTURAS,P87_MONTO_PAGOS,P87_T_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92182393036841528)
,p_event_id=>wwv_flow_imp.id(92180857416841527)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_BANCO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92182727228841528)
,p_name=>'CH'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_TIPO_FORMA_PAGO'
,p_condition_element=>'P87_TIPO_FORMA_PAGO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'CH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92183778199841529)
,p_event_id=>wwv_flow_imp.id(92182727228841528)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_EMISOR_TARJ,,P87_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92184290153841529)
,p_event_id=>wwv_flow_imp.id(92182727228841528)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_IMPORTE'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_retorno number(18,2);',
'begin ',
'    if :P87_MONEDA_DEUDA != :P87_MONEDA then',
'        if :P87_MONEDA_DEUDA = :APP_ID_MONEDA_PRINCIPAL then',
'            v_retorno := round((to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00'')) / to_number(:P87_T_CAMBIO,''999G999D99''),2);',
'        else',
'            v_retorno := round((to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00'')) * to_number(:P87_T_CAMBIO,''999G999D99''),0);',
'        end if;',
'    else',
'      v_retorno := (to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00''));',
'    end if;',
'    return v_retorno;',
' end;'))
,p_attribute_07=>'P87_MONEDA_DEUDA ,P87_MONEDA,APP_ID_MONEDA_PRINCIPAL,P87_MONTO_FACTURAS,P87_MONTO_PAGOS,P87_T_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92183289930841528)
,p_event_id=>wwv_flow_imp.id(92182727228841528)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_FECHA_EMISION,P87_FECHA_COBRO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'trunc(current_date,''DD'')'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92184779475841529)
,p_event_id=>wwv_flow_imp.id(92182727228841528)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_BANCO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92185160776841529)
,p_name=>'DE'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_TIPO_FORMA_PAGO'
,p_condition_element=>'P87_TIPO_FORMA_PAGO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'DE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92186136574841530)
,p_event_id=>wwv_flow_imp.id(92185160776841529)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_EMISOR_TARJ,P87_FECHA_EMISION,P87_FECHA_COBRO,P87_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92185634816841529)
,p_event_id=>wwv_flow_imp.id(92185160776841529)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_IMPORTE'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_retorno number(18,2);',
'begin ',
'    if :P87_MONEDA_DEUDA != :P87_MONEDA then',
'        if :P87_MONEDA_DEUDA = :APP_ID_MONEDA_PRINCIPAL then',
'            v_retorno := round((to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00'')) / to_number(:P87_T_CAMBIO,''999G999D99''),2);',
'        else',
'            v_retorno := round((to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00'')) * to_number(:P87_T_CAMBIO,''999G999D99''),0);',
'        end if;',
'    else',
'      v_retorno := (to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00''));',
'    end if;',
'    return v_retorno;',
' end;'))
,p_attribute_07=>'P87_MONEDA_DEUDA ,P87_MONEDA,APP_ID_MONEDA_PRINCIPAL,P87_MONTO_FACTURAS,P87_MONTO_PAGOS,P87_T_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92186655673841530)
,p_event_id=>wwv_flow_imp.id(92185160776841529)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_BANCO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92187106827841530)
,p_name=>'RT'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_TIPO_FORMA_PAGO'
,p_condition_element=>'P87_TIPO_FORMA_PAGO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'RT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92187563886841530)
,p_event_id=>wwv_flow_imp.id(92187106827841530)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_BANCO,P87_EMISOR_TARJ,P87_FECHA_COBRO,P87_SALDO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92188033388841531)
,p_event_id=>wwv_flow_imp.id(92187106827841530)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_IMPORTE'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_retorno number(18,2);',
'begin ',
'    if :P87_MONEDA_DEUDA != :P87_MONEDA then',
'        if :P87_MONEDA_DEUDA = :APP_ID_MONEDA_PRINCIPAL then',
'            v_retorno := round((to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00'')) / to_number(:P87_T_CAMBIO,''999G999D99''),2);',
'        else',
'            v_retorno := round((to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00'')) * to_number(:P87_T_CAMBIO,''999G999D99''),0);',
'        end if;',
'    else',
'      v_retorno := (to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00''));',
'    end if;',
'    return v_retorno;',
' end;'))
,p_attribute_07=>'P87_MONEDA_DEUDA ,P87_MONEDA,APP_ID_MONEDA_PRINCIPAL,P87_MONTO_FACTURAS,P87_MONTO_PAGOS,P87_T_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92188533009841531)
,p_event_id=>wwv_flow_imp.id(92187106827841530)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_NUMERO_COMPOBANTE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92190404639841532)
,p_name=>'VerDiferencia'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_MONTO_FACTURAS,P87_MONTO_PAGOS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P87_ID_PAGO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92190865835841532)
,p_event_id=>wwv_flow_imp.id(92190404639841532)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_DIFERENCIA'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'to_number(:P87_MONTO_FACTURAS,''999G999G999D00'') - to_number(nvl(:P87_MONTO_PAGOS,0),''999G999G999D00'')'
,p_attribute_07=>'P87_MONTO_FACTURAS,P87_MONTO_PAGOS'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'ITEM_IS_NULL'
,p_server_condition_expr1=>'P87_ID_PAGO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92191364541841533)
,p_event_id=>wwv_flow_imp.id(92190404639841532)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(107590606720706095)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P87_MONTO_FACTURAS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92217625134841546)
,p_name=>'Habilitar buscar'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_END_ID_ENTIDAD'
,p_condition_element=>'P87_END_ID_ENTIDAD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92218201500841546)
,p_event_id=>wwv_flow_imp.id(92217625134841546)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(92142886723841477)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92191813009841533)
,p_name=>'Agregar pago'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(92165321132841507)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92194247234841534)
,p_event_id=>wwv_flow_imp.id(92191813009841533)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Verificar forma de pago y valor'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P87_TIPO_FORMA_PAGO in (''EF'',''RT'') then',
'  if :P87_VALOR_AL_COBRO > to_number(:P87_DIFERENCIA,''999G999G999D99'') then ',
'    raise_application_error(-20000,''Valor a cobrar no puede ser superior al saldo en esta forma de pago.'');',
'  end if;',
'end if;'))
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92193744784841534)
,p_event_id=>wwv_flow_imp.id(92191813009841533)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P87_MONEDA_DEUDA != :P87_MONEDA then',
'    if :P87_MONEDA_DEUDA = :APP_ID_MONEDA_PRINCIPAL then',
'        :P87_VALOR_AL_COBRO := round(to_number(:P87_IMPORTE,''999G999G999D99'') * to_number(:P87_T_CAMBIO,''999G999D99''),0);',
'        if :P87_VALOR_AL_COBRO > to_number(:P87_DIFERENCIA,''999G999G999D99'') then',
'          :P87_VALOR_AL_COBRO := to_number(:P87_DIFERENCIA,''999G999G999D99'');',
'          :P87_SALDO          := to_number(:P87_IMPORTE,''999G999G999D99'') - (to_number(:P87_DIFERENCIA,''999G999G999D99'') / to_number(:P87_T_CAMBIO,''999G999D99''));',
'        end if;',
'    else',
'        :P87_VALOR_AL_COBRO := round(to_number(:P87_IMPORTE,''999G999G999D99'') / to_number(:P87_T_CAMBIO,''999G999D99''),2);',
'        if :P87_VALOR_AL_COBRO > to_number(:P87_DIFERENCIA,''999G999G999D99'') then',
'          :P87_VALOR_AL_COBRO := to_number(:P87_DIFERENCIA,''999G999G999D99'');',
'          :P87_SALDO          := to_number(:P87_IMPORTE,''999G999G999D99'') - (to_number(:P87_DIFERENCIA,''999G999G999D99'') * to_number(:P87_T_CAMBIO,''999G999D99''));',
'        end if;',
'    end if;',
'',
'else',
'    :P87_VALOR_AL_COBRO := to_number(:P87_IMPORTE,''999G999G999D99'');',
'    if :P87_VALOR_AL_COBRO > to_number(:P87_DIFERENCIA,''999G999G999D99'') then',
'      :P87_VALOR_AL_COBRO := to_number(:P87_DIFERENCIA,''999G999G999D99'');',
'      :P87_SALDO          := to_number(:P87_IMPORTE,''999G999G999D99'') - to_number(:P87_DIFERENCIA,''999G999G999D99'');',
'    end if;',
'end if;',
''))
,p_attribute_02=>'P87_MONEDA,P87_MONEDA_DEUDA,P87_T_CAMBIO,P87_IMPORTE,P87_DIFERENCIA'
,p_attribute_03=>'P87_VALOR_AL_COBRO,P87_SALDO'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92192306830841533)
,p_event_id=>wwv_flow_imp.id(92191813009841533)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P87_MONEDA is null then ',
'        raise_application_error(-20000,''Favor seleccione moneda del pago.'');',
'    end if;',
'    if :P87_BANCO is null and :P87_TIPO_FORMA_PAGO in (''CH'') then ',
'        raise_application_error(-20000,''Seleccione BANCO emisor.'');',
'    end if;',
'    if :P87_EMISOR_TARJ is null and :P87_TIPO_FORMA_PAGO in (''TC'',''TD'') then',
'        raise_application_error(-20000,''Seleccione EMISOR de la tarjeta.'');',
'    end if;',
'    if :P87_NUMERO_COMPOBANTE is null and :P87_TIPO_FORMA_PAGO in (''TC'',''TD'',''CH'',''DE'',''RT'') then ',
unistr('        raise_application_error(-20000,''Ingrese n\00FAmero de comprobante.'');'),
'    end if;',
'    if :P87_FECHA_EMISION is null and :P87_TIPO_FORMA_PAGO in (''CH'',''RT'') then ',
unistr('        raise_application_error(-20000,''Fecha de emisi\00F3n del comprobante es requerido.'');'),
'    end if;',
'    if :P87_FECHA_COBRO is null and :P87_TIPO_FORMA_PAGO in (''CH'') then',
'        raise_application_error(-20000,''Ingrese fecha del cobro EFECTIVO del comprobante ingresado.'');',
'    end if;',
'    if nvl(to_number(:P87_IMPORTE,''999G999G999D99''),0) = 0 then',
'        raise_application_error(-20000,''Ingrese valor del cobro que se ingresa.'');',
'    end if;',
'    APEX_COLLECTION.ADD_MEMBER (',
'        p_collection_name => ''COLL_DETALLE_PAGOS''',
'       ,p_c001 => NULL',
'       ,p_c002 => NULL',
'       ,p_c003 => NULL',
'       ,p_c004 => to_char(:P87_FORMA_PAGO)',
'       ,p_c005 => to_char(:P87_MONEDA)',
'       ,p_c006 => to_char(:P87_BANCO)',
'       ,p_c007 => to_char(:P87_EMISOR_TARJ)',
'       ,p_c008 => to_char(:P87_NUMERO_COMPOBANTE)',
'       ,p_c009 => :P87_FECHA_EMISION',
'       ,p_c010 => :P87_FECHA_COBRO',
'       ,p_c011 => to_number(:P87_IMPORTE,''999G999G999D99'')',
'       ,p_c012 => nvl(to_number(:P87_SALDO,''999G999G999D99''),0)',
'       ,p_c013 => ''ACTIVO''',
'       ,p_c014 => :P87_TIPO_FORMA_PAGO',
'       ,p_c015 => to_number(:P87_IMPORTE,''999G999G999D99'')',
'       ,p_c016 => to_number(:P87_VALOR_AL_COBRO,''999G999G999D99'')',
'            );',
'    :P87_FORMA_PAGO         := NULL;',
'    :P87_BANCO              := NULL;',
'    :P87_EMISOR_TARJ        := NULL;',
'    :P87_NUMERO_COMPOBANTE  := NULL;',
'    :P87_FECHA_EMISION      := NULL;',
'    :P87_FECHA_COBRO        := NULL;',
'    :P87_IMPORTE            := NULL;',
'    :P87_SALDO              := NULL;',
'    :P87_TIPO_FORMA_PAGO    := NULL;',
'    :P87_VALOR_AL_COBRO     := NULL;',
'',
'end;'))
,p_attribute_02=>'P87_FORMA_PAGO,P87_MONEDA,P87_BANCO,P87_EMISOR_TARJ,P87_NUMERO_COMPOBANTE,P87_FECHA_EMISION,P87_FECHA_COBRO,P87_IMPORTE,P87_SALDO,P87_TIPO_FORMA_PAGO,P87_VALOR_AL_COBRO'
,p_attribute_03=>'P87_FORMA_PAGO,P87_BANCO,P87_EMISOR_TARJ,P87_NUMERO_COMPOBANTE,P87_FECHA_EMISION,P87_FECHA_COBRO,P87_IMPORTE,P87_SALDO,P87_TIPO_FORMA_PAGO,P87_VALOR_AL_COBRO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92193263985841534)
,p_event_id=>wwv_flow_imp.id(92191813009841533)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#P87_MONEDA").prop( ''readOnly'', true);'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92192736200841534)
,p_event_id=>wwv_flow_imp.id(92191813009841533)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(108116240812812368)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92194629024841535)
,p_name=>unistr('Bot\00F3n limpiar eliminados')
,p_event_sequence=>220
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P87_ID_PAGO'
,p_security_scheme=>wwv_flow_imp.id(89923600056527918)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92195177397841535)
,p_event_id=>wwv_flow_imp.id(92194629024841535)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.FOS.INTERACTIVE_GRID_ADD_BUTTON'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(108116240812812368)
,p_attribute_01=>'toolbar-actions4'
,p_attribute_02=>'first'
,p_attribute_05=>'Limpiar registros eliminados'
,p_attribute_07=>'save'
,p_attribute_09=>'do-nothing'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92216810172841545)
,p_name=>'Verificar facturas'
,p_event_sequence=>230
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(107590606720706095)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusin'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92217293183841545)
,p_event_id=>wwv_flow_imp.id(92216810172841545)
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
'    if to_number(:P87_MONTO_FACTURAS,''999G999G999D99'') = 0 then',
'        raise_application_error(-20000,''Seleccione cuotas/facturas para realizar el cobro.'');',
'    end if;',
'end;'))
,p_attribute_02=>'P87_MONTO_FACTURAS'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92196493314841535)
,p_name=>'Habilitar'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_HABILITAR_GUARDAR'
,p_condition_element=>'P87_HABILITAR_GUARDAR'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SI'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92196962535841536)
,p_event_id=>wwv_flow_imp.id(92196493314841535)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(92141815865841476)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92197486041841536)
,p_event_id=>wwv_flow_imp.id(92196493314841535)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(92141815865841476)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92197926268841536)
,p_event_id=>wwv_flow_imp.id(92196493314841535)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#REG_AGREGAR.a-Collapsible.is-collapsed'').removeClass(''is-collapsed'').addClass(''is-expanded'');',
'$(''#REG_AGREGAR.a-Collapsible .a-Collapsible-content'').show();'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92198439240841536)
,p_event_id=>wwv_flow_imp.id(92196493314841535)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#REG_AGREGAR.a-Collapsible.is-expanded'').removeClass(''is-expanded'').addClass(''is-collapsed'');',
'$(''#REG_AGREGAR.a-Collapsible .a-Collapsible-content'').show();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92195584331841535)
,p_name=>'Verifica para habilitar GUARDAR'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_DIFERENCIA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92196040478841535)
,p_event_id=>wwv_flow_imp.id(92195584331841535)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if to_number(:P87_MONTO_FACTURAS,''999G999G999D99'') > 0 and to_number(:P87_DIFERENCIA,''999G999G999D99'') = 0 then',
'        :P87_HABILITAR_GUARDAR := ''SI'';',
'    else',
'        :P87_HABILITAR_GUARDAR := ''NO'';',
'    end if;',
'end;',
''))
,p_attribute_02=>'P87_MONTO_FACTURAS,P87_DIFERENCIA'
,p_attribute_03=>'P87_HABILITAR_GUARDAR'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92208023189841541)
,p_name=>'Ver'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_MONEDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92208602305841541)
,p_event_id=>wwv_flow_imp.id(92208023189841541)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Show P87_VALOR_AL_COBRO'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_VALOR_AL_COBRO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92207203740841541)
,p_name=>'Activar buscar change'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_ENT_ID_ENTIDAD'
,p_condition_element=>'P87_ENT_ID_ENTIDAD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92207669699841541)
,p_event_id=>wwv_flow_imp.id(92207203740841541)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(92142886723841477)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92215002521841544)
,p_name=>'Activar buscar lose'
,p_event_sequence=>270
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_ENT_ID_ENTIDAD'
,p_condition_element=>'P87_ENT_ID_ENTIDAD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92215504139841545)
,p_event_id=>wwv_flow_imp.id(92215002521841544)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(92142886723841477)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92200286460841537)
,p_name=>'Buscar TCambio'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_MONEDA'
,p_condition_element=>'P87_MONEDA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92201810037841538)
,p_event_id=>wwv_flow_imp.id(92200286460841537)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_compra moneda.tc_compra%type;',
'v_venta  moneda.tc_venta%type;',
'begin ',
'    p_devuelve_tipo_cambio ( P_FECHA     => to_date(:P87_FECHA,''dd/mm/yyyy hh24:mi'')',
'                            ,P_ID_MONEDA => :P87_MONEDA_DEUDA',
'                            ,P_COMPRA    => v_compra',
'                            ,P_VENTA     => v_venta',
'    );',
'    if :P87_MONEDA_DEUDA != :P87_MONEDA then ',
'        if :APP_ID_MONEDA_PRINCIPAL != :P87_MONEDA_DEUDA then',
'            :P87_T_CAMBIO := v_venta;',
'        else',
'            :P87_T_CAMBIO := v_compra;',
'        end if;',
'    else',
'        :P87_T_CAMBIO := 1;',
'    end if;',
'end;'))
,p_attribute_02=>'P87_FECHA,P87_MONEDA_DEUDA,P87_MONEDA,APP_ID_MONEDA_PRINCIPAL'
,p_attribute_03=>'P87_T_CAMBIO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92200719734841538)
,p_event_id=>wwv_flow_imp.id(92200286460841537)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Hide P87_VALOR_AL_COBRO'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_VALOR_AL_COBRO'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item("P87_MONEDA_DEUDA").getValue() == apex.item("P87_MONEDA").getValue()'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92201264448841538)
,p_event_id=>wwv_flow_imp.id(92200286460841537)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_FORMA_PAGO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92202194024841538)
,p_name=>'Obtener valor cobro_lose'
,p_event_sequence=>290
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_IMPORTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92202677468841539)
,p_event_id=>wwv_flow_imp.id(92202194024841538)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if to_number(nvl(:P87_SALDO,0),''999G999G999D99'') > 0 then',
'    if to_number(:P87_SALDO,''999G999G999D99'') < to_number(:P87_IMPORTE,''999G999G999D99'') then',
'        raise_application_error(-20000,''El valor a cobrar no puede ser superior al saldo del doc. de cobro.'');',
'    end if;',
'end if;',
'if :P87_MONEDA_DEUDA != :P87_MONEDA then',
'    if :P87_MONEDA_DEUDA = :APP_ID_MONEDA_PRINCIPAL then',
'        :P87_VALOR_AL_COBRO := round(to_number(:P87_IMPORTE,''999G999G999D99'') * to_number(:P87_T_CAMBIO,''999G999D99''),0);',
'    else',
'        :P87_VALOR_AL_COBRO := round(to_number(:P87_IMPORTE,''999G999G999D99'') / to_number(:P87_T_CAMBIO,''999G999D99''),2);',
'    end if;',
'else',
'  :P87_VALOR_AL_COBRO := to_number(:P87_IMPORTE,''999G999G999D99'');',
'end if;'))
,p_attribute_02=>'P87_MONEDA,P87_MONEDA_DEUDA,P87_T_CAMBIO,P87_IMPORTE'
,p_attribute_03=>'P87_VALOR_AL_COBRO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92206298158841540)
,p_name=>'Obtener valor cobro_change'
,p_event_sequence=>300
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_IMPORTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92206765739841541)
,p_event_id=>wwv_flow_imp.id(92206298158841540)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if to_number(nvl(:P87_SALDO,0),''999G999G999D99'') > 0 then',
'    if to_number(:P87_SALDO,''999G999G999D99'') < to_number(:P87_IMPORTE,''999G999G999D99'') then',
'        raise_application_error(-20000,''El valor a cobrar no puede ser superior al saldo del doc. de cobro.'');',
'    end if;',
'end if;',
'if :P87_MONEDA_DEUDA != :P87_MONEDA then',
'    if :P87_MONEDA_DEUDA = :APP_ID_MONEDA_PRINCIPAL then',
'        :P87_VALOR_AL_COBRO := round(to_number(:P87_IMPORTE,''999G999G999D99'') * to_number(:P87_T_CAMBIO,''999G999D99''),0);',
'    else',
'        :P87_VALOR_AL_COBRO := round(to_number(:P87_IMPORTE,''999G999G999D99'') / to_number(:P87_T_CAMBIO,''999G999D99''),2);',
'    end if;',
'else',
'  :P87_VALOR_AL_COBRO := to_number(:P87_IMPORTE,''999G999G999D99'');',
'end if;'))
,p_attribute_02=>'P87_MONEDA,P87_MONEDA_DEUDA,P87_T_CAMBIO,P87_IMPORTE'
,p_attribute_03=>'P87_VALOR_AL_COBRO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92203113030841539)
,p_name=>'Set moneda formas pago'
,p_event_sequence=>310
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_DESCRI_MONEDA_DEUDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92203546259841539)
,p_event_id=>wwv_flow_imp.id(92203113030841539)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.item("P87_MONEDA").setValue( apex.item("P87_MONEDA_DEUDA").getValue(),apex.item("P87_DESCRI_MONEDA_DEUDA").getValue() );'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92204039856841539)
,p_event_id=>wwv_flow_imp.id(92203113030841539)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(107329305851400167)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92205377401841540)
,p_name=>'Obtener moneda deuda'
,p_event_sequence=>320
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(107590386392706093)
,p_condition_element_type=>'ITEM'
,p_condition_element=>'P87_ENT_ID_ENTIDAD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92205859504841540)
,p_event_id=>wwv_flow_imp.id(92205377401841540)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_cantidad number;',
'begin',
'    :P87_DESCRI_MONEDA_DEUDA := NULL;',
'    SELECT count(distinct a.c005) mon_id_moneda',
'    INTO v_cantidad',
'    FROM apex_collections a',
'    WHERE a.collection_name = ''COLL_DETALLE_PENDIENTES''',
'    AND a.c012 = ''SI'';',
'    if v_cantidad > 1 then',
unistr('        raise_application_error(-20000,''Seleccion\00F3 cuotas/facturas con distintas monedas, favor solo selecione deudas con la misma moneda por cobranza.'');'),
'    elsif v_cantidad = 1 then',
'        SELECT a.c005 mon_id_moneda',
'        INTO :P87_MONEDA_DEUDA',
'        FROM apex_collections a',
'        WHERE a.collection_name = ''COLL_DETALLE_PENDIENTES''',
'        AND a.c012 = ''SI''',
'        FETCH FIRST 1 ROW ONLY;',
'    else',
'        :P87_MONEDA_DEUDA := NULL;',
'    end if;',
'    if :P87_MONEDA is null then ',
'        select m.descripcion',
'        into :P87_DESCRI_MONEDA_DEUDA',
'        from moneda m',
'        where m.id_moneda = :P87_MONEDA_DEUDA;',
'    end if ;',
'exception',
'    when no_data_found then ',
'        null;    ',
'end;'))
,p_attribute_02=>'P87_MONEDA'
,p_attribute_03=>'P87_MONEDA_DEUDA,P87_DESCRI_MONEDA_DEUDA'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92208987398841542)
,p_name=>'Buscar doc con saldo'
,p_event_sequence=>330
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_NUMERO_COMPOBANTE'
,p_condition_element=>'P87_NUMERO_COMPOBANTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P87_ID_PAGO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92209423712841542)
,p_event_id=>wwv_flow_imp.id(92208987398841542)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_importe number;',
'begin ',
'    if :P87_TIPO_FORMA_PAGO in (''TC'',''TD'',''CH'',''DE'') then ',
'        v_importe := to_number(:P87_IMPORTE,''999G999G999D99'');',
'        p_buscar_documento_cobro (',
'           P_TIPO_TRANSACCION        => ''COBRO''',
'          ,P_NRO_COMPROBANTE         => :P87_NUMERO_COMPOBANTE',
'          ,P_FOR_ID_FORMA_PAGO       => :P87_FORMA_PAGO',
'          ,P_MON_ID_MONEDA           => :P87_MONEDA',
'          ,P_BAN_ID_BANCO            => :P87_BANCO',
'          ,P_EMI_ID_EMISOR_TARJETA   => :P87_EMISOR_TARJ',
'          ,P_FECHA_EMISION           => :P87_FECHA_EMISION',
'          ,P_FECHA_COBRO             => :P87_FECHA_COBRO',
'          ,P_IMPORTE                 => v_importe',
'          ,P_SALDO                   => :P87_SALDO',
'        );',
'        if v_importe is not null then',
'          :P87_IMPORTE := v_importe;',
'        end if;',
'    end if;',
'end;  '))
,p_attribute_02=>'P87_NUMERO_COMPOBANTE,P87_FORMA_PAGO,P87_MONEDA,P87_BANCO,P87_EMISOR_TARJ,P87_TIPO_FORMA_PAGO'
,p_attribute_03=>'P87_FECHA_EMISION,P87_FECHA_COBRO,P87_IMPORTE,P87_SALDO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(86451508912289650)
,p_name=>'AgregarRecibo'
,p_event_sequence=>340
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(86451205523289647)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(86451557673289651)
,p_event_id=>wwv_flow_imp.id(86451508912289650)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'agregarRecibo()'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92164622423841506)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(108116240812812368)
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
,p_internal_uid=>18431603359834766
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92172581087841521)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar pago'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    p_guarda_pago_compra (',
'        P_ID_PAGO                 => :P87_ID_PAGO',
'       ,P_SUC_ID_SUCURSAL         => :P87_SUC_ID_SUCURSAL',
'       ,P_FECHA                   => to_date(to_char(CURRENT_DATE,''dd/mm/yyyy hh24:mi:ss''),''dd/mm/yyyy hh24:mi:ss'')',
'       ,P_ENT_ID_ENTIDAD          => :P87_ID_ENTIDAD_GUARDAR',
'       ,P_MON_ID_MONEDA           => :P87_MONEDA',
'       ,P_TIPO_CAMBIO             => :P87_T_CAMBIO',
'       ,P_ESTADO                  => ''ACTIVO''',
'       ,P_REN_ID_RENDICION_CAJA   => :P87_REN_ID_RENDICION_CAJA',
'               );',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Cobro generado correctamente. Doc. Nro. &P87_NRO_COMPROBANTE.'
,p_internal_uid=>18439562023834781
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92173394146841522)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Anular'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    p_anular_pago_compra (P_ID_PAGO => :P87_ID_PAGO);',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ANULAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>unistr('Anulaci\00F3n realizada correctamente.')
,p_internal_uid=>18440375082834782
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92171751673841521)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>18438732609834781
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92139494958841472)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(107567931725704263)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear cobro a factura'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>18406475894834732
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92172120714841521)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valores iniciales'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_compra moneda.tc_compra%type;',
'v_venta  moneda.tc_venta%type;',
'begin ',
'    apex_collection.create_or_truncate_collection(p_collection_name=>''COLL_DETALLE_PENDIENTES'');',
'    apex_collection.create_or_truncate_collection(p_collection_name=>''COLL_DETALLE_PAGOS'');',
'    if :P87_ID_PAGO is null then ',
'        begin',
'            SELECT e.suc_id_sucursal ',
'            INTO :P87_SUC_ID_SUCURSAL',
'            FROM entidad e',
'            WHERE e.id_entidad = f_id_entidad(v(''APP_USER''))',
'            AND e.estado = ''ACTIVO''',
'            ;',
'            :P87_DISPLAY_SUCURSAL := :P87_SUC_ID_SUCURSAL;',
'        exception',
'            when no_data_found then ',
'                raise_application_error(-20000,''NO SE IDENTIFICA SUCURSAL DEL USUARIO, FAVOR SOLICITAR VERIFICACION...'');    ',
'        end;',
'        begin ',
'            SELECT r.id_rendicion_caja',
'            INTO :P87_REN_ID_RENDICION_CAJA',
'            FROM rendicion_caja r',
'            WHERE r.ent_id_entidad = f_id_entidad(v(''APP_USER''))',
'            AND trunc(current_date) BETWEEN r.fecha_desde AND r.fecha_hasta ',
'            AND r.estado = ''ABIERTO''  ',
'            ;',
'        exception ',
'            when no_data_found then ',
'                :P87_REN_ID_RENDICION_CAJA := null;    ',
'        end;        ',
'    end if;',
'    :P87_FECHA := to_char(current_date,''DD/MM/YYYY HH24:MI'');',
'    :P87_DISPLAY_SUCURSAL := :P87_SUC_ID_SUCURSAL;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>18439101650834781
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92173004775841522)
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
'    INTO :P87_MONTO_DE_COBRANZA',
'    FROM det_cobro c',
'    WHERE c.cob_id_cobro = :P87_ID_PAGO;',
'    ',
'  v_select := q''[',
'SELECT c.fecha_factura',
'      ,c.tip_id_tipo_comprobante',
'      ,c.condicion_compra',
'      ,c.nro_factura',
'      ,c.mon_id_moneda',
'      ,dc.id_detalle_cuenta',
'      ,dc.item',
'      ,dc.fecha_vencimiento',
'      ,dc.importe',
'      ,NULL saldo',
'      ,d.importe pagar',
'      ,''SI'' seleccion',
'FROM det_pago d',
'    ,det_cuenta_compra dc',
'    ,cab_factura_compra c',
'WHERE d.pag_id_pago = ]''||:P87_ID_PAGO||q''[',
'AND dc.id_detalle_cuenta = d.det_id_detalle_cuenta',
'AND c.id_factura_compra = dc.fac_id_factura_compra ',
'ORDER BY dc.fecha_vencimiento]''',
' ;',
'    P_CARGA_COLECCION (',
'      P_SELECT     => v_select',
'     ,P_COLLECTION => ''COLL_DETALLE_PENDIENTES''',
'     );',
'',
'  v_select_fc := q''[',
'SELECT',
' t.id_transaccion',
',t.tipo_transaccion',
',t.fecha_transaccion',
',t.for_id_forma_pago',
',t.mon_id_moneda',
',t.ban_id_banco',
',t.emi_id_emisor_tarjeta',
',t.nro_comprobante',
',t.fecha_emision',
',t.fecha_cobro',
',t.importe',
',NULL saldo',
',t.estado',
',NULL tipo_forma_pago',
',NULL sumar_forma_pago',
',df.valor_moneda_factura',
'FROM det_formas_pago df',
'    ,transaccion t',
'WHERE df.pag_id_pago = ]''||:P87_ID_PAGO||q''[',
'AND t.id_transaccion = df.tran_id_transaccion',
'AND t.estado = ''ACTIVO'']''',
';',
'    P_CARGA_COLECCION (',
'      P_SELECT     => v_select_fc',
'     ,P_COLLECTION => ''COLL_DETALLE_PAGOS''',
'    );',
'    select sum(to_number(d.importe))',
'    into :P87_MONTO_DE_COBRANZA',
'    from det_pago d',
'    where d.pag_id_pago = :P87_ID_PAGO;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P87_ID_PAGO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>18439985711834782
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(86451712458289652)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'obtener_tipo_doc'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'BEGIN',
'    BEGIN',
'        SELECT t.id_tipo_comprobante, t.descripcion',
'        INTO :P87_P_TIPO_DOCUMENTO, :P87_P_DESCRIP_DOCUMENTO ',
'        FROM tipo_comprobante t',
'        WHERE t.estado = ''ACTIVO''',
'        AND t.pago = ''SI''',
'        FETCH FIRST 1 ROW ONLY;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            :P87_P_TIPO_DOCUMENTO   := NULL;',
'            :P87_P_DESCRIP_DOCUMENTO:= NULL;',
'    END;',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P87_P_TIPO_DOCUMENTO'', :P87_P_TIPO_DOCUMENTO);',
'    output_json_item(''P87_P_DESCRIP_DOCUMENTO'', :P87_P_DESCRIP_DOCUMENTO);',
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
,p_internal_uid=>12718693394282912
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(86452321933289659)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'actualiza_rec'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'BEGIN',
'    if :P87_R_NRO_RECIBO is null then ',
'        raise_application_error(-20000,''Debe ingresar nro. de recibo'');',
'    end if;',
'    if :P87_R_TIPO_COMPROBANTE is null then',
'        raise_application_error(-20000,''Tipo de comprobante se debe seleccionar.'');',
'    end if;',
'    update cab_pago c',
'    set c.tip_id_tipo_comprobante = :P87_R_TIPO_COMPROBANTE',
'       ,c.nro_comprobante = :P87_R_NRO_RECIBO',
'    where c.id_pago = :P87_P_ID_PAGO;',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
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
,p_internal_uid=>12719302869282919
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(89845490954773241)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ver_PDF'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'vl_vNomReporte VARCHAR2(255);',
'BEGIN',
'    vl_vNomReporte := ''ORDEN_PAGO_PROV'';',
'    pkg_jasperreports_server.descarga_reporte(p_vNomReporte  => vl_vNomReporte,',
'                                              p_aNomParams   => apex_util.string_to_table(''P_ID_ORDEN''),',
'                                              p_aValParams   => apex_util.string_to_table( apex_application.g_x01 ));',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>16112471890766501
);
wwv_flow_imp.component_end;
end;
/
