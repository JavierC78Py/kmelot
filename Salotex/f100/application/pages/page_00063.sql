prompt --application/pages/page_00063
begin
--   Manifest
--     PAGE: 00063
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
 p_id=>63
,p_name=>unistr('Puntos de expedici\00F3n')
,p_alias=>unistr('PUNTOS-DE-EXPEDICI\00D3N')
,p_step_title=>unistr('Puntos de expedici\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86872814809648321)
,p_plug_name=>unistr('Puntos de expedici\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_TIMBRADO,',
'       NRO_TIMBRADO,',
'       FECHA_INICIO,',
'       SUC_ID_SUCURSAL,',
'       TIP_ID_TIPO_COMPROBANTE,',
'       lpad(ESTABLECIMIENTO,3,''0'') ESTABLECIMIENTO,',
'       lpad(PUNTO_EXPEDICION,3,''0'') PUNTO_EXPEDICION,',
'       NRO_INICIAL,',
'       NRO_FINAL,',
'       NRO_UTILIZADO,',
'       ESTADO,',
'       FECHA_VENCIMIENTO',
'  from TIMBRADO'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>unistr('Puntos de expedici\00F3n')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(86872860910648321)
,p_name=>unistr('Puntos de expedici\00F3n')
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
,p_detail_link=>'f?p=&APP_ID.:64:&APP_SESSION.::&DEBUG.:RP:P64_ID_TIMBRADO:\#ID_TIMBRADO#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>13139841846641581
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(86873287630648323)
,p_db_column_name=>'ID_TIMBRADO'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'Id Timbrado'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(86873630255648326)
,p_db_column_name=>'NRO_TIMBRADO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Nro. Timbrado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(86874116458648327)
,p_db_column_name=>'FECHA_INICIO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Fecha inicio'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(86877637026648331)
,p_db_column_name=>'FECHA_VENCIMIENTO'
,p_display_order=>13
,p_column_identifier=>'L'
,p_column_label=>'Fecha vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(86874479504648327)
,p_db_column_name=>'SUC_ID_SUCURSAL'
,p_display_order=>23
,p_column_identifier=>'D'
,p_column_label=>'Sucursal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(90179677127002391)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(86876060757648328)
,p_db_column_name=>'NRO_INICIAL'
,p_display_order=>63
,p_column_identifier=>'H'
,p_column_label=>'Nro inicial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(86876474071648328)
,p_db_column_name=>'NRO_FINAL'
,p_display_order=>73
,p_column_identifier=>'I'
,p_column_label=>'Nro final'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(86876832941648328)
,p_db_column_name=>'NRO_UTILIZADO'
,p_display_order=>83
,p_column_identifier=>'J'
,p_column_label=>'Nro utilizado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(86877227404648328)
,p_db_column_name=>'ESTADO'
,p_display_order=>93
,p_column_identifier=>'K'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85174709452016287)
,p_db_column_name=>'TIP_ID_TIPO_COMPROBANTE'
,p_display_order=>103
,p_column_identifier=>'M'
,p_column_label=>'Tipo Comprobante'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(85114591955551686)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85174733218016288)
,p_db_column_name=>'ESTABLECIMIENTO'
,p_display_order=>113
,p_column_identifier=>'N'
,p_column_label=>'Establecimiento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85174875399016289)
,p_db_column_name=>'PUNTO_EXPEDICION'
,p_display_order=>123
,p_column_identifier=>'O'
,p_column_label=>unistr('Punto expedici\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(86880353515650953)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'131474'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NRO_TIMBRADO:FECHA_INICIO:FECHA_VENCIMIENTO:SUC_ID_SUCURSAL:TIP_ID_TIPO_COMPROBANTE:ESTABLECIMIENTO:PUNTO_EXPEDICION:NRO_INICIAL:NRO_FINAL:NRO_UTILIZADO:ESTADO:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86879901585648334)
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
 p_id=>wwv_flow_imp.id(86878197964648331)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(86872814809648321)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Crear nuevo punto de expedici\00F3n')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:64:&APP_SESSION.::&DEBUG.:64::'
,p_security_scheme=>wwv_flow_imp.id(86900512946968350)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(86878505417648331)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(86872814809648321)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(86879016164648333)
,p_event_id=>wwv_flow_imp.id(86878505417648331)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(86872814809648321)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
