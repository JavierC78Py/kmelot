prompt --application/pages/page_00028
begin
--   Manifest
--     PAGE: 00028
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
 p_id=>28
,p_name=>'Sucursal Entidad'
,p_alias=>'SUCURSAL-ENTIDAD'
,p_page_mode=>'MODAL'
,p_step_title=>'Sucursal Entidad'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(209606681270953911)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_SUC_ENTIDAD,',
'       ENT_ID_ENTIDAD,',
'       DESCRIPCION,',
'       DIRECCION,',
'       LATITUD,',
'       LONGITUD,',
'       TELEFONO1,',
'       TELEFONO2,',
'       ES_CENTRAL,',
'       ESTADO,',
'       CIU_COD_CIUDAD',
'  from SUCURSAL_ENTIDAD',
' where :P28_ID_ENTIDAD IS NULL or ENT_ID_ENTIDAD = :P28_ID_ENTIDAD'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P28_ID_ENTIDAD'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_page_header=>'Report 1'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(209607010530953911)
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
,p_detail_link=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:RP:P29_ID_SUC_ENTIDAD:\#ID_SUC_ENTIDAD#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'CESAR'
,p_internal_uid=>6531008859718913
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209607196174953912)
,p_db_column_name=>'ID_SUC_ENTIDAD'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID Sucursal Entidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209607575247953912)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Entidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(203697032118698509)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209607967768953913)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209609515873953915)
,p_db_column_name=>'DIRECCION'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209609917861953916)
,p_db_column_name=>'LATITUD'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Latitud'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209610342828953916)
,p_db_column_name=>'LONGITUD'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Longitud'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209610766564953917)
,p_db_column_name=>'TELEFONO1'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209611131189953918)
,p_db_column_name=>'TELEFONO2'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209611542926953918)
,p_db_column_name=>'ES_CENTRAL'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Es casa central'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209611908983953919)
,p_db_column_name=>'ESTADO'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(218019318647101479)
,p_db_column_name=>'CIU_COD_CIUDAD'
,p_display_order=>23
,p_column_identifier=>'N'
,p_column_label=>'Ciudad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(201370327514633350)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(209615707776954910)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'65398'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_SUC_ENTIDAD:ENT_ID_ENTIDAD:DESCRIPCION:DIRECCION:LATITUD:LONGITUD:TELEFONO1:TELEFONO2:CIU_COD_CIUDAD:ES_CENTRAL:ESTADO:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(209615313984953927)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(209606681270953911)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear nueva sucursal'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:29:P29_ENT_ID_ENTIDAD:&P28_ID_ENTIDAD.'
,p_security_scheme=>wwv_flow_imp.id(205643948291771036)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(203769747190482810)
,p_name=>'P28_ID_ENTIDAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(209606681270953911)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209613068234953923)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(209606681270953911)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209613580186953924)
,p_event_id=>wwv_flow_imp.id(209613068234953923)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(209606681270953911)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
