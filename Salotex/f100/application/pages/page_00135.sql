prompt --application/pages/page_00135
begin
--   Manifest
--     PAGE: 00135
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
 p_id=>135
,p_name=>'Agregar precio de servicio'
,p_alias=>'AGREGAR-PRECIO-DE-SERVICIO'
,p_page_mode=>'MODAL'
,p_step_title=>'Agregar precio de servicio'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(148195081159791895)
,p_plug_name=>'Agregar precio de servicio'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_PRECIO_VENTA,',
'       MON_ID_MONEDA,',
'       PRO_ID_PRODUCTO,',
'       PRECIO,',
'       USUARIO,',
'       FECHA,',
'       FECHA_VIGENCIA_DESDE,',
'       ENT_ID_ENTIDAD,',
'       ESP_ID_ESPECIALIDAD',
'  from PRODUCTO_PRECIO_VENTA'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(148219227896729187)
,p_name=>unistr('Hist\00F3rico de precios')
,p_parent_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_template=>4072358936313175081
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_PRECIO_VENTA,',
'       MON_ID_MONEDA,',
'       PRO_ID_PRODUCTO,',
'       PRECIO,',
'       USUARIO,',
'       FECHA,',
'       FECHA_VIGENCIA_DESDE',
'  from PRODUCTO_PRECIO_VENTA',
' where PRO_ID_PRODUCTO = :P135_PRO_ID_PRODUCTO',
'order by FECHA_VIGENCIA_DESDE DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P135_PRO_ID_PRODUCTO'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134410309282250995)
,p_query_column_id=>1
,p_column_alias=>'ID_PRECIO_VENTA'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134410596329250995)
,p_query_column_id=>2
,p_column_alias=>'MON_ID_MONEDA'
,p_column_display_sequence=>40
,p_column_heading=>'Moneda'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(84541326864380916)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134410980056250996)
,p_query_column_id=>3
,p_column_alias=>'PRO_ID_PRODUCTO'
,p_column_display_sequence=>20
,p_column_heading=>'Producto'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(87561607060077175)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134411406778250996)
,p_query_column_id=>4
,p_column_alias=>'PRECIO'
,p_column_display_sequence=>60
,p_column_heading=>'Precio'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134411773867250996)
,p_query_column_id=>5
,p_column_alias=>'USUARIO'
,p_column_display_sequence=>70
,p_column_heading=>'Usuario'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134412190325250996)
,p_query_column_id=>6
,p_column_alias=>'FECHA'
,p_column_display_sequence=>80
,p_column_heading=>'Fecha de carga'
,p_column_format=>'DD-MM-YYYY HH24:MI:SS'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134412582140250997)
,p_query_column_id=>7
,p_column_alias=>'FECHA_VIGENCIA_DESDE'
,p_column_display_sequence=>30
,p_column_heading=>'Vigencia desde'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(148199910050791916)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134413333260250997)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(148199910050791916)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134413738565250998)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(148199910050791916)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P135_ID_PRECIO_VENTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(134426462369480904)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134414163957250998)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(148199910050791916)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition=>'P135_ID_PRECIO_VENTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(134426117281478944)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134414555588250998)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(148199910050791916)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P135_ID_PRECIO_VENTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(134426300850479975)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132632728459385771)
,p_name=>'P135_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_item_source_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_prompt=>'Prestador'
,p_source=>'ENT_ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.nombre AS d',
'      ,e.id_entidad AS r',
'FROM entidad e',
'WHERE e.es_prestador = ''SI''',
'AND e.estado = ''ACTIVO''',
'AND EXISTS (',
'  SELECT 1 ',
'  FROM det_especialidad d',
'  WHERE d.ent_id_entidad = e.id_entidad',
'  AND d.esp_id_especialidad = :P135_ESP_ID_ESPECIALIDAD',
'  AND d.estado = ''ACTIVO''',
')',
''))
,p_lov_cascade_parent_items=>'P135_ESP_ID_ESPECIALIDAD'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132632874488385772)
,p_name=>'P135_ESP_ID_ESPECIALIDAD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_item_source_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_prompt=>'Especialidad'
,p_source=>'ESP_ID_ESPECIALIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ESPECIALIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_ESPECIALIDAD AS R',
'      ,DESCRIPCION AS D',
'from ESPECIALIDAD'))
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(148196066137791899)
,p_name=>'P135_ID_PRECIO_VENTA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_item_source_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_source=>'ID_PRECIO_VENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(148196438326791905)
,p_name=>'P135_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_item_source_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_prompt=>'Moneda'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA'
,p_cHeight=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(148196905225791907)
,p_name=>'P135_PRO_ID_PRODUCTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_item_source_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_prompt=>'Producto'
,p_source=>'PRO_ID_PRODUCTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_SERVICIO_DESCRIPCION'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_producto as r',
'      ,descripcion as d',
'from PRODUCTO',
'where tipo = ''SRV'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cSize=>30
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(148197610006791913)
,p_name=>'P135_PRECIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_item_source_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_prompt=>'Precio'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'PRECIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(148197982581791913)
,p_name=>'P135_USUARIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_item_source_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_source=>'USUARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(148198356471791914)
,p_name=>'P135_FECHA'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_item_source_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_source=>'FECHA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(148219796532729188)
,p_name=>'P135_FECHA_VIGENCIA_DESDE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_item_source_plug_id=>wwv_flow_imp.id(148195081159791895)
,p_item_default=>'current_date'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Vigencia Desde'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_VIGENCIA_DESDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134415606945251003)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134413333260250997)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134416104963251003)
,p_event_id=>wwv_flow_imp.id(134415606945251003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134416499975251003)
,p_name=>'Actualiza historico'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P135_PRO_ID_PRODUCTO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134417009657251003)
,p_event_id=>wwv_flow_imp.id(134416499975251003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(148219227896729187)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134409598111250993)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(148195081159791895)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Agregar precio de venta'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>60676579047244253
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134415174282251002)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>60682155218244262
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134409135802250992)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(148195081159791895)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Agregar precio de venta'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>60676116738244252
);
wwv_flow_imp.component_end;
end;
/
