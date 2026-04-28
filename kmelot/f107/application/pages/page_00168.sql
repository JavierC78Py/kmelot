prompt --application/pages/page_00168
begin
--   Manifest
--     PAGE: 00168
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
'}',
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(170366831358593208)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168768166564931242)
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
 p_id=>wwv_flow_imp.id(168768865783931257)
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
'    p.id_producto || '' - '' || p.descripcion AS producto_final_desc,',
'    r.cantidad_base,',
'    r.uni_id_unidad_medida,',
'    u.abreviatura AS unidad_medida_abrev,',
'    r.estado,',
'    r.usuario_registro,',
'    r.fecha_registro,',
'    r.sexo,',
'    r.tip_id_tipo_logo',
'FROM',
'    cab_receta_produccion r,',
'    producto p,',
'    unidad_medida u',
'WHERE r.pro_id_producto_fin = p.id_producto',
'  AND r.uni_id_unidad_medida = u.id_unidad_medida'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>unistr('Reporte de Recetas de Producci\00F3n')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(168768934148931257)
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
 p_id=>wwv_flow_imp.id(168769696445931263)
,p_db_column_name=>'ID_RECETA'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID receta'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168770113476931264)
,p_db_column_name=>'DESCRIPCION_RECETA'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168770518106931264)
,p_db_column_name=>'PRO_ID_PRODUCTO_FIN'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'ID producto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168770863987931264)
,p_db_column_name=>'PRODUCTO_FINAL_DESC'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Producto final'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168771287264931265)
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
 p_id=>wwv_flow_imp.id(168771651267931265)
,p_db_column_name=>'UNI_ID_UNIDAD_MEDIDA'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Uni. medida ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168772049577931265)
,p_db_column_name=>'UNIDAD_MEDIDA_ABREV'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Unidad medida'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168772429113931265)
,p_db_column_name=>'ESTADO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168772864129931265)
,p_db_column_name=>'USUARIO_REGISTRO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Usuario registro'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168773264783931266)
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
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(173047392850819759)
,p_db_column_name=>'SEXO'
,p_display_order=>20
,p_column_identifier=>'K'
,p_column_label=>'Sexo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(173047455373819760)
,p_db_column_name=>'TIP_ID_TIPO_LOGO'
,p_display_order=>30
,p_column_identifier=>'L'
,p_column_label=>'Tipo logo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(173167437004433058)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(168773993099932601)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'495405'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_RECETA:DESCRIPCION_RECETA:PRODUCTO_FINAL_DESC:CANTIDAD_BASE:UNIDAD_MEDIDA_ABREV:ESTADO:SEXO:TIP_ID_TIPO_LOGO:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168792490529951674)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(168768865783931257)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear receta'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.:170::'
,p_security_scheme=>wwv_flow_imp.id(170367256876596729)
);
wwv_flow_imp.component_end;
end;
/
