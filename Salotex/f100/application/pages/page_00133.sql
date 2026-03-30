prompt --application/pages/page_00133
begin
--   Manifest
--     PAGE: 00133
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
 p_id=>133
,p_name=>'Crear o editar grupo'
,p_alias=>'CREAR-O-EDITAR-GRUPO1'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear o editar grupo'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(142413579581221029)
,p_plug_name=>'Crear o editar grupo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_GRUPO,',
'       DESCRIPCION,',
'       GRUPO_NIVEL_1,',
'       GRUPO_NIVEL_2,',
'       GRUPO_NIVEL_3,',
'       ESTADO,',
'       TIPO',
'  from GRUPO_PRODUCTO'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(142418067062221046)
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
 p_id=>wwv_flow_imp.id(134263372621506626)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(142418067062221046)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134263804143506626)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(142418067062221046)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P133_ID_GRUPO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(134274735942968566)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134264121170506626)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(142418067062221046)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition=>'P133_ID_GRUPO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(134274402978966508)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134264579673506626)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(142418067062221046)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P133_ID_GRUPO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(134274529207967695)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(142391359623226433)
,p_name=>'P133_NIVEL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_prompt=>'Nivel a crear'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_NIVEL_GRUPOS'
,p_lov=>'.'||wwv_flow_imp.id(81879845392784831)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cHeight=>1
,p_colspan=>6
,p_read_only_when=>'P133_ID_GRUPO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(142414605673221031)
,p_name=>'P133_ID_GRUPO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_item_source_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Grupo'
,p_source=>'ID_GRUPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(142414929774221041)
,p_name=>'P133_DESCRIPCION'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_item_source_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DESCRIPCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>400
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(142415309974221043)
,p_name=>'P133_GRUPO_NIVEL_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_item_source_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_prompt=>'Familia'
,p_source=>'GRUPO_NIVEL_1'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_GRUPO_SRV_NIVEL_1'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select grupo_nivel_1 r, descripcion d',
'from grupo_producto',
'where estado = ''ACTIVO''',
'and tipo = ''SRV''',
'and grupo_nivel_2 is null',
'and grupo_nivel_3 is null',
''))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>255
,p_read_only_when=>'P133_ID_GRUPO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(142415716862221044)
,p_name=>'P133_GRUPO_NIVEL_2'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_item_source_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_prompt=>'Sub familia'
,p_source=>'GRUPO_NIVEL_2'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select descripcion d, grupo_nivel_2 r',
'from grupo_producto',
'where grupo_nivel_1 = :P133_GRUPO_NIVEL_1',
'and tipo = ''SRV''',
'and grupo_nivel_2 is not null',
'and grupo_nivel_3 is null',
'and estado = ''ACTIVO'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P133_GRUPO_NIVEL_1'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P133_ID_GRUPO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(142416126923221044)
,p_name=>'P133_GRUPO_NIVEL_3'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_item_source_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_source=>'GRUPO_NIVEL_3'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(142416553452221044)
,p_name=>'P133_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_item_source_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_item_default=>'ACTIVO'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ESTADO'
,p_lov=>'.'||wwv_flow_imp.id(89273472179480473)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193157142754885649)
,p_name=>'P133_TIPO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_item_source_plug_id=>wwv_flow_imp.id(142413579581221029)
,p_item_default=>'SRV'
,p_source=>'TIPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134266002451506627)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134263372621506626)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134266472269506627)
,p_event_id=>wwv_flow_imp.id(134266002451506627)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134269741815506629)
,p_name=>'Desactivar'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134270254414506630)
,p_event_id=>wwv_flow_imp.id(134269741815506629)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P133_GRUPO_NIVEL_1,P133_GRUPO_NIVEL_2,P133_GRUPO_NIVEL_3,P133_DESCRIPCION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134266876240506628)
,p_name=>'Habilitar'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P133_NIVEL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134267375411506628)
,p_event_id=>wwv_flow_imp.id(134266876240506628)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P133_GRUPO_NIVEL_1,P133_GRUPO_NIVEL_2,P133_GRUPO_NIVEL_3'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134269417790506629)
,p_event_id=>wwv_flow_imp.id(134266876240506628)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P133_DESCRIPCION'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P133_NIVEL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134268382904506629)
,p_event_id=>wwv_flow_imp.id(134266876240506628)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P133_GRUPO_NIVEL_1'
,p_client_condition_type=>'GREATER_THAN_OR_EQUAL'
,p_client_condition_element=>'P133_NIVEL'
,p_client_condition_expression=>'2'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134268846270506629)
,p_event_id=>wwv_flow_imp.id(134266876240506628)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P133_GRUPO_NIVEL_2'
,p_client_condition_type=>'GREATER_THAN_OR_EQUAL'
,p_client_condition_element=>'P133_NIVEL'
,p_client_condition_expression=>'3'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134267866236506628)
,p_event_id=>wwv_flow_imp.id(134266876240506628)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P133_DESCRIPCION'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P133_NIVEL'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134262643574506625)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(142413579581221029)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Crear o editar grupo'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>60529624510499885
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134265134220506627)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>60532115156499887
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134262266164506624)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(142413579581221029)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear o editar grupo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>60529247100499884
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134265554385506627)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ValorInicial'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P133_GRUPO_NIVEL_1 is not null and :P133_GRUPO_NIVEL_2 is null and :P133_GRUPO_NIVEL_3 is null then',
'  :P133_NIVEL := 1;',
'end if;',
'if :P133_GRUPO_NIVEL_1 is not null and :P133_GRUPO_NIVEL_2 is not null and :P133_GRUPO_NIVEL_3 is null then',
'  :P133_NIVEL := 2;',
'end if;',
'if :P133_GRUPO_NIVEL_1 is not null and :P133_GRUPO_NIVEL_2 is not null and :P133_GRUPO_NIVEL_3 is not null then',
'  :P133_NIVEL := 3;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P133_ID_GRUPO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>60532535321499887
);
wwv_flow_imp.component_end;
end;
/
