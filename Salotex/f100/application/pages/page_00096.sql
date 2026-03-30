prompt --application/pages/page_00096
begin
--   Manifest
--     PAGE: 00096
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
 p_id=>96
,p_name=>'Tabla de descuento en venta'
,p_alias=>'TABLA-DE-DESCUENTO-EN-VENTA'
,p_step_title=>'Tabla de descuento en venta'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(99140882271774167)
,p_plug_name=>'Tabla de descuento en venta'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_DESCUENTO,',
'       ESTADO,',
'       FECHA_DESDE,',
'       FECHA_HASTA,',
'       ORI_ID_ORIGEN,',
'       GRU_ID_GRUPO,',
'       MAR_ID_MARCA,',
'       MONTO_DESDE,',
'       PORC_DESCUENTO,',
'       MON_ID_MONEDA',
'  from DESCUENTO_VENTA'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Tabla de descuento en venta'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(99140955228774167)
,p_name=>'Tabla de descuento en venta'
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
,p_detail_link=>'f?p=&APP_ID.:97:&APP_SESSION.::&DEBUG.:RP:P97_ID_DESCUENTO:\#ID_DESCUENTO#\'
,p_detail_link_text=>'<span role="img" aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>25407936164767427
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(99141325512774170)
,p_db_column_name=>'ID_DESCUENTO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id descuento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(99141798259774172)
,p_db_column_name=>'ESTADO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(99142187120774172)
,p_db_column_name=>'FECHA_DESDE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Fecha/hora desde'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(99142587074774172)
,p_db_column_name=>'FECHA_HASTA'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Fecha hasta'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(99077377530895780)
,p_db_column_name=>'MON_ID_MONEDA'
,p_display_order=>14
,p_column_identifier=>'M'
,p_column_label=>'Moneda'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(84541326864380916)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(99144175898774173)
,p_db_column_name=>'MONTO_DESDE'
,p_display_order=>24
,p_column_identifier=>'H'
,p_column_label=>'Monto desde'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(99144549831774173)
,p_db_column_name=>'PORC_DESCUENTO'
,p_display_order=>34
,p_column_identifier=>'I'
,p_column_label=>'% Descuento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(99077097449895777)
,p_db_column_name=>'ORI_ID_ORIGEN'
,p_display_order=>44
,p_column_identifier=>'J'
,p_column_label=>'Origen'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(90413925760461462)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(99077209046895778)
,p_db_column_name=>'GRU_ID_GRUPO'
,p_display_order=>54
,p_column_identifier=>'K'
,p_column_label=>'Grupo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(90414341237469676)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(99077239314895779)
,p_db_column_name=>'MAR_ID_MARCA'
,p_display_order=>64
,p_column_identifier=>'L'
,p_column_label=>'Marca'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(90414130111464811)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(99147942705777335)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'254150'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DESCUENTO:ESTADO:FECHA_DESDE:FECHA_HASTA:MON_ID_MONEDA:MONTO_DESDE:PORC_DESCUENTO:ORI_ID_ORIGEN:GRU_ID_GRUPO:MAR_ID_MARCA:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(99146802690774180)
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
 p_id=>wwv_flow_imp.id(99145036494774174)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(99140882271774167)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:97:&APP_SESSION.::&DEBUG.:97::'
,p_security_scheme=>wwv_flow_imp.id(113307824784507341)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(99145370776774174)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(99140882271774167)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99145876515774175)
,p_event_id=>wwv_flow_imp.id(99145370776774174)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(99140882271774167)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
