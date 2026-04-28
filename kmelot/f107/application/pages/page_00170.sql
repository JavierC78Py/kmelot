prompt --application/pages/page_00170
begin
--   Manifest
--     PAGE: 00170
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
 p_id=>170
,p_name=>'Detalle de receta'
,p_alias=>'DETALLE-DE-RECETA'
,p_step_title=>'Detalle de receta'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buscar_producto() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("buscar_producto", {',
'        pageItems: [',
'            "P170_PRO_ID_PRODUCTO_FIN"',
'    ]},',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'            } else {',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }',
'        }',
'    }).always( function() {',
'        waitPopup.remove();',
'    });',
'}',
'',
'function urlVerPDF(){',
'    apex.navigation.openInNewWindow(',
'        apex.server.url( {',
'            p_request: "application_process=ver_pdf",',
'            x01: apex.item("P170_ID_RECETA").getValue()',
'        })',
'    );',
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}',
'',
'.t-Footer, .t-Region-body {',
'    padding-top: 0px;',
'    padding-bottom: 0px;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(170366831358593208)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168775502998951654)
,p_plug_name=>'Datos de Receta'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_RECETA,',
'       PRO_ID_PRODUCTO_FIN,',
'       DESCRIPCION_RECETA,',
'       CANTIDAD_BASE,',
'       UNI_ID_UNIDAD_MEDIDA,',
'       ESTADO,',
'       USUARIO_REGISTRO,',
'       FECHA_REGISTRO,',
'       SEXO,',
'       TIP_ID_TIPO_LOGO,',
'       MON_ID_MONEDA',
'  from CAB_RECETA_PRODUCCION'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168793444638951675)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(206180564029405200)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168808701418983161)
,p_plug_name=>unistr('Pesta\00F1as')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168794127691951936)
,p_plug_name=>'Insumos y Materiales'
,p_region_name=>'REG_INSUMOS'
,p_parent_plug_id=>wwv_flow_imp.id(168808701418983161)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select D.ID_DET_RECETA,',
'       D.REC_ID_RECETA,',
'       D.PRO_ID_PRODUCTO_MAT,',
'       D.UNI_ID_UNIDAD_MEDIDA,',
'       D.CANTIDAD_REQUERIDA,',
'       D.MERMAS_PORCENTAJE,',
'       D.ESTADO,',
'       (',
'        SELECT P.TIPO',
'        FROM PRODUCTO P',
'        WHERE P.ID_PRODUCTO = D.PRO_ID_PRODUCTO_MAT',
'       ) TIPO_ARTICULO',
'  from DET_RECETA_PRODUCCION D',
' where D.REC_ID_RECETA = :P170_ID_RECETA',
' '))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P170_ID_RECETA'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P170_ID_RECETA'
,p_prn_page_header=>'Insumos y Materiales'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168795393857951940)
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
 p_id=>wwv_flow_imp.id(168795780022951940)
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
 p_id=>wwv_flow_imp.id(168796803752951942)
,p_name=>'ID_DET_RECETA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DET_RECETA'
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
 p_id=>wwv_flow_imp.id(168797777412951942)
,p_name=>'REC_ID_RECETA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REC_ID_RECETA'
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
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P170_ID_RECETA'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168798789177951945)
,p_name=>'PRO_ID_PRODUCTO_MAT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRO_ID_PRODUCTO_MAT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Producto materia prima'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'TIPO:TIPO_ARTICULO',
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Materia prima',
  'width', '900')).to_clob
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(158983750476131911)
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
 p_id=>wwv_flow_imp.id(168799821541951945)
,p_name=>'UNI_ID_UNIDAD_MEDIDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNI_ID_UNIDAD_MEDIDA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Unidad medida'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(157585458416540594)
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_lov_null_text=>'-- Seleccione'
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
 p_id=>wwv_flow_imp.id(168800809773951946)
,p_name=>'CANTIDAD_REQUERIDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD_REQUERIDA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad requerida'
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
 p_id=>wwv_flow_imp.id(168801730571951946)
,p_name=>'MERMAS_PORCENTAJE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MERMAS_PORCENTAJE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Mermas porcentaje'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'99G990D00'
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
 p_id=>wwv_flow_imp.id(168802773255951947)
,p_name=>'ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(208506997751136611)
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
,p_default_type=>'STATIC'
,p_default_expression=>'ACTIVO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168807530926983150)
,p_name=>'TIPO_ARTICULO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_ARTICULO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo articulo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_static_id=>'TIPO_ARTICULO'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(168794586284951937)
,p_internal_uid=>49561060713295799
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_add_authorization_scheme=>wwv_flow_imp.id(170367256876596729)
,p_update_authorization_scheme=>wwv_flow_imp.id(170367116594595896)
,p_delete_authorization_scheme=>wwv_flow_imp.id(170367478606598023)
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
,p_download_formats=>'CSV:XLSX'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(168794970604951938)
,p_interactive_grid_id=>wwv_flow_imp.id(168794586284951937)
,p_static_id=>'495615'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(168795222661951938)
,p_report_id=>wwv_flow_imp.id(168794970604951938)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168796177117951941)
,p_view_id=>wwv_flow_imp.id(168795222661951938)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(168795780022951940)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168797180942951942)
,p_view_id=>wwv_flow_imp.id(168795222661951938)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(168796803752951942)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168798197973951942)
,p_view_id=>wwv_flow_imp.id(168795222661951938)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(168797777412951942)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168799216377951945)
,p_view_id=>wwv_flow_imp.id(168795222661951938)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(168798789177951945)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168800189195951946)
,p_view_id=>wwv_flow_imp.id(168795222661951938)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(168799821541951945)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168801207174951946)
,p_view_id=>wwv_flow_imp.id(168795222661951938)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(168800809773951946)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168802147341951946)
,p_view_id=>wwv_flow_imp.id(168795222661951938)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(168801730571951946)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168803137010951947)
,p_view_id=>wwv_flow_imp.id(168795222661951938)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(168802773255951947)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(170172166465126150)
,p_view_id=>wwv_flow_imp.id(168795222661951938)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(168807530926983150)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_highlight(
 p_id=>wwv_flow_imp.id(119233703321656142)
,p_view_id=>wwv_flow_imp.id(168795222661951938)
,p_execution_seq=>5
,p_name=>'INACTIVO'
,p_background_color=>'#ffd6d2'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_imp.id(168802773255951947)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'INACTIVO'
,p_is_enabled=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168806492662983139)
,p_plug_name=>'Costos Operativos (Opcional)'
,p_region_name=>'REG_COSTOS'
,p_parent_plug_id=>wwv_flow_imp.id(168808701418983161)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_DET_RECETA_OPE,',
'       REC_ID_RECETA,',
'       DESCRIPCION,',
'       TIPO_COSTO,',
'       COSTO_ESTIMADO,',
'       ES_MANO_OBRA_PROD,',
'       ESTADO',
'  from DET_RECETA_PRODUCCION_OPE',
' where REC_ID_RECETA = :P170_ID_RECETA'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P170_ID_RECETA'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P170_ID_RECETA'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168806652932983141)
,p_name=>'ID_DET_RECETA_OPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DET_RECETA_OPE'
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
 p_id=>wwv_flow_imp.id(168806782703983142)
,p_name=>'REC_ID_RECETA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REC_ID_RECETA'
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
,p_default_type=>'ITEM'
,p_default_expression=>'P170_ID_RECETA'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168806904639983143)
,p_name=>'DESCRIPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPCION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(168806954051983144)
,p_name=>'TIPO_COSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_COSTO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo costo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(168820302182073516)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168807092511983145)
,p_name=>'COSTO_ESTIMADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COSTO_ESTIMADO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Costo estimado (Gs.)'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168807214869983146)
,p_name=>'ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(208506997751136611)
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
,p_default_type=>'STATIC'
,p_default_expression=>'ACTIVO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168807244174983147)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168807250000983150)
,p_name=>'ES_MANO_OBRA_PROD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ES_MANO_OBRA_PROD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'MO productor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>75
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Si;S,No;N'
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168807395198983148)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(168806593275983140)
,p_internal_uid=>49573067704327002
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_add_authorization_scheme=>wwv_flow_imp.id(170367256876596729)
,p_update_authorization_scheme=>wwv_flow_imp.id(170367116594595896)
,p_delete_authorization_scheme=>wwv_flow_imp.id(170367478606598023)
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
,p_download_formats=>'CSV:XLSX'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(168812405988057015)
,p_interactive_grid_id=>wwv_flow_imp.id(168806593275983140)
,p_static_id=>'495789'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(168812583849057015)
,p_report_id=>wwv_flow_imp.id(168812405988057015)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168813061980057017)
,p_view_id=>wwv_flow_imp.id(168812583849057015)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(168806652932983141)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168814015049057019)
,p_view_id=>wwv_flow_imp.id(168812583849057015)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(168806782703983142)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168814836540057020)
,p_view_id=>wwv_flow_imp.id(168812583849057015)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(168806904639983143)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168815817707057021)
,p_view_id=>wwv_flow_imp.id(168812583849057015)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(168806954051983144)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168816699990057022)
,p_view_id=>wwv_flow_imp.id(168812583849057015)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(168807092511983145)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168817621364057024)
,p_view_id=>wwv_flow_imp.id(168812583849057015)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(168807214869983146)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168817700000057030)
,p_view_id=>wwv_flow_imp.id(168812583849057015)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(168807250000983150)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(168818466169057025)
,p_view_id=>wwv_flow_imp.id(168812583849057015)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(168807244174983147)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168808745681983162)
,p_plug_name=>'Prestadores (productores)'
,p_region_name=>'REG_PRESTADORES'
,p_parent_plug_id=>wwv_flow_imp.id(168808701418983161)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_DET_PRESTADOR,',
'       REC_ID_RECETA,',
'       ENT_ID_ENTIDAD_PRESTADOR',
'  from DET_CABECERA_PRODUCCION',
' where REC_ID_RECETA = :P170_ID_RECETA'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P170_ID_RECETA'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P170_ID_RECETA'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168809013342983164)
,p_name=>'ID_DET_PRESTADOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DET_PRESTADOR'
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
 p_id=>wwv_flow_imp.id(168809056179983165)
,p_name=>'REC_ID_RECETA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REC_ID_RECETA'
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
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P170_ID_RECETA'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168809149998983166)
,p_name=>'ENT_ID_ENTIDAD_PRESTADOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ENT_ID_ENTIDAD_PRESTADOR'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Entidad (productor)'
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
  'min_chars', '0',
  'title', 'Entidad')).to_clob
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(251853650349747834)
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_lov_null_text=>'-- Seleccione'
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
 p_id=>wwv_flow_imp.id(168809278045983167)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168809371768983168)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(168808899287983163)
,p_internal_uid=>49575373716327025
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_add_authorization_scheme=>wwv_flow_imp.id(170367256876596729)
,p_update_authorization_scheme=>wwv_flow_imp.id(170367116594595896)
,p_delete_authorization_scheme=>wwv_flow_imp.id(170367478606598023)
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
,p_download_formats=>'CSV:XLSX'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(171678641786298978)
,p_interactive_grid_id=>wwv_flow_imp.id(168808899287983163)
,p_static_id=>'524452'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(171678870876298978)
,p_report_id=>wwv_flow_imp.id(171678641786298978)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(171679381781298982)
,p_view_id=>wwv_flow_imp.id(171678870876298978)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(168809013342983164)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(171680316615298984)
,p_view_id=>wwv_flow_imp.id(171678870876298978)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(168809056179983165)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(171681135016298986)
,p_view_id=>wwv_flow_imp.id(171678870876298978)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(168809149998983166)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(171683497751316051)
,p_view_id=>wwv_flow_imp.id(171678870876298978)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(168809278045983167)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168713436092239783)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_button_name=>'BTN_TAMANHOS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>unistr('Tama\00F1os')
,p_button_redirect_url=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:175:P175_P_ID_RECETA,P175_P_ID_PRODUCTO_FINAL:&P170_ID_RECETA.,&P170_PRO_ID_PRODUCTO_FIN.'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168784577919951668)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'CHANGE'
,p_button_condition=>'P170_ID_RECETA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(170367116594595896)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168783600420951667)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:168:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168785004405951669)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'CREATE'
,p_button_condition=>'P170_ID_RECETA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(170367256876596729)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800170212)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_button_name=>'VER_PDF'
,p_button_static_id=>'btn_ver_pdf'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ver PDF'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript: urlVerPDF();'
,p_button_condition=>':P170_ID_RECETA IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(173047016995819755)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_button_name=>'BTN_DUPLICAR'
,p_button_static_id=>'BTN_DUPLICAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Duplicar receta'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P170_ID_RECETA IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(170367116594595896)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168713170635239780)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_button_name=>'BTN_PRODUCTO'
,p_button_static_id=>'BTN_PRODUCTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Ficha producto'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:31:P31_ID_PRODUCTO,P31_P_PAGINA_ORIGEN:&P170_PRO_ID_PRODUCTO_FIN.,170'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P170_ID_RECETA IS NOT NULL',
'AND :P170_PRO_ID_PRODUCTO_FIN IS NOT NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168784160259951668)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P170_ID_RECETA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(170367478606598023)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(168807847566983153)
,p_branch_name=>'Aplica cambios'
,p_branch_action=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.::P170_ID_RECETA:&P170_ID_RECETA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'SAVE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(134309320309216004)
,p_name=>'P170_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_item_source_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_item_default=>'APP_ID_MONEDA_PRINCIPAL'
,p_item_default_type=>'ITEM'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(138408721672533380)
,p_name=>'P170_COSTO'
,p_item_sequence=>135
,p_item_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_prompt=>'Costo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(168775844996951654)
,p_name=>'P170_ID_RECETA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_item_source_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Receta'
,p_source=>'ID_RECETA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(168777083460951659)
,p_name=>'P170_PRO_ID_PRODUCTO_FIN'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_item_source_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_prompt=>'Producto final'
,p_source=>'PRO_ID_PRODUCTO_FIN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_PRODUCTO_ART_VAR_COL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT P.ID_PRODUCTO||'' - ''||P.DESCRIPCION D',
'      ,P.ID_PRODUCTO R',
'      ,P.TIPO',
'FROM PRODUCTO P',
'WHERE P.ESTADO = ''ACTIVO''',
'AND P.TIPO = ''ART''',
'ORDER BY P.DESCRIPCION ASC'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Producto',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(168777513089951661)
,p_name=>'P170_DESCRIPCION_RECETA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_item_source_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_prompt=>'Detalles / comentarios'
,p_source=>'DESCRIPCION_RECETA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>200
,p_cHeight=>1
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(168777895699951661)
,p_name=>'P170_CANTIDAD_BASE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_item_source_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_prompt=>'Cantidad base'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'CANTIDAD_BASE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(168778309171951661)
,p_name=>'P170_UNI_ID_UNIDAD_MEDIDA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_item_source_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_prompt=>'Unidad medida'
,p_source=>'UNI_ID_UNIDAD_MEDIDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_UNIDAD_MEDIDA_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT descripcion||'' (''||abreviatura||'')'' AS d',
'      ,id_unidad_medida AS r ',
'from unidad_medida',
'where estado = ''ACTIVO'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(168779019786951664)
,p_name=>'P170_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_item_source_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ESTADO'
,p_lov=>'.'||wwv_flow_imp.id(208506997751136611)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
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
 p_id=>wwv_flow_imp.id(168779415024951664)
,p_name=>'P170_USUARIO_REGISTRO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_item_source_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_prompt=>'Usuario registro'
,p_source=>'USUARIO_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(168779732032951664)
,p_name=>'P170_FECHA_REGISTRO'
,p_source_data_type=>'DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_item_source_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_prompt=>'Fecha registro'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(173046203582819747)
,p_name=>'P170_TAMANHOS_PRODUCIR'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_prompt=>unistr('Tama\00F1os a producir')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(173047601002819761)
,p_name=>'P170_SEXO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_item_source_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_prompt=>'Sexo'
,p_source=>'SEXO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SEXO_PRODUCTO'
,p_lov=>'.'||wwv_flow_imp.id(173166185700427161)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Sin definir'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(173047712512819762)
,p_name=>'P170_TIP_ID_TIPO_LOGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_item_source_plug_id=>wwv_flow_imp.id(168775502998951654)
,p_prompt=>'Tipo logo'
,p_source=>'TIP_ID_TIPO_LOGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TIPO_LOGO_PRODUCTO'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Sin definir'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(173047079675819756)
,p_name=>'Duplicar'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(173047016995819755)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(173047184226819757)
,p_event_id=>wwv_flow_imp.id(173047079675819756)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('\00BFDesea realizar la duplicaci\00F3n de la receta?')
,p_attribute_02=>'Duplicar'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(173047295377819758)
,p_event_id=>wwv_flow_imp.id(173047079675819756)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'REPLICAR'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(173047917364819764)
,p_name=>'Buscar info producto'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P170_PRO_ID_PRODUCTO_FIN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(173048005137819765)
,p_event_id=>wwv_flow_imp.id(173047917364819764)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buscar_producto()'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168787749776951671)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(168775502998951654)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Form on CAB_RECETA_PRODUCCION'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>49554224205295533
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168803773178951948)
,p_process_sequence=>35
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(168794127691951936)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Detalle de receta - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>49570247607295810
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168807430509983149)
,p_process_sequence=>45
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(168806492662983139)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Costos operativos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>49573904938327011
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168809475918983169)
,p_process_sequence=>55
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(168808745681983162)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Prestadores (productores) - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>49575950347327031
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(173046873855819754)
,p_process_sequence=>65
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Duplicar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    v_id_receta_origen  NUMBER := :P175_P_ID_RECETA;',
'    v_id_receta_nueva   NUMBER := seq_cab_receta_produccion.nextval; ',
'BEGIN ',
unistr('    -- 1) Duplicar cabecera (estado INACTIVO para revisi\00F3n) '),
'    INSERT INTO CAB_RECETA_PRODUCCION ( ',
'      PRO_ID_PRODUCTO_FIN, ',
'      ID_RECETA,',
'      DESCRIPCION_RECETA, ',
'      CANTIDAD_BASE,',
'      UNI_ID_UNIDAD_MEDIDA, ',
'      ESTADO, ',
'      USUARIO_REGISTRO, ',
'      FECHA_REGISTRO ',
'    )',
'        SELECT  PRO_ID_PRODUCTO_FIN, ',
'                v_id_receta_nueva,',
'                DESCRIPCION_RECETA || '' (Copia)'', ',
'                CANTIDAD_BASE,',
'                UNI_ID_UNIDAD_MEDIDA, ',
'                ''INACTIVO'', ',
'                :APP_USER, ',
'                SYSDATE',
'        FROM CAB_RECETA_PRODUCCION ',
'        WHERE ID_RECETA = v_id_receta_origen;',
'    -- 2) Duplicar materiales',
'    INSERT INTO DET_RECETA_PRODUCCION ( ',
'          REC_ID_RECETA, ',
'          PRO_ID_PRODUCTO_MAT, ',
'          UNI_ID_UNIDAD_MEDIDA, ',
'          CANTIDAD_REQUERIDA, ',
'          MERMAS_PORCENTAJE, ',
'          ESTADO',
'      )',
'        SELECT  v_id_receta_nueva, ',
'                PRO_ID_PRODUCTO_MAT, ',
'                UNI_ID_UNIDAD_MEDIDA,',
'                CANTIDAD_REQUERIDA, ',
'                MERMAS_PORCENTAJE, ',
'                ESTADO ',
'        FROM DET_RECETA_PRODUCCION ',
'        WHERE REC_ID_RECETA = v_id_receta_origen;',
'',
'    -- 3) Duplicar operaciones/costos',
'    INSERT INTO DET_RECETA_PRODUCCION_OPE (',
'        REC_ID_RECETA, ',
'        DESCRIPCION, ',
'        TIPO_COSTO, ',
'        COSTO_ESTIMADO, ',
'        ES_MANO_OBRA_PROD, ',
'        ESTADO',
'      )',
'        SELECT  v_id_receta_nueva, ',
'                DESCRIPCION, ',
'                TIPO_COSTO, ',
'                COSTO_ESTIMADO, ',
'                ES_MANO_OBRA_PROD, ',
'                ESTADO',
'        FROM DET_RECETA_PRODUCCION_OPE',
'        WHERE REC_ID_RECETA = v_id_receta_origen;',
'   ',
'        -- 4) Duplicar prestadores',
'        INSERT INTO DET_CABECERA_PRODUCCION (',
'            REC_ID_RECETA, ',
'            ENT_ID_ENTIDAD_PRESTADOR ',
'        )',
'            SELECT  v_id_receta_nueva, ',
'                    ENT_ID_ENTIDAD_PRESTADOR  ',
'            FROM DET_CABECERA_PRODUCCION',
'            WHERE REC_ID_RECETA = v_id_receta_origen; ',
'   ',
unistr('        -- 5) Duplicar tama\00F1os '),
'    INSERT INTO RECETA_PRODUCCION_TAMANHO (',
'        REC_ID_RECETA, ',
'        TAM_ID_TAMANHO ',
'    )',
'        SELECT  v_id_receta_nueva, ',
'                TAM_ID_TAMANHO',
'        FROM RECETA_PRODUCCION_TAMANHO',
'        WHERE REC_ID_RECETA = v_id_receta_origen; ',
'    APEX_APPLICATION.G_PRINT_SUCCESS_MESSAGE :=''Receta replicada exitosamente. Id de receta '' || v_id_receta_nueva || '' fue creada.'';         ',
'  END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'REPLICAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>53813348284163616
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168787400601951671)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(168775502998951654)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Form on CAB_RECETA_PRODUCCION'
,p_internal_uid=>49553875030295533
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(53812746843163610)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P170_ID_RECETA IS NOT NULL THEN',
'    SELECT listagg(p.tamanho,'','') within group (ORDER BY p.tamanho)',
'    INTO :P170_TAMANHOS_PRODUCIR',
'    FROM receta_produccion_tamanho r',
'        ,producto_tamanho p',
'    WHERE r.rec_id_receta = :P170_ID_RECETA',
'    AND p.id_tamanho = r.tam_id_tamanho;',
'',
'    :P170_COSTO := TO_CHAR(f_dev_costo_receta(:P170_ID_RECETA), ''FM999G999G999D00'');',
'END IF;    '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>53812746843163610
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(173046272414819748)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P170_ID_RECETA IS NOT NULL THEN',
'    SELECT listagg(p.tamanho,'','') within group (ORDER BY p.tamanho)',
'    INTO :P170_TAMANHOS_PRODUCIR',
'    FROM receta_produccion_tamanho r',
'        ,producto_tamanho p',
'    WHERE r.rec_id_receta = :P170_ID_RECETA',
'    AND p.id_tamanho = r.tam_id_tamanho;',
'',
'    :P170_COSTO := TO_CHAR(f_dev_costo_receta(:P170_ID_RECETA), ''FM999G999G999D00'');',
'END IF;    '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>53812746843163610
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(173047806903819763)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'buscar_producto'
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
'',
'    SELECT p.sexo',
'          ,p.tip_id_tipo_logo',
'    INTO  :P170_SEXO',
'         ,:P170_TIP_ID_TIPO_LOGO    ',
'    FROM producto p',
'    WHERE p.id_producto = :P170_PRO_ID_PRODUCTO_FIN;',
'',
'  apex_json.open_object;',
'  apex_json.write(''success'', TRUE);',
'  apex_json.open_array(''items'');',
'  output_json_item(''P170_SEXO'', :P170_SEXO);',
'  output_json_item(''P170_TIP_ID_TIPO_LOGO'', :P170_TIP_ID_TIPO_LOGO);',
'  apex_json.close_array;',
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
,p_internal_uid=>53814281332163625
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800170320)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ver_pdf'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  vl_vNomReporte VARCHAR2(255);',
'  vl_empresa parametros.nombre%type;',
'BEGIN',
'    SELECT p.nombre',
'    INTO vl_empresa',
'    FROM parametros p;',
'  vl_vNomReporte := ''RECETA_PRODUCCION'';',
'',
'  pkg_jasperreports_server.descarga_reporte(p_vNomReporte  => vl_vNomReporte',
'                                           ,p_aNomParams   => apex_util.string_to_table(''P_ID_RECETA:P_USUARIO:P_EMPRESA'')',
'                                           ,p_aValParams   => apex_util.string_to_table(apex_application.g_x01||'':''||:APP_USER||'':''||vl_empresa)',
'                                            );',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>800170320
);
wwv_flow_imp.component_end;
end;
/
