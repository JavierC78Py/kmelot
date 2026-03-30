prompt --application/pages/page_00166
begin
--   Manifest
--     PAGE: 00166
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
 p_id=>166
,p_name=>unistr('Costeo por licitaci\00F3n')
,p_alias=>unistr('COSTEO-POR-LICITACI\00D3N')
,p_step_title=>unistr('Costeo por licitaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(42935511197222159)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(42936162727222166)
,p_plug_name=>unistr('Costeo por licitaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  x.nro_licitacion, ',
'        x.nombre_licitacion, ',
'        x.ent_id_entidad_convocante, ',
'        x.eta_id_etapa, ',
'        x.monto_adjudicado, ',
'        x.monto_comision, ',
'        x.costeo_por_ajuste,',
'        (x.monto_adjudicado - x.monto_comision - x.costeo_por_ajuste) margen_licitacion,',
'        x.id_licitacion',
'FROM (',
'SELECT l.nro_licitacion',
'      ,l.nombre_licitacion',
'      ,l.ent_id_entidad_convocante',
'      ,l.eta_id_etapa',
'      ,l.monto_adjudicado',
'      ,(',
'        SELECT Nvl(Sum(lc.monto_comision),0)',
'        FROM licitacion_comision lc',
'        WHERE lc.lic_id_licitacion = l.id_licitacion',
'        ) monto_comision',
'      ,(',
'        SELECT Nvl(Sum( round(d.precio_unitario * ai.cantidad,0) ),0) AS total_costeado',
'        FROM ajuste_ing_costeo_licitacion ai',
'            ,det_ajuste_inventario d',
'        WHERE ai.lic_id_licitacion = l.id_licitacion',
'        AND d.id_detalle_ajuste = ai.det_id_detalle_ajuste',
'      ) costeo_por_ajuste',
'      ,l.id_licitacion',
'FROM licitacion l ) x'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>unistr('Costeo por licitaci\00F3n')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(42936267370222166)
,p_name=>unistr('Costeo por licitaci\00F3n')
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>42936267370222166
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42936904891222171)
,p_db_column_name=>'NRO_LICITACION'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>unistr('Nro. licitaci\00F3n')
,p_column_link=>'f?p=&APP_ID.:167:&SESSION.::&DEBUG.::P167_P_ID_LICITACION,P167_P_ETAPA:#ID_LICITACION#,#ETA_ID_ETAPA#'
,p_column_linktext=>'#NRO_LICITACION#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42937372348222173)
,p_db_column_name=>'NOMBRE_LICITACION'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('Nombre licitaci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42937734970222173)
,p_db_column_name=>'ENT_ID_ENTIDAD_CONVOCANTE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Entidad convocante'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(17452607221543045)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42938111024222173)
,p_db_column_name=>'ETA_ID_ETAPA'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Etapa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42938563596222173)
,p_db_column_name=>'MONTO_ADJUDICADO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Monto adjudicado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42938914110222174)
,p_db_column_name=>'MONTO_COMISION'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Monto comision'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42939371770222174)
,p_db_column_name=>'COSTEO_POR_AJUSTE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Costeo por ajuste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42939716872222174)
,p_db_column_name=>'MARGEN_LICITACION'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>unistr('Margen licitaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(40144931089956605)
,p_db_column_name=>'ID_LICITACION'
,p_display_order=>18
,p_column_identifier=>'I'
,p_column_label=>'Id Licitacion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(43181218196468830)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'431813'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NRO_LICITACION:NOMBRE_LICITACION:ENT_ID_ENTIDAD_CONVOCANTE:ETA_ID_ETAPA:MONTO_ADJUDICADO:MONTO_COMISION:COSTEO_POR_AJUSTE:MARGEN_LICITACION'
,p_sort_column_1=>'NRO_LICITACION'
,p_sort_direction_1=>'DESC'
,p_sum_columns_on_break=>'MONTO_ADJUDICADO:MONTO_COMISION:COSTEO_POR_AJUSTE:MARGEN_LICITACION'
);
wwv_flow_imp.component_end;
end;
/
