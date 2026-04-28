prompt --application/pages/page_00074
begin
--   Manifest
--     PAGE: 00074
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
 p_id=>74
,p_name=>'Cuotas factura venta'
,p_alias=>'CUOTAS-FACTURA-VENTA'
,p_page_mode=>'MODAL'
,p_step_title=>'Cuotas factura venta'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function($) {',
'',
'    function update(model) {',
'        var salKey = model.getFieldKey("SALDO"),',
'            total = 0;',
'',
'        console.log(">> starting sum SALDO column")',
'        model.forEach(function(record, index, id) {',
'            var sal = parseFloat( record[salKey].replace(/\./g, '''') ), ',
'                meta = model.getRecordMetadata(id);',
'',
'            if (!isNaN(sal) && !meta.deleted && !meta.agg) {',
'                total += sal;',
'            }',
'        });',
'        console.log(">> setting sum SALDO column to " + total)',
'        $s("P74_MONTO_CUOTAS", total);',
'    }',
'',
'    $(function() {',
'       ',
'        $("#REG_CUOTAS").on("interactivegridviewmodelcreate", function(event, ui) {',
'            var sid,',
'                model = ui.model;',
'',
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
'                    progressView: $("#P74_MONTO_CUOTAS") ',
'                } );',
'                 update( model );           ',
'                model.fetchAll(function() {});',
'            }',
'        });',
'',
'    });',
'',
'})(apex.jQuery)'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#P74_MONTO'').prop(''readonly'', true);',
'$(''#P74_MONTO_CUOTAS'').prop(''readonly'', true);'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#btn_calcular, #btn_regresar {    ',
'    margin-top: 17px;',
'    }',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(203423198400386081)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>40
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(204430758123494279)
,p_plug_name=>'Reporte'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
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
' WHERE collection_name = ''COLL_DETALLE_PAGOS''',
' ORDER BY to_number(c003) asc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P74_P_ID_FACTURA'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Reporte'
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
 p_id=>wwv_flow_imp.id(204431641741494287)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>11465097105831409
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204431714462494288)
,p_db_column_name=>'ID_DETALLE_CUENTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Detalle Cuenta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204431835014494289)
,p_db_column_name=>'FAC_ID_FACTURA_VENTA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Fac Id Factura Venta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204431851203494290)
,p_db_column_name=>'ITEM'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Item'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204432021007494291)
,p_db_column_name=>'FECHA_VENCIMIENTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204432112107494292)
,p_db_column_name=>'IMPORTE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Importe'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204432232758494293)
,p_db_column_name=>'SALDO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Saldo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204432279361494294)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(204443816146505455)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'114773'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DETALLE_CUENTA:FAC_ID_FACTURA_VENTA:ITEM:FECHA_VENCIMIENTO:IMPORTE:SALDO:SEQ_ID'
,p_sum_columns_on_break=>'IMPORTE:SALDO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(208212662863453534)
,p_plug_name=>'Cuotas factura venta'
,p_region_name=>'REG_CUOTAS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
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
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P74_P_ID_FACTURA'
,p_prn_page_header=>'Cuotas factura venta'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208213975787453538)
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
 p_id=>wwv_flow_imp.id(208214531197453539)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208215505183453541)
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
 p_id=>wwv_flow_imp.id(208216489562453543)
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
 p_id=>wwv_flow_imp.id(208217469390453543)
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
 p_id=>wwv_flow_imp.id(208218490096453544)
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
 p_id=>wwv_flow_imp.id(208219500667453545)
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
  'virtual_keyboard', 'numeric')).to_clob
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
 p_id=>wwv_flow_imp.id(208220517021453545)
,p_name=>'SALDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(208221455775453546)
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
 p_id=>wwv_flow_imp.id(208213239335453536)
,p_internal_uid=>15246694699790658
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
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>true
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
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(208213623636453536)
,p_interactive_grid_id=>wwv_flow_imp.id(208213239335453536)
,p_static_id=>'152471'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(208213760114453537)
,p_report_id=>wwv_flow_imp.id(208213623636453536)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208214848144453540)
,p_view_id=>wwv_flow_imp.id(208213760114453537)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(208214531197453539)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208215886352453542)
,p_view_id=>wwv_flow_imp.id(208213760114453537)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(208215505183453541)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208216942649453543)
,p_view_id=>wwv_flow_imp.id(208213760114453537)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(208216489562453543)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208217863753453544)
,p_view_id=>wwv_flow_imp.id(208213760114453537)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(208217469390453543)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208218904752453544)
,p_view_id=>wwv_flow_imp.id(208213760114453537)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(208218490096453544)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208219852524453545)
,p_view_id=>wwv_flow_imp.id(208213760114453537)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(208219500667453545)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208220900917453546)
,p_view_id=>wwv_flow_imp.id(208213760114453537)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(208220517021453545)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(208221910323453546)
,p_view_id=>wwv_flow_imp.id(208213760114453537)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(208221455775453546)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(208188361010923789)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(208212662863453534)
,p_button_name=>'Calcular'
,p_button_static_id=>'btn_calcular'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Calcular'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P74_P_ID_FACTURA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_cattributes=>'title="Calcular cantidad y monto de cuotas"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(208189267979923798)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(208212662863453534)
,p_button_name=>'Confirmar'
,p_button_static_id=>'btn_regresar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Confirmar'
,p_button_condition=>'P74_P_ID_FACTURA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(203423335058386082)
,p_name=>'P74_P_ID_FACTURA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(203423198400386081)
,p_use_cache_before_default=>'NO'
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
 p_id=>wwv_flow_imp.id(208188260806923788)
,p_name=>'P74_CUOTAS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(208212662863453534)
,p_prompt=>'Cant. cuotas'
,p_format_mask=>'990'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>2
,p_display_when=>'P74_P_ID_FACTURA'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208188692483923792)
,p_name=>'P74_MONTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(208212662863453534)
,p_prompt=>'Monto total'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P74_P_ID_FACTURA'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208188964665923795)
,p_name=>'P74_MONTO_CUOTAS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(208212662863453534)
,p_prompt=>'Monto cuotas'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P74_P_ID_FACTURA'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208188473047923790)
,p_name=>'Calcular cuotas'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(208188361010923789)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208188641866923791)
,p_event_id=>wwv_flow_imp.id(208188473047923790)
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
'    if nvl(to_number(:P74_CUOTAS),0) = 0 then',
'        raise_application_error(-20000,''Defina cantidad de pagos/cuotas'');',
'    end if;',
'    v_item    := 0;',
'    v_fecha   := trunc(current_date,''DD'');',
'    v_cuotas  := nvl(to_number(:P74_CUOTAS),0);',
'    v_importe := round( to_number(:P74_MONTO,''999G999G999D99'') / v_cuotas);',
'    if nvl(v_importe,0) = 0 then',
'        raise_application_error(-20000,''Regrese a la factura y registre productos/servicios para la venta.'');',
'    end if;',
'    v_ultimo  := to_number(:P74_MONTO,''999G999G999D99'') - (v_importe * (v_cuotas-1));',
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
,p_attribute_02=>'P74_CUOTAS,P74_MONTO'
,p_attribute_05=>'#SQLERRM_TEXT#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208188876142923794)
,p_event_id=>wwv_flow_imp.id(208188473047923790)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(208212662863453534)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209604342287191895)
,p_name=>'ir a'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209604356721191896)
,p_event_id=>wwv_flow_imp.id(209604342287191895)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P74_CUOTAS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209754738758900579)
,p_name=>'Set saldo'
,p_event_sequence=>30
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(208212662863453534)
,p_triggering_element=>'IMPORTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209754787818900580)
,p_event_id=>wwv_flow_imp.id(209754738758900579)
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(208190271148923808)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Verificar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if nvl(to_number(:P74_CUOTAS,''999G999G999''),0) = 0 then',
'        raise_application_error(-20000,''Defina cantidad de pagos/cuotas'');',
'    end if;',
'    if nvl(to_number(:P74_MONTO,''999G999G999''),0) = 0 then',
'        raise_application_error(-20000,''Regrese a la factura y registre productos/servicios para la venta.'');',
'    end if;',
'    if to_number(:P74_MONTO,''999g999g999g999'') != to_number(:P74_MONTO_CUOTAS,''999g999g999g999'') then',
'        raise_application_error(-20000,''Monto de cuotas y monto a abonar no son iguales, favor verificar.'');',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(208189267979923798)
,p_internal_uid=>15223726513260930
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(208222528646453547)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(208212662863453534)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Cuotas factura venta - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    case :APEX$ROW_STATUS',
'    when ''U'' then',
'        APEX_COLLECTION.UPDATE_MEMBER (',
'        p_collection_name => ''COLL_DETALLE_PAGOS'',',
'        p_seq             => :seq_id,',
'        p_c001            => NULL,',
'        p_c002            => NULL,',
'        p_c003            => to_char(:ITEM),',
'        p_c004            => :FECHA_VENCIMIENTO,',
'        p_c005            => to_number(:IMPORTE,''999g999g999g999''),',
'        p_c006            => to_number(:IMPORTE,''999g999g999g999'')',
'            );',
'    when ''D'' then',
'        APEX_COLLECTION.DELETE_MEMBER (',
'        p_collection_name => ''COLL_DETALLE_PAGOS'',',
'        p_seq             => :seq_id);',
'    end case;',
'end;'))
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(208189267979923798)
,p_only_for_changed_rows=>'N'
,p_internal_uid=>15255984010790669
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(208189091427923796)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Regresar'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(208189267979923798)
,p_internal_uid=>15222546792260918
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(208188778931923793)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    SELECT sum(To_Number(c016)) TOTAL',
'    INTO :P74_MONTO',
'    FROM apex_collections f',
'    WHERE collection_name = ''COLL_DETALLE_FVENTA'';',
'',
'    SELECT COUNT(*)',
'    INTO :P74_CUOTAS',
'    FROM apex_collections',
'    WHERE collection_name = ''COLL_DETALLE_PAGOS'';',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>15222234296260915
);
wwv_flow_imp.component_end;
end;
/
