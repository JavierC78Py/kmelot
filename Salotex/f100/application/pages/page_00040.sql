prompt --application/pages/page_00040
begin
--   Manifest
--     PAGE: 00040
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
 p_id=>40
,p_name=>'Jefatura'
,p_alias=>'JEFATURA'
,p_step_title=>'Jefatura'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(84769910160599813)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select J.ID_JEFATURA,',
'       J.DEP_ID_DEPARTAMENTO,',
'       S.DESCRIPCION SECCION,',
'       J.COL_ID_COLABORADOR,',
'       J.NIVEL,',
'       J.ESTADO',
'  from JEFATURA J, SECCION S',
'  where s.ID_SECCION(+)            = J.SEC_ID_SECCION',
'  and   s.DEP_ID_DEPARTAMENTO(+)   = J.DEP_ID_DEPARTAMENTO'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_page_header=>'Report 1'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(84770309570599813)
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
,p_detail_link=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP:P41_ID_JEFATURA:\#ID_JEFATURA#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar";></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>11037290506593073
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84770326167599814)
,p_db_column_name=>'ID_JEFATURA'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Jefatura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84770722943599814)
,p_db_column_name=>'DEP_ID_DEPARTAMENTO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Departamento'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(84749873667427468)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84771587155599815)
,p_db_column_name=>'COL_ID_COLABORADOR'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Colaborador'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(90258037866810503)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84771974565599815)
,p_db_column_name=>'NIVEL'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Nivel'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(84778145189617462)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84772369332599815)
,p_db_column_name=>'ESTADO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84156262356868844)
,p_db_column_name=>'SECCION'
,p_display_order=>16
,p_column_identifier=>'G'
,p_column_label=>unistr('Secci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(84779775759621799)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'110468'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DEP_ID_DEPARTAMENTO:ID_JEFATURA:SECCION:NIVEL:ESTADO:'
,p_break_on=>'DEP_ID_DEPARTAMENTO:0:0:0:0:0'
,p_break_enabled_on=>'DEP_ID_DEPARTAMENTO:0:0:0:0:0'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(84799704033231121)
,p_report_id=>wwv_flow_imp.id(84779775759621799)
,p_name=>'Gerente'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'NIVEL'
,p_operator=>'='
,p_expr=>'GERENTE'
,p_condition_sql=>' (case when ("NIVEL" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''GERENTE''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#d0f1cc'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(84800041098231121)
,p_report_id=>wwv_flow_imp.id(84779775759621799)
,p_name=>'Presidencia'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'NIVEL'
,p_operator=>'='
,p_expr=>'PRESIDENTE'
,p_condition_sql=>' (case when ("NIVEL" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''PRESIDENTE''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#fff5ce'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(84800482182231121)
,p_report_id=>wwv_flow_imp.id(84779775759621799)
,p_name=>'Inactivo'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTADO'
,p_operator=>'='
,p_expr=>'INACTIVO'
,p_condition_sql=>' (case when ("ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''INACTIVO''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#ffd6d2'
,p_column_font_color=>'#f44336'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(84774571850599821)
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
 p_id=>wwv_flow_imp.id(84775778218599821)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(84769910160599813)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear jefatura'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:41'
,p_security_scheme=>wwv_flow_imp.id(86631916171910579)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(84773455254599820)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(84769910160599813)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(84773983894599820)
,p_event_id=>wwv_flow_imp.id(84773455254599820)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(84769910160599813)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
