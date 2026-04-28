prompt --application/pages/page_00130
begin
--   Manifest
--     PAGE: 00130
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
 p_id=>130
,p_name=>'Servicio'
,p_alias=>'SERVICIO'
,p_step_title=>'Servicio'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(269944856434270305)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT P.ID_PRODUCTO,',
'       P.DESCRIPCION,',
'       P.GRU_ID_GRUPO,',
'       P.IVA_ID_IVA,',
'       P.ESTADO,',
'       P.CUE_CON_ID_CTA_COMPRA,',
'       P.CUE_CON_ID_CTA_VENTA,',
'       P.CUE_CON_ID_CTA_COSTO_V,',
'       P.CUE_CON_ID_CTA_DEVOL_CLI,',
'       P.CUE_CON_ID_CTA_DSCTO_PROV,',
'       G.GRUPO_NIVEL_1,',
'       (',
'        select gr.descripcion',
'        from grupo_producto gr',
'        where gr.grupo_nivel_1 = G.GRUPO_NIVEL_1',
'        and gr.grupo_nivel_2 = G.GRUPO_NIVEL_2',
'        and gr.grupo_nivel_3 is null',
'        and tipo = ''SRV''',
'       ) GRUPO_NIVEL_2',
'  FROM PRODUCTO P',
'     , GRUPO_PRODUCTO G',
' WHERE G.ID_GRUPO = P.GRU_ID_GRUPO',
' AND P.TIPO = ''SRV''',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_page_header=>'Report 1'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(269945250083270306)
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
,p_detail_link=>'f?p=&APP_ID.:131:&SESSION.::&DEBUG.:RP,:P131_ID_PRODUCTO:\#ID_PRODUCTO#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'CESAR'
,p_internal_uid=>76978705447607428
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(269945383240270306)
,p_db_column_name=>'ID_PRODUCTO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID Producto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(269945798876270307)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(269946956508270309)
,p_db_column_name=>'GRU_ID_GRUPO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Grupo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(253441701815291083)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(269947407549270309)
,p_db_column_name=>'IVA_ID_IVA'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'I.V.A.'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(209648098562129753)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(269948551612270311)
,p_db_column_name=>'ESTADO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(269948977370270311)
,p_db_column_name=>'CUE_CON_ID_CTA_COMPRA'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Cue Con Id Cta Compra'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(269949421544270312)
,p_db_column_name=>'CUE_CON_ID_CTA_VENTA'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Cue Con Id Cta Venta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(269949827440270313)
,p_db_column_name=>'CUE_CON_ID_CTA_COSTO_V'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Cue Con Id Cta Costo V'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(269950189720270313)
,p_db_column_name=>'CUE_CON_ID_CTA_DEVOL_CLI'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Cue Con Id Cta Devol Cli'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(269950553437270314)
,p_db_column_name=>'CUE_CON_ID_CTA_DSCTO_PROV'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Cue Con Id Cta Dscto Prov'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(264074220481644917)
,p_db_column_name=>'GRUPO_NIVEL_1'
,p_display_order=>56
,p_column_identifier=>'T'
,p_column_label=>'Familia'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(253443139176300073)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(264074437759644919)
,p_db_column_name=>'GRUPO_NIVEL_2'
,p_display_order=>66
,p_column_identifier=>'V'
,p_column_label=>'Sub familia'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(269958622466355443)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'65764'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_PRODUCTO:DESCRIPCION:IVA_ID_IVA:ESTADO:GRUPO_NIVEL_1:GRUPO_NIVEL_2:GRU_ID_GRUPO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(269952007657270316)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(206180564029405200)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(253280481226825046)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(269944856434270305)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear servicio'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:131:&SESSION.::&DEBUG.:131::'
,p_security_scheme=>wwv_flow_imp.id(253515865102893787)
);
wwv_flow_imp.component_end;
end;
/
