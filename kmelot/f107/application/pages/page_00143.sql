prompt --application/pages/page_00143
begin
--   Manifest
--     PAGE: 00143
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
 p_id=>143
,p_name=>'Conversaciones bot'
,p_alias=>'CONVERSACIONES-BOT'
,p_step_title=>'Conversaciones bot'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(223711721078126073)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(206180564029405200)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(223712565991126077)
,p_plug_name=>'Search'
,p_parent_plug_id=>wwv_flow_imp.id(223711721078126073)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>10
,p_plug_display_point=>'SMART_FILTERS'
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(223712402539126077)
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(223712402539126077)
,p_name=>'Search Results'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TABLE_NAME,',
'       ID_PK,',
'       REMOTE_JID,',
'       ID_FLOW_SUPERIOR,',
'       ID_FLOW,',
'       TYPE,',
'       FLOW_NAME,',
'       ID_ANSWER,',
'       ANSWER_TEXT,',
'       ANSWER_CAPTURE,',
'       CAPTURE_OPTION,',
'       CAPTURED_OPTION,',
'       TO_TIMESTAMP(TIMESTAMP_SEND,''DD.MM.YY HH24:MI:SS.FF3'') AS TIMESTAMP_SEND,',
'       TO_TIMESTAMP(TIMESTAMP_CAPTURE,''DD.MM.YY HH24:MI:SS.FF3'') AS TIMESTAMP_CAPTURE,',
'       ANSWER_REPONSE,',
'       TO_TIMESTAMP(TIMESTAMP_SEND_RESPONSE,''DD.MM.YY HH24:MI:SS.FF3'') AS TIMESTAMP_SEND_RESPONSE       ',
'  from V_CONVERSATION_JSON',
'  ORDER BY ID_PK DESC, TO_TIMESTAMP(TIMESTAMP_CAPTURE,''DD.MM.YY HH24:MI:SS.FF3'') DESC NULLS LAST'))
,p_query_order_by_type=>'STATIC'
,p_query_order_by=>'ID_PK DESC, TIMESTAMP_SEND DESC'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No se encuentran datos.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>100000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(184996075346247739)
,p_query_column_id=>1
,p_column_alias=>'TABLE_NAME'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(184996544815247740)
,p_query_column_id=>2
,p_column_alias=>'ID_PK'
,p_column_display_sequence=>2
,p_column_heading=>'Id reserva'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(184996876994247740)
,p_query_column_id=>3
,p_column_alias=>'REMOTE_JID'
,p_column_display_sequence=>3
,p_column_heading=>'Nro. celular'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(184997318115247740)
,p_query_column_id=>4
,p_column_alias=>'ID_FLOW_SUPERIOR'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(184997702531247740)
,p_query_column_id=>5
,p_column_alias=>'ID_FLOW'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(184998093536247740)
,p_query_column_id=>6
,p_column_alias=>'TYPE'
,p_column_display_sequence=>6
,p_column_heading=>'Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(184998536746247741)
,p_query_column_id=>7
,p_column_alias=>'FLOW_NAME'
,p_column_display_sequence=>7
,p_column_heading=>'Flow name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(184998938885247741)
,p_query_column_id=>8
,p_column_alias=>'ID_ANSWER'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(184999263127247741)
,p_query_column_id=>9
,p_column_alias=>'ANSWER_TEXT'
,p_column_display_sequence=>9
,p_column_heading=>'Answer text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(184999709087247741)
,p_query_column_id=>10
,p_column_alias=>'ANSWER_CAPTURE'
,p_column_display_sequence=>10
,p_column_heading=>'Answer capture'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(185000075892247742)
,p_query_column_id=>11
,p_column_alias=>'CAPTURE_OPTION'
,p_column_display_sequence=>11
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(185000457158247742)
,p_query_column_id=>12
,p_column_alias=>'CAPTURED_OPTION'
,p_column_display_sequence=>12
,p_column_heading=>'Captured option'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(185000918689247742)
,p_query_column_id=>13
,p_column_alias=>'TIMESTAMP_SEND'
,p_column_display_sequence=>13
,p_column_heading=>'Timestamp send'
,p_column_format=>'DD-MM-YYYY HH24:MI:SS'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(185001278168247742)
,p_query_column_id=>14
,p_column_alias=>'TIMESTAMP_CAPTURE'
,p_column_display_sequence=>14
,p_column_heading=>'Timestamp capture'
,p_column_format=>'DD-MM-YYYY HH24:MI:SS'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(185001746191247742)
,p_query_column_id=>15
,p_column_alias=>'ANSWER_REPONSE'
,p_column_display_sequence=>15
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(185002127930247743)
,p_query_column_id=>16
,p_column_alias=>'TIMESTAMP_SEND_RESPONSE'
,p_column_display_sequence=>16
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(223569936815539680)
,p_name=>'P143_ID_RESERVA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(223712565991126077)
,p_prompt=>'Id reserva'
,p_source=>'ID_PK'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_ai_enabled=>false
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(223720856766126102)
,p_name=>'P143_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(223712565991126077)
,p_prompt=>'Search'
,p_source=>'REMOTE_JID,PK_ID'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(223721233673126106)
,p_name=>'P143_REMOTE_JID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(223712565991126077)
,p_prompt=>'Remote Jid'
,p_source=>'REMOTE_JID'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_fc_show_label=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_ai_enabled=>false
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp.component_end;
end;
/
