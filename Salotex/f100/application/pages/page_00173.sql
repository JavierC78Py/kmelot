prompt --application/pages/page_00173
begin
--   Manifest
--     PAGE: 00173
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
 p_id=>173
,p_name=>unistr('Detalle de orden de producci\00F3n')
,p_alias=>unistr('DETALLE-DE-ORDEN-DE-PRODUCCI\00D3N')
,p_step_title=>unistr('Detalle de orden de producci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#mascara_fecha_hora#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buscar_producto_final() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors();',
'    apex.server.process("producto_final", {',
'        pageItems: ["P173_REC_ID_RECETA"]',
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
'mascaraFechaHoraRegex("#P173_FECHA_INICIO_EST");',
'mascaraFechaHoraRegex("#P173_FECHA_FIN_REAL");',
'mascaraFechaHoraRegex("#P173_FECHA_ORDEN");',
'',
'if (apex.item("P173_ID_ORDEN_PROD").isEmpty()) {',
'    setTimeout(function(){',
'        apex.item("P173_FECHA_ORDEN").setFocus();',
'    },250);',
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}',
'.t-Region-body {',
'    padding-bottom: 0px;',
'}',
'.apex_disabled {',
'    opacity: 65%!important;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49576031544327032)
,p_plug_name=>unistr('Pesta\00F1as')
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>8
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49478483608583630)
,p_plug_name=>'Detalle de costo operativo'
,p_region_name=>'REG_DETALLE_COSTO_OP'
,p_parent_plug_id=>wwv_flow_imp.id(49576031544327032)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_DET_ORDEN_OPE,',
'       ORP_ID_ORDEN_PROD,',
'       DESCRIPCION,',
'       TIPO_COSTO,',
'       COSTO_REAL_TOTAL',
'  from DET_ORDEN_PRODUCCION_OPE',
' where ORP_ID_ORDEN_PROD = :P173_ID_ORDEN_PROD'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P173_ID_ORDEN_PROD'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P173_ID_ORDEN_PROD'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
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
,p_plug_header=>'Detalle de costo operativo'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(49478691648583632)
,p_name=>'ID_DET_ORDEN_OPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DET_ORDEN_OPE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(49478796722583633)
,p_name=>'ORP_ID_ORDEN_PROD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORP_ID_ORDEN_PROD'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_imp.id(49478868868583634)
,p_name=>'DESCRIPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(49478969796583635)
,p_name=>'TIPO_COSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_COSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo costo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(49586776610417378)
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
 p_id=>wwv_flow_imp.id(49479045949583636)
,p_name=>'COSTO_REAL_TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COSTO_REAL_TOTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Costo real total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(49478539585583631)
,p_internal_uid=>49478539585583631
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(52157058738500244)
,p_interactive_grid_id=>wwv_flow_imp.id(49478539585583631)
,p_static_id=>'521571'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(52157291356500245)
,p_report_id=>wwv_flow_imp.id(52157058738500244)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52157734136500249)
,p_view_id=>wwv_flow_imp.id(52157291356500245)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(49478691648583632)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52158630058500252)
,p_view_id=>wwv_flow_imp.id(52157291356500245)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(49478796722583633)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52159560962500253)
,p_view_id=>wwv_flow_imp.id(52157291356500245)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(49478868868583634)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52160407820500254)
,p_view_id=>wwv_flow_imp.id(52157291356500245)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(49478969796583635)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52161302307500256)
,p_view_id=>wwv_flow_imp.id(52157291356500245)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(49479045949583636)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51149248432116641)
,p_plug_name=>unistr('Orden de producci\00F3n &P173_NRO_ORDEN.')
,p_parent_plug_id=>wwv_flow_imp.id(49576031544327032)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_ORDEN_PROD,',
'       NRO_ORDEN,',
'       FECHA_ORDEN,',
'       FECHA_INICIO_EST,',
'       FECHA_FIN_REAL,',
'       SUC_ID_SUCURSAL,',
'       DEP_ID_DEPOSITO_ORIG,',
'       DEP_ID_DEPOSITO_DEST,',
'       REC_ID_RECETA,',
'       PRO_ID_PRODUCTO_FIN,',
'       CANTIDAD_A_PRODUCIR,',
'       COSTO_TOTAL_ESTIMADO,',
'       COSTO_TOTAL_REAL,',
'       ESTADO,',
'       OBSERVACION,',
'       USUARIO_REGISTRO,',
'       FECHA_REGISTRO,',
'       LIC_ID_LICITACION,',
'       DET_ID_DET_LICITACION,',
'       ENT_ID_ENTIDAD_PRODUCTOR ',
'  from CAB_ORDEN_PRODUCCION'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49476602400583612)
,p_plug_name=>'Ocultar'
,p_title=>'Obs. y datos'
,p_parent_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:t-Region--hideShowIconsMath:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49475705902583603)
,p_plug_name=>'Sub region A'
,p_parent_plug_id=>wwv_flow_imp.id(49476602400583612)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49475806522583604)
,p_plug_name=>'Sub region B'
,p_parent_plug_id=>wwv_flow_imp.id(49476602400583612)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51177828520116934)
,p_plug_name=>unistr('Detalle de orden de producci\00F3n')
,p_region_name=>'REG_DETALLE_OP'
,p_parent_plug_id=>wwv_flow_imp.id(49576031544327032)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_DET_ORDEN_MAT,',
'       ORD_ID_ORDEN_PROD,',
'       PRO_ID_PRODUCTO_MAT,',
'       UNI_ID_UNIDAD_MEDIDA,',
'       CANTIDAD_ESTIMADA,',
'       CANTIDAD_REAL_CONSUMIDA,',
'       COSTO_UNITARIO,',
'       COSTO_TOTAL',
'  from DET_ORDEN_PRODUCCION_MAT',
' where ORD_ID_ORDEN_PROD = :P173_ID_ORDEN_PROD'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P173_ID_ORDEN_PROD'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P173_ID_ORDEN_PROD'
,p_prn_page_header=>unistr('Detalle de orden de producci\00F3n')
,p_plug_header=>unistr('Detalle de orden de producci\00F3n')
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51179074465116937)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51179556483116938)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Actions'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51180552997116939)
,p_name=>'ID_DET_ORDEN_MAT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DET_ORDEN_MAT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_enable_filter=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51181597673116940)
,p_name=>'ORD_ID_ORDEN_PROD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORD_ID_ORDEN_PROD'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_enable_filter=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P173_ID_ORDEN_PROD'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51182556682116940)
,p_name=>'PRO_ID_PRODUCTO_MAT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRO_ID_PRODUCTO_MAT'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Materia prima'
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
  'title', 'Materia prima',
  'width', '1000')).to_clob
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(39750224904475773)
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51183513423116941)
,p_name=>'UNI_ID_UNIDAD_MEDIDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNI_ID_UNIDAD_MEDIDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Unidad medida'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(34805528510739251)
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51184544658116941)
,p_name=>'CANTIDAD_ESTIMADA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD_ESTIMADA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad estimada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(51185536726116941)
,p_name=>'CANTIDAD_REAL_CONSUMIDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD_REAL_CONSUMIDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Can. real consumida'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
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
 p_id=>wwv_flow_imp.id(51186505371116942)
,p_name=>'COSTO_UNITARIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COSTO_UNITARIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Costo unitario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
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
 p_id=>wwv_flow_imp.id(51187547363116942)
,p_name=>'COSTO_TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COSTO_TOTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Costo total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(51178236334116935)
,p_internal_uid=>51178236334116935
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
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(51178645681116936)
,p_interactive_grid_id=>wwv_flow_imp.id(51178236334116935)
,p_static_id=>'511787'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(51178830122116936)
,p_report_id=>wwv_flow_imp.id(51178645681116936)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51179985685116938)
,p_view_id=>wwv_flow_imp.id(51178830122116936)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(51179556483116938)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51180989743116939)
,p_view_id=>wwv_flow_imp.id(51178830122116936)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(51180552997116939)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51181977786116940)
,p_view_id=>wwv_flow_imp.id(51178830122116936)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(51181597673116940)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51182901568116940)
,p_view_id=>wwv_flow_imp.id(51178830122116936)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(51182556682116940)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51183969842116941)
,p_view_id=>wwv_flow_imp.id(51178830122116936)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(51183513423116941)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51184958919116941)
,p_view_id=>wwv_flow_imp.id(51178830122116936)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(51184544658116941)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51185976352116941)
,p_view_id=>wwv_flow_imp.id(51178830122116936)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(51185536726116941)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51186978003116942)
,p_view_id=>wwv_flow_imp.id(51178830122116936)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(51186505371116942)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51187942163116942)
,p_view_id=>wwv_flow_imp.id(51178830122116936)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(51187547363116942)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51177128621116668)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51164650473116659)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'CHANGE'
,p_button_condition=>'P173_ID_ORDEN_PROD'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51163622742116658)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:169:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51165073259116659)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'CREATE'
,p_button_condition=>'P173_ID_ORDEN_PROD'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(49477921849583625)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_button_name=>'CALCULAR_COSTOS'
,p_button_static_id=>'CALCULAR_COSTOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Calcular costos'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P173_ID_ORDEN_PROD IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(49475948070583605)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_button_name=>'BTN_CARGAR_INSUMOS'
,p_button_static_id=>'BTN_CARGAR_INSUMOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cargar insumos'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P173_ID_ORDEN_PROD IS NOT NULL',
'AND :P173_ESTADO = ''PENDIENTE'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(49477304202583619)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_button_name=>'BTN_FINALIZAR'
,p_button_static_id=>'BTN_FINALIZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>unistr('Finalizar producci\00F3n')
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P173_ID_ORDEN_PROD IS NOT NULL',
'AND :P173_ESTADO = ''EN_PROCESO'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(49476740043583613)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_button_name=>'BTN_INICIAR_PROD'
,p_button_static_id=>'BTN_INICIAR_PROD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>unistr('Iniciar producci\00F3n')
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P173_ID_ORDEN_PROD IS NOT NULL',
'AND :P173_ESTADO = ''PENDIENTE'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51164212937116659)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P173_ID_ORDEN_PROD'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(51166237574116660)
,p_branch_name=>'Go To Page 173'
,p_branch_action=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.::P173_ID_ORDEN_PROD:&P173_ID_ORDEN_PROD.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'CREATE,CARGAR,SAVE, INICIO_PROD,COSTEO'
,p_branch_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(51166923054116661)
,p_branch_name=>'Go To Page 169'
,p_branch_action=>'f?p=&APP_ID.:169:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'FINALIZAR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49477861159583624)
,p_name=>'P173_METODO_COSTEO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(49475806522583604)
,p_prompt=>'Metodo de costeo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_METODO_COSTEO'
,p_lov=>'.'||wwv_flow_imp.id(52149934500230494)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49576116763327033)
,p_name=>'P173_LIC_ID_LICITACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>unistr('Licitaci\00F3n')
,p_source=>'LIC_ID_LICITACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_LICITACION_ADJU'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT l.id_licitacion AS r',
'      ,l.nro_licitacion||'' CC: ''||l.codigo_contratacion||'' ''||l.convocante AS d',
'FROM licitacion l',
'WHERE l.eta_id_etapa = ''ADJU'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Licitaciones adjudicadas',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49576223413327034)
,p_name=>'P173_DET_ID_DET_LICITACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>unistr('Articulo de la licitaci\00F3n')
,p_source=>'DET_ID_DET_LICITACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  ''Lote: ''||lote||'', numero: ''||numero||'', Producto: ''||producto_nombre_catalogo||'' >> ''||producto_nombre_convocante||'', ''||',
'unidad_medida||''(''||a_unidad_medida||''), cantidad:''||Trim(To_Char(cantidad,''999g999g999d99'')) AS D ',
',id_det_licitacion AS R',
'FROM licitacion_det_producto l',
'WHERE l.lic_id_licitacion = :P173_LIC_ID_LICITACION',
'AND l.eta_id_etapa = ''ADJU''',
'ORDER BY lote, numero ASC'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccionar'
,p_lov_cascade_parent_items=>'P173_LIC_ID_LICITACION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', unistr('Art\00EDculos de la licitaci\00F3n'),
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49576384832327035)
,p_name=>'P173_ENT_ID_ENTIDAD_PRODUCTOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Entidad (productor)'
,p_source=>'ENT_ID_ENTIDAD_PRODUCTOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.id_entidad||'' - ''||e.nombre||'' ''||e.numero_documento AS d',
'      ,e.id_entidad AS r',
'FROM entidad e',
'WHERE EXISTS (',
'  SELECT 1',
'  FROM det_cabecera_produccion d',
'  WHERE d.rec_id_receta = :P173_REC_ID_RECETA',
'  AND d.ent_id_entidad_prestador = e.id_entidad',
')',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_lov_cascade_parent_items=>'P173_REC_ID_RECETA'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Lista de productores con receta definida.',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51149608211116641)
,p_name=>'P173_ID_ORDEN_PROD'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_source=>'ID_ORDEN_PROD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51150815589116646)
,p_name=>'P173_NRO_ORDEN'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Nro. orden'
,p_source=>'NRO_ORDEN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_colspan=>2
,p_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_imp.id(51151238801116647)
,p_name=>'P173_FECHA_ORDEN'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Fecha orden'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_ORDEN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>':P173_ESTADO != ''PENDIENTE'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'Y',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51151631988116648)
,p_name=>'P173_FECHA_INICIO_EST'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Inicio establecido'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_INICIO_EST'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'Y',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51152051331116648)
,p_name=>'P173_FECHA_FIN_REAL'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Fin real'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_FIN_REAL'
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
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'Y',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51152440877116648)
,p_name=>'P173_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Sucursal'
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SUCURSAL_ENTIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.id_suc_entidad AS r',
'      ,s.descripcion AS d',
'FROM sucursal_entidad s',
'WHERE s.ent_id_entidad = :APP_ID_ENTIDAD',
'AND s.estado = ''ACTIVO''',
''))
,p_cHeight=>1
,p_read_only_when=>':P173_ESTADO != ''PENDIENTE'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51152827528116649)
,p_name=>'P173_DEP_ID_DEPOSITO_ORIG'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Deposito origen'
,p_source=>'DEP_ID_DEPOSITO_ORIG'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_DEPOSITO'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>':P173_ESTADO != ''PENDIENTE'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51153272536116649)
,p_name=>'P173_DEP_ID_DEPOSITO_DEST'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Deposito destino'
,p_source=>'DEP_ID_DEPOSITO_DEST'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_DEPOSITO'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>':P173_ESTADO != ''PENDIENTE'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51153650408116650)
,p_name=>'P173_REC_ID_RECETA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Receta'
,p_source=>'REC_ID_RECETA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_RECETA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT c.id_receta AS r',
'      ,c.descripcion_receta AS d',
'FROM cab_receta_produccion c'))
,p_cSize=>30
,p_read_only_when=>':P173_ESTADO != ''PENDIENTE'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Recetas',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51154317977116652)
,p_name=>'P173_PRO_ID_PRODUCTO_FIN'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Producto final'
,p_source=>'PRO_ID_PRODUCTO_FIN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PRODUCTO_DESCRI_ART_SRV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.id_producto AS r',
'      ,p.descripcion AS d',
'FROM producto p'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51154756265116652)
,p_name=>'P173_CANTIDAD_A_PRODUCIR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Cantidad a producir'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'CANTIDAD_A_PRODUCIR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51155143572116652)
,p_name=>'P173_COSTO_TOTAL_ESTIMADO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Costo total estimado'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'COSTO_TOTAL_ESTIMADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51155539893116652)
,p_name=>'P173_COSTO_TOTAL_REAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Costo total real'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'COSTO_TOTAL_REAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51155934463116653)
,p_name=>'P173_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(49475806522583604)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_imp.id(51156364305116653)
,p_name=>'P173_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(49475705902583603)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51156763626116653)
,p_name=>'P173_USUARIO_REGISTRO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(49475806522583604)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Usuario registro'
,p_source=>'USUARIO_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_imp.id(51157127209116653)
,p_name=>'P173_FECHA_REGISTRO'
,p_source_data_type=>'DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(49475806522583604)
,p_item_source_plug_id=>wwv_flow_imp.id(51149248432116641)
,p_prompt=>'Fecha registro'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_imp.id(51163324630116658)
,p_name=>'P173_ID_ORDEN_PROD_COUNT'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(49475806522583604)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'class="fielddata"'
,p_begin_on_new_line=>'N'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49574938828327021)
,p_name=>'Buscar producto final'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P173_REC_ID_RECETA'
,p_condition_element=>'P173_REC_ID_RECETA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49476322029583609)
,p_event_id=>wwv_flow_imp.id(49574938828327021)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buscar_producto_final()'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49476089531583606)
,p_name=>'Cargar'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(49475948070583605)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49476549263583611)
,p_event_id=>wwv_flow_imp.id(49476089531583606)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CARGAR'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49476826581583614)
,p_name=>'Inicio'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(49476740043583613)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49477095420583616)
,p_event_id=>wwv_flow_imp.id(49476826581583614)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('Marcar inicio de la producci\00F3n?')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49476961795583615)
,p_event_id=>wwv_flow_imp.id(49476826581583614)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'INICIO_PROD'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49477483805583620)
,p_name=>'Finalizar'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(49477304202583619)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49477507614583621)
,p_event_id=>wwv_flow_imp.id(49477483805583620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('Confirma la finalizaci\00F3n de la producci\00F3n?')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49477624448583622)
,p_event_id=>wwv_flow_imp.id(49477483805583620)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'FINALIZAR'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49478099364583626)
,p_name=>'Costeo'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(49477921849583625)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49478167484583627)
,p_event_id=>wwv_flow_imp.id(49478099364583626)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Desea continuar con el costeo?'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49478289795583628)
,p_event_id=>wwv_flow_imp.id(49478099364583626)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'COSTEO'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49576485390327036)
,p_name=>'Inicio foco'
,p_event_sequence=>60
,p_condition_element=>'P173_NRO_ORDEN'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49576549576327037)
,p_event_id=>wwv_flow_imp.id(49576485390327036)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P173_FECHA_ORDEN'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51167895492116662)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(51149248432116641)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Form on CAB_ORDEN_PRODUCCION'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>51167895492116662
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51188518112116944)
,p_process_sequence=>35
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(51177828520116934)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Detalle de orden de producci\00F3n - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_exec_cond_for_each_row=>'Y'
,p_internal_uid=>51188518112116944
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49476446060583610)
,p_process_sequence=>45
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_produccion.cargar_insumos_orden(p_id_orden_prod => :P173_ID_ORDEN_PROD );',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CARGAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>49476446060583610
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49477273501583618)
,p_process_sequence=>55
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Iniciar produccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE cab_orden_produccion c',
'    SET c.fecha_inicio_est = CURRENT_DATE',
'       ,c.estado = ''EN_PROCESO'' ',
'    WHERE c.id_orden_prod = :P173_ID_ORDEN_PROD;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'INICIO_PROD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>49477273501583618
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49477722336583623)
,p_process_sequence=>65
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Finalizar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  salotex.pkg_produccion.finalizar_orden(',
'    p_id_orden_prod => :P173_ID_ORDEN_PROD',
'  );',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'FINALIZAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>unistr('\00A1Orden finalizada! Inventario actualizado.')
,p_internal_uid=>49477722336583623
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49478303623583629)
,p_process_sequence=>75
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Costeo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_produccion.calcular_costos_orden(',
'       p_id_orden_prod => :P173_ID_ORDEN_PROD,',
'       p_metodo_costeo => :P173_METODO_COSTEO',
'     );'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'COSTEO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>unistr('Costos calculados correctamente con m\00E9todo: &P173_METODO_COSTEO.')
,p_internal_uid=>49478303623583629
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51167412322116661)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(51149248432116641)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Form on CAB_ORDEN_PRODUCCION'
,p_attribute_03=>'P173_ID_ORDEN_PROD_COUNT'
,p_internal_uid=>51167412322116661
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49574712915327019)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P173_ID_ORDEN_PROD IS NULL THEN',
'    :P173_FECHA_ORDEN := TO_CHAR(CURRENT_DATE,''DD-MM-YYYY HH24:MI'');',
'    :P173_ESTADO := ''PENDIENTE'';',
'    :P173_USUARIO_REGISTRO := :APP_USER;',
'    :P173_FECHA_REGISTRO := TO_CHAR(CURRENT_DATE,''DD-MM-YYYY HH24:MI'');',
'    :P173_METODO_COSTEO := ''PROMEDIO'';',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>49574712915327019
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49574892717327020)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'producto_final'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_nombre_producto   producto.descripcion%TYPE;',
'    v_id_producto       producto.id_producto%TYPE;',
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
'    BEGIN',
'        SELECT p.id_producto',
'        INTO :P173_PRO_ID_PRODUCTO_FIN',
'        FROM cab_receta_produccion c',
'            ,producto p',
'        WHERE c.id_receta = :P173_REC_ID_RECETA',
'        AND p.id_producto = c.pro_id_producto_fin;  ',
'    END;',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P173_PRO_ID_PRODUCTO_FIN'', :P173_PRO_ID_PRODUCTO_FIN);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        ROLLBACK;',
'        apex_json.open_object;',
'        apex_json.write(''success'', FALSE);',
'        apex_json.write(''message'', utl_call_stack.error_msg(1));',
'        apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_internal_uid=>49574892717327020
);
wwv_flow_imp.component_end;
end;
/
