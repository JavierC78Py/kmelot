prompt --application/pages/page_00168
begin
--   Manifest
--     PAGE: 00168
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
 p_id=>168
,p_name=>unistr('Reporte de Recetas de Producci\00F3n')
,p_alias=>unistr('REPORTE-DE-RECETAS-DE-PRODUCCI\00D3N')
,p_step_title=>unistr('Reporte de Recetas de Producci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Footer {',
'    padding-top: 0px;',
'    padding-bottom: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(51133305786937070)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49534640993275104)
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
 p_id=>wwv_flow_imp.id(49535340212275119)
,p_plug_name=>unistr('Reporte de Recetas de Producci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    r.id_receta,',
'    r.descripcion_receta,',
'    r.pro_id_producto_fin,',
'    NVL(p.producto_codigo || '' - '', '''') || p.descripcion AS producto_final_desc,',
'    r.cantidad_base,',
'    r.uni_id_unidad_medida,',
'    u.abreviatura AS unidad_medida_abrev,',
'    r.estado,',
'    r.usuario_registro,',
'    r.fecha_registro',
'FROM',
'    salotex.cab_receta_produccion r,',
'    salotex.producto p,',
'    salotex.unidad_medida u',
'WHERE r.pro_id_producto_fin = p.id_producto',
'  AND r.uni_id_unidad_medida = u.id_unidad_medida'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>unistr('Reporte de Recetas de Producci\00F3n')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(49535408577275119)
,p_name=>unistr('Reporte de Recetas de Producci\00F3n')
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
,p_detail_link=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.::P170_ID_RECETA:#ID_RECETA#'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>49535408577275119
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49536170874275125)
,p_db_column_name=>'ID_RECETA'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID receta'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49536587905275126)
,p_db_column_name=>'DESCRIPCION_RECETA'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49536992535275126)
,p_db_column_name=>'PRO_ID_PRODUCTO_FIN'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'ID producto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49537338416275126)
,p_db_column_name=>'PRODUCTO_FINAL_DESC'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Producto final'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49537761693275127)
,p_db_column_name=>'CANTIDAD_BASE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Cantidad base'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49538125696275127)
,p_db_column_name=>'UNI_ID_UNIDAD_MEDIDA'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Uni. medida ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49538524006275127)
,p_db_column_name=>'UNIDAD_MEDIDA_ABREV'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Unidad medida'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49538903542275127)
,p_db_column_name=>'ESTADO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49539338558275127)
,p_db_column_name=>'USUARIO_REGISTRO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Usuario registro'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49539739212275128)
,p_db_column_name=>'FECHA_REGISTRO'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Fecha registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(49540467528276463)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'495405'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_RECETA:DESCRIPCION_RECETA:PRO_ID_PRODUCTO_FIN:PRODUCTO_FINAL_DESC:CANTIDAD_BASE:UNI_ID_UNIDAD_MEDIDA:UNIDAD_MEDIDA_ABREV:ESTADO:USUARIO_REGISTRO:FECHA_REGISTRO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(49558964958295536)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(49535340212275119)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear Receta'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:170:&APP_SESSION.::&DEBUG.:170::'
,p_security_scheme=>wwv_flow_imp.id(51133731304940591)
);
wwv_flow_imp.component_end;
end;
/
