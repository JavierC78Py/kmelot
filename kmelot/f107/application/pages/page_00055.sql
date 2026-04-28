prompt --application/pages/page_00055
begin
--   Manifest
--     PAGE: 00055
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
 p_id=>55
,p_name=>'Control gastos'
,p_alias=>'CONTROL-GASTOS'
,p_step_title=>'Control gastos'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function transferir(){',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("transferir", {',
'        pageItems: [',
'        "P55_P_ORIGEN"',
'       ,"P55_P_DESTINO" ',
'       ,"P55_P_FECHA"',
'       ,"P55_P_IMPORTE"',
'       ,"P55_PERIODO"',
'        ]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
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
'function devSaldo() {',
'    apex.message.clearErrors();',
'    apex.server.process(',
'        "dev_saldo_control_gasto",',
'        {},',
'        {',
'            success:function(data){',
'                if (data.success){',
'                    apex.item("P55_SALDO").setValue( data.saldo );',
'                }',
'                else{',
'                    apex.message.showErrors([{',
'                        type:"error",',
'                        location:"page",',
'                        message: data.message,',
'                        unsafe:false',
'                    }]);',
'                }',
'            }',
'        }',
'    )    ',
'}'))
,p_javascript_code_onload=>'$("#P55_SALDO").prop( ''readOnly'', true);'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Achicar bread*/',
'.t-BreadcrumbRegion {',
'    padding: 3px;',
'}',
'.t-Region-headerItems--title{    ',
'    padding: 0px;',
'}',
'#REG_RESU_GASTOS_control_panel, #REG_RESU_INGRESOS_control_panel{',
'    display: none;',
'}',
'.aling_derecha {',
'    text-align: right;',
'}',
'/*Inicio para extender region*/',
'.t-Body-contentInner {',
'    height: 100vh !important;',
'    padding: 10px;',
'}',
'.t-Body-content {',
'    height: 100%;',
'}',
'.container {',
'    height: 100%;',
'    display: flex;',
'    flex-direction: column;',
'}',
unistr('/* Si la regi\00F3n celeste tiene una clase espec\00EDfica, por ejemplo ''mi-region'' */'),
'/*',
'.mi-region {',
'    flex: 1;',
'    overflow: auto;',
'}',
'*/',
'/*Fin*/'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202421779215856396)
,p_plug_name=>unistr('M\00E1s Info')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206078747482517932)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(206180564029405200)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206091082458563579)
,p_plug_name=>'Registro de egresos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'SESSION')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(194894985199581399)
,p_plug_name=>'Ingresos'
,p_region_name=>'INGRESOS'
,p_parent_plug_id=>wwv_flow_imp.id(206091082458563579)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_GASTO',
'       ,TIPO',
'       ,FECHA',
'       ,IMPORTE',
'       ,DESCRIPCION',
'       ,CON_ID_CONCEPTO',
'       ,DIS_ID_DISPONIBILIDAD',
'       ,PERIODO',
'  from REGISTRO_GASTO_INGRESO',
' where TIPO = ''I''',
'   and PERIODO = to_date(:P55_PERIODO,''month/yyyy'')',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P55_PERIODO'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Ingresos'
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
 p_id=>wwv_flow_imp.id(194895226004581401)
,p_name=>'ID_GASTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_GASTO'
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(194895325325581402)
,p_name=>'TIPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO'
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
,p_default_type=>'STATIC'
,p_default_expression=>'I'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(194895408271581403)
,p_name=>'FECHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON:CLEAR-BUTTON',
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
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'to_char(current_date,''dd-mm-yyyy'')'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(194895490164581404)
,p_name=>'IMPORTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPORTE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_heading=>'Importe'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    '    decimalPlaces: 0',
    '}')))).to_clob
,p_is_required=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(194895632238581405)
,p_name=>'DESCRIPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPCION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(194895760658581407)
,p_name=>'DIS_ID_DISPONIBILIDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIS_ID_DISPONIBILIDAD'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Disponibilidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(242782088970553336)
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
 p_id=>wwv_flow_imp.id(194895859178581408)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(194895977631581409)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(202345062893274182)
,p_name=>'CON_ID_CONCEPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CON_ID_CONCEPTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_lov_id=>wwv_flow_imp.id(202344190280266495)
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
 p_id=>wwv_flow_imp.id(214166725055186480)
,p_name=>'PERIODO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PERIODO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'to_date(:P55_PERIODO,''month/yyyy'')'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(194895088052581400)
,p_internal_uid=>1928543416918522
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No se encuentran datos.'
,p_show_toolbar=>true
,p_toolbar_buttons=>'SAVE'
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
 p_id=>wwv_flow_imp.id(194940810397716188)
,p_interactive_grid_id=>wwv_flow_imp.id(194895088052581400)
,p_static_id=>'19743'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(194940960573716188)
,p_report_id=>wwv_flow_imp.id(194940810397716188)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(194941460799716190)
,p_view_id=>wwv_flow_imp.id(194940960573716188)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(194895226004581401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(194942408307716193)
,p_view_id=>wwv_flow_imp.id(194940960573716188)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(194895325325581402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(194943250630716197)
,p_view_id=>wwv_flow_imp.id(194940960573716188)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(194895408271581403)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(194944228252716200)
,p_view_id=>wwv_flow_imp.id(194940960573716188)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(194895490164581404)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(194945091226716203)
,p_view_id=>wwv_flow_imp.id(194940960573716188)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(194895632238581405)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(194946910895716209)
,p_view_id=>wwv_flow_imp.id(194940960573716188)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(194895760658581407)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(194949602927723737)
,p_view_id=>wwv_flow_imp.id(194940960573716188)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(194895859178581408)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(202364837592650802)
,p_view_id=>wwv_flow_imp.id(194940960573716188)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(202345062893274182)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(214174264279195322)
,p_view_id=>wwv_flow_imp.id(194940960573716188)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(214166725055186480)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206297743878647993)
,p_plug_name=>'Egresos'
,p_region_name=>'GASTOS'
,p_parent_plug_id=>wwv_flow_imp.id(206091082458563579)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_GASTO',
'       ,TIPO',
'       ,FECHA',
'       ,IMPORTE',
'       ,DESCRIPCION',
'       ,CON_ID_CONCEPTO',
'       ,DIS_ID_DISPONIBILIDAD',
'       ,PERIODO',
'  from REGISTRO_GASTO_INGRESO',
' where TIPO = ''G''',
'   and PERIODO = to_date(:P55_PERIODO,''month/yyyy'')'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P55_PERIODO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Egresos'
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
 p_id=>wwv_flow_imp.id(202345007690274181)
,p_name=>'CON_ID_CONCEPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CON_ID_CONCEPTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_lov_id=>wwv_flow_imp.id(202344190280266495)
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
 p_id=>wwv_flow_imp.id(206297943959647995)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206297982679647996)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206298128562647997)
,p_name=>'ID_GASTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_GASTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206298239326647998)
,p_name=>'TIPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'G'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206298267186647999)
,p_name=>'FECHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
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
,p_format_mask=>'DD-MM-YYYY'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'to_char(current_date,''dd-mm-yyyy'')'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206298346313648000)
,p_name=>'IMPORTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPORTE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_heading=>'Importe'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    '    decimalPlaces: 0',
    '}')))).to_clob
,p_is_required=>true
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206298492305648001)
,p_name=>'DESCRIPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPCION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206298722876648003)
,p_name=>'DIS_ID_DISPONIBILIDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIS_ID_DISPONIBILIDAD'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Disponibilidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(242782088970553336)
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
 p_id=>wwv_flow_imp.id(214166601581186479)
,p_name=>'PERIODO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PERIODO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'to_date(:P55_PERIODO,''month/yyyy'')'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(206297843095647994)
,p_internal_uid=>13331298459985116
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_no_data_found_message=>'No se encuentran datos.'
,p_show_toolbar=>true
,p_toolbar_buttons=>'ACTIONS_MENU:SAVE'
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
 p_id=>wwv_flow_imp.id(197044530717813492)
,p_interactive_grid_id=>wwv_flow_imp.id(206297843095647994)
,p_static_id=>'40780'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(197044713420813493)
,p_report_id=>wwv_flow_imp.id(197044530717813492)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(197045613667813501)
,p_view_id=>wwv_flow_imp.id(197044713420813493)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(206297982679647996)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(197046472426813506)
,p_view_id=>wwv_flow_imp.id(197044713420813493)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(206298128562647997)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(197047433868813509)
,p_view_id=>wwv_flow_imp.id(197044713420813493)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(206298239326647998)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(197048263495813513)
,p_view_id=>wwv_flow_imp.id(197044713420813493)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(206298267186647999)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(197049146475813518)
,p_view_id=>wwv_flow_imp.id(197044713420813493)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(206298346313648000)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(197050103059813521)
,p_view_id=>wwv_flow_imp.id(197044713420813493)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(206298492305648001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(197051811353813528)
,p_view_id=>wwv_flow_imp.id(197044713420813493)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(206298722876648003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(202363879758650797)
,p_view_id=>wwv_flow_imp.id(197044713420813493)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(202345007690274181)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(214173438098195316)
,p_view_id=>wwv_flow_imp.id(197044713420813493)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(214166601581186479)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206299197293648008)
,p_plug_name=>'Resumen'
,p_parent_plug_id=>wwv_flow_imp.id(206091082458563579)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202152339164202779)
,p_plug_name=>'GIngresos'
,p_parent_plug_id=>wwv_flow_imp.id(206299197293648008)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(202152438758202780)
,p_region_id=>wwv_flow_imp.id(202152339164202779)
,p_chart_type=>'bar'
,p_height=>'70'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'N'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(202152525231202781)
,p_chart_id=>wwv_flow_imp.id(202152438758202780)
,p_seq=>10
,p_name=>'Ingresos'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from (',
'select (',
'     SELECT sum(C.IMPORTE_PREVISTO)',
'     FROM CATEGORIA_GASTO_INGRESO C',
'     WHERE C.TIPO = ''I''',
'     AND trunc(C.PERIODO,''MM'') = to_date(:P55_PERIODO,''Month-YYYY'')',
'       ) monto',
'       , ''Previsto'' titulo',
'from dual         ',
'union ',
'select (',
'     SELECT Sum(r.importe)',
'     FROM registro_gasto_ingreso r',
'     WHERE r.tipo = ''I''',
'     AND r.periodo = to_date(:P55_PERIODO,''Month-YYYY'')',
'       ) monto',
'     , ''Real'' titulo',
'from dual     ',
')',
'order by titulo',
''))
,p_ajax_items_to_submit=>'P55_PERIODO'
,p_items_value_column_name=>'MONTO'
,p_items_label_column_name=>'TITULO'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(202152560851202782)
,p_chart_id=>wwv_flow_imp.id(202152438758202780)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(202152714588202783)
,p_chart_id=>wwv_flow_imp.id(202152438758202780)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202421862392856397)
,p_plug_name=>'Resumen Egresos'
,p_region_name=>'REG_RESU_GASTOS'
,p_parent_plug_id=>wwv_flow_imp.id(206299197293648008)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>70
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  G.TIPO',
'       ,G.DESCRIPCION',
'       ,G.IMPORTE_PREVISTO',
'       ,G.DEL_PERIODO REAL',
'       ,CASE WHEN G.IMPORTE_PREVISTO >= G.DEL_PERIODO THEN ',
'          G.IMPORTE_PREVISTO - G.DEL_PERIODO',
'        ELSE',
'          0',
'        END PENDIENTE',
'       ,CASE WHEN G.IMPORTE_PREVISTO < G.DEL_PERIODO THEN ',
'          G.DEL_PERIODO - G.IMPORTE_PREVISTO',
'        ELSE',
'          0',
'        END DE_MAS',
'  from (',
'        SELECT RR.TIPO',
'              ,CO.DESCRIPCION',
'              ,NVL(C.IMPORTE_PREVISTO,0) IMPORTE_PREVISTO',
'              ,RR.IMPORTE_PERIODO DEL_PERIODO',
'        FROM CATEGORIA_GASTO_INGRESO C',
'            ,(',
'            SELECT r.con_id_concepto',
'                  ,r.tipo',
'                  ,sum(r.importe) IMPORTE_PERIODO',
'            FROM registro_gasto_ingreso r',
'            WHERE r.tipo = ''G''',
'            AND r.periodo = to_date(:P55_PERIODO,''month/yyyy'')',
'            GROUP BY r.con_id_concepto, r.tipo',
'            ) RR',
'            ,CONCEPTO_GASTO_INGRESO CO',
'        WHERE C.CON_ID_CONCEPTO (+) = RR.CON_ID_CONCEPTO',
'        AND C.PERIODO(+) = to_date(:P55_PERIODO,''month/yyyy'')',
'        AND CO.ID_CONCEPTO = RR.CON_ID_CONCEPTO',
'       ) G',
'',
'UNION ALL       ',
'',
'select  G.TIPO',
'       ,G.DESCRIPCION',
'       ,G.IMPORTE_PREVISTO',
'       ,G.DEL_PERIODO REAL',
'       ,CASE WHEN G.IMPORTE_PREVISTO >= G.DEL_PERIODO THEN ',
'          G.IMPORTE_PREVISTO - G.DEL_PERIODO',
'        ELSE',
'          0',
'        END PENDIENTE',
'       ,CASE WHEN G.IMPORTE_PREVISTO < G.DEL_PERIODO THEN ',
'          G.DEL_PERIODO - G.IMPORTE_PREVISTO',
'        ELSE',
'          0',
'        END DE_MAS',
'  from (',
'        SELECT C.TIPO',
'              ,CO.DESCRIPCION',
'              ,C.IMPORTE_PREVISTO',
'              ,0 DEL_PERIODO',
'        FROM CATEGORIA_GASTO_INGRESO C',
'            ,CONCEPTO_GASTO_INGRESO CO',
'        WHERE C.PERIODO(+) = to_date(:P55_PERIODO,''month/yyyy'')',
'        AND CO.ID_CONCEPTO = C.CON_ID_CONCEPTO',
'        AND C.TIPO = ''G''',
'        AND NOT EXISTS (',
'            SELECT r.con_id_concepto',
'            FROM registro_gasto_ingreso r',
'            WHERE r.tipo = ''G''',
'            AND r.periodo = to_date(:P55_PERIODO,''month/yyyy'')',
'            AND r.con_id_concepto = c.con_id_concepto           ',
'        )',
'       ) G  ',
'ORDER BY DESCRIPCION       ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P55_PERIODO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Resumen Gastos'
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
,p_plug_header=>'<B><FONT COLOR="red">Egresos</FONT></B>'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(202422652326856405)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>9456107691193527
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202422784612856406)
,p_db_column_name=>'TIPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202422860488856407)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202422966284856408)
,p_db_column_name=>'IMPORTE_PREVISTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Previsto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202423047399856409)
,p_db_column_name=>'REAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Real'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202423162035856410)
,p_db_column_name=>'PENDIENTE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Pendiente'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202423330182856411)
,p_db_column_name=>'DE_MAS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('De m\00E1s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(203146947044295102)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'101805'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TIPO:DESCRIPCION:IMPORTE_PREVISTO:REAL:PENDIENTE:DE_MAS'
,p_sum_columns_on_break=>'IMPORTE_PREVISTO:REAL:PENDIENTE:DE_MAS'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(252266850064614390)
,p_report_id=>wwv_flow_imp.id(203146947044295102)
,p_name=>'Descripcion'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'DESCRIPCION'
,p_operator=>'is not null'
,p_condition_sql=>' (case when ("DESCRIPCION" is not null) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME#'
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#e8e8e8'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(252267341809614391)
,p_report_id=>wwv_flow_imp.id(203146947044295102)
,p_name=>'Falta pagar'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'REAL'
,p_operator=>'='
,p_expr=>'0'
,p_condition_sql=>' (case when ("REAL" = to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>11
,p_column_bg_color=>'#ffd6d2'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206300619128648022)
,p_plug_name=>'GGastos'
,p_parent_plug_id=>wwv_flow_imp.id(206299197293648008)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(206300677341648023)
,p_region_id=>wwv_flow_imp.id(206300619128648022)
,p_chart_type=>'bar'
,p_height=>'70'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'N'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(206300817221648024)
,p_chart_id=>wwv_flow_imp.id(206300677341648023)
,p_seq=>10
,p_name=>'Gastos'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from (',
'select (',
'     SELECT sum(C.IMPORTE_PREVISTO)',
'     FROM CATEGORIA_GASTO_INGRESO C',
'     WHERE C.TIPO = ''G''',
'     AND trunc(C.PERIODO,''MM'') = to_date(:P55_PERIODO,''Month-YYYY'')',
'       ) monto',
'       , ''Previsto'' titulo',
'from dual         ',
'union ',
'select (',
'     SELECT Sum(r.importe)',
'     FROM registro_gasto_ingreso r',
'     WHERE r.tipo = ''G''',
'     AND r.periodo = to_date(:P55_PERIODO,''Month-YYYY'')',
'       ) monto',
'     , ''Real'' titulo',
'from dual     ',
')',
'order by titulo',
''))
,p_ajax_items_to_submit=>'P55_PERIODO'
,p_items_value_column_name=>'MONTO'
,p_items_label_column_name=>'TITULO'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(206300923667648025)
,p_chart_id=>wwv_flow_imp.id(206300677341648023)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(206300975395648026)
,p_chart_id=>wwv_flow_imp.id(206300677341648023)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(214169232248186505)
,p_plug_name=>'Derecha'
,p_parent_plug_id=>wwv_flow_imp.id(206299197293648008)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202423372525856412)
,p_plug_name=>'Resumen Ingresos'
,p_region_name=>'REG_RESU_INGRESOS'
,p_parent_plug_id=>wwv_flow_imp.id(214169232248186505)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>90
,p_plug_new_grid_row=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  G.TIPO',
'       ,G.DESCRIPCION',
'       ,G.IMPORTE_PREVISTO',
'       ,G.DEL_PERIODO REAL',
'       ,CASE WHEN G.IMPORTE_PREVISTO >= G.DEL_PERIODO THEN ',
'          G.IMPORTE_PREVISTO - G.DEL_PERIODO',
'        ELSE',
'          0',
'        END PENDIENTE',
'       ,CASE WHEN G.IMPORTE_PREVISTO < G.DEL_PERIODO THEN ',
'          G.DEL_PERIODO - G.IMPORTE_PREVISTO',
'        ELSE',
'          0',
'        END DE_MAS',
'  from (',
'        SELECT RR.TIPO',
'              ,CO.DESCRIPCION',
'              ,NVL(C.IMPORTE_PREVISTO,0) IMPORTE_PREVISTO',
'              ,RR.IMPORTE_PERIODO DEL_PERIODO',
'        FROM CATEGORIA_GASTO_INGRESO C',
'            ,(',
'            SELECT r.con_id_concepto',
'                  ,r.tipo',
'                  ,sum(r.importe) IMPORTE_PERIODO',
'            FROM registro_gasto_ingreso r',
'            WHERE r.tipo = ''I''',
'            AND r.periodo = to_date(:P55_PERIODO,''month/yyyy'')',
'            GROUP BY r.con_id_concepto, r.tipo',
'            ) RR',
'            ,CONCEPTO_GASTO_INGRESO CO',
'        WHERE C.CON_ID_CONCEPTO (+) = RR.CON_ID_CONCEPTO',
'        AND C.PERIODO(+) = to_date(:P55_PERIODO,''month/yyyy'')',
'        AND CO.ID_CONCEPTO = RR.CON_ID_CONCEPTO',
'       ) G',
'',
'UNION ALL       ',
'',
'select  G.TIPO',
'       ,G.DESCRIPCION',
'       ,G.IMPORTE_PREVISTO',
'       ,G.DEL_PERIODO REAL',
'       ,CASE WHEN G.IMPORTE_PREVISTO >= G.DEL_PERIODO THEN ',
'          G.IMPORTE_PREVISTO - G.DEL_PERIODO',
'        ELSE',
'          0',
'        END PENDIENTE',
'       ,CASE WHEN G.IMPORTE_PREVISTO < G.DEL_PERIODO THEN ',
'          G.DEL_PERIODO - G.IMPORTE_PREVISTO',
'        ELSE',
'          0',
'        END DE_MAS',
'  from (',
'        SELECT C.TIPO',
'              ,CO.DESCRIPCION',
'              ,C.IMPORTE_PREVISTO',
'              ,0 DEL_PERIODO',
'        FROM CATEGORIA_GASTO_INGRESO C',
'            ,CONCEPTO_GASTO_INGRESO CO',
'        WHERE C.PERIODO(+) = to_date(:P55_PERIODO,''month/yyyy'')',
'        AND CO.ID_CONCEPTO = C.CON_ID_CONCEPTO',
'        AND C.TIPO = ''I''',
'        AND NOT EXISTS (',
'            SELECT r.con_id_concepto',
'            FROM registro_gasto_ingreso r',
'            WHERE r.tipo = ''I''',
'            AND r.periodo = to_date(:P55_PERIODO,''month/yyyy'')',
'            AND r.con_id_concepto = c.con_id_concepto           ',
'        )',
'       ) G  ',
'ORDER BY DESCRIPCION       ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P55_PERIODO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Resumen Ingresos'
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
,p_plug_header=>'<B><FONT COLOR="red">Ingresos</FONT></B>'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(202424162097856420)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>9457617462193542
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202424300443856421)
,p_db_column_name=>'TIPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202424411656856422)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202424528088856423)
,p_db_column_name=>'IMPORTE_PREVISTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Previsto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202424611524856424)
,p_db_column_name=>'REAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Real'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202424677078856425)
,p_db_column_name=>'PENDIENTE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Pendiente'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202424839065856426)
,p_db_column_name=>'DE_MAS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('De m\00E1s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(203150800603301134)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'101843'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TIPO:DESCRIPCION:IMPORTE_PREVISTO:REAL:PENDIENTE:DE_MAS'
,p_sum_columns_on_break=>'IMPORTE_PREVISTO:REAL:PENDIENTE:DE_MAS'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(203162472818443695)
,p_report_id=>wwv_flow_imp.id(203150800603301134)
,p_name=>'Descripcion'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'DESCRIPCION'
,p_operator=>'is not null'
,p_condition_sql=>' (case when ("DESCRIPCION" is not null) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME#'
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#e8e8e8'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(214167484132186488)
,p_plug_name=>'Por concepto'
,p_parent_plug_id=>wwv_flow_imp.id(214169232248186505)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>100
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(214167567253186489)
,p_region_id=>wwv_flow_imp.id(214167484132186488)
,p_chart_type=>'pie'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(214167696876186490)
,p_chart_id=>wwv_flow_imp.id(214167567253186489)
,p_seq=>10
,p_name=>'Datos'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select G.DESCRIPCION',
'      ,G.DEL_PERIODO REAL',
'  from (',
'        SELECT RR.TIPO',
'              ,CO.DESCRIPCION',
'              ,NVL(C.IMPORTE_PREVISTO,0) IMPORTE_PREVISTO',
'              ,RR.IMPORTE_PERIODO DEL_PERIODO',
'        FROM CATEGORIA_GASTO_INGRESO C',
'            ,(',
'            SELECT r.con_id_concepto',
'                  ,r.tipo',
'                  ,sum(r.importe) IMPORTE_PERIODO',
'            FROM registro_gasto_ingreso r',
'            WHERE r.tipo = ''G''',
'            AND r.periodo = to_date(:P55_PERIODO,''month/yyyy'')',
'            GROUP BY r.con_id_concepto, r.tipo',
'            ) RR',
'            ,CONCEPTO_GASTO_INGRESO CO',
'        WHERE C.CON_ID_CONCEPTO (+) = RR.CON_ID_CONCEPTO',
'        AND C.PERIODO(+) = to_date(:P55_PERIODO,''month/yyyy'')',
'        AND CO.ID_CONCEPTO = RR.CON_ID_CONCEPTO',
'       ) G',
'',
'UNION ALL       ',
'',
'select  G.DESCRIPCION',
'       ,G.DEL_PERIODO REAL',
'  from (',
'        SELECT C.TIPO',
'              ,CO.DESCRIPCION',
'              ,C.IMPORTE_PREVISTO',
'              ,0 DEL_PERIODO',
'        FROM CATEGORIA_GASTO_INGRESO C',
'            ,CONCEPTO_GASTO_INGRESO CO',
'        WHERE C.PERIODO(+) = to_date(:P55_PERIODO,''month/yyyy'')',
'        AND CO.ID_CONCEPTO = C.CON_ID_CONCEPTO',
'        AND C.TIPO = ''G''',
'        AND NOT EXISTS (',
'            SELECT r.con_id_concepto',
'            FROM registro_gasto_ingreso r',
'            WHERE r.tipo = ''G''',
'            AND r.periodo = to_date(:P55_PERIODO,''month/yyyy'')',
'            AND r.con_id_concepto = c.con_id_concepto           ',
'        )',
'       ) G  ',
'ORDER BY REAL       ',
''))
,p_ajax_items_to_submit=>'P55_PERIODO'
,p_series_name_column_name=>'DESCRIPCION'
,p_items_value_column_name=>'REAL'
,p_items_label_column_name=>'DESCRIPCION'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(242788031586430596)
,p_plug_name=>'Transferencias'
,p_region_name=>'REG_TRANSFERENCIA'
,p_parent_plug_id=>wwv_flow_imp.id(206091082458563579)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_GASTO',
'       ,TIPO',
'       ,FECHA',
'       ,IMPORTE',
'       ,DESCRIPCION',
'       ,CON_ID_CONCEPTO',
'       ,DIS_ID_DISPONIBILIDAD',
'       ,PERIODO',
'  from REGISTRO_GASTO_INGRESO',
' where TIPO = ''T''',
'   and PERIODO = to_date(:P55_PERIODO,''month/yyyy'')',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P55_PERIODO'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Transferencias'
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
 p_id=>wwv_flow_imp.id(242788190251430598)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(242788281086430599)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(242788425663430600)
,p_name=>'ID_GASTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_GASTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(242788445949430601)
,p_name=>'TIPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'I'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(242788566962430602)
,p_name=>'FECHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON:CLEAR-BUTTON',
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
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'to_char(current_date,''dd-mm-yyyy'')'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(242788644675430603)
,p_name=>'IMPORTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPORTE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_heading=>'Importe'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    '    decimalPlaces: 0',
    '}')))).to_clob
,p_is_required=>true
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(242788815286430604)
,p_name=>'DESCRIPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPCION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(242788938757430605)
,p_name=>'DIS_ID_DISPONIBILIDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIS_ID_DISPONIBILIDAD'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Disponibilidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(242782088970553336)
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
 p_id=>wwv_flow_imp.id(242789044242430606)
,p_name=>'CON_ID_CONCEPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CON_ID_CONCEPTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_lov_id=>wwv_flow_imp.id(202344190280266495)
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
 p_id=>wwv_flow_imp.id(242789075997430607)
,p_name=>'PERIODO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PERIODO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'to_date(:P55_PERIODO,''month/yyyy'')'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(242788123256430597)
,p_internal_uid=>49821578620767719
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No se encuentran datos.'
,p_show_toolbar=>true
,p_toolbar_buttons=>'SAVE'
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
 p_id=>wwv_flow_imp.id(242806058026169680)
,p_interactive_grid_id=>wwv_flow_imp.id(242788123256430597)
,p_static_id=>'498396'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(242806299202169680)
,p_report_id=>wwv_flow_imp.id(242806058026169680)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(242807169497169672)
,p_view_id=>wwv_flow_imp.id(242806299202169680)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(242788281086430599)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(242808122342169669)
,p_view_id=>wwv_flow_imp.id(242806299202169680)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(242788425663430600)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(242808987032169667)
,p_view_id=>wwv_flow_imp.id(242806299202169680)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(242788445949430601)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(242809882888169664)
,p_view_id=>wwv_flow_imp.id(242806299202169680)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(242788566962430602)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(242810808932169662)
,p_view_id=>wwv_flow_imp.id(242806299202169680)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(242788644675430603)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(242811688779169660)
,p_view_id=>wwv_flow_imp.id(242806299202169680)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(242788815286430604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(242812604848169657)
,p_view_id=>wwv_flow_imp.id(242806299202169680)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(242788938757430605)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(242813513301169655)
,p_view_id=>wwv_flow_imp.id(242806299202169680)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(242789044242430606)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(242814389999169653)
,p_view_id=>wwv_flow_imp.id(242806299202169680)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(242789075997430607)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(255049595844646495)
,p_plug_name=>'Extracto'
,p_parent_plug_id=>wwv_flow_imp.id(206091082458563579)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT x.id_gasto',
'      ,x.tipo',
'      ,x.fecha',
'      ,x.importe',
'      ,Sum(x.importe',
'      ) OVER( PARTITION BY x.periodo',
'              ORDER BY x.fecha ASC, x.id_gasto',
'              ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW',
'           ) AS saldo',
'      ,x.descripcion',
'      ,x.dis_id_disponibilidad',
'      ,x.con_id_concepto',
'      ,x.periodo',
'      ,x.orden',
'FROM (',
'SELECT   t.id_gasto',
'        ,t.tipo',
'        ,t.fecha',
'        ,t.importe',
'        ,t.descripcion',
'        ,t.dis_id_disponibilidad',
'        ,t.con_id_concepto',
'        ,t.periodo',
'        ,ROWNUM AS orden',
'from (',
'  SELECT 1 AS id_gasto',
'        ,''X'' AS tipo',
'        ,Add_Months( to_date(:P55_PERIODO,''month/yyyy''), -1) AS fecha',
'        ,Sum(s.importe * CASE WHEN s.tipo = ''G'' THEN -1 ELSE 1 END) importe',
'        ,''Saldo anterior'' AS descripcion',
'        ,NULL dis_id_disponibilidad',
'        ,NULL con_id_concepto',
'        ,TO_DATE(:P55_PERIODO,''month/yyyy'') periodo',
'  FROM registro_gasto_ingreso s',
'  WHERE EXISTS (',
'        SELECT 1',
'        FROM TABLE(apex_string.split_numbers(p_str => :P55_P_ID_DISPONIBILIDAD , p_sep =>'':'' ))t',
'        WHERE t.column_value = s.dis_id_disponibilidad',
'        FETCH FIRST 1 ROW ONLY',
'    )',
'  AND s.periodo < TO_DATE(:P55_PERIODO,''month/yyyy'')',
'  UNION ALL ',
'  SELECT r.id_gasto',
'        ,r.tipo',
'        ,r.fecha',
'        ,(r.importe * CASE WHEN r.tipo = ''G'' THEN -1 ELSE 1 END) importe',
'        ,r.descripcion',
'        ,r.dis_id_disponibilidad',
'        ,r.con_id_concepto',
'        ,r.periodo',
'  FROM registro_gasto_ingreso r',
'  WHERE EXISTS (',
'        SELECT 1',
'        FROM TABLE(apex_string.split_numbers(p_str => :P55_P_ID_DISPONIBILIDAD , p_sep =>'':'' ))t',
'        WHERE t.column_value = r.dis_id_disponibilidad',
'        FETCH FIRST 1 ROW ONLY',
'    )',
'  AND r.periodo = TO_DATE(:P55_PERIODO,''month/yyyy'')',
'  ORDER BY fecha ASC, id_gasto',
') t',
'',
') x',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P55_PERIODO,P55_P_ID_DISPONIBILIDAD'
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
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(255049743664646496)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>62083199028983618
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(255049757269646497)
,p_db_column_name=>'ID_GASTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id gasto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(255049890787646498)
,p_db_column_name=>'TIPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(255049954963646499)
,p_db_column_name=>'FECHA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha'
,p_allow_hide=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(255050100436646500)
,p_db_column_name=>'IMPORTE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Importe'
,p_allow_sorting=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(255050148660646501)
,p_db_column_name=>'SALDO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Saldo'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(255050309641646502)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Descripci\00F3n')
,p_allow_sorting=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(255050397857646503)
,p_db_column_name=>'DIS_ID_DISPONIBILIDAD'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Disponibilidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(242782088970553336)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(255050472722646504)
,p_db_column_name=>'CON_ID_CONCEPTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Concepto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(202344190280266495)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(255050600292646505)
,p_db_column_name=>'PERIODO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Periodo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(255050649463646506)
,p_db_column_name=>'ORDEN'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Orden'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(257052615419269475)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'640861'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_GASTO:TIPO:FECHA:IMPORTE:SALDO:DESCRIPCION:DIS_ID_DISPONIBILIDAD:CON_ID_CONCEPTO:PERIODO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(242786310307430579)
,p_plug_name=>'Disponibilidades'
,p_region_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--md'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>1660973136434625155
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT x.dis_id_disponibilidad',
'      ,e.id_entidad',
'      ,Sum(x.importe) saldo',
'FROM (',
'  SELECT i.dis_id_disponibilidad',
'        ,Sum(i.importe) importe',
'  FROM registro_gasto_ingreso i',
'  WHERE i.tipo = ''I''',
'  GROUP BY i.dis_id_disponibilidad',
'  UNION ALL ',
'  SELECT g.dis_id_disponibilidad',
'        ,Sum(g.importe)*-1 importe',
'  FROM registro_gasto_ingreso g',
'  WHERE g.tipo = ''G'' ',
'  GROUP BY g.dis_id_disponibilidad',
'  UNION ALL ',
'  SELECT g.dis_id_disponibilidad',
'        ,Sum(g.importe) importe',
'  FROM registro_gasto_ingreso g',
'  WHERE g.tipo = ''T'' ',
'  GROUP BY g.dis_id_disponibilidad',
') x',
' ,disponibilidad d',
' ,entidad e',
'WHERE d.id_disponibilidad = x.dis_id_disponibilidad',
'AND e.id_entidad = d.ent_id_entidad',
'GROUP BY x.dis_id_disponibilidad',
'        ,e.id_entidad'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Disponibilidades'
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
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(242786441218430580)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>49819896582767702
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(242786502743430581)
,p_db_column_name=>'DIS_ID_DISPONIBILIDAD'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Disponibilidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(242782088970553336)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(242786603454430582)
,p_db_column_name=>'ID_ENTIDAD'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Entidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(209491563438466641)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(242786724332430583)
,p_db_column_name=>'SALDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Saldo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(242793525028407615)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'498270'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DIS_ID_DISPONIBILIDAD:ID_ENTIDAD:SALDO'
,p_sum_columns_on_break=>'SALDO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(242787095739430587)
,p_plug_name=>'Grafico disponibilidad'
,p_parent_plug_id=>wwv_flow_imp.id(242786310307430579)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(242787151920430588)
,p_region_id=>wwv_flow_imp.id(242787095739430587)
,p_chart_type=>'pie'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(242787282651430589)
,p_chart_id=>wwv_flow_imp.id(242787151920430588)
,p_seq=>10
,p_name=>'Saldos'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d.descripcion',
'      ,Sum(x.importe) saldo',
'FROM (',
'  SELECT i.dis_id_disponibilidad',
'        ,Sum(i.importe) importe',
'  FROM registro_gasto_ingreso i',
'  WHERE i.tipo = ''I''',
'  GROUP BY i.dis_id_disponibilidad',
'  UNION ALL ',
'  SELECT g.dis_id_disponibilidad',
'        ,Sum(g.importe)*-1 importe',
'  FROM registro_gasto_ingreso g',
'  WHERE g.tipo = ''G'' ',
'  GROUP BY g.dis_id_disponibilidad',
'  UNION ALL ',
'  SELECT g.dis_id_disponibilidad',
'        ,Sum(g.importe) importe',
'  FROM registro_gasto_ingreso g',
'  WHERE g.tipo = ''T'' ',
'  GROUP BY g.dis_id_disponibilidad',
') x',
' ,disponibilidad d',
' ,entidad e',
'WHERE d.id_disponibilidad = x.dis_id_disponibilidad',
'AND e.id_entidad = d.ent_id_entidad',
'GROUP BY descripcion',
'        ,e.id_entidad'))
,p_items_value_column_name=>'SALDO'
,p_items_label_column_name=>'DESCRIPCION'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(255050865001646508)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(255049595844646495)
,p_button_name=>'Filtrar'
,p_button_static_id=>'BTN_FILTRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--padTop'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Filtrar'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(242987421554454383)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(242788031586430596)
,p_button_name=>'Agregar'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--padTop'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_redirect_url=>'javascript: transferir()'
,p_button_execute_validations=>'N'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(242786795872430584)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(206078747482517932)
,p_button_name=>'BTN_DISPONIBILIDAD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Disponibilidad'
,p_button_position=>'UP'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-usd'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(202402211589930388)
,p_branch_name=>'IrAConcepto'
,p_branch_action=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.:60::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'CONCEPTO'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(202421558187856394)
,p_branch_name=>'Reload'
,p_branch_action=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202152747478202784)
,p_name=>'P55_PERIODO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(202421779215856396)
,p_prompt=>'Periodo'
,p_format_mask=>'Month-yyyy'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(202420111874856379)
,p_name=>'P55_SALDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(202421779215856396)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(x.importe)',
'from (',
'select sum(i.importe) importe',
'from registro_gasto_ingreso i',
'where i.tipo = ''I''',
'union all ',
'select sum(g.importe)*-1 importe',
'from registro_gasto_ingreso g',
'where g.tipo = ''G'' ) x',
'     '))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Saldo'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>30
,p_tag_css_classes=>'aling_derecha'
,p_begin_on_new_line=>'N'
,p_grid_column=>11
,p_display_when_type=>'NEVER'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    '    decimalPlaces: 0',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242986982913454379)
,p_name=>'P55_P_ORIGEN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(242788031586430596)
,p_prompt=>'Origen'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_DISPONIBILIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d.descripcion AS d',
'      ,e.nombre AS nombre_entidad',
'      ,d.id_disponibilidad AS r',
'FROM disponibilidad d',
'    ,entidad e',
'WHERE e.id_entidad = d.ent_id_entidad',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(242987143927454380)
,p_name=>'P55_P_DESTINO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(242788031586430596)
,p_prompt=>'Destino'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_DISPONIBILIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d.descripcion AS d',
'      ,e.nombre AS nombre_entidad',
'      ,d.id_disponibilidad AS r',
'FROM disponibilidad d',
'    ,entidad e',
'WHERE e.id_entidad = d.ent_id_entidad',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(242987220352454381)
,p_name=>'P55_P_FECHA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(242788031586430596)
,p_item_default=>'to_char(sysdate,''dd-mm-yyyy'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Fecha'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_cMaxlength=>10
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242987245726454382)
,p_name=>'P55_P_IMPORTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(242788031586430596)
,p_prompt=>'Importe'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(255050768415646507)
,p_name=>'P55_P_ID_DISPONIBILIDAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(255049595844646495)
,p_prompt=>'Disponibilidad'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_DISPONIBILIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d.descripcion AS d',
'      ,e.nombre AS nombre_entidad',
'      ,d.id_disponibilidad AS r',
'FROM disponibilidad d',
'    ,entidad e',
'WHERE e.id_entidad = d.ent_id_entidad',
''))
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Disponibilidad')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(202153120344202787)
,p_name=>'SetValor'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P55_PERIODO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(202153191653202788)
,p_event_id=>wwv_flow_imp.id(202153120344202787)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(202401645654930383)
,p_name=>'Accesos'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(202401823883930384)
,p_event_id=>wwv_flow_imp.id(202401645654930383)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'btn_concepto'
,p_action=>'PLUGIN_COM.FOS.INTERACTIVE_GRID_ADD_BUTTON'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(206297743878647993)
,p_attribute_01=>'toolbar-actions3'
,p_attribute_02=>'last'
,p_attribute_05=>'+Concepto'
,p_attribute_09=>'execute-javascript-code'
,p_attribute_11=>' apex.submit( "CONCEPTO" );'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(202402245280930389)
,p_event_id=>wwv_flow_imp.id(202401645654930383)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'btn_concepto'
,p_action=>'PLUGIN_COM.FOS.INTERACTIVE_GRID_ADD_BUTTON'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(194894985199581399)
,p_attribute_01=>'toolbar-actions3'
,p_attribute_02=>'last'
,p_attribute_05=>'+Concepto'
,p_attribute_09=>'execute-javascript-code'
,p_attribute_11=>' apex.submit( "CONCEPTO" );'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(242786905364430585)
,p_name=>'Ir a disponibilidad'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(242786795872430584)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(242787811546430594)
,p_event_id=>wwv_flow_imp.id(242786905364430585)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(242786310307430579)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(242786976573430586)
,p_event_id=>wwv_flow_imp.id(242786905364430585)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(242786310307430579)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(242979234211505079)
,p_name=>'Refresca egresos'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(206297743878647993)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(242979343818505080)
,p_event_id=>wwv_flow_imp.id(242979234211505079)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(206297743878647993)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(242979400612505081)
,p_name=>'Refresca ingresos'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(194894985199581399)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(242979487265505082)
,p_event_id=>wwv_flow_imp.id(242979400612505081)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(194894985199581399)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(242987631068454385)
,p_name=>'Refresca guardar'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(242788031586430596)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(242987742024454386)
,p_event_id=>wwv_flow_imp.id(242987631068454385)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(242788031586430596)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(194896060789581410)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(194894985199581399)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Ingresos - Save Interactive Grid'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Guardado...'
,p_internal_uid=>1929516153918532
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(206298750208648004)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(206297743878647993)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Gastos - Save Interactive Grid'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Guardado...'
,p_internal_uid=>13332205572985126
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(242987787220454387)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(242788031586430596)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Transferencia - Save Interactive Grid'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Guardado...'
,p_internal_uid=>50021242584791509
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(202152896059202785)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicial'
,p_process_sql_clob=>':P55_PERIODO := to_char(current_date,''Month-yyyy'');'
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P55_PERIODO'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>9186351423539907
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(202433982027726379)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'dev_saldo_control_gasto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    vl_importe registro_gasto_ingreso.importe%type;',
'begin',
'   select sum(x.importe)',
'   into vl_importe',
'   from (',
'   select sum(i.importe) importe',
'   from registro_gasto_ingreso i',
'   where i.tipo = ''I''',
'   union all ',
'   select sum(g.importe)*-1 importe',
'   from registro_gasto_ingreso g',
'   where g.tipo = ''G'' ) x;',
'     ',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'',true);',
'    apex_json.write(''saldo'', Nvl(vl_importe, 0));',
'    apex_json.close_object;',
'exception',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''success'',false);',
'        apex_json.write(''message'',sqlerrm);',
'        apex_json.close_object;     ',
'end;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9467437392063501
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(242987541319454384)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'transferir'
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
'',
'BEGIN',
'',
'',
'',
'    INSERT INTO registro_gasto_ingreso (',
'       tipo',
'      ,fecha',
'      ,importe',
'      ,descripcion',
'      ,dis_id_disponibilidad',
'      ,con_id_concepto',
'      ,periodo',
'    ) VALUES (',
'       ''T''             --tipo',
'      ,to_date(:P55_P_FECHA,''dd-mm-yyyy'')          --fecha',
'      ,to_number(:P55_P_IMPORTE,''999g999g999'')*-1  --importe',
'      ,''Transferencia'' --descripcion',
'      ,:P55_P_ORIGEN   --dis_id_disponibilidad',
'      ,NULL            --con_id_concepto',
'      ,to_date(:P55_PERIODO,''month/yyyy'')    --periodo',
'    );',
'',
'',
'    INSERT INTO registro_gasto_ingreso (',
'       tipo',
'      ,fecha',
'      ,importe',
'      ,descripcion',
'      ,dis_id_disponibilidad',
'      ,con_id_concepto',
'      ,periodo',
'    ) VALUES (',
'       ''T''             --tipo',
'      ,to_date(:P55_P_FECHA,''dd-mm-yyyy'')       --fecha',
'      ,to_number(:P55_P_IMPORTE,''999g999g999'')  --importe',
'      ,''Transferencia'' --descripcion',
'      ,:P55_P_DESTINO  --dis_id_disponibilidad',
'      ,NULL            --con_id_concepto',
'      ,to_date(:P55_PERIODO,''month/yyyy'')    --periodo',
'    );',
'    COMMIT;',
'    :P55_P_FECHA  := NULL;',
'    :P55_P_ORIGEN := NULL;',
'    :P55_P_DESTINO:= NULL;',
'    :P55_P_IMPORTE:= NULL;',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P55_P_FECHA'', :P55_P_FECHA);',
'    output_json_item(''P55_P_ORIGEN'', :P55_P_ORIGEN);',
'    output_json_item(''P55_P_DESTINO'', :P55_P_DESTINO);',
'    output_json_item(''P55_P_IMPORTE'', :P55_P_IMPORTE);',
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
,p_internal_uid=>50020996683791506
);
wwv_flow_imp.component_end;
end;
/
