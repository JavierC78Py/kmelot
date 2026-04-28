prompt --application/pages/page_00051
begin
--   Manifest
--     PAGE: 00051
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
 p_id=>51
,p_name=>unistr('Roles por p\00E1gina')
,p_alias=>unistr('ROLES-POR-P\00C1GINA')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Roles por p\00E1gina')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(205496402140983556)
,p_plug_name=>unistr('Roles por p\00E1gina')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select P.ID_PERMISO,',
'       P.PAG_ID_PAGINA,',
'       P.ROL_ID_ROL,',
'       P.INSERTAR,',
'       P.ACTUALIZAR,',
'       P.ELIMINAR,',
'       PG.MODULO,',
'       PG.GRUPO',
'  from PAGINA_ROL P, PAGINA PG',
' where PG.ID_PAGINA = P.PAG_ID_PAGINA '))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>unistr('Roles por p\00E1gina')
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
 p_id=>wwv_flow_imp.id(205562803353327085)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>12596258717664207
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205562863584327086)
,p_db_column_name=>'ID_PERMISO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Permiso'
,p_column_link=>'f?p=&APP_ID.:52:&SESSION.::&DEBUG.:52:P52_ID_PERMISO,P52_GRUPO,P52_MODULO:#ID_PERMISO#,#GRUPO#,#MODULO#'
,p_column_linktext=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205562988750327087)
,p_db_column_name=>'PAG_ID_PAGINA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('P\00E1gina')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(205177556039913320)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205563124682327088)
,p_db_column_name=>'ROL_ID_ROL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Rol'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(205488467588983542)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205563173702327089)
,p_db_column_name=>'INSERTAR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Insertar'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205563332635327090)
,p_db_column_name=>'ACTUALIZAR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Actualizar'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205563361007327091)
,p_db_column_name=>'ELIMINAR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Eliminar'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205563475628327092)
,p_db_column_name=>'MODULO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('M\00F3dulo')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205563607575327093)
,p_db_column_name=>'GRUPO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Grupo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(205588907768329671)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'126224'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_PERMISO:MODULO:GRUPO:PAG_ID_PAGINA:ROL_ID_ROL:INSERTAR:ACTUALIZAR:ELIMINAR:'
,p_sort_column_1=>'PAG_ID_PAGINA'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'MODULO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'GRUPO'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'MODULO:0:0:0:0:0'
,p_break_enabled_on=>'MODULO:0:0:0:0:0'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(159389032752015940)
,p_report_id=>wwv_flow_imp.id(205588907768329671)
,p_name=>'Upd NO'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ACTUALIZAR'
,p_operator=>'='
,p_expr=>'NO'
,p_condition_sql=>' (case when ("ACTUALIZAR" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''NO''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_font_color=>'#f44336'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(159389489859015940)
,p_report_id=>wwv_flow_imp.id(205588907768329671)
,p_name=>'Upd'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ACTUALIZAR'
,p_operator=>'='
,p_expr=>'SI'
,p_condition_sql=>' (case when ("ACTUALIZAR" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''SI''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_font_color=>'#3baa2c'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(159389882148015940)
,p_report_id=>wwv_flow_imp.id(205588907768329671)
,p_name=>'Del NO'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ELIMINAR'
,p_operator=>'='
,p_expr=>'NO'
,p_condition_sql=>' (case when ("ELIMINAR" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''NO''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_font_color=>'#f44336'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(159390299873015941)
,p_report_id=>wwv_flow_imp.id(205588907768329671)
,p_name=>'Del'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ELIMINAR'
,p_operator=>'='
,p_expr=>'SI'
,p_condition_sql=>' (case when ("ELIMINAR" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''SI''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_font_color=>'#3baa2c'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(159390694097015941)
,p_report_id=>wwv_flow_imp.id(205588907768329671)
,p_name=>'Ins NO'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'INSERTAR'
,p_operator=>'='
,p_expr=>'NO'
,p_condition_sql=>' (case when ("INSERTAR" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''NO''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_font_color=>'#f44336'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(159391089974015941)
,p_report_id=>wwv_flow_imp.id(205588907768329671)
,p_name=>'Ins'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'INSERTAR'
,p_operator=>'='
,p_expr=>'SI'
,p_condition_sql=>' (case when ("INSERTAR" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''SI''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_font_color=>'#3baa2c'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(205505450817983570)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(205496402140983556)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Crear nueva asignaci\00F3n')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:52:&SESSION.::&DEBUG.:52'
,p_security_scheme=>wwv_flow_imp.id(205916011427256412)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(205505752025983570)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(205496402140983556)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(205506314908983572)
,p_event_id=>wwv_flow_imp.id(205505752025983570)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(205496402140983556)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
