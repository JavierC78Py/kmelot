prompt --application/pages/page_00059
begin
--   Manifest
--     PAGE: 00059
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
 p_id=>59
,p_name=>'Crear/Editar factura compra'
,p_alias=>'CREAR-EDITAR-FACTURA-COMPRA'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear/Editar factura compra'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#mascara_fecha#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function($) {',
'    function update(model) {',
'        var salKey = model.getFieldKey("SOLO_TOTAL"),',
'            total = 0;',
'',
'        console.log(">> starting sum TOTAL column")',
'        model.forEach(function(record, index, id) {',
'            var sal = parseFloat(record[salKey]), ',
'                meta = model.getRecordMetadata(id);',
'',
'            if (!isNaN(sal) && !meta.deleted && !meta.agg) {',
'                total += sal;',
'            }',
'        });',
'        console.log(">> setting sum TOTAL column to " + total)',
'        $s("P59_MONTO", total);',
'        $s("P59_MONTO_FACTURA", total);',
'        console.log( "P59_MONTO_FACTURA >>" + apex.item("P59_MONTO_FACTURA").getValue() );',
'    }',
'    $(function() {',
'        $("#GRID_DETALLE").on("interactivegridviewmodelcreate", function(event, ui) {',
'            var sid,',
'                model = ui.model;',
'            if ( ui.viewId === "grid" ) {',
'                sid = model.subscribe( {',
'                    onChange: function(type, change) {',
'                        console.log(">> model changed ", type, change);',
'                        if ( type === "set" ) {',
'                             if (change.field === "SOLO_TOTAL" ) {',
'                                update( model );',
'                            }',
'                        } else if (type !== "move" && type !== "metaChange") {',
'                          update( model );',
'                        }',
'                    },',
'                    progressView: $("#P59_MONTO") ',
'                } );',
'                 update( model );           ',
'                model.fetchAll(function() {});',
'            }',
'        });',
'    });',
'})(apex.jQuery);',
'(function($) {',
'    function update(model) {',
'        var salKey = model.getFieldKey("SALDO"),',
'            total = 0;',
'        console.log(">> starting sum SALDO column")',
'        model.forEach(function(record, index, id) {',
'            var sal = parseFloat(record[salKey]), ',
'                meta = model.getRecordMetadata(id);',
'            if (!isNaN(sal) && !meta.deleted && !meta.agg) {',
'                total += sal;',
'            }',
'        });',
'        console.log(">> setting sum SALDO column to " + total)',
'        $s("P59_MONTO_CUOTAS", total);',
'    }',
'',
'    $(function() {',
'        $("#REG_CUOTAS").on("interactivegridviewmodelcreate", function(event, ui) {',
'            var sid,',
'                model = ui.model;',
'            if ( ui.viewId === "grid" ) {',
'                sid = model.subscribe( {',
'                    onChange: function(type, change) {',
'                        console.log(">> model changed ", type, change);',
'                        if ( type === "set" ) {',
'                             if (change.field === "SALDO" ) {',
'                                update( model );',
'                            }',
'                        } else if (type !== "move" && type !== "metaChange") {',
'                          update( model );',
'                        }',
'                    },',
'                    progressView: $("#P59_MONTO_CUOTAS") ',
'                } );',
'                 update( model );           ',
'                model.fetchAll(function() {});',
'            }',
'        });',
'',
'    });',
'})(apex.jQuery);'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P59_MONTO").prop( ''readOnly'', true);',
'$("#P59_SALDO").prop( ''readOnly'', true);',
'$(''#P59_MONTO_CUOTAS'').prop(''readonly'', true);',
'$(''#P59_MONTO_FACTURA'').prop(''readonly'', true);',
'mascaraFechaRegex("#P59_FECHA_FACTURA");',
'mascaraFechaRegex("#P59_FECHA_VENCIMIENTO");',
'mascaraFechaRegex("#P59_VTO_TIMBRADO");',
''))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#btn_agregar_entidad,#btn_calcular, #btn_regresar, #BTN_VER_CUOTAS {    ',
'    margin-top: 17px;',
'    }',
'',
'.text-dark {',
'    color:rgb(107, 100, 100) !important;',
'    opacity: 1 !important;',
'}',
'',
'.aling_derecha {',
'    text-align: right;',
'}',
'',
'#P59_SUC_ID_SUCURSAL {',
'    background-color: rgb(190, 190, 190);',
'    color :rgb(0, 0, 0);',
'    text-align: center;',
'}',
'',
'#P59_ENT_ID_ENTIDAD,',
'#P59_CONDICION_COMPRA,',
'#P59_TIMBRADO_input,',
'#P59_VTO_TIMBRADO_input,',
'#P59_NRO_FACTURA',
'{',
'    background-color: rgb(240, 215, 102) !important;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when=>'P59_ID_FACTURA_COMPRA'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(154705903714352163)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>250
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(204346108357207812)
,p_plug_name=>'Crear/Editar factura compra'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_FACTURA_COMPRA,',
'       FECHA_FACTURA,',
'       FECHA_VENCIMIENTO,',
'       ENT_ID_ENTIDAD,',
'       TIP_ID_TIPO_COMPROBANTE,',
'       CONDICION_COMPRA,',
'       TIMBRADO,',
'       VTO_TIMBRADO,',
'       NRO_FACTURA,',
'       MON_ID_MONEDA,',
'       TIPO_CAMBIO,',
'       MONTO,',
'       SALDO,',
'       USUARIO_REGISTRO,',
'       FECHA_REGISTRO,',
'       SUC_ID_SUCURSAL',
'  from CAB_FACTURA_COMPRA'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(204403796091672381)
,p_plug_name=>'Detalle de factura New'
,p_region_name=>'GRID_DETALLE'
,p_parent_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>210
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT To_Number(c001) ID_DET_FACTURA_COMPRA',
'      ,To_Number(c002) FAC_ID_FACTURA_COMPRA',
'      ,To_Number(c003) PRO_ID_PRODUCTO',
'      ,c004            DESCRIPCION',
'      ,To_Number(c005) IVA_ID_IVA',
'      ,To_Number(c006) UNI_ID_UNIDAD_MEDIDA',
'      ,To_Number(c007) PRECIO_UNITARIO',
'      ,To_Number(c008) CANTIDAD',
'      ,To_Number(c009) EXENTO',
'      ,To_Number(c010) GRAVADO',
'      ,To_Number(c011) IVA',
'      ,To_Number(c012) MONTO_DESCUENTO',
'      ,To_Number(c013) PORC_DESCUENTO',
'      ,c014            LOTE',
'      ,To_Date(c015,''dd/mm/yyyy'') VENCIMIENTO',
'      ,To_Number(c016) TOTAL',
'      ,To_Number(c017) CEN_ID_CENTRO_COSTO',
'      ,To_Number(c018) DEP_ID_DEPOSITO',
'      ,SEQ_ID',
'      ,c019            TIPO_PRODUCTO ',
'  FROM apex_collections',
' WHERE collection_name = ''COLL_DETALLE_FCOMPRA'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P59_ID_FACTURA_COMPRA'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Detalle de factura'
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
 p_id=>wwv_flow_imp.id(154705089748352155)
,p_name=>'TIPO_PRODUCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_PRODUCTO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
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
 p_id=>wwv_flow_imp.id(204403952579672383)
,p_name=>'ID_DET_FACTURA_COMPRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DET_FACTURA_COMPRA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(204404052514672384)
,p_name=>'FAC_ID_FACTURA_COMPRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FAC_ID_FACTURA_COMPRA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(204404210675672385)
,p_name=>'PRO_ID_PRODUCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRO_ID_PRODUCTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Producto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Productos',
  'width', '900')).to_clob
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(156366982752024579)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'Seleccione'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'UPPER'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(204404276726672386)
,p_name=>'DESCRIPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPCION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(204404406926672387)
,p_name=>'IVA_ID_IVA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IVA_ID_IVA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'I.V.A.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(209648098562129753)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'Seleccione'
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
 p_id=>wwv_flow_imp.id(204404526192672388)
,p_name=>'UNI_ID_UNIDAD_MEDIDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNI_ID_UNIDAD_MEDIDA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Unidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(157585458416540594)
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_lov_null_text=>'--Seleccione'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(204404574585672389)
,p_name=>'PRECIO_UNITARIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRECIO_UNITARIO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Precio unitario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
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
 p_id=>wwv_flow_imp.id(204404672674672390)
,p_name=>'CANTIDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(204404813712672391)
,p_name=>'EXENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXENTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Exento'
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
,p_static_id=>'EXENTO'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(204404882391672392)
,p_name=>'GRAVADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GRAVADO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Gravado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_static_id=>'GRAVADO'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(204404947856672393)
,p_name=>'IVA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IVA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'I.V.A.'
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
,p_static_id=>'IVA'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(204405112991672394)
,p_name=>'MONTO_DESCUENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MONTO_DESCUENTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(204405228723672395)
,p_name=>'PORC_DESCUENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PORC_DESCUENTO'
,p_data_type=>'NUMBER'
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
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(204405277381672396)
,p_name=>'LOTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOTE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Lote'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>32767
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
 p_id=>wwv_flow_imp.id(204405416817672397)
,p_name=>'VENCIMIENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VENCIMIENTO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
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
,p_format_mask=>'DD-MM-YYYY'
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
 p_id=>wwv_flow_imp.id(204405488871672398)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(204405556241672399)
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
 p_id=>wwv_flow_imp.id(204407385215672417)
,p_name=>'TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_static_id=>'TOTAL'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(204407970977672423)
,p_name=>'CEN_ID_CENTRO_COSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CEN_ID_CENTRO_COSTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Centro de costo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(204941911718114998)
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
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'APP_CENTRO_COSTO'
,p_display_condition2=>'SI'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(204954825046631179)
,p_name=>'SOLO_TOTAL'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_static_id=>'SOLO_TOTAL'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(205942034074578980)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(205942591771578986)
,p_name=>'DEP_ID_DEPOSITO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEP_ID_DEPOSITO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>unistr('Dep\00F3sito')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d.descripcion d, id_deposito r',
'FROM deposito d',
'WHERE d.suc_id_sucursal = :APP_ID_SUCURSAL;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(204403918167672382)
,p_internal_uid=>11437373532009504
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No se encuentran registros.'
,p_show_toolbar=>true
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>true
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    var toolbar = apex.jQuery.apex.interactiveGrid.copyDefaultToolbar();',
'    var group = toolbar.toolbarFind("actions2");',
'    group.controls.shift(); // assumes edit is first control in group',
'    config.toolbarData = toolbar;',
'    config.defaultSingleRowOptions = {',
'       alwaysEdit: true',
'    }',
'    return config;',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(204422436582626194)
,p_interactive_grid_id=>wwv_flow_imp.id(204403918167672382)
,p_static_id=>'114559'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(204422623903626195)
,p_report_id=>wwv_flow_imp.id(204422436582626194)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(156369980915083143)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(154705089748352155)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204423116547626200)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(204403952579672383)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204424003984626204)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(204404052514672384)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204424915361626206)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(204404210675672385)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>292
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204425758833626208)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(204404276726672386)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>201
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204426723778626210)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(204404406926672387)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204427563512626212)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(204404526192672388)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204428519465626214)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(204404574585672389)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204429363966626216)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(204404672674672390)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>75
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204430311100626218)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(204404813712672391)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204431237125626220)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(204404882391672392)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204432078990626222)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(204404947856672393)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204432880467626226)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(204405112991672394)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204433813235626229)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(204405228723672395)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204434679896626231)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(204405277381672396)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204435593034626234)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(204405416817672397)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204439517439734058)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(204405488871672398)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204782194756826929)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(204407385215672417)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204943541416144813)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(204407970977672423)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(204960459847641691)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(204954825046631179)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(205948648597811310)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(205942034074578980)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(205992048960446363)
,p_view_id=>wwv_flow_imp.id(204422623903626195)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(205942591771578986)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206017809569012582)
,p_plug_name=>'Detalle de factura'
,p_region_name=>'GRID_CONSULTA'
,p_parent_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>220
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_DET_FACTURA_COMPRA',
'      ,FAC_ID_FACTURA_COMPRA',
'      ,PRO_ID_PRODUCTO',
'      ,DESCRIPCION',
'      ,IVA_ID_IVA',
'      ,UNI_ID_UNIDAD_MEDIDA',
'      ,PRECIO_UNITARIO',
'      ,CANTIDAD',
'      ,EXENTO',
'      ,GRAVADO',
'      ,IVA',
'      ,MONTO_DESCUENTO',
'      ,PORC_DESCUENTO',
'      ,LOTE',
'      ,VENCIMIENTO',
'      ,TOTAL',
'      ,CEN_ID_CENTRO_COSTO',
'      ,DEP_ID_DEPOSITO',
'      ,NULL SEQ_ID',
'  FROM det_factura_compra',
' WHERE fac_id_factura_compra = :P59_ID_FACTURA_COMPRA'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P59_ID_FACTURA_COMPRA'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206018191906012586)
,p_name=>'ID_DET_FACTURA_COMPRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DET_FACTURA_COMPRA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206018325708012587)
,p_name=>'FAC_ID_FACTURA_COMPRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FAC_ID_FACTURA_COMPRA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206018387598012588)
,p_name=>'PRO_ID_PRODUCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRO_ID_PRODUCTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Producto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(206758630093203799)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'Seleccione'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'UPPER'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206018530741012589)
,p_name=>'DESCRIPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPCION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>400
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206018600979012590)
,p_name=>'IVA_ID_IVA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IVA_ID_IVA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'I.V.A.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(209648098562129753)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'Seleccione'
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206018722981012591)
,p_name=>'UNI_ID_UNIDAD_MEDIDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNI_ID_UNIDAD_MEDIDA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Unidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(209648288667134807)
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206018757967012592)
,p_name=>'PRECIO_UNITARIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRECIO_UNITARIO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Precio unitario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>true
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206018899872012593)
,p_name=>'CANTIDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>true
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206018965540012594)
,p_name=>'EXENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXENTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Exento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>true
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206019063436012595)
,p_name=>'GRAVADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GRAVADO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Gravado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>true
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206019153230012596)
,p_name=>'IVA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IVA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'I.V.A.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>true
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206019344084012597)
,p_name=>'MONTO_DESCUENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MONTO_DESCUENTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Monto descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206019382750012598)
,p_name=>'PORC_DESCUENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PORC_DESCUENTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'% Descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'990D00'
,p_is_required=>false
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206019532443012599)
,p_name=>'LOTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOTE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206019560575012600)
,p_name=>'VENCIMIENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VENCIMIENTO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
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
,p_format_mask=>'DD-MM-YYYY'
,p_is_required=>false
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206019685422012601)
,p_name=>'TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206019833875012602)
,p_name=>'CEN_ID_CENTRO_COSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CEN_ID_CENTRO_COSTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Centro de costo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(204941911718114998)
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
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'APP_CENTRO_COSTO'
,p_display_condition2=>'SI'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206019881776012603)
,p_name=>'SOLO_TOTAL'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206019955239012604)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206020108896012605)
,p_name=>'DEP_ID_DEPOSITO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEP_ID_DEPOSITO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>unistr('Dep\00F3sito')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d.descripcion d, id_deposito r',
'FROM deposito d',
'WHERE d.suc_id_sucursal = :APP_ID_SUCURSAL;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(206017932420012583)
,p_internal_uid=>13051387784349705
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No se encuentran registros.'
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>true
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>true
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(206024537555056147)
,p_interactive_grid_id=>wwv_flow_imp.id(206017932420012583)
,p_static_id=>'130580'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(206024648184056148)
,p_report_id=>wwv_flow_imp.id(206024537555056147)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206026507312056154)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(206018191906012586)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206027425548056159)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(206018325708012587)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206028327384056161)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(206018387598012588)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>241
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206029223686056163)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(206018530741012589)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206030065483056165)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(206018600979012590)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206031011193056167)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(206018722981012591)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206031938151056169)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(206018757967012592)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206032843968056172)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(206018899872012593)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206033725734056174)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(206018965540012594)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206034610917056176)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(206019063436012595)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206035501389056178)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(206019153230012596)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206036355928056180)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(206019344084012597)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206037263175056182)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(206019382750012598)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206038222853056185)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(206019532443012599)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206039116415056187)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(206019560575012600)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206039955087056189)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(206019685422012601)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206040854300056191)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(206019833875012602)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206041791832056194)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(206019881776012603)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206042672434056196)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(206019955239012604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(206043555876056199)
,p_view_id=>wwv_flow_imp.id(206024648184056148)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(206020108896012605)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(204357103963207845)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(241880853073249582)
,p_plug_name=>'Cuotas factura compra'
,p_region_name=>'REG_CUOTAS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>1485369341786500999
,p_plug_display_sequence=>240
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select To_Number(c001) ID_DETALLE_CUENTA,',
'       To_Number(c002) FAC_ID_FACTURA_VENTA,',
'       To_Number(c003) ITEM,',
'       To_Date(c004,''DD/MM/YYYY'') FECHA_VENCIMIENTO,',
'       To_Number(c005) IMPORTE,',
'       To_Number(c006) SALDO,',
'       seq_id',
'  FROM apex_collections',
' WHERE collection_name = ''COLL_DETALLE_PAGOS'''))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_page_header=>'Cuotas factura venta'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(241882165997249586)
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
 p_id=>wwv_flow_imp.id(241882721407249587)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(241883695393249589)
,p_name=>'ID_DETALLE_CUENTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DETALLE_CUENTA'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(241884679772249591)
,p_name=>'FAC_ID_FACTURA_VENTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FAC_ID_FACTURA_VENTA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(241885659600249591)
,p_name=>'ITEM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEM'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Item'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(241886680306249592)
,p_name=>'FECHA_VENCIMIENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_VENCIMIENTO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Fecha vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
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
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(241887690877249593)
,p_name=>'IMPORTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPORTE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Importe'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(241888707231249593)
,p_name=>'SALDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(241889645985249594)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(241881429545249584)
,p_internal_uid=>48914884909586706
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>300
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    var $ = apex.jQuery,',
'        toolbarData = $.apex.interactiveGrid.copyDefaultToolbar();',
'    //toolbarData.toolbarRemove( "actions2" );',
'    options.toolbar.editing = false;',
'    options.toolbar.save = false;',
'    options.toolbarData = toolbarData;',
'    return options;',
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(241881813846249584)
,p_interactive_grid_id=>wwv_flow_imp.id(241881429545249584)
,p_static_id=>'152471'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(241881950324249585)
,p_report_id=>wwv_flow_imp.id(241881813846249584)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(241883038354249588)
,p_view_id=>wwv_flow_imp.id(241881950324249585)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(241882721407249587)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(241884076562249590)
,p_view_id=>wwv_flow_imp.id(241881950324249585)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(241883695393249589)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(241885132859249591)
,p_view_id=>wwv_flow_imp.id(241881950324249585)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(241884679772249591)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(241886053963249592)
,p_view_id=>wwv_flow_imp.id(241881950324249585)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(241885659600249591)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(241887094962249592)
,p_view_id=>wwv_flow_imp.id(241881950324249585)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(241886680306249592)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(241888042734249593)
,p_view_id=>wwv_flow_imp.id(241881950324249585)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(241887690877249593)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(241889091127249594)
,p_view_id=>wwv_flow_imp.id(241881950324249585)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(241888707231249593)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(241890100533249594)
,p_view_id=>wwv_flow_imp.id(241881950324249585)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(241889645985249594)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(209828609899625792)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(241880853073249582)
,p_button_name=>'Calcular'
,p_button_static_id=>'btn_calcular'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Calcular'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'title="Calcular cantidad y monto de cuotas"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(206301066280648027)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_button_name=>'Agregar_entidad'
,p_button_static_id=>'btn_agregar_entidad'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--success:t-Button--simple:t-Button--iconLeft:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'+Prov.'
,p_button_redirect_url=>'f?p=&APP_ID.:161:&SESSION.::&DEBUG.:::'
,p_button_condition=>'P59_ID_FACTURA_COMPRA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-address-book'
,p_button_cattributes=>'title="Agregar una entidad"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_security_scheme=>wwv_flow_imp.id(205634223166200932)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(209828982883625794)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(241880853073249582)
,p_button_name=>'Regresar'
,p_button_static_id=>'btn_regresar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Confirmar'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(216549468490996483)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_button_name=>'Cuotas'
,p_button_static_id=>'BTN_VER_CUOTAS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cuotas'
,p_button_redirect_url=>'f?p=&APP_ID.:85:&SESSION.::&DEBUG.:85:P85_P_ID_FACTURA:&P59_ID_FACTURA_COMPRA.'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(204357500871207845)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(204357103963207845)
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
 p_id=>wwv_flow_imp.id(206020180748012606)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(204357103963207845)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P59_ID_FACTURA_COMPRA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(204388716045954803)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(204359310232207852)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(204357103963207845)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition_type=>'NEVER'
,p_security_scheme=>wwv_flow_imp.id(204388275109952232)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(209789445237556079)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(204357103963207845)
,p_button_name=>'CUOTAS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Definir pagos'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P59_ID_FACTURA_COMPRA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(204388489338953423)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(204359700691207852)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(204357103963207845)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P59_ID_FACTURA_COMPRA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(204388489338953423)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(206020925527012613)
,p_branch_name=>'Add Producto'
,p_branch_action=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:31::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'ADD_PRODUCTO'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204346426697207815)
,p_name=>'P59_ID_FACTURA_COMPRA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_prompt=>'Id factura compra'
,p_source=>'ID_FACTURA_COMPRA'
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
 p_id=>wwv_flow_imp.id(204346801957207821)
,p_name=>'P59_FECHA_FACTURA'
,p_source_data_type=>'DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_default=>'trunc(current_date)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Fecha factura'
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'FECHA_FACTURA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(204347219311207822)
,p_name=>'P59_FECHA_VENCIMIENTO'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_prompt=>'Fecha vencimiento'
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'FECHA_VENCIMIENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(204347587518207823)
,p_name=>'P59_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_prompt=>'Entidad'
,p_source=>'ENT_ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
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
 p_id=>wwv_flow_imp.id(204348038939207824)
,p_name=>'P59_TIP_ID_TIPO_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_default=>'APP_ID_TIPO_COMP_FACTURA'
,p_item_default_type=>'ITEM'
,p_prompt=>'Tipo Comprobante'
,p_source=>'TIP_ID_TIPO_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
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
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204348632284207839)
,p_name=>'P59_CONDICION_COMPRA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_prompt=>unistr('Condici\00F3n')
,p_source=>'CONDICION_COMPRA'
,p_source_type=>'REGION_SOURCE_COLUMN'
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
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204349044146207839)
,p_name=>'P59_TIMBRADO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_prompt=>'Nro. Timbrado'
,p_source=>'TIMBRADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct c.timbrado',
'FROM cab_factura_compra c',
'WHERE c.ent_id_entidad = :P59_ENT_ID_ENTIDAD'))
,p_lov_cascade_parent_items=>'P59_ENT_ID_ENTIDAD'
,p_ajax_items_to_submit=>'P59_TIMBRADO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'aling_derecha'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'match_type', 'CONTAINS_IGNORE',
  'max_values_in_list', '7',
  'min_chars', '2',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204349440015207840)
,p_name=>'P59_VTO_TIMBRADO'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_prompt=>'Vto. Timbrado'
,p_source=>'VTO_TIMBRADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(204349801603207840)
,p_name=>'P59_NRO_FACTURA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_prompt=>'Nro. Factura'
,p_format_mask=>'999G999G9999999'
,p_source=>'NRO_FACTURA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>17
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204350227755207840)
,p_name=>'P59_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_prompt=>'Moneda'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'text-dark'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204350585433207840)
,p_name=>'P59_TIPO_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_prompt=>'Tipo cambio'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'TIPO_CAMBIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_css_classes=>'aling_derecha'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204350996477207840)
,p_name=>'P59_MONTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_prompt=>'Monto'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'MONTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'is-readonly apex_disabled text-dark aling_derecha'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204351362359207841)
,p_name=>'P59_SALDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_prompt=>'Saldo'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'SALDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'is-readonly apex_disabled text-dark aling_derecha'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204351815732207841)
,p_name=>'P59_USUARIO_REGISTRO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_prompt=>unistr('Usuario registr\00F3')
,p_source=>'USUARIO_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>80
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P59_ID_FACTURA_COMPRA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'is-readonly apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204352178543207841)
,p_name=>'P59_FECHA_REGISTRO'
,p_source_data_type=>'DATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_prompt=>unistr('Fecha registr\00F3')
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'FECHA_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P59_ID_FACTURA_COMPRA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'is-readonly apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206353411524057579)
,p_name=>'P59_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_source_plug_id=>wwv_flow_imp.id(204346108357207812)
,p_item_default=>'APP_ID_SUCURSAL'
,p_item_default_type=>'ITEM'
,p_prompt=>'Sucursal'
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SUCURSAL'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>' is-readonly apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209829417424625794)
,p_name=>'P59_CUOTAS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(241880853073249582)
,p_prompt=>'Cant. cuotas'
,p_format_mask=>'990'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209829806387625795)
,p_name=>'P59_MONTO_FACTURA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(241880853073249582)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Monto total'
,p_format_mask=>'999G999G999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209830166318625795)
,p_name=>'P59_MONTO_CUOTAS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(241880853073249582)
,p_prompt=>'Monto cuotas'
,p_format_mask=>'999G999G999G999G999G999G990D99'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(206301154341648028)
,p_validation_name=>'Habilita timbrado'
,p_validation_sequence=>10
,p_validation=>':P59_VTO_TIMBRADO > :P59_FECHA_FACTURA'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'El timbrado ya no tiene vigencia para la fecha de la factura.'
,p_always_execute=>'Y'
,p_validation_condition=>'P59_ID_FACTURA_COMPRA'
,p_validation_condition_type=>'ITEM_IS_NULL'
,p_associated_item=>wwv_flow_imp.id(204349440015207840)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204357634641207845)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(204357500871207845)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204358373570207851)
,p_event_id=>wwv_flow_imp.id(204357634641207845)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204403571770672379)
,p_name=>'Buscar timbrado'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_TIMBRADO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204403734096672380)
,p_event_id=>wwv_flow_imp.id(204403571770672379)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    SELECT c.vto_timbrado',
'    INTO :P59_VTO_TIMBRADO',
'    FROM cab_factura_compra c',
'    WHERE c.timbrado = :P59_TIMBRADO',
'    FETCH FIRST 1 ROW ONLY;',
'exception',
'  when no_data_found then ',
'    null;',
'end;    '))
,p_attribute_02=>'P59_TIMBRADO'
,p_attribute_03=>'P59_VTO_TIMBRADO'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204405981561672403)
,p_name=>'Buscar cambio'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_MON_ID_MONEDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204406142544672404)
,p_event_id=>wwv_flow_imp.id(204405981561672403)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_compra moneda.tc_compra%type;',
'v_venta  moneda.tc_venta%type;',
'begin ',
'    p_devuelve_tipo_cambio ( P_FECHA => :P59_FECHA_FACTURA',
'                            ,P_ID_MONEDA => :P59_MON_ID_MONEDA',
'                            ,P_COMPRA => v_compra',
'                            ,P_VENTA => v_venta',
'    );',
'    :P59_TIPO_CAMBIO := v_venta;',
'end;'))
,p_attribute_02=>'P59_FECHA_FACTURA,P59_MON_ID_MONEDA'
,p_attribute_03=>'P59_TIPO_CAMBIO'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'ITEM_IS_NULL'
,p_server_condition_expr1=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204406435094672407)
,p_name=>'Set moneda'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_ENT_ID_ENTIDAD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204406543220672408)
,p_event_id=>wwv_flow_imp.id(204406435094672407)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P59_MON_ID_MONEDA'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'1'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204406643207672409)
,p_name=>'Calcular'
,p_event_sequence=>50
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(204403796091672381)
,p_triggering_element=>'CANTIDAD,PRECIO_UNITARIO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(207767516247230979)
,p_event_id=>wwv_flow_imp.id(204406643207672409)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#TOTAL").removeAttr(''readonly'');',
'$("#EXENTO").removeAttr(''readonly'');',
'$("#GRAVADO").removeAttr(''readonly'');',
'$("#IVA").removeAttr(''readonly'');'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204406708309672410)
,p_event_id=>wwv_flow_imp.id(204406643207672409)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
' BEGIN',
'  p_dev_valores_factura  ( P_ID_IVA  =>          :IVA_ID_IVA',
'                          ,P_ID_MONEDA =>        :P59_MON_ID_MONEDA ',
'                          ,P_PRECIO_UNITARIO =>  to_number(:PRECIO_UNITARIO,''999G999G999D99'')',
'                          ,P_CANTIDAD =>         to_number(:CANTIDAD,''999G999D99'')',
'                          ,P_EXENTO =>           :EXENTO',
'                          ,P_GRAVADO =>          :GRAVADO',
'                          ,P_IVA =>              :IVA',
'                          ,P_TOTAL =>            :TOTAL',
'                          );',
'  :SOLO_TOTAL := :TOTAL;                        ',
'END;',
''))
,p_attribute_02=>'IVA_ID_IVA,PRECIO_UNITARIO,CANTIDAD,P59_MON_ID_MONEDA'
,p_attribute_03=>'EXENTO,GRAVADO,IVA,TOTAL,SOLO_TOTAL'
,p_attribute_05=>'#SQLERRM_TEXT# '
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(207767640110230980)
,p_event_id=>wwv_flow_imp.id(204406643207672409)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#TOTAL").attr(''readonly'',''readonly'');',
'$("#EXENTO").attr(''readonly'',''readonly'');',
'$("#GRAVADO").attr(''readonly'',''readonly'');',
'$("#IVA").attr(''readonly'',''readonly'');',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204407829516672421)
,p_name=>'SetTotal'
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(204403796091672381)
,p_triggering_element=>'EXENTO,GRAVADO,IVA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204407888458672422)
,p_event_id=>wwv_flow_imp.id(204407829516672421)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTAL,SOLO_TOTAL'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'to_number(:EXENTO,''999G999G999D99'') + to_number(:GRAVADO,''999G999G999D99'') + to_number(:IVA,''999G999G999D99'')'
,p_attribute_07=>'GRAVADO,EXENTO,IVA'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(206180762717346879)
,p_name=>'SetVto'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_CONDICION_COMPRA'
,p_condition_element=>'P59_CONDICION_COMPRA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'CONTADO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206180912460346880)
,p_event_id=>wwv_flow_imp.id(206180762717346879)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P59_FECHA_VENCIMIENTO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':P59_FECHA_FACTURA'
,p_attribute_07=>'P59_FECHA_FACTURA'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206181005397346881)
,p_event_id=>wwv_flow_imp.id(206180762717346879)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P59_FECHA_VENCIMIENTO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'add_months(to_date(:P59_FECHA_FACTURA,''dd/mm/yyyy''),1)'
,p_attribute_07=>'P59_FECHA_FACTURA'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(207767788353230982)
,p_name=>'Ir A deposito'
,p_event_sequence=>110
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(204403796091672381)
,p_triggering_element=>'CANTIDAD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(207767918322230983)
,p_event_id=>wwv_flow_imp.id(207767788353230982)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'DEP_ID_DEPOSITO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209575121454264379)
,p_name=>'obtener IVA'
,p_event_sequence=>120
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(204403796091672381)
,p_triggering_element=>'PRO_ID_PRODUCTO'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'PRO_ID_PRODUCTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209575175816264380)
,p_event_id=>wwv_flow_imp.id(209575121454264379)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select p.iva_id_iva, p.tipo',
'    into :IVA_ID_IVA, :TIPO_PRODUCTO',
'    from producto p',
'    where p.id_producto = :PRO_ID_PRODUCTO;',
'    IF :CANTIDAD IS NULL THEN ',
'        :CANTIDAD := 1;',
'    END IF;',
'end;'))
,p_attribute_02=>'PRO_ID_PRODUCTO,CANTIDAD'
,p_attribute_03=>'IVA_ID_IVA,TIPO_PRODUCTO,CANTIDAD'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209603420532191886)
,p_event_id=>wwv_flow_imp.id(209575121454264379)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region("GRID_DETALLE").focus();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209575289359264381)
,p_name=>'Ir a'
,p_event_sequence=>130
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209591467588518381)
,p_event_id=>wwv_flow_imp.id(209575289359264381)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'setTimeout(function() {',
'    apex.item( "P59_ENT_ID_ENTIDAD" ).setFocus();',
'}, 600);  ',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209575368939264382)
,p_event_id=>wwv_flow_imp.id(209575289359264381)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P59_ENT_ID_ENTIDAD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209603986593191892)
,p_name=>'Habilita set focus a grilla'
,p_event_sequence=>140
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209604058199191893)
,p_event_id=>wwv_flow_imp.id(209603986593191892)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var ig$ = apex.region("GRID_DETALLE").widget();',
'ig$.interactiveGrid("getActions").set("edit", true);',
'var grid$ = ig$.interactiveGrid("getViews").grid.view$;',
'grid$.on("gridmodechange", function(event, ui) {',
'    if ( !ui.editMode ) {',
'        setTimeout(function() {',
'            if ( grid$.find(".a-GV-cell.is-focused").trigger("dblclick").length === 0) {',
'            ig$.interactiveGrid("getActions").set("edit", true);',
'            }',
'        }, 100);',
'    }',
'});',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209591251219518379)
,p_name=>'Ir a condicion'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_ENT_ID_ENTIDAD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204407271690672416)
,p_event_id=>wwv_flow_imp.id(209591251219518379)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P59_CONDICION_COMPRA'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209592003621518386)
,p_name=>'Ir a detalle'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_NRO_FACTURA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209592058905518387)
,p_event_id=>wwv_flow_imp.id(209592003621518386)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#P59_CONDICION_COMPRA'').attr(''disabled'', true);',
'$(''#P59_TIP_ID_TIPO_COMPROBANTE'').attr(''disabled'', true);',
'$(''#P59_MON_ID_MONEDA'').attr(''disabled'', true);',
'',
'apex.region("GRID_DETALLE").focus();',
''))
,p_server_condition_type=>'ITEM_IS_NULL'
,p_server_condition_expr1=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209789754166556082)
,p_name=>'Desactivar'
,p_event_sequence=>170
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209789892972556083)
,p_event_id=>wwv_flow_imp.id(209789754166556082)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(209789445237556079)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209789975829556084)
,p_name=>'Habilitar cuotas'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_MONTO_NUMERICO'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'apex.item("P59_CONDICION_COMPRA").getValue() == ''CREDITO'' //&& apex.item("P59_MONTO_NUMERICO").getValue() > 0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209790101476556085)
,p_event_id=>wwv_flow_imp.id(209789975829556084)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(209789445237556079)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209791279750556097)
,p_name=>'Habilitar cuotas'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_MONTO_FACTURA'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'!apex.item("P59_MONTO_FACTURA").isEmpty() && apex.item("P59_CONDICION_COMPRA").getValue() == ''CREDITO'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P59_ID_FACTURA_COMPRA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206275589477483512)
,p_event_id=>wwv_flow_imp.id(209791279750556097)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(209789445237556079)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209791357276556098)
,p_event_id=>wwv_flow_imp.id(209791279750556097)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(209789445237556079)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209792136514556105)
,p_name=>'New'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(209789445237556079)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209792199625556106)
,p_event_id=>wwv_flow_imp.id(209792136514556105)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(241880853073249582)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209792283127556107)
,p_name=>'Calcular cuotas'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(209828609899625792)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209792387645556108)
,p_event_id=>wwv_flow_imp.id(209792283127556107)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_item    number;',
'v_fecha   date;',
'v_cuotas  number;',
'v_importe number;',
'v_ultimo  number;',
'begin ',
'    if nvl(to_number(:P59_CUOTAS),0) = 0 then',
'        raise_application_error(-20000,''Defina cantidad de pagos/cuotas'');',
'    end if;',
'    v_item    := 0;',
'    v_fecha   := trunc(current_date,''DD'');',
'    v_cuotas  := nvl(to_number(:P59_CUOTAS),0);',
'    v_importe := round( to_number(:P59_MONTO_FACTURA,''999G999G999D99'') / v_cuotas);',
'',
'    if nvl(v_importe,0) = 0 then',
'        raise_application_error(-20000,''Regrese a la factura y registre productos/servicios para la venta.'');',
'    end if;',
'    v_ultimo  := to_number(:P59_MONTO_FACTURA,''999G999G999D99'') - (v_importe * (v_cuotas-1));',
'',
'    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''COLL_DETALLE_PAGOS'');',
'    for i in 1..(v_cuotas-1) loop',
'        v_item  := v_item + 1;',
'        v_fecha := add_months(v_fecha,1);',
'        APEX_COLLECTION.ADD_MEMBER(',
'            p_collection_name => ''COLL_DETALLE_PAGOS'',',
'            p_c001            => NULL,',
'            p_c002            => NULL,',
'            p_c003            => to_char(v_item),',
'            p_c004            => to_char(v_fecha,''dd/mm/yyyy''),',
'            p_c005            => to_char(v_importe),',
'            p_c006            => to_char(v_importe)',
'            );',
'    end loop;',
'    v_item  := v_item + 1;',
'    v_fecha := add_months(v_fecha,1);',
'    APEX_COLLECTION.ADD_MEMBER(',
'        p_collection_name => ''COLL_DETALLE_PAGOS'',',
'        p_c001            => NULL,',
'        p_c002            => NULL,',
'        p_c003            => to_char(v_item),',
'        p_c004            => to_char(v_fecha,''dd/mm/yyyy''),',
'        p_c005            => to_char(v_ultimo),',
'        p_c006            => to_char(v_ultimo)',
'        );',
'end;'))
,p_attribute_02=>'P59_CUOTAS,P59_MONTO_FACTURA'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206275756679483514)
,p_event_id=>wwv_flow_imp.id(209792283127556107)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(241880853073249582)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(206276141435483517)
,p_name=>'Set saldo'
,p_event_sequence=>230
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(241880853073249582)
,p_triggering_element=>'IMPORTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206276194387483518)
,p_event_id=>wwv_flow_imp.id(206276141435483517)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SALDO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'to_number(:IMPORTE,''999G999G999D99'')'
,p_attribute_07=>'IMPORTE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(206276774436483524)
,p_name=>'Cerrar cuota'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(209828982883625794)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206276903804483525)
,p_event_id=>wwv_flow_imp.id(206276774436483524)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(241880853073249582)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209957443213439983)
,p_name=>'Actualizar coll cuotas'
,p_event_sequence=>260
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(241880853073249582)
,p_triggering_element=>'FECHA_VENCIMIENTO,IMPORTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209957504612439984)
,p_event_id=>wwv_flow_imp.id(209957443213439983)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'        APEX_COLLECTION.UPDATE_MEMBER (',
'        p_collection_name => ''COLL_DETALLE_PAGOS'',',
'        p_seq             => :seq_id,',
'        p_c001            => NULL,',
'        p_c002            => NULL,',
'        p_c003            => to_char(:ITEM),',
'        p_c004            => :FECHA_VENCIMIENTO,',
'        p_c005            => to_number(:IMPORTE,''999G999G999D99''),',
'        p_c006            => to_number(:IMPORTE,''999G999G999D99'')',
'            );',
''))
,p_attribute_02=>'SEQ_ID,ITEM,FECHA_VENCIMIENTO,,IMPORTE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209957627422439985)
,p_name=>'Crear factura'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(204359700691207852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209957723369439986)
,p_event_id=>wwv_flow_imp.id(209957627422439985)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#P59_CONDICION_COMPRA'').attr(''disabled'', false);',
'$(''#P59_TIP_ID_TIPO_COMPROBANTE'').attr(''disabled'', false);',
'$(''#P59_MON_ID_MONEDA'').attr(''disabled'', false);',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209957799953439987)
,p_event_id=>wwv_flow_imp.id(209957627422439985)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CREATE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(154705304530352157)
,p_name=>'SRV'
,p_event_sequence=>280
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(204403796091672381)
,p_triggering_element=>'TIPO_PRODUCTO'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'TIPO_PRODUCTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SRV'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(154705434636352159)
,p_event_id=>wwv_flow_imp.id(154705304530352157)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'DEP_ID_DEPOSITO,LOTE,VENCIMIENTO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(154705419967352158)
,p_event_id=>wwv_flow_imp.id(154705304530352157)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'DEP_ID_DEPOSITO,LOTE,VENCIMIENTO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(154705552743352160)
,p_name=>'ART'
,p_event_sequence=>290
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(204403796091672381)
,p_triggering_element=>'TIPO_PRODUCTO'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'TIPO_PRODUCTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ART'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(154705719152352161)
,p_event_id=>wwv_flow_imp.id(154705552743352160)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'DEP_ID_DEPOSITO,LOTE,VENCIMIENTO'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204405675690672400)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(204403796091672381)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Detalle de factura - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    case :APEX$ROW_STATUS',
'    when ''C'' then',
'        APEX_COLLECTION.ADD_MEMBER (',
'        p_collection_name => ''COLL_DETALLE_FCOMPRA''',
'       ,p_c001 => :ID_DET_FACTURA_COMPRA',
'       ,p_c002 => :FAC_ID_FACTURA_COMPRA',
'       ,p_c003 => :PRO_ID_PRODUCTO',
'       ,p_c004 => :DESCRIPCION',
'       ,p_c005 => :IVA_ID_IVA',
'       ,p_c006 => :UNI_ID_UNIDAD_MEDIDA',
'       ,p_c007 => :PRECIO_UNITARIO',
'       ,p_c008 => :CANTIDAD',
'       ,p_c009 => :EXENTO',
'       ,p_c010 => :GRAVADO',
'       ,p_c011 => :IVA',
'       ,p_c012 => :MONTO_DESCUENTO',
'       ,p_c013 => :PORC_DESCUENTO',
'       ,p_c014 => :LOTE',
'       ,p_c015 => To_Char(:VENCIMIENTO,''dd/mm/yyyy'')',
'       ,p_c016 => :TOTAL',
'       ,p_c017 => :CEN_ID_CENTRO_COSTO',
'       ,p_c018 => :DEP_ID_DEPOSITO',
'       ,p_c019 => :TIPO_PRODUCTO',
'            );',
'    when ''U'' then',
'        APEX_COLLECTION.UPDATE_MEMBER (',
'        p_collection_name => ''COLL_DETALLE_FCOMPRA''',
'       ,p_seq             => :seq_id',
'       ,p_c001 => :ID_DET_FACTURA_COMPRA',
'       ,p_c002 => :FAC_ID_FACTURA_COMPRA',
'       ,p_c003 => :PRO_ID_PRODUCTO',
'       ,p_c004 => :DESCRIPCION',
'       ,p_c005 => :IVA_ID_IVA',
'       ,p_c006 => :UNI_ID_UNIDAD_MEDIDA',
'       ,p_c007 => :PRECIO_UNITARIO',
'       ,p_c008 => :CANTIDAD',
'       ,p_c009 => :EXENTO',
'       ,p_c010 => :GRAVADO',
'       ,p_c011 => :IVA',
'       ,p_c012 => :MONTO_DESCUENTO',
'       ,p_c013 => :PORC_DESCUENTO',
'       ,p_c014 => :LOTE',
'       ,p_c015 => To_Char(:VENCIMIENTO,''dd/mm/yyyy'')',
'       ,p_c016 => :TOTAL',
'       ,p_c017 => :CEN_ID_CENTRO_COSTO',
'       ,p_c018 => :DEP_ID_DEPOSITO',
'       ,p_c019 => :TIPO_PRODUCTO',
'            );',
'    when ''D'' then',
'        APEX_COLLECTION.DELETE_MEMBER (',
'        p_collection_name => ''COLL_DETALLE_FCOMPRA'',',
'        p_seq             => :seq_id);',
'    end case;',
'end;',
''))
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_exec_cond_for_each_row=>'Y'
,p_internal_uid=>11439131055009522
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(205942741762578987)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar factura'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'p_guarda_factura_compra (',
'            P_ID_FACTURA_COMPRA       => :P59_ID_FACTURA_COMPRA',
'           ,P_FECHA_FACTURA           => to_date(:P59_FECHA_FACTURA,''DD/MM/YYYY'')',
'           ,P_FECHA_VENCIMIENTO       => to_date(:P59_FECHA_VENCIMIENTO,''DD/MM/YYYY'')',
'           ,P_ENT_ID_ENTIDAD          => to_number(:P59_ENT_ID_ENTIDAD)',
'           ,P_TIP_ID_TIPO_COMPROBANTE => to_number(:P59_TIP_ID_TIPO_COMPROBANTE)',
'           ,P_CONDICION_COMPRA        => :P59_CONDICION_COMPRA',
'           ,P_TIMBRADO                => :P59_TIMBRADO',
'           ,P_VTO_TIMBRADO            => to_date(:P59_VTO_TIMBRADO,''DD/MM/YYYY'')',
'           ,P_NRO_FACTURA             => to_number(:P59_NRO_FACTURA,''9999999999999'')',
'           ,P_MON_ID_MONEDA           => :P59_MON_ID_MONEDA',
'           ,P_TIPO_CAMBIO             => to_number(:P59_TIPO_CAMBIO,''999999D99'')',
'           ,P_ID_SUCURSAL             => :P59_SUC_ID_SUCURSAL',
');',
'           '))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(204359700691207852)
,p_process_success_message=>'Guardado...'
,p_internal_uid=>12976197126916109
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(206020485561012609)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar factura'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete det_factura_compra',
'where fac_id_factura_compra = :P59_ID_FACTURA_COMPRA;',
'',
'delete cab_factura_compra',
'where id_factura_compra = :P59_ID_FACTURA_COMPRA;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(206020180748012606)
,p_process_success_message=>'Eliminado...'
,p_internal_uid=>13053940925349731
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204360888403207856)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>11394343767544978
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204360122507207853)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(204346108357207812)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear/Editar factura compra'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>11393577871544975
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(205941927218578979)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Iniciar coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_collection.create_or_truncate_collection(p_collection_name => ''COLL_DETALLE_PAGOS'');',
'apex_collection.create_or_truncate_collection(p_collection_name => ''COLL_DETALLE_FCOMPRA'');',
'apex_collection.create_or_truncate_collection(p_collection_name => ''COLL_DETALLE_PAGOS'');',
'IF :P59_ID_FACTURA_COMPRA IS NOT NULL THEN',
'  PKG_FACTURA_COMPRA.CARGAR_COLL_ESTADO_CUENTA(P_ID_FACTURA => :P59_ID_FACTURA_COMPRA);',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>12975382582916101
);
wwv_flow_imp.component_end;
end;
/
