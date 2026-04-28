prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
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
 p_id=>12
,p_name=>'Contacto Entidad'
,p_alias=>'CONTACTO-ENTIDAD'
,p_page_mode=>'MODAL'
,p_step_title=>'Contacto Entidad'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(209445977843094885)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_CONTACTO_ENTIDAD,',
'       ENT_ID_ENTIDAD,',
'       NOMBRE,',
'       DIRECCION,',
'       TELEFONO,',
'       CORREO,',
'       OBSERVACIONES,',
'       PRINCIPAL,',
'       ESTADO',
'  from CONTACTO_ENTIDAD',
' where (:P12_ID_ENTIDAD IS NULL or ENT_ID_ENTIDAD = :P12_ID_ENTIDAD)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P12_ID_ENTIDAD'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_page_header=>'Report 1'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(209446341870094885)
,p_name=>'Report 1'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encuentran datos.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP:P13_ID_CONTACTO_ENTIDAD:\#ID_CONTACTO_ENTIDAD#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'CESAR'
,p_internal_uid=>6370340198859887
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209446440892094889)
,p_db_column_name=>'ID_CONTACTO_ENTIDAD'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID Contacto Entidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209446847380094890)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Entidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(209491563438466641)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209447207478094891)
,p_db_column_name=>'NOMBRE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Apellido nombre'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209447699578094891)
,p_db_column_name=>'DIRECCION'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209448035996094892)
,p_db_column_name=>'TELEFONO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209448465924094892)
,p_db_column_name=>'CORREO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Correo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209448838788094893)
,p_db_column_name=>'OBSERVACIONES'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Observaciones'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209449258322094893)
,p_db_column_name=>'PRINCIPAL'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Principal'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209449700204094894)
,p_db_column_name=>'ESTADO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(209453443843096054)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'63775'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_CONTACTO_ENTIDAD:ENT_ID_ENTIDAD:NOMBRE:DIRECCION:TELEFONO:CORREO:OBSERVACIONES:PRINCIPAL:ESTADO'
,p_sort_column_1=>'ENT_ID_ENTIDAD'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'NOMBRE'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(209453004358094914)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(209445977843094885)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear contacto'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:13:P13_ENT_ID_ENTIDAD:&P12_ID_ENTIDAD.'
,p_security_scheme=>wwv_flow_imp.id(205641670819730326)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(203769370923482806)
,p_name=>'P12_ID_ENTIDAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(209445977843094885)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209450760347094905)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(209445977843094885)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209451264822094907)
,p_event_id=>wwv_flow_imp.id(209450760347094905)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(209445977843094885)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
