prompt --application/pages/page_00161
begin
--   Manifest
--     PAGE: 00161
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
 p_id=>161
,p_name=>unistr('Crear proveedor - r\00E1pido')
,p_alias=>unistr('CREAR-PROVEEDOR-R\00C1PIDO')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Crear proveedor - r\00E1pido')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#BTN_LIMITE_CREDITO {    ',
'    margin-top: 17px;',
'    }',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(142777683792570884)
,p_plug_name=>'Crear o Editar Entidad'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_ENTIDAD,',
'       NOMBRE,',
'       TIP_ID_TIPO_DOCUMENTO,',
'       NUMERO_DOCUMENTO,',
'       ES_CLIENTE,',
'       ES_PROVEEDOR,',
'       ES_EMPLEADO,',
'       ES_USUARIO,',
'       ESTADO,',
'       FECHA_NACIMIENTO,',
'       OBSERVACION,',
'       USU_ID_USUARIO,',
'       TIPO_ENTIDAD,',
'       SUC_ID_SUCURSAL',
'  from ENTIDAD'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(142785686793570912)
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
 p_id=>wwv_flow_imp.id(37948346909547875)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(142785686793570912)
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
 p_id=>wwv_flow_imp.id(37948749687547876)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(142785686793570912)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear entidad'
,p_button_position=>'NEXT'
,p_confirm_message=>unistr('\00BFConfirma los datos a guardar?')
,p_confirm_style=>'warning'
,p_button_condition=>'P161_ID_ENTIDAD'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(86400697594544794)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126286245199920457)
,p_name=>'P161_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_source_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Entidad'
,p_source=>'ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126286643597920459)
,p_name=>'P161_NOMBRE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_source_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_prompt=>unistr('Apellido Nombre / Raz\00F3n Social')
,p_source=>'NOMBRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>800
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126286995152920459)
,p_name=>'P161_FECHA_NACIMIENTO'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_source_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_prompt=>'Fecha de Nacimiento'
,p_source=>'FECHA_NACIMIENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'N',
  'use_defaults', 'N')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126287458339920459)
,p_name=>'P161_TIP_ID_TIPO_DOCUMENTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_source_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_prompt=>'Tipo de Documento'
,p_source=>'TIP_ID_TIPO_DOCUMENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TIPO_DOCUMENTO_ABREVIATURA'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--'
,p_cHeight=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126287838945920460)
,p_name=>'P161_NUMERO_DOCUMENTO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_source_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_prompt=>unistr('N\00FAmero de Documento')
,p_source=>'NUMERO_DOCUMENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>80
,p_begin_on_new_line=>'N'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126288217929920460)
,p_name=>'P161_TIPO_ENTIDAD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_source_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_prompt=>'Tipo'
,p_source=>'TIPO_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:FISICA;FISICA,JURIDICA;JURIDICA'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126288601128920461)
,p_name=>'P161_ES_CLIENTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_source_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_source=>'ES_CLIENTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126289060753920461)
,p_name=>'P161_ES_PROVEEDOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_source_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_default=>'''SI'''
,p_source=>'ES_PROVEEDOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126289419514920462)
,p_name=>'P161_ES_EMPLEADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_source_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_default=>'NO'
,p_source=>'ES_EMPLEADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126289871778920462)
,p_name=>'P161_ES_USUARIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_source_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_default=>'NO'
,p_source=>'ES_USUARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126290209673920462)
,p_name=>'P161_USU_ID_USUARIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_source_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_source=>'USU_ID_USUARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126290680073920462)
,p_name=>'P161_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_source_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126291009632920463)
,p_name=>'P161_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_source_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_default=>'ACTIVO'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126291406581920463)
,p_name=>'P161_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_item_source_plug_id=>wwv_flow_imp.id(142777683792570884)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>800
,p_cHeight=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(37950166937547887)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(37948346909547875)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37950646042547889)
,p_event_id=>wwv_flow_imp.id(37950166937547887)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(37947652553547874)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(142777683792570884)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Crear o Editar Entidad'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>37947652553547874
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(37949728269547887)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_01=>'P161_ID_ENTIDAD'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>37949728269547887
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(37947211182547872)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(142777683792570884)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear o Editar Entidad'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>37947211182547872
);
wwv_flow_imp.component_end;
end;
/
