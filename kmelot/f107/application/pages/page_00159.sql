prompt --application/pages/page_00159
begin
--   Manifest
--     PAGE: 00159
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
 p_id=>159
,p_name=>unistr('Productos a facturar - licitaci\00F3n')
,p_alias=>unistr('PRODUCTOS-A-FACTURAR-LICITACI\00D3N')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Productos a facturar - licitaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function irFactura() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors();',
'    apex.server.process("url_factura", {',
'        pageItems: ["P159_P_ID_LICITACION"',
'                    ,"P159_ORDEN_COMPRA"]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                window.open(data.url_factura, ''_blank'');',
'                setTimeout(function(){',
'                    apex.navigation.dialog.close(true,{dialogPageId: 159})',
'                },250)',
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
'',
'(function($) {',
'    /**',
unistr('     * Parsea un valor num\00E9rico de un string, considerando separadores de miles ''.'' y decimales '',''.'),
'     * @param {string|number|null|undefined} value El valor a parsear.',
unistr('     * @returns {number} El n\00FAmero parseado o 0 si el valor es inv\00E1lido.'),
'     */',
'    function parseCurrency(value) {',
'        console.log(''antes ''+value);',
'        if (value === null || value === undefined) {',
'            return 0;',
'        }',
'        let strValue = String(value);',
'        if (typeof strValue === ''string'') {',
'            strValue = strValue.replace(/\./g, '''').replace('','', ''.'');',
'        }',
'        const num = parseFloat(strValue);',
'        console.log(''despues ''+num);',
'        return isNaN(num) ? 0 : num;',
'    }',
'    function update(model) {',
'        const montoKey = model.getFieldKey("MONTO");',
'',
'        let total = 0;',
'',
'        console.log(">> starting sum MONTO column");',
'',
'        model.forEach(function(record, index, id) {',
'            const meta = model.getRecordMetadata(id);',
'',
'            if (!meta.deleted && !meta.agg) {',
'                const monto = parseCurrency(record[montoKey]);',
'                total += monto;',
'            }',
'        });',
'        const format = (num) => num.toFixed(0); //decimales',
'        console.log(`>> setting total - TOTAL: ${format(total)}`);',
'        try {',
'            $s("P159_TOTAL", format(total));',
'        } catch (e) {',
'            console.error("Error al actualizar items:", e);',
'        }',
'    }',
'    $(function() {',
'        $("#REG_DETALLE").on("interactivegridviewmodelcreate", function(event, ui) {',
'            const model = ui.model;',
'            if (ui.viewId === "grid") {',
'                model.subscribe({',
'                    onChange: function(type, change) {',
'                        console.log(">> model changed ", type, change);',
'                        if (type === "set") {',
'                            if (change.field === "MONTO") {',
'                                update(model);',
'                            }',
'                        } else if (type !== "move" && type !== "metaChange") {',
'                            update(model);',
'                        }',
'                    },',
'                    progressView: $("#P159_TOTAL")',
'                });',
'                update(model);',
'                model.fetchAll(function() {});',
'            }',
'        });',
'    });',
'})(apex.jQuery);'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function() {',
'    // Esperar a que el Interactive Grid se inicialice',
'    setTimeout(function() {',
'        var ig$ = apex.region("REG_DETALLE").widget().interactiveGrid("getActions");',
'        if (ig$) {',
'            ig$.set("edit", true);',
'        }',
'    }, 500);',
'});',
''))
,p_css_file_urls=>'#WORKSPACE_IMAGES#template-floating-minimalista.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.text-dark {',
'    color:black !important;',
'    opacity: 1 !important;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(147397159449953353)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>30
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(150023891277189232)
,p_plug_name=>unistr('Productos a facturar - licitaci\00F3n')
,p_region_name=>'REG_DETALLE'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_REGISTRO_TMP,',
'       ID_DET_LICITACION,',
'       FECHA_INSERT,',
'       LIC_ID_LICITACION,',
'       NUMERO,',
'       PRODUCTO_CODIGO,',
'       PRODUCTO_NOMBRE_CATALOGO,',
'       PRODUCTO_NOMBRE_CONVOCANTE,',
'       PRECIO_UNITARIO,',
'       CANTIDAD,',
'       CANTIDAD_ORIGINAL,',
'       MONTO,',
'       MONEDA,',
'       UNIDAD_MEDIDA,',
'       DEP_ID_DEPOSITO,',
'       LOTE',
'  from LICITA_DET_PROD_TMP_VENTA',
' where LIC_ID_LICITACION = :P159_P_ID_LICITACION ',
' and DET_ID_DET_FACTURA_VENTA is null'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P159_P_ID_LICITACION'
,p_prn_page_header=>unistr('Productos a facturar - licitaci\00F3n')
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(147293433571213487)
,p_name=>'LOTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOTE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Lote'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'center',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(147397411761953355)
,p_name=>'CANTIDAD_ORIGINAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD_ORIGINAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(147399635514953378)
,p_name=>'DEP_ID_DEPOSITO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEP_ID_DEPOSITO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Dep\00F3sito ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(207000662853696875)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150025149386189238)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150025675975189238)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Actions'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150026682250189241)
,p_name=>'ID_REGISTRO_TMP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_REGISTRO_TMP'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150027665687189242)
,p_name=>'ID_DET_LICITACION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DET_LICITACION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150028719097189244)
,p_name=>'FECHA_INSERT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_INSERT'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150029671880189245)
,p_name=>'LIC_ID_LICITACION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LIC_ID_LICITACION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Licitaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150030662956189245)
,p_name=>'NUMERO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUMERO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Nro.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150031719322189245)
,p_name=>'PRODUCTO_CODIGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRODUCTO_CODIGO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Producto c\00F3digo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150032650454189246)
,p_name=>'PRODUCTO_NOMBRE_CATALOGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRODUCTO_NOMBRE_CATALOGO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Nombre cat\00E1logo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150033711046189247)
,p_name=>'PRODUCTO_NOMBRE_CONVOCANTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRODUCTO_NOMBRE_CONVOCANTE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nombre convocante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150034691873189247)
,p_name=>'PRECIO_UNITARIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRECIO_UNITARIO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Precio unitario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150035652845189248)
,p_name=>'CANTIDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150036631646189248)
,p_name=>'MONTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MONTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Monto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_static_id=>'MONTO'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150037695164189248)
,p_name=>'MONEDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MONEDA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Moneda'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>3
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(150038700482189249)
,p_name=>'UNIDAD_MEDIDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIDAD_MEDIDA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Unidad medida'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(143778353299371777)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(150024373996189235)
,p_internal_uid=>30790848424533097
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
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
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(150024811736189235)
,p_interactive_grid_id=>wwv_flow_imp.id(150024373996189235)
,p_static_id=>'307913'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(150024943382189236)
,p_report_id=>wwv_flow_imp.id(150024811736189235)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150026075868189239)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(150025675975189238)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150027121146189241)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(150026682250189241)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150028026746189242)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(150027665687189242)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150029088413189244)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(150028719097189244)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150030064184189245)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(150029671880189245)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150031071840189245)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(150030662956189245)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>55
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150032062156189246)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(150031719322189245)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150033117306189246)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(150032650454189246)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>388
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150034121847189247)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(150033711046189247)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>251
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150035037209189247)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(150034691873189247)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150036115189189248)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(150035652845189248)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150037120169189248)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(150036631646189248)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150038093436189249)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(150037695164189248)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>59
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150039040981189249)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(150038700482189249)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(150819817570373675)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(147397411761953355)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(151971414200982533)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(147399635514953378)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(153766666713194684)
,p_view_id=>wwv_flow_imp.id(150024943382189236)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(147293433571213487)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>55
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(147398986899953371)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(150023891277189232)
,p_button_name=>'BTN_CARGAR'
,p_button_static_id=>'BTN_CARGAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Cargar art\00EDculos pendientes')
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_column=>5
,p_security_scheme=>wwv_flow_imp.id(208262437230142561)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(147399549079953377)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(150023891277189232)
,p_button_name=>'BTN_FACTURAR'
,p_button_static_id=>'BTN_FACTURAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Facturar'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_column=>8
,p_security_scheme=>wwv_flow_imp.id(208262437230142561)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(147399218920953373)
,p_branch_name=>'Volver a cargar'
,p_branch_action=>'f?p=&APP_ID.:159:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147290258811213455)
,p_name=>'P159_P_ID_FACTURA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(147397159449953353)
,p_prompt=>'P Id Factura'
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
 p_id=>wwv_flow_imp.id(147397237405953354)
,p_name=>'P159_P_ID_LICITACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(150023891277189232)
,p_prompt=>unistr('Licitaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_LICITACIONES_ALL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT l.id_licitacion AS r',
'      ,l.nro_licitacion||'' CC: ''||l.codigo_contratacion||'' ''||l.convocante AS d',
'FROM licitacion l'))
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147398578447953367)
,p_name=>'P159_TOTAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(150023891277189232)
,p_prompt=>'Total a facturar'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_grid_column=>11
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147400001213953381)
,p_name=>'P159_ORDEN_COMPRA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(150023891277189232)
,p_prompt=>'Orden de compra'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(147396926794953351)
,p_name=>'Set monto'
,p_event_sequence=>10
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(150023891277189232)
,p_triggering_element=>'CANTIDAD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(147398334458953365)
,p_event_id=>wwv_flow_imp.id(147396926794953351)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'MONTO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(147397123177953352)
,p_event_id=>wwv_flow_imp.id(147396926794953351)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'MONTO'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
':MONTO := to_number(:CANTIDAD,''999g999g999d99'') * to_number(:PRECIO_UNITARIO,''999g999g999d99'');',
'return :MONTO;'))
,p_attribute_07=>'CANTIDAD,PRECIO_UNITARIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(147398490400953366)
,p_event_id=>wwv_flow_imp.id(147396926794953351)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'MONTO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(147399309912953374)
,p_name=>'Cargar'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(147398986899953371)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(147399360965953375)
,p_event_id=>wwv_flow_imp.id(147399309912953374)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Se eliminaran los registros temporales que esten actualmente.'
,p_attribute_02=>'Seguir'
,p_attribute_03=>'warning'
,p_attribute_04=>'fa-warning'
,p_attribute_06=>'Seguir'
,p_attribute_07=>'Cancelar'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(147399488709953376)
,p_event_id=>wwv_flow_imp.id(147399309912953374)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CARGAR'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(147289656973213449)
,p_name=>'Facturar con OC'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(147399549079953377)
,p_condition_element=>'P159_ORDEN_COMPRA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(147289731135213450)
,p_event_id=>wwv_flow_imp.id(147289656973213449)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('\00BFDesea generar la factura sobre los registros seleccionados?')
,p_attribute_02=>'Facturar'
,p_attribute_03=>'warning'
,p_attribute_04=>'fa-warning'
,p_attribute_06=>'FACTURAR'
,p_attribute_07=>'CANCELAR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(147290402962213456)
,p_event_id=>wwv_flow_imp.id(147289656973213449)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'irFactura()'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(147400072472953382)
,p_name=>'Facturar sin OC'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(147399549079953377)
,p_condition_element=>'P159_ORDEN_COMPRA'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(147400132098953383)
,p_event_id=>wwv_flow_imp.id(147400072472953382)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('\00BFDesea generar la factura SIN REGISTRAR el n\00FAmero de ORDEN DE COMPRA?')
,p_attribute_02=>'Facturar'
,p_attribute_03=>'warning'
,p_attribute_04=>'fa-warning'
,p_attribute_06=>'FACTURAR'
,p_attribute_07=>'CANCELAR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(147400249237953384)
,p_event_id=>wwv_flow_imp.id(147400072472953382)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'irFactura()'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(147399124902953372)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre cargar'
,p_process_sql_clob=>'pkg_licitacion.p_cargar_pendientes(pi_id_licitacion => :P159_P_ID_LICITACION);'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CARGAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>28165599331297234
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(150039712716189252)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(150023891277189232)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Productos a facturar - licitaci\00F3n - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>30806187144533114
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(147290147767213454)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'url_factura'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_url   varchar2(1000);',
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
'    pkg_licitacion.p_cargar_venta(pi_id_licitacion => :P159_P_ID_LICITACION, pi_orden_compra => :P159_ORDEN_COMPRA, po_id_factura => :P159_P_ID_FACTURA);',
'    v_url := apex_page.get_url(',
'        p_page   => 68,',
'        p_items  => ''P68_ID_FACTURA_VENTA'',',
'        p_values => :P159_P_ID_FACTURA,',
'        p_plain_url => TRUE  -- URL absoluta',
'    );',
'  apex_json.open_object;',
'  apex_json.write(''success'', TRUE);',
'  apex_json.write(''url_factura'', v_url);',
'  apex_json.close_object;  ',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>28056622195557316
);
wwv_flow_imp.component_end;
end;
/
