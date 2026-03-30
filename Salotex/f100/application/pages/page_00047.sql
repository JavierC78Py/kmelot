prompt --application/pages/page_00047
begin
--   Manifest
--     PAGE: 00047
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
 p_id=>47
,p_name=>'Crear o editar usuario'
,p_alias=>'CREAR-O-EDITAR-USUARIO'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear o editar usuario'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#P47_FECHA_ALTA'').prop(''readonly'', true);',
'$(''#P47_ID_USUARIO'').prop(''readonly'', true);'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P47_BLOQUEADO {    ',
'    margin-top: 17px;',
'    }'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(82329093685760717)
,p_plug_name=>'Detalle de usuario'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
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
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(82335573529760734)
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
 p_id=>wwv_flow_imp.id(82335997910760735)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(82335573529760734)
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
 p_id=>wwv_flow_imp.id(82337341919760743)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(82335573529760734)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P47_ID_USUARIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(86667496041463259)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(86330301192670957)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(82335573529760734)
,p_button_name=>'ROLES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Roles'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:53:P53_ID_USUARIO:&P47_ID_USUARIO.'
,p_button_condition=>'P47_ID_USUARIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-key'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(82337721234760744)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(82335573529760734)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P47_ID_USUARIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(86667065239460622)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(82338184864760744)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(82335573529760734)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P47_ID_USUARIO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(86667306477461974)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(81868240649726568)
,p_name=>'P47_BLOQUEADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_item_source_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_item_default=>'NO'
,p_prompt=>'Bloqueado'
,p_source=>'BLOQUEADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'SI',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82329370687760719)
,p_name=>'P47_ID_USUARIO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_item_source_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_prompt=>'Id usuario'
,p_source=>'ID_USUARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82329766597760726)
,p_name=>'P47_FECHA_ALTA'
,p_source_data_type=>'DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_item_source_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_prompt=>'Fecha alta'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_source=>'FECHA_ALTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(82330126277760729)
,p_name=>'P47_USUARIO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_item_source_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_prompt=>'Usuario'
,p_source=>'USUARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_read_only_when=>'P47_ID_USUARIO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82330527208760729)
,p_name=>'P47_PASSWORD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_item_source_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_source=>'PASSWORD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82330980779760730)
,p_name=>'P47_PASSWORD1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_item_source_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_source=>'PASSWORD1'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82331325546760730)
,p_name=>'P47_PASSWORD2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_item_source_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_source=>'PASSWORD2'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82331733757760730)
,p_name=>'P47_PASSWORD3'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_item_source_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_source=>'PASSWORD3'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82332183453760731)
,p_name=>'P47_CORREO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_item_source_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_prompt=>unistr('Correo electr\00F3nico')
,p_source=>'CORREO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>400
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'LOWER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(82332558997760731)
,p_name=>'P47_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_item_source_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_item_default=>'ACTIVO'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ESTADO'
,p_lov=>'.'||wwv_flow_imp.id(89273472179480473)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(84534894614826658)
,p_name=>'P47_CONTRASENA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(82329093685760717)
,p_item_default=>'P47_PASSWORD'
,p_item_default_type=>'ITEM'
,p_prompt=>unistr('Contrase\00F1a')
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(84534982732826659)
,p_validation_name=>'AlSerNuevo'
,p_validation_sequence=>10
,p_validation=>'P47_CONTRASENA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Para crear el usuario debe ingresar contrase\00F1a.')
,p_when_button_pressed=>wwv_flow_imp.id(82338184864760744)
,p_associated_item=>wwv_flow_imp.id(84534894614826658)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(84535212905826661)
,p_validation_name=>'Largor'
,p_validation_sequence=>20
,p_validation=>'length(:P47_CONTRASENA) >= 8'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('La contrase\00F1a debe ser al menos de 8 caracteres')
,p_validation_condition=>'P47_CONTRASENA'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_imp.id(84534894614826658)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(82336111562760735)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(82335997910760735)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(82336842184760740)
,p_event_id=>wwv_flow_imp.id(82336111562760735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(81868024415726566)
,p_name=>'IrAUsuario'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(81868140972726567)
,p_event_id=>wwv_flow_imp.id(81868024415726566)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P47_USUARIO'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P47_ID_USUARIO'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(84535099683826660)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SetCambioContrasena'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P47_CONTRASENA is not null then ',
'    :P47_PASSWORD := :P47_CONTRASENA;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>10802080619819920
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(82338933810760748)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(82329093685760717)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Detalle de usuario'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8605914746754008
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(82339370278760749)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>8606351214754009
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(82338574706760747)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(82329093685760717)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Detalle de usuario'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8605555642754007
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(81868626021726572)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Decrip'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P47_PASSWORD is not null then',
'    :P47_PASSWORD := toolkit.decrypt(:P47_PASSWORD);',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>8135606957719832
);
wwv_flow_imp.component_end;
end;
/
