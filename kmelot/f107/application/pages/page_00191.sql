prompt --application/pages/page_00191
begin
--   Manifest
--     PAGE: 00191
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
 p_id=>191
,p_name=>unistr('Reporte \00D3rdenes de Producci\00F3n')
,p_alias=>'REPORTE-ORDENES-PRODUCCION'
,p_step_title=>unistr('Reporte \00D3rdenes de Producci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>'.t-Body-contentInner{ padding-top: 0px; }'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900191001)
,p_plug_name=>unistr('\00D3rdenes de Producci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT o.ID_ORDEN_PROD,',
'       o.NRO_ORDEN,',
'       o.FECHA_ORDEN,',
'       p.DESCRIPCION AS PRODUCTO,',
'       e.NOMBRE AS PRODUCTOR,',
'       o.CANTIDAD_A_PRODUCIR,',
'       o.CANTIDAD_A_PRODUCIR - PKG_RECEPCION_PRODUCTO.F_CANTIDAD_PENDIENTE(o.ID_ORDEN_PROD) AS CANTIDAD_PRODUCIDA,',
'       PKG_RECEPCION_PRODUCTO.F_CANTIDAD_PENDIENTE(o.ID_ORDEN_PROD) AS PENDIENTE,',
'       o.ESTADO,',
'       o.COSTO_TOTAL_REAL',
'  FROM CAB_ORDEN_PRODUCCION o,',
'       PRODUCTO p,',
'       ENTIDAD e',
' WHERE o.PRO_ID_PRODUCTO_FIN = p.ID_PRODUCTO',
'   AND o.ENT_ID_ENTIDAD_PRODUCTOR = e.ID_ENTIDAD(+)',
' ORDER BY o.FECHA_ORDEN DESC, o.NRO_ORDEN DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_output=>'N'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(900191002)
,p_name=>unistr('\00D3rdenes de Producci\00F3n')
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se encuentran \00F3rdenes de producci\00F3n.')
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.:RP,173:P173_ID_ORDEN_PROD:#ID_ORDEN_PROD#'
,p_detail_link_text=>'<span role="img" aria-label="Ver" class="fa fa-edit" title="Ver orden"></span>'
,p_owner=>'KMELOT'
,p_internal_uid=>900191002
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900191010)
,p_db_column_name=>'ID_ORDEN_PROD'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900191011)
,p_db_column_name=>'NRO_ORDEN'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nro Orden'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900191012)
,p_db_column_name=>'FECHA_ORDEN'
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
 p_id=>wwv_flow_imp.id(900191013)
,p_db_column_name=>'PRODUCTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Producto'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900191014)
,p_db_column_name=>'PRODUCTOR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Productor'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900191015)
,p_db_column_name=>'CANTIDAD_A_PRODUCIR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'A Producir'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900191016)
,p_db_column_name=>'CANTIDAD_PRODUCIDA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Producido'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900191017)
,p_db_column_name=>'PENDIENTE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Pendiente'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900191018)
,p_db_column_name=>'ESTADO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900191019)
,p_db_column_name=>'COSTO_TOTAL_REAL'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Costo Real'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(900191030)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'ORDEN_PROD_RPT'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NRO_ORDEN:FECHA_ORDEN:PRODUCTO:PRODUCTOR:CANTIDAD_A_PRODUCIR:CANTIDAD_PRODUCIDA:PENDIENTE:ESTADO:COSTO_TOTAL_REAL:'
,p_sort_column_1=>'FECHA_ORDEN'
,p_sort_direction_1=>'DESC'
,p_sum_columns_on_break=>'CANTIDAD_A_PRODUCIR:CANTIDAD_PRODUCIDA:PENDIENTE:COSTO_TOTAL_REAL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900191900)
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
wwv_flow_imp.component_end;
end;
/
