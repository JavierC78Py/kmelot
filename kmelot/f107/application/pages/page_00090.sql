prompt --application/pages/page_00090
begin
--   Manifest
--     PAGE: 00090
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
 p_id=>90
,p_name=>'Editar grupo mensaje'
,p_alias=>'EDITAR-GRUPO-MENSAJE'
,p_page_mode=>'MODAL'
,p_step_title=>'Editar grupo mensaje'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#P90_FECHA_ALTA'').prop(''readonly'', true);',
'$(''#P90_USUARIO'').prop(''readonly'', true);',
'',
'if (apex.item("P90_ESTADO").getValue() == ''ENVIAR'') {',
'    $(''#P90_FECHA_ENVIAR'').attr(''disabled'', true);',
'    $(''#P90_PRIORIDAD'').attr(''disabled'', true);',
'    $(''#P90_MENSAJE'').prop(''readonly'', true);',
'    $(''#P90_CUENTA_ENVIAR'').prop(''readonly'', true);',
'}',
'if (apex.item("P90_ESTADO").getValue() == ''ENVIADO''){',
'    apex.item("BTN_ELIMINAR").disable();',
'    apex.item("BTN_APLICAR").disable();',
'}',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.text-dark {',
'    color:black !important;',
'    opacity: 1 !important;',
'}',
''))
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(214416818228128791)
,p_plug_name=>'Editar grupo mensaje'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_GRUPO_COLA,',
'       MENSAJE,',
'       FECHA_ALTA,',
'       FECHA_ENVIAR,',
'       PRIORIDAD,',
'       USUARIO,',
'       CUENTA_ENVIAR,',
'       ESTADO',
'  from GRUPO_COLA_MENSAJE'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P90_ESTADO'
,p_plug_read_only_when2=>'ENVIADO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(214421945515128798)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214422351045128798)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(214421945515128798)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214423839233128807)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(214421945515128798)
,p_button_name=>'DELETE'
,p_button_static_id=>'BTN_ELIMINAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P90_ID_GRUPO_COLA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214424204543128808)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(214421945515128798)
,p_button_name=>'SAVE'
,p_button_static_id=>'BTN_APLICAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition=>':P90_ID_GRUPO_COLA IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214424611747128808)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(214421945515128798)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P90_ID_GRUPO_COLA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214417101050128791)
,p_name=>'P90_ID_GRUPO_COLA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_item_source_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_source=>'ID_GRUPO_COLA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214417531194128794)
,p_name=>'P90_MENSAJE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_item_source_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_prompt=>'Mensaje'
,p_source=>'MENSAJE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'Y',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214417938876128794)
,p_name=>'P90_FECHA_ALTA'
,p_source_data_type=>'DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_item_source_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_item_default=>'to_char(current_date,''dd-mm-yyyy hh24:mi'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Fecha Alta'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_ALTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'text-dark'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214418305466128795)
,p_name=>'P90_FECHA_ENVIAR'
,p_source_data_type=>'DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_item_source_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_prompt=>'Fecha enviar'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_ENVIAR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>16
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Ingresar fecha y hora en caso de querer programar un env\00EDo, si no se define el valor ser\00E1 tomado como inmediato.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'Y',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214418647017128795)
,p_name=>'P90_PRIORIDAD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_item_source_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_prompt=>'Prioridad'
,p_source=>'PRIORIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PRIORIDAD_WHATSAPP'
,p_lov=>'.'||wwv_flow_imp.id(214437601356180702)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Normal'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214419086215128796)
,p_name=>'P90_USUARIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_item_source_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_prompt=>'Usuario'
,p_source=>'USUARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_tag_css_classes=>'text-dark'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214419531272128796)
,p_name=>'P90_CUENTA_ENVIAR'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_item_source_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_prompt=>'Cuenta por la cual enviar'
,p_placeholder=>'Ej. 595981429971'
,p_source=>'CUENTA_ENVIAR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('N\00FAmero de tel\00E9fono por la cual ser\00E1 enviado en mensaje ej.: 595981429971')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214448355725590579)
,p_name=>'P90_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_item_source_plug_id=>wwv_flow_imp.id(214416818228128791)
,p_item_default=>'PENDIENTE'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ESTADO_WHATSAPP'
,p_lov=>'.'||wwv_flow_imp.id(214454831652596429)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214422500335128798)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214422351045128798)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214423327127128807)
,p_event_id=>wwv_flow_imp.id(214422500335128798)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(214425421184128809)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(214416818228128791)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Editar grupo mensaje'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>21458876548465931
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(214425753227128809)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>21459208591465931
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(214425042251128809)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(214416818228128791)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Editar grupo mensaje'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>21458497615465931
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(214448480630590580)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Iniciar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P90_ID_GRUPO_COLA IS NULL THEN ',
'  :P90_USUARIO := v(''APP_USER'');',
'END IF;  '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>21481935994927702
);
wwv_flow_imp.component_end;
end;
/
