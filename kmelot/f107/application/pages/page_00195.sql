prompt --application/pages/page_00195
begin
--   Manifest
--     PAGE: 00195
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
 p_id=>195
,p_name=>'Presupuestos'
,p_alias=>'PRESUPUESTOS'
,p_step_title=>'Presupuestos'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(171712708822432905)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900000000000195001)
,p_plug_name=>'Presupuestos'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:t-IRR-region--removeHeader js-removeLandmark:margin-top-none'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cp.ID_PRESUPUESTO,',
'       cp.NRO_PRESUPUESTO,',
'       cp.FECHA_PRESUPUESTO,',
'       cp.FECHA_VALIDEZ,',
'       cp.ENT_ID_ENTIDAD,',
'       e.NOMBRE || '' - '' || e.numero_documento as CLIENTE,',
'       cp.CONDICION_VENTA,',
'       cp.MON_ID_MONEDA,',
'       m.descripcion as MONEDA,',
'       cp.TIPO_CAMBIO,',
'       cp.MONTO,',
'       cp.SUC_ID_SUCURSAL,',
'       cp.ESTADO,',
'       cp.OBSERVACION,',
'       cp.USUARIO_REGISTRO,',
'       cp.FECHA_REGISTRO,',
'       cp.USUARIO_ANULO,',
'       cp.FECHA_ANULO,',
'       (select cfv.nro_factura from cab_factura_venta cfv where cfv.pre_id_presupuesto = cp.id_presupuesto and rownum=1) as NRO_FACTURA',
'  from CAB_PRESUPUESTO cp,',
'       ENTIDAD e,',
'       MONEDA m',
' where cp.ent_id_entidad = e.id_entidad',
'   and cp.mon_id_moneda = m.id_moneda'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Presupuestos'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(900000000000195002)
,p_name=>'Presupuestos'
,p_max_row_count_message=>unistr('El reporte excede el m\00E1ximo de #MAX_ROW_COUNT# filas. Aplique un filtro para reducir.')
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
,p_detail_link=>'f?p=&APP_ID.:196:&APP_SESSION.::&DEBUG.:RP:P196_ID_PRESUPUESTO:\#ID_PRESUPUESTO#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'KMELOT'
,p_internal_uid=>900000000000195002
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195101)
,p_db_column_name=>'ID_PRESUPUESTO'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195102)
,p_db_column_name=>'NRO_PRESUPUESTO'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Nro.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195103)
,p_db_column_name=>'FECHA_PRESUPUESTO'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195104)
,p_db_column_name=>'FECHA_VALIDEZ'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Validez'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195105)
,p_db_column_name=>'CLIENTE'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Cliente'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195106)
,p_db_column_name=>'CONDICION_VENTA'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>unistr('Condici\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195107)
,p_db_column_name=>'MONEDA'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Moneda'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195108)
,p_db_column_name=>'TIPO_CAMBIO'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'T. Cambio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195109)
,p_db_column_name=>'MONTO'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Monto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195110)
,p_db_column_name=>'ESTADO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195111)
,p_db_column_name=>'NRO_FACTURA'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Nro. Factura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G9999999'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195112)
,p_db_column_name=>'OBSERVACION'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195113)
,p_db_column_name=>'USUARIO_REGISTRO'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>unistr('Usuario registr\00F3')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195114)
,p_db_column_name=>'FECHA_REGISTRO'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>unistr('Fecha registr\00F3')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195115)
,p_db_column_name=>'USUARIO_ANULO'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>unistr('Usuario anul\00F3')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195116)
,p_db_column_name=>'FECHA_ANULO'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>unistr('Fecha anul\00F3')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195117)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>160
,p_column_identifier=>'Q'
,p_column_label=>'Id Entidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195118)
,p_db_column_name=>'MON_ID_MONEDA'
,p_display_order=>170
,p_column_identifier=>'R'
,p_column_label=>'Id Moneda'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000195119)
,p_db_column_name=>'SUC_ID_SUCURSAL'
,p_display_order=>180
,p_column_identifier=>'S'
,p_column_label=>'Id Sucursal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(900000000000195200)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'P195_DEF'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'NRO_PRESUPUESTO:FECHA_PRESUPUESTO:FECHA_VALIDEZ:CLIENTE:CONDICION_VENTA:MONEDA:MONTO:ESTADO:NRO_FACTURA:'
,p_sort_column_1=>'FECHA_PRESUPUESTO'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'NRO_PRESUPUESTO'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_sum_columns_on_break=>'MONTO'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(900000000000195301)
,p_report_id=>wwv_flow_imp.id(900000000000195200)
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
,p_row_bg_color=>'#fdecea'
,p_column_bg_color=>'#f44336'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(900000000000195302)
,p_report_id=>wwv_flow_imp.id(900000000000195200)
,p_name=>'FACTURADO'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTADO'
,p_operator=>'='
,p_expr=>'FACTURADO'
,p_condition_sql=>' (case when ("ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''FACTURADO''  '
,p_enabled=>'Y'
,p_highlight_sequence=>20
,p_column_bg_color=>'#4caf50'
,p_column_font_color=>'#ffffff'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(900000000000195303)
,p_report_id=>wwv_flow_imp.id(900000000000195200)
,p_name=>'VENCIDO'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTADO'
,p_operator=>'='
,p_expr=>'VENCIDO'
,p_condition_sql=>' (case when ("ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''VENCIDO''  '
,p_enabled=>'Y'
,p_highlight_sequence=>30
,p_column_bg_color=>'#ff9800'
,p_column_font_color=>'#ffffff'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900000000000195003)
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
 p_id=>wwv_flow_imp.id(900000000000195401)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900000000000195001)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear nuevo presupuesto'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:196:&SESSION.::&DEBUG.:196::'
,p_security_scheme=>wwv_flow_imp.id(171713341674431177)
);
wwv_flow_imp.component_end;
end;
/
