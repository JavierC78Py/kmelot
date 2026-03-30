prompt --application/pages/page_00030
begin
--   Manifest
--     PAGE: 00030
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
 p_id=>30
,p_name=>'Producto'
,p_alias=>'PRODUCTO'
,p_step_title=>'Producto'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(86461862284176368)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(90405101626452042)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT P.ID_PRODUCTO,',
'       P.DESCRIPCION,',
'       P.ORI_ID_ORIGEN,',
'       P.MAR_ID_MARCA,',
'       P.GRU_ID_GRUPO,',
'       P.IVA_ID_IVA,',
'       P.CODIGO_BARRA_FABRICA,',
'       P.CODIGO_BARRA_INTERNO,',
'       P.ESTADO,',
'       P.CUE_CON_ID_CTA_COMPRA,',
'       P.CUE_CON_ID_CTA_VENTA,',
'       P.CUE_CON_ID_CTA_COSTO_V,',
'       P.CUE_CON_ID_CTA_DEVOL_CLI,',
'       P.CUE_CON_ID_CTA_DSCTO_PROV,',
'       P.ES_UNICO,',
'       P.NOMBRE_ARCHIVO,',
'       P.MIME_TYPE_ARCHIVO,',
'       P.STOCK_MINIMO,',
'       G.GRUPO_NIVEL_1,',
'       (',
'        select gr.descripcion',
'        from grupo_producto gr',
'        where gr.grupo_nivel_1 = G.GRUPO_NIVEL_1',
'        and gr.grupo_nivel_2 = G.GRUPO_NIVEL_2',
'        and gr.grupo_nivel_3 is null',
'       ) GRUPO_NIVEL_2,',
'       (',
'         f_devuelve_stock( p_id_producto => P.ID_PRODUCTO',
'                          ,p_id_deposito => null',
'                          ,p_id_unidad_medida => null',
'                          ,p_fecha_hasta => null',
'                          ,p_momento     => ''TODOS'')',
'       ) stock,',
'       P.PRODUCTO_CODIGO',
'  FROM PRODUCTO P, GRUPO_PRODUCTO G',
' WHERE G.ID_GRUPO = P.GRU_ID_GRUPO',
' AND P.TIPO = ''ART''',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_page_header=>'Report 1'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(90405495275452043)
,p_name=>'Report 1'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encuentran datos.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:RP:P31_ID_PRODUCTO:\#ID_PRODUCTO#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'CESAR'
,p_internal_uid=>6563019175873183
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90405628432452043)
,p_db_column_name=>'ID_PRODUCTO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID Producto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90406044068452044)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90406449440452044)
,p_db_column_name=>'ORI_ID_ORIGEN'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Origen'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(90413925760461462)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90406865282452045)
,p_db_column_name=>'MAR_ID_MARCA'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Marca'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(90414130111464811)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90407201700452046)
,p_db_column_name=>'GRU_ID_GRUPO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Grupo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(90414341237469676)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90407652741452046)
,p_db_column_name=>'IVA_ID_IVA'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'I.V.A.'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(90414572990473615)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90408038223452047)
,p_db_column_name=>'CODIGO_BARRA_FABRICA'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>unistr('C\00F3digo barra fabrica')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90408416192452047)
,p_db_column_name=>'CODIGO_BARRA_INTERNO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>unistr('C\00F3digo barra interno')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90408796804452048)
,p_db_column_name=>'ESTADO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90409222562452048)
,p_db_column_name=>'CUE_CON_ID_CTA_COMPRA'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Cue Con Id Cta Compra'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90409666736452049)
,p_db_column_name=>'CUE_CON_ID_CTA_VENTA'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Cue Con Id Cta Venta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90410072632452050)
,p_db_column_name=>'CUE_CON_ID_CTA_COSTO_V'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Cue Con Id Cta Costo V'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90410434912452050)
,p_db_column_name=>'CUE_CON_ID_CTA_DEVOL_CLI'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Cue Con Id Cta Devol Cli'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90410798629452051)
,p_db_column_name=>'CUE_CON_ID_CTA_DSCTO_PROV'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Cue Con Id Cta Dscto Prov'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90411260586452051)
,p_db_column_name=>'ES_UNICO'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Es Unico'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84534151638826651)
,p_db_column_name=>'NOMBRE_ARCHIVO'
,p_display_order=>26
,p_column_identifier=>'Q'
,p_column_label=>'Nombre Archivo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84534222816826652)
,p_db_column_name=>'MIME_TYPE_ARCHIVO'
,p_display_order=>36
,p_column_identifier=>'R'
,p_column_label=>'Mime Type Archivo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84534396853826653)
,p_db_column_name=>'STOCK_MINIMO'
,p_display_order=>46
,p_column_identifier=>'S'
,p_column_label=>unistr('Stock m\00EDnimo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84534465673826654)
,p_db_column_name=>'GRUPO_NIVEL_1'
,p_display_order=>56
,p_column_identifier=>'T'
,p_column_label=>'Familia'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(81921102351837677)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(84534682951826656)
,p_db_column_name=>'GRUPO_NIVEL_2'
,p_display_order=>66
,p_column_identifier=>'V'
,p_column_label=>'Sub familia'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88712923576775541)
,p_db_column_name=>'STOCK'
,p_display_order=>76
,p_column_identifier=>'W'
,p_column_label=>'Stock'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(34545145538185337)
,p_db_column_name=>'PRODUCTO_CODIGO'
,p_display_order=>86
,p_column_identifier=>'X'
,p_column_label=>unistr('Producto c\00F3digo')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(90418867658537180)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'65764'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_PRODUCTO:DESCRIPCION:STOCK:ORI_ID_ORIGEN:MAR_ID_MARCA:IVA_ID_IVA:CODIGO_BARRA_FABRICA:CODIGO_BARRA_INTERNO:ESTADO:GRUPO_NIVEL_1:GRUPO_NIVEL_2:GRU_ID_GRUPO:STOCK_MINIMO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(90412252849452053)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(90413395794452055)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(90405101626452042)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear producto'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:31'
,p_security_scheme=>wwv_flow_imp.id(86462283349178791)
);
wwv_flow_imp.component_end;
end;
/
