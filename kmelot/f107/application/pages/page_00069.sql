prompt --application/pages/page_00069
begin
--   Manifest
--     PAGE: 00069
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
 p_id=>69
,p_name=>unistr('Hist\00F3rico de precios de venta')
,p_alias=>unistr('HIST\00D3RICO-DE-PRECIOS-DE-VENTA')
,p_step_title=>unistr('Hist\00F3rico de precios de venta')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(206804734067872096)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(153775978071841448)
,p_plug_name=>unistr('Hist\00F3rico de precios de venta')
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>11
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select V.ID_PRECIO_VENTA,',
'       V.MON_ID_MONEDA,',
'       V.PRO_ID_PRODUCTO,',
'       V.PRECIO,',
'       V.USUARIO,',
'       V.FECHA,',
'       V.FECHA_VIGENCIA_DESDE,',
'       P.TIPO',
'  from PRODUCTO_PRECIO_VENTA V',
'      ,PRODUCTO P',
' where P.ID_PRODUCTO = V.PRO_ID_PRODUCTO',
'   and P.TIPO = :P69_P_TIPO'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P69_P_TIPO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(153776088987841449)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.::P70_ID_PRECIO_VENTA:\#ID_PRECIO_VENTA#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>34542563416185311
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153776147657841450)
,p_db_column_name=>'ID_PRECIO_VENTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Precio Venta'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153776305167841451)
,p_db_column_name=>'MON_ID_MONEDA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Moneda'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(203774852436037054)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153776365107841452)
,p_db_column_name=>'PRO_ID_PRODUCTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Producto/Servicio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(206795132631733313)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153776467504841453)
,p_db_column_name=>'PRECIO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Precio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153776618067841454)
,p_db_column_name=>'USUARIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153776698606841455)
,p_db_column_name=>'FECHA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153776762467841456)
,p_db_column_name=>'FECHA_VIGENCIA_DESDE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Fecha vigencia desde'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(153777954536841468)
,p_db_column_name=>'TIPO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(153789054803848403)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'345556'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_PRECIO_VENTA:TIPO:PRO_ID_PRODUCTO:MON_ID_MONEDA:PRECIO:FECHA_VIGENCIA_DESDE:USUARIO:FECHA:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206771591609203831)
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
 p_id=>wwv_flow_imp.id(206769907071203827)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(153775978071841448)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear nuevo precio &P69_P_TIPO.'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:70:P70_P_TIPO:&P69_P_TIPO.'
,p_security_scheme=>wwv_flow_imp.id(206805067312874342)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(153777751691841466)
,p_name=>'P69_P_TIPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(153775978071841448)
,p_prompt=>'Tipo'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC:Art\00EDculo;ART,Servicio;SRV')
,p_grid_column=>9
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'N',
  'number_of_columns', '2',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(153777899393841467)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P69_P_TIPO IS NULL THEN',
'    :P69_P_TIPO := ''ART'';',
'END IF;    '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>34544373822185329
);
wwv_flow_imp.component_end;
end;
/
