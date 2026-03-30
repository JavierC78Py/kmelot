prompt --application/pages/page_00034
begin
--   Manifest
--     PAGE: 00034
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
 p_id=>34
,p_name=>'Colaboradores'
,p_alias=>'COLABORADORES'
,p_step_title=>'Colaboradores'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(84708392868304280)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select C.ID_COLABORADOR,',
'       C.ENT_ID_ENTIDAD,',
'       C.ESTADO,',
'       C.DEP_ID_DEPARTAMENTO,',
'       S.DESCRIPCION',
'  from COLABORADOR C, SECCION S',
'  where S.ID_SECCION (+)       = C.SEC_ID_SECCION',
'  and S.DEP_ID_DEPARTAMENTO(+) = C.DEP_ID_DEPARTAMENTO'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_page_header=>'Report 1'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(84708786904304280)
,p_name=>'Report 1'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encontraron datos.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.:RP:P35_ID_COLABORADOR:\#ID_COLABORADOR#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>10975767840297540
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84708896512304282)
,p_db_column_name=>'ID_COLABORADOR'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Colaborador'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84709309110304287)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Colaborador'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(84463506547042371)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84709705101304287)
,p_db_column_name=>'ESTADO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84710031664304287)
,p_db_column_name=>'DEP_ID_DEPARTAMENTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Departamento'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(84749873667427468)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84156188837868843)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>14
,p_column_identifier=>'F'
,p_column_label=>unistr('Secci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(84714483805309657)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'109815'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_COLABORADOR:ENT_ID_ENTIDAD:DEP_ID_DEPARTAMENTO:DESCRIPCION:ESTADO:'
,p_sort_column_1=>'ENT_ID_ENTIDAD'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'DEP_ID_DEPARTAMENTO:0:0:0:0:0'
,p_break_enabled_on=>'DEP_ID_DEPARTAMENTO:0:0:0:0:0'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(84712694883304319)
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
 p_id=>wwv_flow_imp.id(84713835396304321)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(84708392868304280)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear colaborador'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.:35'
,p_security_scheme=>wwv_flow_imp.id(86628754627857417)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(84711589531304316)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(84708392868304280)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(84712105276304317)
,p_event_id=>wwv_flow_imp.id(84711589531304316)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(84708392868304280)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
