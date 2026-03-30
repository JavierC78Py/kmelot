prompt --application/pages/page_00164
begin
--   Manifest
--     PAGE: 00164
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
 p_id=>164
,p_name=>unistr('Costeo licitaci\00F3n')
,p_alias=>unistr('COSTEO-LICITACI\00D3N')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Costeo licitaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_required_role=>wwv_flow_imp.id(40161789611524189)
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(39624904468563017)
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
 p_id=>wwv_flow_imp.id(39944352381313979)
,p_plug_name=>unistr('Costeo licitaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_COSTEO,',
'       DET_ID_DETALLE_AJUSTE,',
'       LIC_ID_LICITACION,',
'       DET_ID_DET_LICITACION,',
'       CANTIDAD,',
'       round(CANTIDAD * to_number(:P164_P_PRECIO,''999g999g999d999'')) IMPORTE',
'  from AJUSTE_ING_COSTEO_LICITACION',
' where DET_ID_DETALLE_AJUSTE = :P164_P_ID_DETALLE_AJUSTE '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P164_P_ID_DETALLE_AJUSTE'
,p_prn_page_header=>unistr('Costeo licitaci\00F3n')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(39944488533313979)
,p_name=>unistr('Costeo licitaci\00F3n')
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
,p_detail_link=>'f?p=&APP_ID.:165:&APP_SESSION.::&DEBUG.:RP:P165_ID_COSTEO:\#ID_COSTEO#\'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>39944488533313979
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(39945102380313985)
,p_db_column_name=>'ID_COSTEO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id Costeo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(39946776539313987)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D0000'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(39625453148563022)
,p_db_column_name=>'DET_ID_DETALLE_AJUSTE'
,p_display_order=>15
,p_column_identifier=>'F'
,p_column_label=>'Det Id Detalle Ajuste'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(39625575512563023)
,p_db_column_name=>'LIC_ID_LICITACION'
,p_display_order=>25
,p_column_identifier=>'G'
,p_column_label=>unistr('Licitaci\00F3n')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(18133351729542421)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(39625614826563024)
,p_db_column_name=>'DET_ID_DET_LICITACION'
,p_display_order=>35
,p_column_identifier=>'H'
,p_column_label=>unistr('Item licitaci\00F3n')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(39972019683340938)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(39626712849563035)
,p_db_column_name=>'IMPORTE'
,p_display_order=>45
,p_column_identifier=>'J'
,p_column_label=>'Importe'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(39950339066330441)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'399504'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LIC_ID_LICITACION:DET_ID_DET_LICITACION:CANTIDAD:IMPORTE:'
,p_sum_columns_on_break=>'IMPORTE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39947246113313987)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(39944352381313979)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:165:&SESSION.::&DEBUG.:165:P165_DET_ID_DETALLE_AJUSTE,P165_P_CANTIDAD:&P164_P_ID_DETALLE_AJUSTE.,&P164_CANT_DIF.'
,p_security_scheme=>wwv_flow_imp.id(40162109743527135)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39625002316563018)
,p_name=>'P164_P_ID_DETALLE_AJUSTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(39624904468563017)
,p_prompt=>'P Id Detalle Ajuste'
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
 p_id=>wwv_flow_imp.id(39625198772563019)
,p_name=>'P164_ID_PRODUCTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(39944352381313979)
,p_prompt=>'Producto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PRODUCTO_COD_BARRA_ID_ALL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT P.CODIGO_BARRA_FABRICA||'' * ''||P.ID_PRODUCTO||'' - ''||P.DESCRIPCION D',
'      ,P.ID_PRODUCTO R',
'FROM PRODUCTO P',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1"'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39625204831563020)
,p_name=>'P164_ID_UNIDAD_MEDIDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(39944352381313979)
,p_prompt=>'Unidad medida'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_UNIDAD_MEDIDA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT descripcion||'' (''||abreviatura||'')'' AS d',
'      ,id_unidad_medida AS r ',
'from UNIDAD_MEDIDA'))
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39625379979563021)
,p_name=>'P164_CANTIDAD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(39944352381313979)
,p_prompt=>'Cantidad'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39626064046563028)
,p_name=>'P164_CANT_COSTEO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(39944352381313979)
,p_prompt=>'Cantidad costeo'
,p_format_mask=>'999G999G999G999G990D0000'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39626182059563029)
,p_name=>'P164_CANT_DIF'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(39944352381313979)
,p_prompt=>'Diferencia'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39626870754563036)
,p_name=>'P164_P_PRECIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(39624904468563017)
,p_prompt=>'P Precio'
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
 p_id=>wwv_flow_imp.id(39947543404313988)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(39944352381313979)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39948072428313989)
,p_event_id=>wwv_flow_imp.id(39947543404313988)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(39944352381313979)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(39626232999563030)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    select nvl(sum(CANTIDAD),0)',
'    into :P164_CANT_COSTEO',
'    from AJUSTE_ING_COSTEO_LICITACION',
'    where DET_ID_DETALLE_AJUSTE = :P164_P_ID_DETALLE_AJUSTE ;',
'    :P164_CANT_DIF := to_number(:P164_CANTIDAD,''999g999g999d9999'') - :P164_CANT_COSTEO;',
'END; '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>39626232999563030
);
wwv_flow_imp.component_end;
end;
/
