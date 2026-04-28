prompt --application/pages/page_00065
begin
--   Manifest
--     PAGE: 00065
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
 p_id=>65
,p_name=>unistr('Asignaci\00F3n puntos de expedici\00F3n')
,p_alias=>unistr('ASIGNACI\00D3N-PUNTOS-DE-EXPEDICI\00D3N')
,p_step_title=>unistr('Asignaci\00F3n puntos de expedici\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206146872086701045)
,p_plug_name=>unistr('Asignaci\00F3n puntos de expedici\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.nro_timbrado',
'      ,s.descripcion sucursal',
'      ,tc.descripcion tipo_comprobante',
'      ,LPad(t.establecimiento,3,''0'') establecimiento',
'      ,LPad(t.punto_expedicion,3,''0'') punto_expedicion',
'      ,e.nombre||''(''||us.usuario||'')'' usuario',
'      ,t.nro_final',
'      ,t.nro_utilizado',
'      ,u.estado',
'      ,u.id_usu_p_exp',
'FROM usuario_punto_expedicion u, timbrado t, sucursal_entidad s, tipo_comprobante tc, entidad e, usuarios us',
'WHERE t.id_timbrado = u.tim_id_timbrado',
'AND s.id_suc_entidad = t.suc_id_sucursal',
'AND tc.id_tipo_comprobante = t.tip_id_tipo_comprobante',
'AND e.id_entidad = u.ent_id_entidad',
'AND us.id_usuario = e.usu_id_usuario',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>unistr('Asignaci\00F3n puntos de expedici\00F3n')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(206147007777701045)
,p_name=>unistr('Asignaci\00F3n puntos de expedici\00F3n')
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
,p_detail_link=>'f?p=&APP_ID.:66:&APP_SESSION.::&DEBUG.:RP:P66_ID_USU_P_EXP:\#ID_USU_P_EXP#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>13180463142038167
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206147406675701047)
,p_db_column_name=>'ID_USU_P_EXP'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'Id Usu P Exp'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206148579829701048)
,p_db_column_name=>'ESTADO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206156427843925981)
,p_db_column_name=>'NRO_TIMBRADO'
,p_display_order=>14
,p_column_identifier=>'E'
,p_column_label=>'Nro Timbrado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206156535378925982)
,p_db_column_name=>'SUCURSAL'
,p_display_order=>24
,p_column_identifier=>'F'
,p_column_label=>'Sucursal'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206156624040925983)
,p_db_column_name=>'TIPO_COMPROBANTE'
,p_display_order=>34
,p_column_identifier=>'G'
,p_column_label=>'Tipo Comprobante'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206156742998925984)
,p_db_column_name=>'ESTABLECIMIENTO'
,p_display_order=>44
,p_column_identifier=>'H'
,p_column_label=>'Establecimiento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206156757547925985)
,p_db_column_name=>'PUNTO_EXPEDICION'
,p_display_order=>54
,p_column_identifier=>'I'
,p_column_label=>unistr('Punto expedici\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206156900003925986)
,p_db_column_name=>'USUARIO'
,p_display_order=>64
,p_column_identifier=>'J'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206157014699925987)
,p_db_column_name=>'NRO_FINAL'
,p_display_order=>74
,p_column_identifier=>'K'
,p_column_label=>'Nro Final'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206157068712925988)
,p_db_column_name=>'NRO_UTILIZADO'
,p_display_order=>84
,p_column_identifier=>'L'
,p_column_label=>'Nro Utilizado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(206151331218701783)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'131848'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NRO_TIMBRADO:USUARIO:SUCURSAL:TIPO_COMPROBANTE:ESTABLECIMIENTO:PUNTO_EXPEDICION:NRO_FINAL:NRO_UTILIZADO:ESTADO:'
,p_break_on=>'TIPO_COMPROBANTE'
,p_break_enabled_on=>'TIPO_COMPROBANTE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206150758429701050)
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
 p_id=>wwv_flow_imp.id(206149059464701049)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(206146872086701045)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Crear asignaci\00F3n')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:66:&APP_SESSION.::&DEBUG.:66::'
,p_security_scheme=>wwv_flow_imp.id(206167839024019151)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(206149378990701049)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(206146872086701045)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206149863082701049)
,p_event_id=>wwv_flow_imp.id(206149378990701049)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(206146872086701045)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
