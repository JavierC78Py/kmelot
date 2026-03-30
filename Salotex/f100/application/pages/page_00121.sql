prompt --application/pages/page_00121
begin
--   Manifest
--     PAGE: 00121
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
 p_id=>121
,p_name=>'Adjunto solicitud'
,p_alias=>'ADJUNTO-SOLICITUD'
,p_page_mode=>'MODAL'
,p_step_title=>'Adjunto solicitud'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(124978808791783740)
,p_plug_name=>'Adjunto solicitud'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'ADJUNTO_PEDIDO_IT'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Adjunto solicitud'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(124978916349783740)
,p_name=>'Adjunto solicitud'
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
,p_detail_link=>'f?p=&APP_ID.:122:&APP_SESSION.::&DEBUG.:RP:P122_ID_ADJUNTO:\#ID_ADJUNTO#\'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>51245897285777000
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(124979255299783736)
,p_db_column_name=>'ID_ADJUNTO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id adjunto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(124979627655783733)
,p_db_column_name=>'PED_ID_PEDIDO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Ped Id Pedido'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(124980086362783733)
,p_db_column_name=>'OBSERVACION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(124980507873783733)
,p_db_column_name=>'NOMBRE_ARCHIVO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nombre archivo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(124980915461783733)
,p_db_column_name=>'MIME_TYPE_ARCHIVO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Tipo archivo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(124989555062761926)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'512566'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ADJUNTO:PED_ID_PEDIDO:OBSERVACION:NOMBRE_ARCHIVO:MIME_TYPE_ARCHIVO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(124983375163778142)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(124981787411783732)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(124978808791783740)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:122:&SESSION.::&DEBUG.:122:P122_PED_ID_PEDIDO:&P121_P_ID_PEDIDO.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(124983612359778144)
,p_name=>'P121_P_ID_PEDIDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(124983375163778142)
,p_prompt=>'P Id Pedido'
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
 p_id=>wwv_flow_imp.id(124982064873783732)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(124978808791783740)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(124982563693783731)
,p_event_id=>wwv_flow_imp.id(124982064873783732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(124978808791783740)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
