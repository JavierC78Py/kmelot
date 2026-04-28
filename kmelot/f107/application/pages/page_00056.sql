prompt --application/pages/page_00056
begin
--   Manifest
--     PAGE: 00056
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
 p_id=>56
,p_name=>'Categorias de gasto'
,p_alias=>'CATEGORIAS-DE-GASTO'
,p_step_title=>'Categorias de gasto'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206611789557498906)
,p_plug_name=>'Categorias de gasto'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_CATEGORIA,',
'       TIPO,',
'       IMPORTE_PREVISTO,',
'       PERIODO,',
'       ESTADO,',
'       CON_ID_CONCEPTO',
'  from CATEGORIA_GASTO_INGRESO'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Categorias de gasto'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(206611939521498906)
,p_name=>'Categorias de gasto'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encuentran datos.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:57:&SESSION.::&DEBUG.:RP:P57_ID_CATEGORIA:\#ID_CATEGORIA#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>13645394885836028
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206612696656498916)
,p_db_column_name=>'ID_CATEGORIA'
,p_display_order=>0
,p_column_identifier=>'B'
,p_column_label=>'Id Categoria'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206613051833498917)
,p_db_column_name=>'TIPO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(206074964432490220)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206613880544498917)
,p_db_column_name=>'IMPORTE_PREVISTO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Importe previsto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206614327732498917)
,p_db_column_name=>'PERIODO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Periodo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206614686204498918)
,p_db_column_name=>'ESTADO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202344873522274180)
,p_db_column_name=>'CON_ID_CONCEPTO'
,p_display_order=>17
,p_column_identifier=>'H'
,p_column_label=>'Concepto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(202344190280266495)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(206617605641516351)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'136511'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PERIODO:TIPO:CON_ID_CONCEPTO:IMPORTE_PREVISTO:ESTADO:'
,p_sort_column_1=>'PERIODO'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'TIPO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'PERIODO:TIPO:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0'
,p_sum_columns_on_break=>'IMPORTE_PREVISTO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206616850567498924)
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
 p_id=>wwv_flow_imp.id(209052529057782716)
,p_plug_name=>'Copiar registros a otro mes'
,p_region_template_options=>'#DEFAULT#:js-dialog-size480x320'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(209052965840782721)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(209052529057782716)
,p_button_name=>'BTN_RETORNAR'
,p_button_static_id=>'BTN_RETORNAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(209053077736782722)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(209052529057782716)
,p_button_name=>'BTN_CREAR'
,p_button_static_id=>'BTN_COPIAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(206615151980498918)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(206611789557498906)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear categoria'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:57:&SESSION.::&DEBUG.:57'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(209052430223782715)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(206611789557498906)
,p_button_name=>'COPIAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Copiar mes'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209052620407782717)
,p_name=>'P56_MES_ORIGEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(209052529057782716)
,p_prompt=>'Mes origen'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MES_PERIODO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -2), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -2), ''MM-YYYY'') AS return_value',
'FROM dual',
'UNION ALL',
'SELECT TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -1), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -1), ''MM-YYYY'') AS return_value',
'FROM dual',
'UNION ALL',
'SELECT TO_CHAR(TRUNC(SYSDATE, ''MM''), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(TRUNC(SYSDATE, ''MM''), ''MM-YYYY'') AS return_value',
'FROM dual',
'UNION ALL',
'SELECT TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), 1), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), 1), ''MM-YYYY'') AS return_value',
'FROM dual',
'UNION ALL',
'SELECT TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), 2), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), 2), ''MM-YYYY'') AS return_value',
'FROM dual',
'ORDER BY 1 DESC;'))
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209052852781782720)
,p_name=>'P56_MES_DESTINO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(209052529057782716)
,p_prompt=>'Mes destino'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MES_PERIODO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -2), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -2), ''MM-YYYY'') AS return_value',
'FROM dual',
'UNION ALL',
'SELECT TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -1), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -1), ''MM-YYYY'') AS return_value',
'FROM dual',
'UNION ALL',
'SELECT TO_CHAR(TRUNC(SYSDATE, ''MM''), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(TRUNC(SYSDATE, ''MM''), ''MM-YYYY'') AS return_value',
'FROM dual',
'UNION ALL',
'SELECT TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), 1), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), 1), ''MM-YYYY'') AS return_value',
'FROM dual',
'UNION ALL',
'SELECT TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), 2), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), 2), ''MM-YYYY'') AS return_value',
'FROM dual',
'ORDER BY 1 DESC;'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(206615494022498918)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(206611789557498906)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206615984113498920)
,p_event_id=>wwv_flow_imp.id(206615494022498918)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(206611789557498906)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209052701376782718)
,p_name=>'Copiar'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(209052430223782715)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209052783941782719)
,p_event_id=>wwv_flow_imp.id(209052701376782718)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(209052529057782716)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(215934187636735980)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Duplicar previsi\00F3n ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' INSERT INTO categoria_gasto_ingreso g',
' (',
' SELECT NULL',
'       ,c.tipo',
'       ,c.importe_previsto',
'       ,To_Date(''01/09/2023'',''dd/mm/yyyy'')',
'       ,c.estado',
'       ,c.con_id_concepto ',
' FROM categoria_gasto_ingreso c',
' WHERE c.periodo = To_Date(''01/06/2023'',''dd/mm/yyyy'')',
' AND c.estado = ''ACTIVO''',
' );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>22967643001073102
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(209053348303782725)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Copiar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    INSERT INTO categoria_gasto_ingreso (',
'      SELECT NULL id_categoria',
'            ,c.tipo',
'            ,c.importe_previsto',
'            ,To_Date(''01-''||:P56_MES_DESTINO)',
'            ,c.estado',
'            ,c.con_id_concepto',
'      FROM categoria_gasto_ingreso c',
'      WHERE c.periodo = To_Date(''01-''||:P56_MES_ORIGEN)',
'      AND c.estado = ''ACTIVO''',
'    );',
'    COMMIT;',
'END;    '))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#SQLERRM_TEXT#',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(209053077736782722)
,p_process_success_message=>'Registros copiados'
,p_internal_uid=>16086803668119847
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(209053206585782723)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P56_MES_ORIGEN := TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -1), ''MM-YYYY'');',
':P56_MES_DESTINO := TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), 1), ''MM-YYYY'');'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>16086661950119845
);
wwv_flow_imp.component_end;
end;
/
