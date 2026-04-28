prompt --application/pages/page_00138
begin
--   Manifest
--     PAGE: 00138
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
 p_id=>138
,p_name=>'Estado de cuenta'
,p_alias=>'ESTADO-DE-CUENTA'
,p_step_title=>'Estado de cuenta'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function urlVerPDF(){',
'    apex.navigation.openInNewWindow(',
'        apex.server.url( {',
'            p_request: "application_process=ver_pdf",',
'            x01: apex.item("P138_ID_ENTIDAD").getValue(),',
'            x02: apex.item("P138_FECHA_DESDE").getValue(),',
'            x03: apex.item("P138_FECHA_HASTA").getValue()',
'        })',
'    );',
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(165506808408628823)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(164975583222024566)
,p_plug_name=>'Detalle de cobros'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT cfv.id_factura_venta',
'      ,cfv.fecha_factura',
'      ,cfv.fecha_vencimiento',
'      ,cfv.ent_id_entidad',
'      ,e.nombre AS nombre_entidad',
'      ,Translate(To_Char(cfv.nro_factura,''000G000G0000000''),'',.'',''--'') AS nro_factura',
'      ,cfv.mon_id_moneda',
'      ,cfv.monto as monto_factura',
'      ,cfv.lic_id_licitacion',
'      ,cfv.orden_compra',
'      ,cc.id_cobro',
'      ,Translate(To_Char(cc.nro_comprobante,''000G000G0000000''),'',.'',''--'') AS nro_recibo',
'      ,cc.fecha AS fecha_cobro',
'      ,cc.ren_id_rendicion_caja',
'      ,fp.descripcion',
'      ,t.importe AS importe_transaccion',
'FROM cab_factura_venta cfv',
'    ,entidad e',
'    ,licitacion l',
'    ,det_cuenta_venta dcv',
'    ,det_cobro dc',
'    ,cab_cobro cc',
'    ,det_formas_cobro dfc',
'    ,transaccion t',
'    ,forma_pago fp',
'WHERE (:P138_ID_ENTIDAD IS NULL OR cfv.ent_id_entidad = :P138_ID_ENTIDAD)',
'AND (:P138_FECHA_DESDE IS NULL OR cfv.fecha_factura > (TO_DATE(:P138_FECHA_DESDE,''DD-MM-YYYY'') -1))',
'AND (:P138_FECHA_HASTA IS NULL OR cfv.fecha_factura < (TO_DATE(:P138_FECHA_HASTA,''DD-MM-YYYY'') +1))',
'AND (:P138_ID_LICITACION IS NULL OR cfv.lic_id_licitacion = :P138_ID_LICITACION)',
'AND cfv.estado = ''ACTIVO''',
'AND e.id_entidad = cfv.ent_id_entidad',
'AND l.id_licitacion(+) = cfv.lic_id_licitacion',
'AND dcv.fac_id_factura_venta = cfv.id_factura_venta',
'AND dc.det_id_detalle_cuenta = dcv.id_detalle_cuenta',
'AND cc.id_cobro = dc.cob_id_cobro',
'AND dfc.cob_id_cobro = cc.id_cobro',
'AND t.id_transaccion = dfc.tran_id_transaccion',
'AND t.tipo_transaccion = ''COBRO''',
'AND fp.id_forma_pago = t.for_id_forma_pago',
'AND (:P138_ID_ENTIDAD IS NOT NULL ',
'    OR :P138_FECHA_DESDE IS NOT NULL',
'    OR :P138_FECHA_HASTA IS NOT NULL',
'    OR :P138_ID_LICITACION IS NOT NULL)',
'ORDER BY nro_factura ASC, nro_recibo ASC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P138_ID_ENTIDAD,P138_FECHA_DESDE,P138_FECHA_HASTA,P138_ID_LICITACION'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(164975687275024567)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>45742161703368429
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164975737595024568)
,p_db_column_name=>'ID_FACTURA_VENTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id factura venta'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164975826875024569)
,p_db_column_name=>'FECHA_FACTURA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Fecha factura'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164975943899024570)
,p_db_column_name=>'FECHA_VENCIMIENTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164976118323024571)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id entidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164976224040024572)
,p_db_column_name=>'NOMBRE_ENTIDAD'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Nombre entidad'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164976315456024573)
,p_db_column_name=>'NRO_FACTURA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Nro. factura'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164976419242024574)
,p_db_column_name=>'MON_ID_MONEDA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Moneda'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(142812134978621442)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164976598446024576)
,p_db_column_name=>'LIC_ID_LICITACION'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Licitaci\00F3n')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(154029758422584544)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164976673545024577)
,p_db_column_name=>'ORDEN_COMPRA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Orden compra'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164976930783024580)
,p_db_column_name=>'ID_COBRO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Id cobro'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164977149535024582)
,p_db_column_name=>'FECHA_COBRO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Fecha cobro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164977301125024583)
,p_db_column_name=>'REN_ID_RENDICION_CAJA'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>unistr('Rendici\00F3n caja')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164977424211024584)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Forma pago'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164977457680024585)
,p_db_column_name=>'IMPORTE_TRANSACCION'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>unistr('Importe transacci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164977667647024587)
,p_db_column_name=>'MONTO_FACTURA'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Monto factura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164977777924024588)
,p_db_column_name=>'NRO_RECIBO'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Nro. recibo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(167421900101748270)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'481884'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LIC_ID_LICITACION:FECHA_FACTURA:FECHA_VENCIMIENTO:NRO_FACTURA:NOMBRE_ENTIDAD:MON_ID_MONEDA:ORDEN_COMPRA:FECHA_COBRO:NRO_RECIBO:MONTO_FACTURA:DESCRIPCION:IMPORTE_TRANSACCION:'
,p_sort_column_1=>'FECHA_COBRO'
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
,p_break_on=>'LIC_ID_LICITACION'
,p_break_enabled_on=>'LIC_ID_LICITACION'
,p_sum_columns_on_break=>'MONTO_FACTURA:IMPORTE_TRANSACCION'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(164977530313024586)
,p_plug_name=>'Regiones'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>9
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(165486738222280076)
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
 p_id=>wwv_flow_imp.id(165487439352280090)
,p_plug_name=>'Estado de cuenta'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT cf.id_factura_venta',
'      ,cf.fecha_factura',
'      ,cf.ent_id_entidad',
'      ,e.nombre nombre_cliente',
'      ,cf.razon_social',
'      ,cf.nro_factura',
'      ,cf.condicion_venta',
'      ,cf.monto',
'      ,cf.saldo',
'      ,cf.orden_compra',
'      ,l.nro_licitacion',
'      ,l.nombre_licitacion',
'      ,null as nota_credito',
'FROM cab_factura_venta cf',
'    ,entidad e',
'    ,licitacion l',
'WHERE (:P138_ID_ENTIDAD IS NULL OR cf.ent_id_entidad = :P138_ID_ENTIDAD)',
'AND (:P138_FECHA_DESDE IS NULL OR cf.fecha_factura > (TO_DATE(:P138_FECHA_DESDE,''DD-MM-YYYY'') -1))',
'AND (:P138_FECHA_HASTA IS NULL OR cf.fecha_factura < (TO_DATE(:P138_FECHA_HASTA,''DD-MM-YYYY'') +1))',
'AND (:P138_ID_LICITACION IS NULL OR cf.lic_id_licitacion = :P138_ID_LICITACION)',
'AND cf.estado = ''ACTIVO''',
'AND cf.nro_factura != cf.id_factura_venta',
'AND e.id_entidad = cf.ent_id_entidad',
'AND l.id_licitacion = cf.lic_id_licitacion',
'AND (:P138_ID_ENTIDAD IS NOT NULL ',
'    OR :P138_FECHA_DESDE IS NOT NULL',
'    OR :P138_FECHA_HASTA IS NOT NULL',
'    OR :P138_ID_LICITACION IS NOT NULL)',
'ORDER BY nro_factura ASC '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P138_ID_ENTIDAD,P138_FECHA_DESDE,P138_FECHA_HASTA,P138_ID_LICITACION'
,p_prn_page_header=>'Estado de cuenta'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(165487537927280090)
,p_name=>'Estado de cuenta'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encuentran datos.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>46254012355623952
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(165488279780280096)
,p_db_column_name=>'ID_FACTURA_VENTA'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id factura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(165488694021280097)
,p_db_column_name=>'FECHA_FACTURA'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Fecha factura'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(165489048466280097)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Id entidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(165489502426280098)
,p_db_column_name=>'NOMBRE_CLIENTE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nombre cliente'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(165489913974280098)
,p_db_column_name=>'RAZON_SOCIAL'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Razon social'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(165490309925280098)
,p_db_column_name=>'NRO_FACTURA'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Nro. factura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999g999g9999999'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(165490701270280098)
,p_db_column_name=>'CONDICION_VENTA'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>unistr('Condici\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(165491060911280099)
,p_db_column_name=>'MONTO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Monto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(165491460700280099)
,p_db_column_name=>'SALDO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Saldo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(165491842263280099)
,p_db_column_name=>'ORDEN_COMPRA'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Nro. O.C.'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(165492229166280099)
,p_db_column_name=>'NRO_LICITACION'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>unistr('Nro. licitaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(165492633217280099)
,p_db_column_name=>'NOMBRE_LICITACION'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>unistr('Nombre licitaci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(164974720465024557)
,p_db_column_name=>'NOTA_CREDITO'
,p_display_order=>22
,p_column_identifier=>'M'
,p_column_label=>unistr('Nro. nota cr\00E9dito')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(165493356617284423)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'462599'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'RAZON_SOCIAL:ORDEN_COMPRA:NRO_LICITACION:NOMBRE_LICITACION:FECHA_FACTURA:NRO_FACTURA:NOTA_CREDITO:CONDICION_VENTA:MONTO:SALDO:'
,p_sort_column_1=>'FECHA_FACTURA'
,p_sort_direction_1=>'DESC'
,p_break_on=>'NRO_LICITACION'
,p_break_enabled_on=>'NRO_LICITACION'
,p_sum_columns_on_break=>'MONTO:SALDO'
,p_chart_type=>'pie'
,p_chart_label_column=>'RAZON_SOCIAL'
,p_chart_value_column=>'MONTO'
,p_chart_aggregate=>'SUM'
,p_chart_sorting=>'DEFAULT'
,p_chart_orientation=>'vertical'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(167168668051178329)
,p_report_id=>wwv_flow_imp.id(165493356617284423)
,p_group_by_columns=>'RAZON_SOCIAL:NRO_LICITACION:NOMBRE_LICITACION'
,p_function_01=>'SUM'
,p_function_column_01=>'MONTO'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Monto'
,p_function_format_mask_01=>'999G999G999G999G999G999G990'
,p_function_sum_01=>'Y'
,p_function_02=>'SUM'
,p_function_column_02=>'SALDO'
,p_function_db_column_name_02=>'APXWS_GBFC_02'
,p_function_label_02=>'Saldo'
,p_function_format_mask_02=>'999G999G999G999G999G999G990'
,p_function_sum_02=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(164974997795024560)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(164977530313024586)
,p_button_name=>'BTN_FILTRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Filtrar'
,p_button_execute_validations=>'N'
,p_show_processing=>'Y'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(164975339337024564)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(164977530313024586)
,p_button_name=>'BTN_PDF'
,p_button_static_id=>'BTN_PDF'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Pdf'
,p_button_redirect_url=>'javascript: urlVerPDF();'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P138_ID_ENTIDAD IS NOT NULL OR',
':P138_FECHA_DESDE IS NOT NULL OR',
':P138_FECHA_HASTA IS NOT NULL OR',
':P138_ID_LICITACION IS NOT NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(159378817041612746)
,p_name=>'P138_ID_LICITACION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(164977530313024586)
,p_prompt=>unistr('Licitaci\00F3n')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_LICITACIONES_ALL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT l.id_licitacion AS r',
'      ,l.nro_licitacion||'' CC: ''||l.codigo_contratacion||'' ''||l.convocante AS d',
'FROM licitacion l'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Todos'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Licitaciones')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(164974347137024554)
,p_name=>'P138_ID_ENTIDAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(164977530313024586)
,p_prompt=>'Entidad'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ENTIDAD_CLIENTE_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.abreviatura||'' ''||e.numero_documento||'', ''||e.nombre d',
'       ,e.id_entidad r',
'FROM entidad e, tipo_documento t',
'WHERE e.es_cliente = ''SI''',
'AND e.estado = ''ACTIVO''',
'AND t.id_tipo_documento = e.tip_id_tipo_documento'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Todos'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Entidad',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(164974742658024558)
,p_name=>'P138_FECHA_DESDE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(164977530313024586)
,p_prompt=>'Fecha desde'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(164974871490024559)
,p_name=>'P138_FECHA_HASTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(164977530313024586)
,p_prompt=>'Fecha hasta'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(164974440494024555)
,p_name=>'Set'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P138_ID_ENTIDAD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(164974587016024556)
,p_event_id=>wwv_flow_imp.id(164974440494024555)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(164975196124024562)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*IF :P138_FECHA_DESDE IS NULL THEN',
'    :P138_FECHA_DESDE := TO_CHAR((SYSDATE-INTERVAL ''1'' YEAR),''DD-MM-YYYY'');',
'    :P138_FECHA_HASTA := TO_CHAR(SYSDATE,''DD-MM-YYYY'');',
'END IF;*/',
'NULL;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>45741670552368424
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(164975433502024565)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ver_pdf'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  vl_vNomReporte VARCHAR2(255);',
'  vl_empresa     VARCHAR2(255);',
'BEGIN',
'    vl_vNomReporte := ''ESTADO_CUENTA'';',
'    SELECT p.razon_social',
'    INTO vl_empresa',
'    FROM parametros p',
'    WHERE p.id_parametro = 1;',
'  pkg_jasperreports_server.descarga_reporte(p_vNomReporte  => vl_vNomReporte',
'                                           ,p_aNomParams   => apex_util.string_to_table(''P_NOMBRE_EMPRESA:P_FECHA_DESDE:P_FECHA_HASTA:P_ID_ENTIDAD'')',
'                                           ,p_aValParams   => apex_util.string_to_table(vl_empresa||'':''||apex_application.g_x02||'':''||apex_application.g_x03||'':''||apex_application.g_x01)',
'                                            );',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_internal_uid=>45741907930368427
);
wwv_flow_imp.component_end;
end;
/
