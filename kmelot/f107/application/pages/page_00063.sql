prompt --application/pages/page_00063
begin
--   Manifest
--     PAGE: 00063
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
 p_id=>wwv_flow_imp.id(206106340381304459)
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
 p_id=>wwv_flow_imp.id(206106386482304459)
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
 p_id=>wwv_flow_imp.id(206106813202304461)
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
 p_id=>wwv_flow_imp.id(206107155827304464)
,p_db_column_name=>'NRO_TIMBRADO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Nro. Timbrado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206107642030304465)
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
 p_id=>wwv_flow_imp.id(206111162598304469)
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
 p_id=>wwv_flow_imp.id(206108005076304465)
,p_db_column_name=>'SUC_ID_SUCURSAL'
,p_display_order=>23
,p_column_identifier=>'D'
,p_column_label=>'Sucursal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(209413202698658529)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206109586329304466)
,p_db_column_name=>'NRO_INICIAL'
,p_display_order=>63
,p_column_identifier=>'H'
,p_column_label=>'Nro inicial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206109999643304466)
,p_db_column_name=>'NRO_FINAL'
,p_display_order=>73
,p_column_identifier=>'I'
,p_column_label=>'Nro final'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206110358513304466)
,p_db_column_name=>'NRO_UTILIZADO'
,p_display_order=>83
,p_column_identifier=>'J'
,p_column_label=>'Nro utilizado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206110752976304466)
,p_db_column_name=>'ESTADO'
,p_display_order=>93
,p_column_identifier=>'K'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204408235023672425)
,p_db_column_name=>'TIP_ID_TIPO_COMPROBANTE'
,p_display_order=>103
,p_column_identifier=>'M'
,p_column_label=>'Tipo Comprobante'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(204348117527207824)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204408258789672426)
,p_db_column_name=>'ESTABLECIMIENTO'
,p_display_order=>113
,p_column_identifier=>'N'
,p_column_label=>'Establecimiento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204408400970672427)
,p_db_column_name=>'PUNTO_EXPEDICION'
,p_display_order=>123
,p_column_identifier=>'O'
,p_column_label=>unistr('Punto expedici\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(206113879087307091)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'131474'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NRO_TIMBRADO:FECHA_INICIO:FECHA_VENCIMIENTO:SUC_ID_SUCURSAL:TIP_ID_TIPO_COMPROBANTE:ESTABLECIMIENTO:PUNTO_EXPEDICION:NRO_INICIAL:NRO_FINAL:NRO_UTILIZADO:ESTADO:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206113427157304472)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(206111723536304469)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(206106340381304459)
,p_button_name=>'CREATE'
,p_button_static_id=>'BTN_CREAR_P_EXP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Crear nuevo punto de expedici\00F3n')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:64:&APP_SESSION.::&DEBUG.:64::'
,p_security_scheme=>wwv_flow_imp.id(206134038518624488)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(206112030989304469)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(206106340381304459)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206112541736304471)
,p_event_id=>wwv_flow_imp.id(206112030989304469)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(206106340381304459)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
