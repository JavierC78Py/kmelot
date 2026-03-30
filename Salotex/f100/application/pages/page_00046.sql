prompt --application/pages/page_00046
begin
--   Manifest
--     PAGE: 00046
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
 p_id=>46
,p_name=>'Usuarios'
,p_alias=>'USUARIOS'
,p_page_mode=>'MODAL'
,p_step_title=>'Usuarios'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(82340389997760767)
,p_plug_name=>'Usuario'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_USUARIO,',
'       FECHA_ALTA,',
'       USUARIO,',
'       PASSWORD,',
'       PASSWORD1,',
'       PASSWORD2,',
'       PASSWORD3,',
'       CORREO,',
'       ESTADO,',
'       BLOQUEADO',
'  from USUARIOS'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Usuario'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(82340461945760767)
,p_name=>'Usuario'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encuentran datos.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:RP:P47_ID_USUARIO:\#ID_USUARIO#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>8607442881754027
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(82341264338760774)
,p_db_column_name=>'ID_USUARIO'
,p_display_order=>0
,p_column_identifier=>'B'
,p_column_label=>'Id Usuario'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(82341632414760774)
,p_db_column_name=>'FECHA_ALTA'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Fecha alta'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(82342071938760774)
,p_db_column_name=>'USUARIO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(82342478922760775)
,p_db_column_name=>'PASSWORD'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Password'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(82342855251760775)
,p_db_column_name=>'PASSWORD1'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Password1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(82343311563760775)
,p_db_column_name=>'PASSWORD2'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Password2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(82343676924760775)
,p_db_column_name=>'PASSWORD3'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Password3'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(82344105453760776)
,p_db_column_name=>'CORREO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Correo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(82344482290760776)
,p_db_column_name=>'ESTADO'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(81868353973726569)
,p_db_column_name=>'BLOQUEADO'
,p_display_order=>20
,p_column_identifier=>'K'
,p_column_label=>'Bloqueado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(82347370007762853)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'86144'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_USUARIO:FECHA_ALTA:USUARIO:PASSWORD:PASSWORD1:PASSWORD2:PASSWORD3:CORREO:ESTADO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(82345012879760777)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(82340389997760767)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear usuario'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:47'
,p_security_scheme=>wwv_flow_imp.id(86667306477461974)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(82345233318760777)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(82340389997760767)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(82345776729760778)
,p_event_id=>wwv_flow_imp.id(82345233318760777)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(82340389997760767)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
