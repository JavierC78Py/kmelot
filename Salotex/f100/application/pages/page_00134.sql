prompt --application/pages/page_00134
begin
--   Manifest
--     PAGE: 00134
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
 p_id=>134
,p_name=>'Precio de servicio'
,p_alias=>'PRECIO-DE-SERVICIO'
,p_step_title=>'Precio de servicio'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(148198895516785640)
,p_plug_name=>unistr('Hist\00F3rico de precio de servicio')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select V.ID_PRECIO_VENTA,',
'       V.MON_ID_MONEDA,',
'       V.PRO_ID_PRODUCTO,',
'       V.PRECIO,',
'       V.USUARIO,',
'       V.FECHA,',
'       V.FECHA_VIGENCIA_DESDE,',
'       V.ESP_ID_ESPECIALIDAD,',
'       V.ENT_ID_ENTIDAD',
'  from PRODUCTO_PRECIO_VENTA V',
'      ,PRODUCTO P',
' where P.ID_PRODUCTO = V.PRO_ID_PRODUCTO',
'   and P.TIPO = ''SRV''  '))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>unistr('Hist\00F3rico de precios de venta')
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(148199069466785640)
,p_name=>unistr('Hist\00F3rico de precios de venta')
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
,p_detail_link=>'f?p=&APP_ID.:135:&SESSION.::&DEBUG.:RP,:P135_ID_PRECIO_VENTA:\#ID_PRECIO_VENTA#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>74466050402778900
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(148199398367785645)
,p_db_column_name=>'ID_PRECIO_VENTA'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'Id Precio Venta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(148214359210722911)
,p_db_column_name=>'PRO_ID_PRODUCTO'
,p_display_order=>34
,p_column_identifier=>'H'
,p_column_label=>'Servicio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(87525104521547661)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(148214213369722910)
,p_db_column_name=>'MON_ID_MONEDA'
,p_display_order=>44
,p_column_identifier=>'G'
,p_column_label=>'Moneda'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(84541326864380916)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(148214421329722912)
,p_db_column_name=>'FECHA_VIGENCIA_DESDE'
,p_display_order=>64
,p_column_identifier=>'I'
,p_column_label=>'Vigencia desde'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(148200560919785648)
,p_db_column_name=>'PRECIO'
,p_display_order=>74
,p_column_identifier=>'D'
,p_column_label=>'Precio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(148201309295785648)
,p_db_column_name=>'FECHA'
,p_display_order=>84
,p_column_identifier=>'F'
,p_column_label=>'Fecha de carga'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(148200957092785648)
,p_db_column_name=>'USUARIO'
,p_display_order=>94
,p_column_identifier=>'E'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132632940727385773)
,p_db_column_name=>'ESP_ID_ESPECIALIDAD'
,p_display_order=>104
,p_column_identifier=>'J'
,p_column_label=>'Especialidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(132599214015901874)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132633032020385774)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>114
,p_column_identifier=>'K'
,p_column_label=>'Prestador'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(132620124778091696)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(148204245376786798)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'138058'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ESP_ID_ESPECIALIDAD:ENT_ID_ENTIDAD:PRO_ID_PRODUCTO:FECHA_VIGENCIA_DESDE:MON_ID_MONEDA:PRECIO:USUARIO:FECHA:'
,p_break_on=>'ESP_ID_ESPECIALIDAD'
,p_break_enabled_on=>'ESP_ID_ESPECIALIDAD'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(148203531122785653)
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
 p_id=>wwv_flow_imp.id(134401792897244723)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(148198895516785640)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear nuevo precio'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:135:&SESSION.::&DEBUG.:135::'
,p_security_scheme=>wwv_flow_imp.id(134426300850479975)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134403106348244735)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(148198895516785640)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134403608362244736)
,p_event_id=>wwv_flow_imp.id(134403106348244735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(148198895516785640)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
