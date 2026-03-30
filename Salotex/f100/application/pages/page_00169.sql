prompt --application/pages/page_00169
begin
--   Manifest
--     PAGE: 00169
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
 p_id=>169
,p_name=>unistr('\00D3rdenes de Producci\00F3n')
,p_alias=>unistr('\00D3RDENES-DE-PRODUCCI\00D3N')
,p_step_title=>unistr('\00D3rdenes de Producci\00F3n')
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
 p_id=>wwv_flow_imp.id(51141686184067177)
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
 p_id=>wwv_flow_imp.id(51142393256067182)
,p_plug_name=>unistr('\00D3rdenes de Producci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    o.id_orden_prod,',
'    o.nro_orden,',
'    o.fecha_orden,',
'    o.suc_id_sucursal,',
'    s.descripcion AS sucursal_desc,',
'    o.pro_id_producto_fin,',
'    p.descripcion AS producto_desc,',
'    o.cantidad_a_producir,',
'    o.costo_total_estimado,',
'    o.costo_total_real,',
'    o.estado,',
'    o.fecha_registro',
'FROM',
'    cab_orden_produccion o,',
'    sucursal_entidad s,',
'    producto p',
'WHERE o.suc_id_sucursal = s.id_suc_entidad',
'  AND o.pro_id_producto_fin = p.id_producto'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>unistr('\00D3rdenes de Producci\00F3n')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(51142431013067182)
,p_name=>unistr('\00D3rdenes de Producci\00F3n')
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
,p_detail_link=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.:173:P173_ID_ORDEN_PROD:#ID_ORDEN_PROD#'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>51142431013067182
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51143144767067186)
,p_db_column_name=>'ID_ORDEN_PROD'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id orden prod'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51143565529067187)
,p_db_column_name=>'NRO_ORDEN'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Nro. orden'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51143933475067187)
,p_db_column_name=>'FECHA_ORDEN'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Fecha orden'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51144397591067188)
,p_db_column_name=>'SUC_ID_SUCURSAL'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Id sucursal'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51144780457067188)
,p_db_column_name=>'SUCURSAL_DESC'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Sucursal'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51145185079067188)
,p_db_column_name=>'PRO_ID_PRODUCTO_FIN'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Id producto final'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51145586102067188)
,p_db_column_name=>'PRODUCTO_DESC'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Producto'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51145922825067188)
,p_db_column_name=>'CANTIDAD_A_PRODUCIR'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Cantidad a producir'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51146372750067189)
,p_db_column_name=>'COSTO_TOTAL_ESTIMADO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Costo totale estimado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51146705268067189)
,p_db_column_name=>'COSTO_TOTAL_REAL'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Costo total real'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51147110661067189)
,p_db_column_name=>'ESTADO'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51147566419067189)
,p_db_column_name=>'FECHA_REGISTRO'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Fecha registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(51147962827078842)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'511480'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ORDEN_PROD:NRO_ORDEN:FECHA_ORDEN:SUC_ID_SUCURSAL:SUCURSAL_DESC:PRO_ID_PRODUCTO_FIN:PRODUCTO_DESC:CANTIDAD_A_PRODUCIR:COSTO_TOTAL_ESTIMADO:COSTO_TOTAL_REAL:ESTADO:FECHA_REGISTRO'
,p_sort_column_1=>'ID_ORDEN_PROD'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(52146933095990319)
,p_report_id=>wwv_flow_imp.id(51147962827078842)
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
,p_row_bg_color=>'#d0f1cc'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(52147307727990319)
,p_report_id=>wwv_flow_imp.id(51147962827078842)
,p_name=>'Pendiente'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTADO'
,p_operator=>'='
,p_expr=>'PENDIENTE'
,p_condition_sql=>' (case when ("ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''PENDIENTE''  '
,p_enabled=>'Y'
,p_highlight_sequence=>20
,p_row_bg_color=>'#fff5ce'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(40145395979956609)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(51142393256067182)
,p_button_name=>'Crear'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear orden'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.:173::'
);
wwv_flow_imp.component_end;
end;
/
