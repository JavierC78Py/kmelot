prompt --application/pages/page_00192
begin
--   Manifest
--     PAGE: 00192
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
 p_id=>192
,p_name=>'Notas de Credito Venta'
,p_alias=>'NC-VENTA-LIST'
,p_step_title=>'Notas de Credito Venta'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>'.t-Body-contentInner{ padding-top: 0px; }'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(159049052521448528)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900192001)
,p_plug_name=>'Notas de Credito Venta'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NCA.ID_NCREDITO_VENTA,',
'       NCA.NRO_NCREDITO,',
'       NCA.FECHA_NCREDITO,',
'       TIP.DESCRIPCION AS TIPO_COMPROBANTE,',
'       NCA.RAZON_SOCIAL,',
'       NCA.NUMERO_DOCUMENTO,',
'       MOT.DESCRIPCION AS MOTIVO,',
'       NCA.MONTO,',
'       NCA.ESTADO,',
'       FAC.NRO_FACTURA,',
'       NCA.USUARIO_REGISTRO',
'  FROM CAB_NCREDITO_VENTA NCA,',
'       CAB_FACTURA_VENTA FAC,',
'       MOTIVO_NCREDITO MOT,',
'       TIPO_COMPROBANTE TIP',
' WHERE FAC.ID_FACTURA_VENTA = NCA.FAC_ID_FACTURA_VENTA',
' AND MOT.ID_MOTIVO = NCA.MOT_ID_MOTIVO',
' AND TIP.ID_TIPO_COMPROBANTE = NCA.TIP_ID_TIPO_COMPROBANTE',
' ORDER BY NCA.FECHA_NCREDITO DESC, NCA.ID_NCREDITO_VENTA DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_output=>'N'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(900192002)
,p_name=>'Notas de Credito'
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encontraron notas de credito.'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:193:&SESSION.::&DEBUG.:RP,193:P193_ID_NCREDITO_VENTA:#ID_NCREDITO_VENTA#'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'KMELOT'
,p_internal_uid=>900192002
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900192010)
,p_db_column_name=>'ID_NCREDITO_VENTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900192011)
,p_db_column_name=>'NRO_NCREDITO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nro. NC'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900192012)
,p_db_column_name=>'FECHA_NCREDITO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900192013)
,p_db_column_name=>'TIPO_COMPROBANTE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900192014)
,p_db_column_name=>'RAZON_SOCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Cliente'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900192015)
,p_db_column_name=>'NUMERO_DOCUMENTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'RUC/CI'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900192016)
,p_db_column_name=>'MOTIVO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Motivo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900192017)
,p_db_column_name=>'MONTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Monto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900192018)
,p_db_column_name=>'ESTADO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900192019)
,p_db_column_name=>'NRO_FACTURA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Nro. Factura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900192020)
,p_db_column_name=>'USUARIO_REGISTRO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(900192030)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'NC_VENTA_RPT'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NRO_NCREDITO:FECHA_NCREDITO:TIPO_COMPROBANTE:RAZON_SOCIAL:NUMERO_DOCUMENTO:MOTIVO:MONTO:ESTADO:NRO_FACTURA:'
,p_sort_column_1=>'FECHA_NCREDITO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900192900)
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
 p_id=>wwv_flow_imp.id(900192040)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900192001)
,p_button_name=>'CREATE'
,p_button_static_id=>'BTN_CREAR_NC'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva nota de cr\00E9dito')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:193:&SESSION.::&DEBUG.:RP,193::'
,p_security_scheme=>wwv_flow_imp.id(159050059517445974)
);
wwv_flow_imp.component_end;
end;
/
