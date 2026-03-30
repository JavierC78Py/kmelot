prompt --application/pages/page_00154
begin
--   Manifest
--     PAGE: 00154
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
 p_id=>154
,p_name=>unistr('Licitaci\00F3n comisiones')
,p_alias=>unistr('LICITACI\00D3N-COMISIONES')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Licitaci\00F3n-comisiones')
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_IMAGES#template-floating-minimalista.min.css'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_required_role=>wwv_flow_imp.id(25974932763007944)
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20341201617072450)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25765132476418869)
,p_plug_name=>unistr('Comisi\00F3n licitaciones')
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_REGISTRO_COMISION,',
'       ENT_ID_ENTIDAD,',
'       MODALIDAD,',
'       PORCENTAJE,',
'       MON_ID_MONEDA,',
'       MONTO_COMISION,',
'       TIPO_CAMBIO,',
'       OBSERVACION,',
'       LIC_ID_LICITACION',
'  from LICITACION_COMISION'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>unistr('Comisi\00F3n licitaciones')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(25765285084418869)
,p_name=>unistr('Comisi\00F3n licitaciones')
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
,p_detail_link=>'f?p=&APP_ID.:155:&SESSION.::&DEBUG.:RP,:P155_ID_REGISTRO_COMISION,P155_P_MONTO_LICITACION:\#ID_REGISTRO_COMISION#\,&P154_P_MONTO_LICITACION.'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>25765285084418869
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25765900522418869)
,p_db_column_name=>'ID_REGISTRO_COMISION'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id Registro Comision'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25766730031418870)
,p_db_column_name=>'MODALIDAD'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Modalidad'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25767151374418870)
,p_db_column_name=>'PORCENTAJE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Porcentaje'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25767974007418870)
,p_db_column_name=>'MONTO_COMISION'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>unistr('Monto comisi\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25768374400418871)
,p_db_column_name=>'TIPO_CAMBIO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Tipo cambio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25768714079418871)
,p_db_column_name=>'OBSERVACION'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20339635255072434)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>18
,p_column_identifier=>'J'
,p_column_label=>'Entidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(17452607221543045)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20339715327072435)
,p_db_column_name=>'MON_ID_MONEDA'
,p_display_order=>28
,p_column_identifier=>'K'
,p_column_label=>'Moneda'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(23578609406965304)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20339823122072436)
,p_db_column_name=>'LIC_ID_LICITACION'
,p_display_order=>38
,p_column_identifier=>'L'
,p_column_label=>unistr('Licitaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(25774174339425889)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'257742'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LIC_ID_LICITACION:ENT_ID_ENTIDAD:MODALIDAD:PORCENTAJE:MONTO_COMISION:OBSERVACION:MON_ID_MONEDA:TIPO_CAMBIO:'
,p_break_on=>'LIC_ID_LICITACION'
,p_break_enabled_on=>'LIC_ID_LICITACION'
,p_sum_columns_on_break=>'MONTO_COMISION'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25770969699418872)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(86947038457749062)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(20341008949072448)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(25765132476418869)
,p_button_name=>'BTN_FILTRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Filtrar'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25769676541418871)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(25765132476418869)
,p_button_name=>'CREATE'
,p_button_static_id=>'BTN_CREAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:155:&SESSION.::&DEBUG.:155:P155_LIC_ID_LICITACION,P155_P_MONTO_LICITACION:&P154_ID_LICITACION.,&P154_P_MONTO_LICITACION.'
,p_button_condition=>'P154_ID_LICITACION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(25975360361010193)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20340997609072447)
,p_name=>'P154_ID_LICITACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25765132476418869)
,p_prompt=>unistr('Licitaci\00F3n')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_LICITACIONES_ALL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT l.id_licitacion AS r',
'      ,l.nro_licitacion||'' CC: ''||l.codigo_contratacion||'' ''||l.convocante AS d',
'FROM licitacion l'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Todos'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Licitaciones')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25986288034247101)
,p_name=>'P154_P_ID_LICITACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(20341201617072450)
,p_prompt=>'P Id Licitacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25988747941247126)
,p_name=>'P154_P_MONTO_LICITACION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(20341201617072450)
,p_prompt=>'P Monto Licitacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25769905769418871)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(25765132476418869)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25770497431418872)
,p_event_id=>wwv_flow_imp.id(25769905769418871)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(25765132476418869)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25986341084247102)
,p_name=>'Inicio'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25986451902247103)
,p_event_id=>wwv_flow_imp.id(25986341084247102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!apex.item("P154_P_ID_LICITACION").isEmpty()){',
'    //apex.item("P154_ID_LICITACION").setValue( apex.item("P154_P_ID_LICITACION").getValue() );',
'    $("#P154_ID_LICITACION").addClass("apex_disabled");',
'    $("#P154_ID_LICITACION").attr("tabindex", "-1");',
'}'))
);
wwv_flow_imp.component_end;
end;
/
