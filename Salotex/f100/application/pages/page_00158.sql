prompt --application/pages/page_00158
begin
--   Manifest
--     PAGE: 00158
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
 p_id=>158
,p_name=>'Reserva consulta'
,p_alias=>'RESERVA-CONSULTA1'
,p_step_title=>'Reserva consulta'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27997932160867887)
,p_plug_name=>'Reserva consulta'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'RESERVA_CONSULTA'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Reserva consulta'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(27998040090867887)
,p_name=>'Reserva consulta'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_base_pk1=>'ID_RESERVA_CONSULTA'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:157:&APP_SESSION.::&DEBUG.:RP:P157_ID_RESERVA_CONSULTA:\#ID_RESERVA_CONSULTA#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>27998040090867887
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27998733905867890)
,p_db_column_name=>'ID_RESERVA_CONSULTA'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id Reserva Consulta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27999194449867891)
,p_db_column_name=>'ENT_ID_ENTIDAD_PRESTADOR'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Ent Id Entidad Prestador'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_imp.id(27976661287867873)
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27999530739867891)
,p_db_column_name=>'SUC_ID_SUC_ENTIDAD'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Suc Id Suc Entidad'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_imp.id(134564062086284179)
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27999946747867891)
,p_db_column_name=>'ESP_ID_ESPECIALIDAD'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Esp Id Especialidad'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_imp.id(27977705685867875)
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28000375737867891)
,p_db_column_name=>'FECHA_TURNO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Fecha Turno'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28000741934867892)
,p_db_column_name=>'ESTADO_TURNO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Estado Turno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28001161713867892)
,p_db_column_name=>'OBSERVACION'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Observacion'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28001579764867892)
,p_db_column_name=>'ENT_ID_ENTIDAD_PACIENTE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Ent Id Entidad Paciente'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_imp.id(27976661287867873)
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28001908617867892)
,p_db_column_name=>'TIP_ID_TIPO_DOCUMENTO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Tip Id Tipo Documento'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_imp.id(84167349864996003)
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28002398011867892)
,p_db_column_name=>'NUMERO_DOCUMENTO'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Numero Documento'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28002721380867893)
,p_db_column_name=>'NOMBRE_PACIENTE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Nombre Paciente'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28003194067867893)
,p_db_column_name=>'CELULAR_PACIENTE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Celular Paciente'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28003507580867893)
,p_db_column_name=>'CORREO_PACIENTE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Correo Paciente'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28003950275867893)
,p_db_column_name=>'MOTIVO_CONSULTA'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Motivo Consulta'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28004356428867894)
,p_db_column_name=>'DIA_ID_DIAGNOSTICO'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Dia Id Diagnostico'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_imp.id(27910834356733653)
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28004769436867894)
,p_db_column_name=>'FECHA_RESERVA'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Fecha Reserva'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28005103048867894)
,p_db_column_name=>'FECHA_CANCELA'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Fecha Cancela'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28005538627867894)
,p_db_column_name=>'OBS_CANCELACION'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Obs Cancelacion'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28005907349867895)
,p_db_column_name=>'HORA_CONFIRMA'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Hora Confirma'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28006372755867895)
,p_db_column_name=>'HORA_RECEPCION'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Hora Recepcion'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28006744004867895)
,p_db_column_name=>'HORA_ENTRADA_CONSULTA'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Hora Entrada Consulta'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28007165955867895)
,p_db_column_name=>'HORA_SALIDA_CONSULTA'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Hora Salida Consulta'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28007566048867895)
,p_db_column_name=>'FECHA_INSERTADO'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Fecha Insertado'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28007927495867895)
,p_db_column_name=>'ENT_ID_ENTIDAD_PREPAGA'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Ent Id Entidad Prepaga'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_imp.id(27976661287867873)
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(28009647912868351)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'280097'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_RESERVA_CONSULTA:ENT_ID_ENTIDAD_PRESTADOR:SUC_ID_SUC_ENTIDAD:ESP_ID_ESPECIALIDAD:FECHA_TURNO:ESTADO_TURNO:OBSERVACION:ENT_ID_ENTIDAD_PACIENTE:TIP_ID_TIPO_DOCUMENTO:NUMERO_DOCUMENTO:NOMBRE_PACIENTE:CELULAR_PACIENTE:CORREO_PACIENTE:MOTIVO_CONSULTA:D'
||'IA_ID_DIAGNOSTICO:FECHA_RESERVA:FECHA_CANCELA:OBS_CANCELACION:HORA_CONFIRMA:HORA_RECEPCION:HORA_ENTRADA_CONSULTA:HORA_SALIDA_CONSULTA:FECHA_INSERTADO:ENT_ID_ENTIDAD_PREPAGA'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28008413248867896)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(27997932160867887)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:157:&APP_SESSION.::&DEBUG.:157::'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28008781378867896)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(27997932160867887)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28009220976867896)
,p_event_id=>wwv_flow_imp.id(28008781378867896)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(27997932160867887)
);
wwv_flow_imp.component_end;
end;
/
