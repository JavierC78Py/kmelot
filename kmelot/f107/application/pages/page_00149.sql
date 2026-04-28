prompt --application/pages/page_00149
begin
--   Manifest
--     PAGE: 00149
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
 p_id=>149
,p_name=>unistr('P\00F3lizas - licitaciones')
,p_alias=>unistr('P\00D3LIZAS-LICITACIONES')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('P\00F3lizas - licitaciones')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(136645789910362383)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(137377648220198581)
,p_plug_name=>unistr('P\00F3lizas - licitaciones')
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_REG_POLIZA,',
'       LIC_ID_LICITACION,',
'       ENT_ID_ENTIDAD,',
'       NRO_POLIZA,',
'       TIPO,',
'       MONTO,',
'       FECHA_INICIO,',
'       FECHA_FIN,',
'       ESTADO,',
'       OBSERVACION,',
'       CASE WHEN (FECHA_FIN - INTERVAL ''7'' DAY) <= TRUNC(SYSDATE) AND ESTADO = ''ACTIVO'' THEN ''ALERTA'' ELSE NULL END MARCA_ALERTA,',
'       MON_ID_MONEDA_POLIZA',
'  from LICITACION_POLIZA',
' where :P149_P_ID_LICITACION IS NULL or LIC_ID_LICITACION = :P149_P_ID_LICITACION'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P149_P_ID_LICITACION'
,p_prn_page_header=>unistr('P\00F3lizas - licitaciones')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(137377805491198581)
,p_name=>unistr('P\00F3lizas - licitaciones')
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encuentran datos.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:150:&APP_SESSION.::&DEBUG.:RP:P150_ID_REG_POLIZA:\#ID_REG_POLIZA#\'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>18144279919542443
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(137378524991198585)
,p_db_column_name=>'ID_REG_POLIZA'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id registro'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(137379661292198587)
,p_db_column_name=>'NRO_POLIZA'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>unistr('Nro. p\00F3liza')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(137380054820198587)
,p_db_column_name=>'TIPO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(137380483026198587)
,p_db_column_name=>'MONTO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Monto (asegurado)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(137380860227198588)
,p_db_column_name=>'FECHA_INICIO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Fecha inicio'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(137381238458198588)
,p_db_column_name=>'FECHA_FIN'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Fecha fin'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(137381663869198588)
,p_db_column_name=>'ESTADO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(136645413178362379)
,p_db_column_name=>'LIC_ID_LICITACION'
,p_display_order=>19
,p_column_identifier=>'J'
,p_column_label=>unistr('Licitaci\00F3n')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(137366877301198559)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(136645512578362380)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>29
,p_column_identifier=>'K'
,p_column_label=>'Entidad (Aseguradora)'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(136686132793199183)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(136645619596362381)
,p_db_column_name=>'OBSERVACION'
,p_display_order=>39
,p_column_identifier=>'L'
,p_column_label=>'Observacion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(136645684170362382)
,p_db_column_name=>'MARCA_ALERTA'
,p_display_order=>49
,p_column_identifier=>'M'
,p_column_label=>'Marca Alerta'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(139571529168728556)
,p_db_column_name=>'MON_ID_MONEDA_POLIZA'
,p_display_order=>69
,p_column_identifier=>'O'
,p_column_label=>unistr('Moneda (P\00F3liza)')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(142812134978621442)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(137384335515202392)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'181509'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ESTADO:ID_REG_POLIZA:LIC_ID_LICITACION:ENT_ID_ENTIDAD:NRO_POLIZA:TIPO:MONTO:FECHA_INICIO:FECHA_FIN'
,p_break_on=>'ESTADO'
,p_break_enabled_on=>'ESTADO'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(142816066826676178)
,p_report_id=>wwv_flow_imp.id(137384335515202392)
,p_name=>'ALERTA'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'MARCA_ALERTA'
,p_operator=>'='
,p_expr=>'ALERTA'
,p_condition_sql=>' (case when ("MARCA_ALERTA" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''ALERTA''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#ffd6d2'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(137383466980198590)
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
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(137382165808198588)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(137377648220198581)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:150:&SESSION.::&DEBUG.:150:P150_LIC_ID_LICITACION:&P149_P_ID_LICITACION.'
,p_security_scheme=>wwv_flow_imp.id(138967445957974166)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(136645845767362384)
,p_name=>'P149_P_ID_LICITACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(136645789910362383)
,p_prompt=>'P Id Licitacion'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(137382433947198588)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(137377648220198581)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(137383008034198589)
,p_event_id=>wwv_flow_imp.id(137382433947198588)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(137377648220198581)
);
wwv_flow_imp.component_end;
end;
/
