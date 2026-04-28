prompt --application/pages/page_00178
begin
--   Manifest
--     PAGE: 00178
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
 p_id=>178
,p_name=>'Ordenes de Trabajo'
,p_alias=>'OT-LIST'
,p_step_title=>'Ordenes de Trabajo'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner{',
'    padding-top: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(132641974324456297)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800178001)
,p_plug_name=>'Ordenes de Trabajo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ot.ID_ORDEN_TRABAJO,',
'       ot.NRO_OT,',
'       ot.ESTADO,',
'       ot.PRIORIDAD,',
'       ot.FECHA_ENTRADA,',
'       ot.FECHA_ENTREGA_ESTIMADA,',
'       ot.FECHA_ENTREGA_REAL,',
'       ot.DESCRIPCION_TRABAJO,',
'       ot.MONTO_TOTAL,',
'       m.DESCRIPCION AS MONEDA_DESC,',
'       e.NOMBRE AS CLIENTE,',
'       (SELECT COUNT(*) FROM DET_OT_SERVICIO s WHERE s.OT_ID_ORDEN_TRABAJO = ot.ID_ORDEN_TRABAJO) AS CANT_SERVICIOS,',
'       (SELECT COUNT(*) FROM DET_OT_MATERIAL mt WHERE mt.OT_ID_ORDEN_TRABAJO = ot.ID_ORDEN_TRABAJO) AS CANT_MATERIALES,',
'       ot.FECHA_APROBACION,',
'       ot.FECHA_FINALIZACION,',
'       s.monto_factura,',
'       s.saldo_factura',
'  FROM  CAB_ORDEN_TRABAJO ot',
'      , ENTIDAD e',
'      , MONEDA m',
'      ,(',
'        SELECT o.ot_id_orden_trabajo',
'              ,Sum(cf.monto) monto_factura',
'              ,Sum(cf.saldo) saldo_factura',
'        FROM ot_factura_venta o',
'            ,cab_factura_venta cf',
'        WHERE cf.id_factura_venta = o.fac_id_factura_venta',
'        GROUP BY ot_id_orden_trabajo',
'      ) s',
' WHERE ot.ENT_ID_ENTIDAD = e.ID_ENTIDAD',
'   AND ot.MON_ID_MONEDA = m.ID_MONEDA',
'   AND s.ot_id_orden_trabajo(+) = ot.id_orden_trabajo',
' ORDER BY ot.FECHA_ENTRADA DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_output=>'N'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(800178002)
,p_name=>'Ordenes de Trabajo'
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encuentran datos.'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:179:&SESSION.::&DEBUG.:RP,179:P179_ID_ORDEN_TRABAJO:#ID_ORDEN_TRABAJO#'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'KMELOT'
,p_internal_uid=>800178002
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800178010)
,p_db_column_name=>'ID_ORDEN_TRABAJO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800178011)
,p_db_column_name=>'NRO_OT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nro OT'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800178012)
,p_db_column_name=>'CLIENTE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Cliente'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800178013)
,p_db_column_name=>'DESCRIPCION_TRABAJO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800178014)
,p_db_column_name=>'FECHA_ENTRADA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha entrada'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800178015)
,p_db_column_name=>'FECHA_ENTREGA_ESTIMADA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Entrega estimada'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800178016)
,p_db_column_name=>'FECHA_ENTREGA_REAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Entrega real'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800178017)
,p_db_column_name=>'PRIORIDAD'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Prioridad'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800178018)
,p_db_column_name=>'ESTADO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800178019)
,p_db_column_name=>'MONTO_TOTAL'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Monto total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800178021)
,p_db_column_name=>'MONEDA_DESC'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Moneda'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800178022)
,p_db_column_name=>'CANT_SERVICIOS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Servicios'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800178023)
,p_db_column_name=>'CANT_MATERIALES'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Materiales'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132544623866877847)
,p_db_column_name=>'FECHA_APROBACION'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('Fecha aprobaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132544719632877848)
,p_db_column_name=>'FECHA_FINALIZACION'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>unistr('Fecha finalizaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(155497902738448604)
,p_db_column_name=>'MONTO_FACTURA'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Facturado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(155498017337448605)
,p_db_column_name=>'SALDO_FACTURA'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Saldo factura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(800178030)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'OT_RPT'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NRO_OT:CLIENTE:DESCRIPCION_TRABAJO:FECHA_ENTRADA:FECHA_ENTREGA_ESTIMADA:PRIORIDAD:ESTADO:MONTO_TOTAL:CANT_SERVICIOS:CANT_MATERIALES:FECHA_APROBACION:FECHA_FINALIZACION:MONTO_FACTURA:SALDO_FACTURA:'
,p_sort_column_1=>'NRO_OT'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(169668427939316165)
,p_report_id=>wwv_flow_imp.id(800178030)
,p_name=>'En proceso'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTADO'
,p_operator=>'='
,p_expr=>'EN_PROCESO'
,p_condition_sql=>' (case when ("ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''EN_PROCESO''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#fff5ce'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(169669283649316164)
,p_report_id=>wwv_flow_imp.id(800178030)
,p_name=>'Rechazado'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTADO'
,p_operator=>'in'
,p_expr=>'RECHAZADO,CANCELADO'
,p_condition_sql=>' (case when ("ESTADO" in (#APXWS_EXPR_VAL1#, #APXWS_EXPR_VAL2#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''RECHAZADO, CANCELADO''  '
,p_enabled=>'Y'
,p_highlight_sequence=>20
,p_column_bg_color=>'#ffd6d2'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(169668893766316164)
,p_report_id=>wwv_flow_imp.id(800178030)
,p_name=>'Facturado'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTADO'
,p_operator=>'='
,p_expr=>'FACTURADO'
,p_condition_sql=>' (case when ("ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''FACTURADO''  '
,p_enabled=>'Y'
,p_highlight_sequence=>30
,p_column_bg_color=>'#d0f1cc'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800178900)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>60
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(206180564029405200)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800178040)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(800178001)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva OT'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:179:&SESSION.::&DEBUG.:RP,179::'
,p_security_scheme=>wwv_flow_imp.id(132642995094453132)
);
wwv_flow_imp.component_end;
end;
/
