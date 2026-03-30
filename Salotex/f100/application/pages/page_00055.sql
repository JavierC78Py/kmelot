prompt --application/pages/page_00055
begin
--   Manifest
--     PAGE: 00055
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
 p_id=>wwv_flow_imp.id(83188253644200258)
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
 p_id=>wwv_flow_imp.id(86845221910861794)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86857556886907441)
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
 p_id=>wwv_flow_imp.id(75661459627925261)
,p_plug_name=>'Ingresos'
,p_region_name=>'INGRESOS'
,p_parent_plug_id=>wwv_flow_imp.id(86857556886907441)
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
 p_id=>wwv_flow_imp.id(75661700432925263)
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
 p_id=>wwv_flow_imp.id(75661799753925264)
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
 p_id=>wwv_flow_imp.id(75661882699925265)
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
 p_id=>wwv_flow_imp.id(75661964592925266)
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
 p_id=>wwv_flow_imp.id(75662106666925267)
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
 p_id=>wwv_flow_imp.id(75662235086925269)
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
,p_lov_id=>wwv_flow_imp.id(123548563398897198)
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
 p_id=>wwv_flow_imp.id(75662333606925270)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(75662452059925271)
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
 p_id=>wwv_flow_imp.id(83111537321618044)
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
,p_lov_id=>wwv_flow_imp.id(83110664708610357)
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
 p_id=>wwv_flow_imp.id(94933199483530342)
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
 p_id=>wwv_flow_imp.id(75661562480925262)
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
 p_id=>wwv_flow_imp.id(75707284826060050)
,p_interactive_grid_id=>wwv_flow_imp.id(75661562480925262)
,p_static_id=>'19743'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(75707435002060050)
,p_report_id=>wwv_flow_imp.id(75707284826060050)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75707935228060052)
,p_view_id=>wwv_flow_imp.id(75707435002060050)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(75661700432925263)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75708882736060055)
,p_view_id=>wwv_flow_imp.id(75707435002060050)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(75661799753925264)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75709725059060059)
,p_view_id=>wwv_flow_imp.id(75707435002060050)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(75661882699925265)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75710702681060062)
,p_view_id=>wwv_flow_imp.id(75707435002060050)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(75661964592925266)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75711565655060065)
,p_view_id=>wwv_flow_imp.id(75707435002060050)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(75662106666925267)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75713385324060071)
,p_view_id=>wwv_flow_imp.id(75707435002060050)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(75662235086925269)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75716077356067599)
,p_view_id=>wwv_flow_imp.id(75707435002060050)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(75662333606925270)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(83131312020994664)
,p_view_id=>wwv_flow_imp.id(75707435002060050)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(83111537321618044)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(94940738707539184)
,p_view_id=>wwv_flow_imp.id(75707435002060050)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(94933199483530342)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87064218306991855)
,p_plug_name=>'Egresos'
,p_region_name=>'GASTOS'
,p_parent_plug_id=>wwv_flow_imp.id(86857556886907441)
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
 p_id=>wwv_flow_imp.id(83111482118618043)
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
,p_lov_id=>wwv_flow_imp.id(83110664708610357)
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
 p_id=>wwv_flow_imp.id(87064418387991857)
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
 p_id=>wwv_flow_imp.id(87064457107991858)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87064602990991859)
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
 p_id=>wwv_flow_imp.id(87064713754991860)
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
 p_id=>wwv_flow_imp.id(87064741614991861)
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
 p_id=>wwv_flow_imp.id(87064820741991862)
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
 p_id=>wwv_flow_imp.id(87064966733991863)
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
 p_id=>wwv_flow_imp.id(87065197304991865)
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
,p_lov_id=>wwv_flow_imp.id(123548563398897198)
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
 p_id=>wwv_flow_imp.id(94933076009530341)
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
 p_id=>wwv_flow_imp.id(87064317523991856)
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
 p_id=>wwv_flow_imp.id(77811005146157354)
,p_interactive_grid_id=>wwv_flow_imp.id(87064317523991856)
,p_static_id=>'40780'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(77811187849157355)
,p_report_id=>wwv_flow_imp.id(77811005146157354)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(77812088096157363)
,p_view_id=>wwv_flow_imp.id(77811187849157355)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(87064457107991858)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(77812946855157368)
,p_view_id=>wwv_flow_imp.id(77811187849157355)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(87064602990991859)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(77813908297157371)
,p_view_id=>wwv_flow_imp.id(77811187849157355)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(87064713754991860)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(77814737924157375)
,p_view_id=>wwv_flow_imp.id(77811187849157355)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(87064741614991861)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(77815620904157380)
,p_view_id=>wwv_flow_imp.id(77811187849157355)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(87064820741991862)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(77816577488157383)
,p_view_id=>wwv_flow_imp.id(77811187849157355)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(87064966733991863)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(77818285782157390)
,p_view_id=>wwv_flow_imp.id(77811187849157355)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(87065197304991865)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(83130354186994659)
,p_view_id=>wwv_flow_imp.id(77811187849157355)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(83111482118618043)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(94939912526539178)
,p_view_id=>wwv_flow_imp.id(77811187849157355)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(94933076009530341)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87065671721991870)
,p_plug_name=>'Resumen'
,p_parent_plug_id=>wwv_flow_imp.id(86857556886907441)
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
 p_id=>wwv_flow_imp.id(82918813592546641)
,p_plug_name=>'GIngresos'
,p_parent_plug_id=>wwv_flow_imp.id(87065671721991870)
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
 p_id=>wwv_flow_imp.id(82918913186546642)
,p_region_id=>wwv_flow_imp.id(82918813592546641)
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
 p_id=>wwv_flow_imp.id(82918999659546643)
,p_chart_id=>wwv_flow_imp.id(82918913186546642)
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
 p_id=>wwv_flow_imp.id(82919035279546644)
,p_chart_id=>wwv_flow_imp.id(82918913186546642)
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
 p_id=>wwv_flow_imp.id(82919189016546645)
,p_chart_id=>wwv_flow_imp.id(82918913186546642)
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
 p_id=>wwv_flow_imp.id(83188336821200259)
,p_plug_name=>'Resumen Egresos'
,p_region_name=>'REG_RESU_GASTOS'
,p_parent_plug_id=>wwv_flow_imp.id(87065671721991870)
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
 p_id=>wwv_flow_imp.id(83189126755200267)
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
 p_id=>wwv_flow_imp.id(83189259041200268)
,p_db_column_name=>'TIPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(83189334917200269)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(83189440713200270)
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
 p_id=>wwv_flow_imp.id(83189521828200271)
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
 p_id=>wwv_flow_imp.id(83189636464200272)
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
 p_id=>wwv_flow_imp.id(83189804611200273)
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
 p_id=>wwv_flow_imp.id(83913421472638964)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'101805'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TIPO:DESCRIPCION:IMPORTE_PREVISTO:REAL:PENDIENTE:DE_MAS'
,p_sum_columns_on_break=>'IMPORTE_PREVISTO:REAL:PENDIENTE:DE_MAS'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(133033324492958252)
,p_report_id=>wwv_flow_imp.id(83913421472638964)
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
 p_id=>wwv_flow_imp.id(133033816237958253)
,p_report_id=>wwv_flow_imp.id(83913421472638964)
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
 p_id=>wwv_flow_imp.id(87067093556991884)
,p_plug_name=>'GGastos'
,p_parent_plug_id=>wwv_flow_imp.id(87065671721991870)
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
 p_id=>wwv_flow_imp.id(87067151769991885)
,p_region_id=>wwv_flow_imp.id(87067093556991884)
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
 p_id=>wwv_flow_imp.id(87067291649991886)
,p_chart_id=>wwv_flow_imp.id(87067151769991885)
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
 p_id=>wwv_flow_imp.id(87067398095991887)
,p_chart_id=>wwv_flow_imp.id(87067151769991885)
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
 p_id=>wwv_flow_imp.id(87067449823991888)
,p_chart_id=>wwv_flow_imp.id(87067151769991885)
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
 p_id=>wwv_flow_imp.id(94935706676530367)
,p_plug_name=>'Derecha'
,p_parent_plug_id=>wwv_flow_imp.id(87065671721991870)
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
 p_id=>wwv_flow_imp.id(83189846954200274)
,p_plug_name=>'Resumen Ingresos'
,p_region_name=>'REG_RESU_INGRESOS'
,p_parent_plug_id=>wwv_flow_imp.id(94935706676530367)
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
 p_id=>wwv_flow_imp.id(83190636526200282)
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
 p_id=>wwv_flow_imp.id(83190774872200283)
,p_db_column_name=>'TIPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(83190886085200284)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(83191002517200285)
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
 p_id=>wwv_flow_imp.id(83191085953200286)
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
 p_id=>wwv_flow_imp.id(83191151507200287)
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
 p_id=>wwv_flow_imp.id(83191313494200288)
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
 p_id=>wwv_flow_imp.id(83917275031644996)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'101843'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TIPO:DESCRIPCION:IMPORTE_PREVISTO:REAL:PENDIENTE:DE_MAS'
,p_sum_columns_on_break=>'IMPORTE_PREVISTO:REAL:PENDIENTE:DE_MAS'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(83928947246787557)
,p_report_id=>wwv_flow_imp.id(83917275031644996)
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
 p_id=>wwv_flow_imp.id(94933958560530350)
,p_plug_name=>'Por concepto'
,p_parent_plug_id=>wwv_flow_imp.id(94935706676530367)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>100
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(94934041681530351)
,p_region_id=>wwv_flow_imp.id(94933958560530350)
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
 p_id=>wwv_flow_imp.id(94934171304530352)
,p_chart_id=>wwv_flow_imp.id(94934041681530351)
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
 p_id=>wwv_flow_imp.id(123554506014774458)
,p_plug_name=>'Transferencias'
,p_region_name=>'REG_TRANSFERENCIA'
,p_parent_plug_id=>wwv_flow_imp.id(86857556886907441)
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
 p_id=>wwv_flow_imp.id(123554664679774460)
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
 p_id=>wwv_flow_imp.id(123554755514774461)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(123554900091774462)
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
 p_id=>wwv_flow_imp.id(123554920377774463)
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
 p_id=>wwv_flow_imp.id(123555041390774464)
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
 p_id=>wwv_flow_imp.id(123555119103774465)
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
 p_id=>wwv_flow_imp.id(123555289714774466)
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
 p_id=>wwv_flow_imp.id(123555413185774467)
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
,p_lov_id=>wwv_flow_imp.id(123548563398897198)
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
 p_id=>wwv_flow_imp.id(123555518670774468)
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
,p_lov_id=>wwv_flow_imp.id(83110664708610357)
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
 p_id=>wwv_flow_imp.id(123555550425774469)
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
 p_id=>wwv_flow_imp.id(123554597684774459)
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
 p_id=>wwv_flow_imp.id(123572532454513542)
,p_interactive_grid_id=>wwv_flow_imp.id(123554597684774459)
,p_static_id=>'498396'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(123572773630513542)
,p_report_id=>wwv_flow_imp.id(123572532454513542)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(123573643925513534)
,p_view_id=>wwv_flow_imp.id(123572773630513542)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(123554755514774461)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(123574596770513531)
,p_view_id=>wwv_flow_imp.id(123572773630513542)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(123554900091774462)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(123575461460513529)
,p_view_id=>wwv_flow_imp.id(123572773630513542)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(123554920377774463)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(123576357316513526)
,p_view_id=>wwv_flow_imp.id(123572773630513542)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(123555041390774464)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(123577283360513524)
,p_view_id=>wwv_flow_imp.id(123572773630513542)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(123555119103774465)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(123578163207513522)
,p_view_id=>wwv_flow_imp.id(123572773630513542)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(123555289714774466)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(123579079276513519)
,p_view_id=>wwv_flow_imp.id(123572773630513542)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(123555413185774467)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(123579987729513517)
,p_view_id=>wwv_flow_imp.id(123572773630513542)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(123555518670774468)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(123580864427513515)
,p_view_id=>wwv_flow_imp.id(123572773630513542)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(123555550425774469)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(135816070272990357)
,p_plug_name=>'Extracto'
,p_parent_plug_id=>wwv_flow_imp.id(86857556886907441)
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
 p_id=>wwv_flow_imp.id(135816218092990358)
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
 p_id=>wwv_flow_imp.id(135816231697990359)
,p_db_column_name=>'ID_GASTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id gasto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(135816365215990360)
,p_db_column_name=>'TIPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(135816429391990361)
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
 p_id=>wwv_flow_imp.id(135816574864990362)
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
 p_id=>wwv_flow_imp.id(135816623088990363)
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
 p_id=>wwv_flow_imp.id(135816784069990364)
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
 p_id=>wwv_flow_imp.id(135816872285990365)
,p_db_column_name=>'DIS_ID_DISPONIBILIDAD'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Disponibilidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(123548563398897198)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(135816947150990366)
,p_db_column_name=>'CON_ID_CONCEPTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Concepto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(83110664708610357)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(135817074720990367)
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
 p_id=>wwv_flow_imp.id(135817123891990368)
,p_db_column_name=>'ORDEN'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Orden'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(137819089847613337)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'640861'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_GASTO:TIPO:FECHA:IMPORTE:SALDO:DESCRIPCION:DIS_ID_DISPONIBILIDAD:CON_ID_CONCEPTO:PERIODO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(123552784735774441)
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
 p_id=>wwv_flow_imp.id(123552915646774442)
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
 p_id=>wwv_flow_imp.id(123552977171774443)
,p_db_column_name=>'DIS_ID_DISPONIBILIDAD'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Disponibilidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(123548563398897198)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(123553077882774444)
,p_db_column_name=>'ID_ENTIDAD'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Entidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(90258037866810503)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(123553198760774445)
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
 p_id=>wwv_flow_imp.id(123559999456751477)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'498270'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DIS_ID_DISPONIBILIDAD:ID_ENTIDAD:SALDO'
,p_sum_columns_on_break=>'SALDO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(123553570167774449)
,p_plug_name=>'Grafico disponibilidad'
,p_parent_plug_id=>wwv_flow_imp.id(123552784735774441)
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
 p_id=>wwv_flow_imp.id(123553626348774450)
,p_region_id=>wwv_flow_imp.id(123553570167774449)
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
 p_id=>wwv_flow_imp.id(123553757079774451)
,p_chart_id=>wwv_flow_imp.id(123553626348774450)
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
 p_id=>wwv_flow_imp.id(135817339429990370)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(135816070272990357)
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
 p_id=>wwv_flow_imp.id(123753895982798245)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(123554506014774458)
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
 p_id=>wwv_flow_imp.id(123553270300774446)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(86845221910861794)
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
 p_id=>wwv_flow_imp.id(83168686018274250)
,p_branch_name=>'IrAConcepto'
,p_branch_action=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.:60::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'CONCEPTO'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(83188032616200256)
,p_branch_name=>'Reload'
,p_branch_action=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82919221906546646)
,p_name=>'P55_PERIODO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(83188253644200258)
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
 p_id=>wwv_flow_imp.id(83186586303200241)
,p_name=>'P55_SALDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(83188253644200258)
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
 p_id=>wwv_flow_imp.id(123753457341798241)
,p_name=>'P55_P_ORIGEN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(123554506014774458)
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
 p_id=>wwv_flow_imp.id(123753618355798242)
,p_name=>'P55_P_DESTINO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(123554506014774458)
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
 p_id=>wwv_flow_imp.id(123753694780798243)
,p_name=>'P55_P_FECHA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(123554506014774458)
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
 p_id=>wwv_flow_imp.id(123753720154798244)
,p_name=>'P55_P_IMPORTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(123554506014774458)
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
 p_id=>wwv_flow_imp.id(135817242843990369)
,p_name=>'P55_P_ID_DISPONIBILIDAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(135816070272990357)
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
 p_id=>wwv_flow_imp.id(82919594772546649)
,p_name=>'SetValor'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P55_PERIODO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(82919666081546650)
,p_event_id=>wwv_flow_imp.id(82919594772546649)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(83168120083274245)
,p_name=>'Accesos'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(83168298312274246)
,p_event_id=>wwv_flow_imp.id(83168120083274245)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'btn_concepto'
,p_action=>'PLUGIN_COM.FOS.INTERACTIVE_GRID_ADD_BUTTON'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(87064218306991855)
,p_attribute_01=>'toolbar-actions3'
,p_attribute_02=>'last'
,p_attribute_05=>'+Concepto'
,p_attribute_09=>'execute-javascript-code'
,p_attribute_11=>' apex.submit( "CONCEPTO" );'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(83168719709274251)
,p_event_id=>wwv_flow_imp.id(83168120083274245)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'btn_concepto'
,p_action=>'PLUGIN_COM.FOS.INTERACTIVE_GRID_ADD_BUTTON'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(75661459627925261)
,p_attribute_01=>'toolbar-actions3'
,p_attribute_02=>'last'
,p_attribute_05=>'+Concepto'
,p_attribute_09=>'execute-javascript-code'
,p_attribute_11=>' apex.submit( "CONCEPTO" );'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(123553379792774447)
,p_name=>'Ir a disponibilidad'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(123553270300774446)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(123554285974774456)
,p_event_id=>wwv_flow_imp.id(123553379792774447)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(123552784735774441)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(123553451001774448)
,p_event_id=>wwv_flow_imp.id(123553379792774447)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(123552784735774441)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(123745708639848941)
,p_name=>'Refresca egresos'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(87064218306991855)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(123745818246848942)
,p_event_id=>wwv_flow_imp.id(123745708639848941)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(87064218306991855)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(123745875040848943)
,p_name=>'Refresca ingresos'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(75661459627925261)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(123745961693848944)
,p_event_id=>wwv_flow_imp.id(123745875040848943)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(75661459627925261)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(123754105496798247)
,p_name=>'Refresca guardar'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(123554506014774458)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(123754216452798248)
,p_event_id=>wwv_flow_imp.id(123754105496798247)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(123554506014774458)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(75662535217925272)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(75661459627925261)
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
 p_id=>wwv_flow_imp.id(87065224636991866)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(87064218306991855)
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
 p_id=>wwv_flow_imp.id(123754261648798249)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(123554506014774458)
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
 p_id=>wwv_flow_imp.id(82919370487546647)
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
 p_id=>wwv_flow_imp.id(83200456456070241)
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
 p_id=>wwv_flow_imp.id(123754015747798246)
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
