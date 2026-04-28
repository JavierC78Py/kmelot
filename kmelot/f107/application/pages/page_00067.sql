prompt --application/pages/page_00067
begin
--   Manifest
--     PAGE: 00067
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
 p_id=>67
,p_name=>'Factura venta'
,p_alias=>'FACTURA-VENTA'
,p_step_title=>'Factura venta'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206242241703622535)
,p_plug_name=>'Factura venta'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:t-IRR-region--removeHeader js-removeLandmark:margin-top-none'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_FACTURA_VENTA,',
'       FECHA_FACTURA,',
'       FECHA_VENCIMIENTO,',
'       ENT_ID_ENTIDAD,',
'       TIP_ID_TIPO_COMPROBANTE,',
'       CONDICION_VENTA,',
'       TIM_ID_TIMBRADO,',
'       NRO_FACTURA,',
'       MON_ID_MONEDA,',
'       TIPO_CAMBIO,',
'       MONTO,',
'       SALDO,',
'       SUC_ID_SUCURSAL,',
'       ESTADO,',
'       DCTO_SEDECO,',
'       USUARIO_REGISTRO,',
'       FECHA_REGISTRO,',
'       USUARIO_ANULO,',
'       FECHA_ANULO,',
'       RAZON_SOCIAL,',
'       NUMERO_DOCUMENTO,',
'       TIP_ID_TIPO_DOCUMENTO,',
'       LIC_ID_LICITACION,',
'       ORDEN_COMPRA,',
'       CASE WHEN ID_FACTURA_VENTA = NRO_FACTURA THEN 1 ELSE 0 END TEMPORAL',
'  from CAB_FACTURA_VENTA'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Factura venta'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(206242324911622535)
,p_name=>'Factura venta'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encuentran registros.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:68:&APP_SESSION.::&DEBUG.:RP:P68_ID_FACTURA_VENTA:\#ID_FACTURA_VENTA#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>13275780275959657
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206242706708622537)
,p_db_column_name=>'ID_FACTURA_VENTA'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'Id factura venta'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'RICH_TEXT'
,p_column_alignment=>'CENTER'
,p_rich_text_format=>'MARKDOWN'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206243117034622537)
,p_db_column_name=>'FECHA_FACTURA'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Fecha Factura'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206243476219622538)
,p_db_column_name=>'FECHA_VENCIMIENTO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206244679592622539)
,p_db_column_name=>'CONDICION_VENTA'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>unistr('Condici\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206245449030622539)
,p_db_column_name=>'NRO_FACTURA'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Nro. Factura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999g999g9999999'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206246279225622540)
,p_db_column_name=>'TIPO_CAMBIO'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Tipo cambio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206246726299622540)
,p_db_column_name=>'MONTO'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Monto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206247069788622540)
,p_db_column_name=>'SALDO'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Saldo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206247936596622541)
,p_db_column_name=>'ESTADO'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206248262944622541)
,p_db_column_name=>'DCTO_SEDECO'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Dcto. Sedeco'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206248664793622541)
,p_db_column_name=>'USUARIO_REGISTRO'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>unistr('Usuario registr\00F3')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206249048169622541)
,p_db_column_name=>'FECHA_REGISTRO'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>unistr('Fecha registr\00F3')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206249527209622542)
,p_db_column_name=>'USUARIO_ANULO'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Usuario anulo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206249902942622542)
,p_db_column_name=>'FECHA_ANULO'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Fecha anulo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153030343333325655)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>29
,p_column_identifier=>'T'
,p_column_label=>'Entidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(136686132793199183)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153030501549325656)
,p_db_column_name=>'TIP_ID_TIPO_COMPROBANTE'
,p_display_order=>39
,p_column_identifier=>'U'
,p_column_label=>'Tipo comprobante'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(207635731551337402)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153030584337325657)
,p_db_column_name=>'TIM_ID_TIMBRADO'
,p_display_order=>49
,p_column_identifier=>'V'
,p_column_label=>'Timbrado'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(206191299021499723)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153030654154325658)
,p_db_column_name=>'MON_ID_MONEDA'
,p_display_order=>59
,p_column_identifier=>'W'
,p_column_label=>'Moneda'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(142812134978621442)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153030746253325659)
,p_db_column_name=>'SUC_ID_SUCURSAL'
,p_display_order=>69
,p_column_identifier=>'X'
,p_column_label=>'Sucursal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(253797587657940317)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153030891675325660)
,p_db_column_name=>'RAZON_SOCIAL'
,p_display_order=>79
,p_column_identifier=>'Y'
,p_column_label=>'Razon social'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153030928530325661)
,p_db_column_name=>'NUMERO_DOCUMENTO'
,p_display_order=>89
,p_column_identifier=>'Z'
,p_column_label=>'Numero documento'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153031107401325662)
,p_db_column_name=>'TIP_ID_TIPO_DOCUMENTO'
,p_display_order=>99
,p_column_identifier=>'AA'
,p_column_label=>'Tipo documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153031135201325663)
,p_db_column_name=>'LIC_ID_LICITACION'
,p_display_order=>109
,p_column_identifier=>'AB'
,p_column_label=>unistr('Licitaci\00F3n')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(154029758422584544)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153031263867325664)
,p_db_column_name=>'ORDEN_COMPRA'
,p_display_order=>119
,p_column_identifier=>'AC'
,p_column_label=>'Orden de compra'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(147293588409213488)
,p_db_column_name=>'TEMPORAL'
,p_display_order=>129
,p_column_identifier=>'AD'
,p_column_label=>'Temporal'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(206252360550622804)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'132859'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'FECHA_FACTURA:ID_FACTURA_VENTA:NRO_FACTURA:FECHA_VENCIMIENTO:CONDICION_VENTA:MONTO:SALDO:ESTADO:FECHA_ANULO:LIC_ID_LICITACION:'
,p_sort_column_1=>'FECHA_FACTURA'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'NRO_FACTURA'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'MON_ID_MONEDA'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'FECHA_FACTURA:MON_ID_MONEDA:0:0:0:0'
,p_break_enabled_on=>'FECHA_FACTURA:MON_ID_MONEDA:0:0:0:0'
,p_sum_columns_on_break=>'MONTO:SALDO'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(165513772801937561)
,p_report_id=>wwv_flow_imp.id(206252360550622804)
,p_name=>'ANULADO'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTADO'
,p_operator=>'='
,p_expr=>'ANULADO'
,p_condition_sql=>' (case when ("ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''ANULADO''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#f44336'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(165514225121937561)
,p_report_id=>wwv_flow_imp.id(206252360550622804)
,p_name=>'Es temporal'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'TEMPORAL'
,p_operator=>'='
,p_expr=>'1'
,p_condition_sql=>' (case when ("TEMPORAL" = to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>21
,p_row_bg_color=>'#fff5ce'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(165514551724937562)
,p_report_id=>wwv_flow_imp.id(206252360550622804)
,p_group_by_columns=>'LIC_ID_LICITACION'
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206251228765622543)
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
 p_id=>wwv_flow_imp.id(206250397589622542)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(206242241703622535)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear nueva venta'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.:68::'
,p_security_scheme=>wwv_flow_imp.id(208262437230142561)
);
wwv_flow_imp.component_end;
end;
/
