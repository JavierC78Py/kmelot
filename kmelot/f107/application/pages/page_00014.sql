prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
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
 p_id=>14
,p_name=>'Entidad'
,p_alias=>'ENTIDAD'
,p_step_title=>'Entidad'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(209472036795313400)
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
'       ES_CLIENTE,',
'       ES_PROVEEDOR,',
'       ES_EMPLEADO,',
'       ES_USUARIO,',
'       ESTADO,',
'       FECHA_NACIMIENTO,',
'       OBSERVACION,',
'       USU_ID_USUARIO,',
'       TIPO_ENTIDAD,',
'       ES_PRESTADOR,',
'       NRO_CELULAR,',
'       CORREO,',
'       SUC_ID_SUCURSAL,',
'       ES_ESTATAL,',
'       CASE ES_ESTATAL WHEN ''SI'' THEN ''color: #239B56!important;font-weight: bold!important;'' ELSE ''color: #B03A2E!important;font-weight: bold!important;'' END style_es_estatal       ',
'  from ENTIDAD'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_page_header=>'Report 1'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(209472500035313401)
,p_name=>'Report 1'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:RP:P15_ID_ENTIDAD:\#ID_ENTIDAD#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'CESAR'
,p_internal_uid=>6396498364078403
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209472561735313406)
,p_db_column_name=>'ID_ENTIDAD'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID Entidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209472935556313407)
,p_db_column_name=>'NOMBRE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('Apellido Nombre/Raz\00F3n Social')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209473330791313408)
,p_db_column_name=>'TIP_ID_TIPO_DOCUMENTO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Tipo Doc.'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(203400875436652141)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209473754832313409)
,p_db_column_name=>'NUMERO_DOCUMENTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nro. de Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209474102128313410)
,p_db_column_name=>'ES_CLIENTE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Es Cliente'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209474555524313410)
,p_db_column_name=>'ES_PROVEEDOR'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Es Proveedor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209474982642313411)
,p_db_column_name=>'ES_EMPLEADO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Es Colaborador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209475308808313411)
,p_db_column_name=>'ES_USUARIO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Es Usuario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209475781587313412)
,p_db_column_name=>'ESTADO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209476163859313413)
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
 p_id=>wwv_flow_imp.id(209476558161313414)
,p_db_column_name=>'OBSERVACION'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203769060346482803)
,p_db_column_name=>'USU_ID_USUARIO'
,p_display_order=>21
,p_column_identifier=>'L'
,p_column_label=>'Usu Id Usuario'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203769213505482804)
,p_db_column_name=>'TIPO_ENTIDAD'
,p_display_order=>31
,p_column_identifier=>'M'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(251765288565067679)
,p_db_column_name=>'ES_PRESTADOR'
,p_display_order=>41
,p_column_identifier=>'N'
,p_column_label=>'Es Prestador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(251864735020041893)
,p_db_column_name=>'NRO_CELULAR'
,p_display_order=>51
,p_column_identifier=>'O'
,p_column_label=>'Nro. celular'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(251864815313041894)
,p_db_column_name=>'CORREO'
,p_display_order=>61
,p_column_identifier=>'P'
,p_column_label=>'Correo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184575588462231086)
,p_db_column_name=>'SUC_ID_SUCURSAL'
,p_display_order=>71
,p_column_identifier=>'Q'
,p_column_label=>'Sucursal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(209413202698658529)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(135165944126903439)
,p_db_column_name=>'ES_ESTATAL'
,p_display_order=>81
,p_column_identifier=>'R'
,p_column_label=>'Es estatal'
,p_column_html_expression=>'<span style="#STYLE_ES_ESTATAL#">#ES_ESTATAL#</span>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(135166027892903440)
,p_db_column_name=>'STYLE_ES_ESTATAL'
,p_display_order=>91
,p_column_identifier=>'S'
,p_column_label=>'Style Es Estatal'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(209482174474325925)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'64062'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ENTIDAD:NOMBRE:TIP_ID_TIPO_DOCUMENTO:NUMERO_DOCUMENTO:ES_ESTATAL:ES_CLIENTE:ES_PROVEEDOR:ES_PRESTADOR:ES_EMPLEADO:ES_USUARIO:ESTADO:SUC_ID_SUCURSAL:FECHA_NACIMIENTO:TIPO_ENTIDAD:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(209478759544313455)
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
 p_id=>wwv_flow_imp.id(209479855240313459)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(209472036795313400)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear entidad'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:15'
,p_security_scheme=>wwv_flow_imp.id(205634223166200932)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209477664813313449)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(209472036795313400)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209478157142313451)
,p_event_id=>wwv_flow_imp.id(209477664813313449)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(209472036795313400)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
