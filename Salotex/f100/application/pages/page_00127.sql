prompt --application/pages/page_00127
begin
--   Manifest
--     PAGE: 00127
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
 p_id=>127
,p_name=>'Paciente'
,p_alias=>'PACIENTE'
,p_step_title=>'Paciente'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(149339836589798201)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_ENTIDAD,',
'       NOMBRE,',
'       TIP_ID_TIPO_DOCUMENTO,',
'       NUMERO_DOCUMENTO,',
'       ESTADO,',
'       FECHA_NACIMIENTO,',
'       OBSERVACION,',
'       USU_ID_USUARIO,',
'       TIPO_ENTIDAD,',
'       NRO_CELULAR,',
'       CORREO,',
'       FACT_RESPONSABLE',
'  from ENTIDAD',
' where ES_PACIENTE = ''SI'' '))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_page_header=>'Report 1'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(149340299829798202)
,p_name=>'Report 1'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encuentran datos.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:128:&SESSION.::&DEBUG.:RP,:P128_ID_ENTIDAD:\#ID_ENTIDAD#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'CESAR'
,p_internal_uid=>75607280765791462
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149340361529798207)
,p_db_column_name=>'ID_ENTIDAD'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID Entidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149340735350798208)
,p_db_column_name=>'NOMBRE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('Apellido Nombre/Raz\00F3n Social')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149341130585798209)
,p_db_column_name=>'TIP_ID_TIPO_DOCUMENTO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Tipo Doc.'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(84167349864996003)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149341554626798210)
,p_db_column_name=>'NUMERO_DOCUMENTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nro. de Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149343581381798213)
,p_db_column_name=>'ESTADO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149343963653798214)
,p_db_column_name=>'FECHA_NACIMIENTO'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>unistr('Nacimiento/Constituci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149344357955798215)
,p_db_column_name=>'OBSERVACION'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(143636860140967604)
,p_db_column_name=>'USU_ID_USUARIO'
,p_display_order=>21
,p_column_identifier=>'L'
,p_column_label=>'Usu Id Usuario'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(143637013299967605)
,p_db_column_name=>'TIPO_ENTIDAD'
,p_display_order=>31
,p_column_identifier=>'M'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(191732534814526694)
,p_db_column_name=>'NRO_CELULAR'
,p_display_order=>51
,p_column_identifier=>'O'
,p_column_label=>'Nro. celular'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(191732615107526695)
,p_db_column_name=>'CORREO'
,p_display_order=>61
,p_column_identifier=>'P'
,p_column_label=>'Correo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132631897712385762)
,p_db_column_name=>'FACT_RESPONSABLE'
,p_display_order=>71
,p_column_identifier=>'Q'
,p_column_label=>'Facturar responsable'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(149349974268810726)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'64062'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ENTIDAD:NOMBRE:TIP_ID_TIPO_DOCUMENTO:NUMERO_DOCUMENTO:ESTADO:FECHA_NACIMIENTO:CORREO:NRO_CELULAR:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(149346559338798256)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(86947038457749062)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(132840287947147708)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(149339836589798201)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear paciente'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:128:&SESSION.::&DEBUG.:128::'
,p_security_scheme=>wwv_flow_imp.id(132947678401665769)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(132841546958147720)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(149339836589798201)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(132842094485147721)
,p_event_id=>wwv_flow_imp.id(132841546958147720)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(149339836589798201)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
