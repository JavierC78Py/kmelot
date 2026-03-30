prompt --application/pages/page_00125
begin
--   Manifest
--     PAGE: 00125
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
 p_id=>125
,p_name=>'Especialidad por prestador'
,p_alias=>'ESPECIALIDAD-POR-PRESTADOR'
,p_page_mode=>'MODAL'
,p_step_title=>'Especialidad por prestador'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--lg'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(89820068850126589)
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
 p_id=>wwv_flow_imp.id(132606913843901879)
,p_plug_name=>'Especialidad por prestador'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_DET_ESPECIALIDAD,',
'       ESP_ID_ESPECIALIDAD,',
'       ENT_ID_ENTIDAD,',
'       OBSERVACION,',
'       ESTADO',
'  from DET_ESPECIALIDAD',
' where :P125_P_ID_PRESTADOR IS NULL OR :P125_P_ID_PRESTADOR = ENT_ID_ENTIDAD'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P125_P_ID_PRESTADOR'
,p_prn_page_header=>'Especialidad por prestador'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(132606955964901879)
,p_name=>'Especialidad por prestador'
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
,p_detail_link=>'f?p=&APP_ID.:126:&APP_SESSION.::&DEBUG.:RP:P126_ID_DET_ESPECIALIDAD:\#ID_DET_ESPECIALIDAD#\'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>58873936900895139
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132607698011901880)
,p_db_column_name=>'ID_DET_ESPECIALIDAD'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id Det Especialidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132608822021901880)
,p_db_column_name=>'OBSERVACION'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132609260582901881)
,p_db_column_name=>'ESTADO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132629789864385741)
,p_db_column_name=>'ESP_ID_ESPECIALIDAD'
,p_display_order=>15
,p_column_identifier=>'F'
,p_column_label=>'Especialidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(132599214015901874)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132629821825385742)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>25
,p_column_identifier=>'G'
,p_column_label=>'Entidad (prestador)'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(132620124778091696)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(132611655662902430)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'588787'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ESTADO:OBSERVACION:ENT_ID_ENTIDAD:ESP_ID_ESPECIALIDAD:'
,p_break_on=>'ESP_ID_ESPECIALIDAD'
,p_break_enabled_on=>'ESP_ID_ESPECIALIDAD'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(132611078643901882)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(86947038457749062)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(132609776789901881)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(132606913843901879)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:126:&APP_SESSION.::&DEBUG.:126::'
,p_security_scheme=>wwv_flow_imp.id(132563184924836789)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89820202385126590)
,p_name=>'P125_P_ID_PRESTADOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(89820068850126589)
,p_prompt=>'P Id Prestador'
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
 p_id=>wwv_flow_imp.id(132610084294901881)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(132606913843901879)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(132610549790901881)
,p_event_id=>wwv_flow_imp.id(132610084294901881)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(132606913843901879)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
