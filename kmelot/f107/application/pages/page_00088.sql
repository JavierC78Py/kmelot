prompt --application/pages/page_00088
begin
--   Manifest
--     PAGE: 00088
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
 p_id=>88
,p_name=>'Transacciones'
,p_alias=>'TRANSACCIONES'
,p_step_title=>'Transacciones'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#BTN_FILTRAR {    ',
'    margin-top: 17px;',
'    }',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(203424267424386092)
,p_plug_name=>'Transacciones'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>5
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(203426314269386112)
,p_plug_name=>'Pagos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.id_transaccion',
'      ,t.tipo_transaccion',
'      ,t.fecha_transaccion',
'      ,t.for_id_forma_pago',
'      ,t.mon_id_moneda',
'      ,t.ban_id_banco',
'      ,t.emi_id_emisor_tarjeta ',
'      ,t.nro_comprobante',
'      ,t.fecha_emision',
'      ,t.fecha_cobro',
'      ,t.importe',
'      ,t.saldo',
'      ,t.estado',
'FROM transaccion t',
'WHERE t.estado = ''ACTIVO''',
'AND t.tipo_transaccion = ''PAGO''',
'AND trunc(t.fecha_transaccion) BETWEEN TO_DATE(:P88_DESDE,''DD/MM/YYYY'') AND TO_DATE(:P88_HASTA,''DD/MM/YYYY'')',
'ORDER BY t.fecha_transaccion DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P88_DESDE,P88_HASTA'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Pagos'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(203426388825386113)
,p_max_row_count=>'1000000'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>10459844189723235
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203426458654386114)
,p_db_column_name=>'ID_TRANSACCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Id Transacci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203426623720386115)
,p_db_column_name=>'TIPO_TRANSACCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo Transaccion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203426695530386116)
,p_db_column_name=>'FECHA_TRANSACCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Fecha transacci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203426780478386117)
,p_db_column_name=>'FOR_ID_FORMA_PAGO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Forma Pago'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(208610113051360149)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203426883264386118)
,p_db_column_name=>'MON_ID_MONEDA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Moneda'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(203774852436037054)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203426954170386119)
,p_db_column_name=>'BAN_ID_BANCO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Banco'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(208615258056976201)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203427091253386120)
,p_db_column_name=>'EMI_ID_EMISOR_TARJETA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Emisor tarjeta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(208615866273984573)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203427165938386121)
,p_db_column_name=>'NRO_COMPROBANTE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Nro. comprobante'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203427293539386122)
,p_db_column_name=>'FECHA_EMISION'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Fecha Emisi\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203427374466386123)
,p_db_column_name=>'FECHA_COBRO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Fecha cobro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203427501494386124)
,p_db_column_name=>'IMPORTE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Importe'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203427562004386125)
,p_db_column_name=>'SALDO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Saldo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203427652164386126)
,p_db_column_name=>'ESTADO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(205270379591250904)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'123039'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'ID_TRANSACCION:TIPO_TRANSACCION:FECHA_TRANSACCION:FOR_ID_FORMA_PAGO:MON_ID_MONEDA:BAN_ID_BANCO:EMI_ID_EMISOR_TARJETA:NRO_COMPROBANTE:FECHA_EMISION:FECHA_COBRO:IMPORTE:SALDO:ESTADO'
,p_break_on=>'MON_ID_MONEDA:FOR_ID_FORMA_PAGO:0:0:0:0'
,p_break_enabled_on=>'MON_ID_MONEDA:FOR_ID_FORMA_PAGO:0:0:0:0'
,p_sum_columns_on_break=>'IMPORTE:SALDO'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(205306084639060143)
,p_report_id=>wwv_flow_imp.id(205270379591250904)
,p_group_by_columns=>'MON_ID_MONEDA'
,p_function_01=>'SUM'
,p_function_column_01=>'IMPORTE'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Importe'
,p_function_format_mask_01=>'999G999G999G999G990D00'
,p_function_sum_01=>'N'
,p_function_02=>'SUM'
,p_function_column_02=>'SALDO'
,p_function_db_column_name_02=>'APXWS_GBFC_02'
,p_function_label_02=>'Saldo'
,p_function_format_mask_02=>'999G999G999G999G990D00'
,p_function_sum_02=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(205232044612862826)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(205232570045862830)
,p_plug_name=>'Cobros'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.id_transaccion',
'      ,t.tipo_transaccion',
'      ,t.fecha_transaccion',
'      ,t.for_id_forma_pago',
'      ,t.mon_id_moneda',
'      ,t.ban_id_banco',
'      ,t.emi_id_emisor_tarjeta ',
'      ,t.nro_comprobante',
'      ,t.fecha_emision',
'      ,t.fecha_cobro',
'      ,t.importe',
'      ,t.saldo',
'      ,t.estado',
'FROM transaccion t',
'WHERE t.estado = ''ACTIVO''',
'AND t.tipo_transaccion = ''COBRO''',
'AND trunc(t.fecha_transaccion) BETWEEN TO_DATE(:P88_DESDE,''DD/MM/YYYY'') AND TO_DATE(:P88_HASTA,''DD/MM/YYYY'')',
'ORDER BY t.fecha_transaccion DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P88_DESDE,P88_HASTA'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Cobros'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(203424710303386096)
,p_max_row_count=>'1000000'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>10458165667723218
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203424792984386097)
,p_db_column_name=>'ID_TRANSACCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Id Transacci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203424891122386098)
,p_db_column_name=>'TIPO_TRANSACCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo Transaccion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203424945493386099)
,p_db_column_name=>'FECHA_TRANSACCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Fecha transacci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203425066159386100)
,p_db_column_name=>'FOR_ID_FORMA_PAGO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Forma Pago'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(208610113051360149)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203425223771386101)
,p_db_column_name=>'MON_ID_MONEDA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Moneda'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(203774852436037054)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203425310487386102)
,p_db_column_name=>'BAN_ID_BANCO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Banco'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(208615258056976201)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203425351621386103)
,p_db_column_name=>'EMI_ID_EMISOR_TARJETA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Emisor tarjeta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(208615866273984573)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203425501218386104)
,p_db_column_name=>'NRO_COMPROBANTE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Nro. comprobante'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203425594567386105)
,p_db_column_name=>'FECHA_EMISION'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Fecha Emisi\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203425732989386106)
,p_db_column_name=>'FECHA_COBRO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Fecha cobro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203425829309386107)
,p_db_column_name=>'IMPORTE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Importe'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203425916314386108)
,p_db_column_name=>'SALDO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Saldo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203425961140386109)
,p_db_column_name=>'ESTADO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(205254569000035263)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'122881'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'ID_TRANSACCION:TIPO_TRANSACCION:FECHA_TRANSACCION:FOR_ID_FORMA_PAGO:MON_ID_MONEDA:BAN_ID_BANCO:EMI_ID_EMISOR_TARJETA:NRO_COMPROBANTE:FECHA_EMISION:FECHA_COBRO:IMPORTE:SALDO:ESTADO'
,p_break_on=>'MON_ID_MONEDA:FOR_ID_FORMA_PAGO:0:0:0:0'
,p_break_enabled_on=>'MON_ID_MONEDA:0:0:0:0:FOR_ID_FORMA_PAGO'
,p_sum_columns_on_break=>'IMPORTE:SALDO'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(205261955346162997)
,p_report_id=>wwv_flow_imp.id(205254569000035263)
,p_group_by_columns=>'MON_ID_MONEDA'
,p_function_01=>'SUM'
,p_function_column_01=>'IMPORTE'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Importe'
,p_function_format_mask_01=>'999G999G999G999G990D00'
,p_function_sum_01=>'N'
,p_function_02=>'SUM'
,p_function_column_02=>'SALDO'
,p_function_db_column_name_02=>'APXWS_GBFC_02'
,p_function_label_02=>'Saldo'
,p_function_format_mask_02=>'999G999G999G999G990D00'
,p_function_sum_02=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(203424593807386095)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(203424267424386092)
,p_button_name=>'Filtrar'
,p_button_static_id=>'BTN_FILTRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Filtrar'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(203424393475386093)
,p_name=>'P88_DESDE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(203424267424386092)
,p_prompt=>'Desde'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(203424451776386094)
,p_name=>'P88_HASTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(203424267424386092)
,p_prompt=>'Hasta'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(203426184716386111)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P88_DESDE is null then',
'    :P88_DESDE := trunc(current_date);',
'    :P88_HASTA := trunc(current_date);',
'end if;    '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>10459640080723233
);
wwv_flow_imp.component_end;
end;
/
