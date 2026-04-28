prompt --application/pages/page_00086
begin
--   Manifest
--     PAGE: 00086
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
 p_id=>86
,p_name=>'Pago factura'
,p_alias=>'PAGO-FACTURA'
,p_step_title=>'Pago factura'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(205713926733225236)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(226796379071291210)
,p_plug_name=>'Cobro factura'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.id_pago,',
'       c.suc_id_sucursal,',
'       c.nro_comprobante,',
'       c.fecha,',
'       c.ent_id_entidad,',
'       c.mon_id_moneda,',
'       c.tipo_cambio,',
'       c.estado,',
'       c.ren_id_rendicion_caja,',
'       r.ent_id_entidad id_ent_cobrador,',
'       CASE c.estado WHEN ''ACTIVO'' THEN ''color: #239B56!important;font-weight: bold!important;'' WHEN ''ANULADO'' THEN ''color: #b01c24!important;font-weight: bold!important;'' END style_estado,',
'       c.tip_id_tipo_comprobante',
'from cab_pago c',
'    ,rendicion_caja r',
'where r.id_rendicion_caja = c.ren_id_rendicion_caja',
'AND r.ent_id_entidad = f_id_entidad(v(''APP_USER''))',
'; ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Cobro factura'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(226796443406291210)
,p_name=>'Cobro factura'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encuentran datos.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:87:&SESSION.::&DEBUG.:RP,:P87_ID_PAGO:#ID_PAGO##ID_COBRO#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>33829898770628332
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211349469240428442)
,p_db_column_name=>'NRO_COMPROBANTE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nro. Comprobante'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G9999999'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211349921214428442)
,p_db_column_name=>'FECHA'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211350245160428443)
,p_db_column_name=>'TIPO_CAMBIO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Tipo cambio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211350662649428443)
,p_db_column_name=>'ESTADO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span style="#STYLE_ESTADO#">#ESTADO#</span>',
''))
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211351052432428443)
,p_db_column_name=>'SUC_ID_SUCURSAL'
,p_display_order=>19
,p_column_identifier=>'K'
,p_column_label=>'Sucursal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(209413202698658529)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211351854675428444)
,p_db_column_name=>'MON_ID_MONEDA'
,p_display_order=>49
,p_column_identifier=>'N'
,p_column_label=>'Moneda'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(203774852436037054)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211352303482428444)
,p_db_column_name=>'REN_ID_RENDICION_CAJA'
,p_display_order=>59
,p_column_identifier=>'O'
,p_column_label=>unistr('Rendici\00F3n caja')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211352731963428445)
,p_db_column_name=>'ID_ENT_COBRADOR'
,p_display_order=>69
,p_column_identifier=>'P'
,p_column_label=>'Pagado por'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(209152421059010815)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211353061721428445)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>79
,p_column_identifier=>'Q'
,p_column_label=>'Entidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(203697032118698509)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211348685205428435)
,p_db_column_name=>'STYLE_ESTADO'
,p_display_order=>89
,p_column_identifier=>'R'
,p_column_label=>'Style Estado'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211353474945428445)
,p_db_column_name=>'TIP_ID_TIPO_COMPROBANTE'
,p_display_order=>99
,p_column_identifier=>'S'
,p_column_label=>'Tipo Comprobante'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(207635731551337402)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211357677273437579)
,p_db_column_name=>'ID_PAGO'
,p_display_order=>109
,p_column_identifier=>'T'
,p_column_label=>'Id Pago'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(226812447218367126)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'154644'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_PAGO:REN_ID_RENDICION_CAJA:ID_ENT_COBRADOR:ENT_ID_ENTIDAD:TIP_ID_TIPO_COMPROBANTE:NRO_COMPROBANTE:FECHA:TIPO_CAMBIO:ESTADO:SUC_ID_SUCURSAL:MON_ID_MONEDA:'
,p_sort_column_1=>'FECHA'
,p_sort_direction_1=>'DESC'
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
,p_break_on=>'REN_ID_RENDICION_CAJA:0:0:0:0:0'
,p_break_enabled_on=>'REN_ID_RENDICION_CAJA:0:0:0:0:0'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(226802598212291216)
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
 p_id=>wwv_flow_imp.id(211354239771428451)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(226796379071291210)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear nuevo pago'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:87:&SESSION.::&DEBUG.:87::'
,p_button_condition=>'P86_RENDICION_CAJA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(205714313956227881)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211355241091428473)
,p_name=>'P86_RENDICION_CAJA'
,p_item_sequence=>20
,p_prompt=>unistr('Cuenta con una rendici\00F3n de caja abierta desde el :')
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>7
,p_grid_label_column_span=>5
,p_display_when=>'P86_RENDICION_CAJA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211355949207428481)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId == 84'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211356508578428484)
,p_event_id=>wwv_flow_imp.id(211355949207428481)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(226796379071291210)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211356839134428484)
,p_name=>'Refrescar al regresar'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(226796379071291210)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211357268157428485)
,p_event_id=>wwv_flow_imp.id(211356839134428484)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(226796379071291210)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(211355562600428477)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Buscar rendicion '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    SELECT to_char(r.fecha_desde,''DD/MM/YYYY HH24:MI'')',
'    INTO :P86_RENDICION_CAJA',
'    FROM rendicion_caja r',
'    WHERE r.ent_id_entidad = f_id_entidad(v(''APP_USER''))',
'    AND trunc(sysdate) BETWEEN r.fecha_desde AND r.fecha_hasta',
'    AND r.estado = ''ABIERTO''',
'    ;',
'exception ',
'    when no_data_found then ',
'        :P86_RENDICION_CAJA := null;    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>18389017964765599
);
wwv_flow_imp.component_end;
end;
/
