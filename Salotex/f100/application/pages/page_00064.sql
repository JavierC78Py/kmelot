prompt --application/pages/page_00064
begin
--   Manifest
--     PAGE: 00064
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
 p_id=>64
,p_name=>unistr('Crear/Editar puntos de expedici\00F3n')
,p_alias=>unistr('CREAR-EDITAR-PUNTOS-DE-EXPEDICI\00D3N')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Crear/Editar puntos de expedici\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86859272674648308)
,p_plug_name=>unistr('Crear/Editar puntos de expedici\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'TIMBRADO'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86867998128648317)
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
 p_id=>wwv_flow_imp.id(86868354893648317)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(86867998128648317)
,p_button_name=>'Retornar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(86869801243648319)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(86867998128648317)
,p_button_name=>'Eliminar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P64_ID_TIMBRADO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(86900635220969749)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(86870166140648319)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(86867998128648317)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition=>'P64_ID_TIMBRADO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(86900301877966824)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(86870613158648319)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(86867998128648317)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P64_ID_TIMBRADO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(86900301877966824)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86859586034648308)
,p_name=>'P64_ID_TIMBRADO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_item_source_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Timbrado'
,p_source=>'ID_TIMBRADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86860004067648309)
,p_name=>'P64_NRO_TIMBRADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_item_source_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_prompt=>'Nro. Timbrado'
,p_source=>'NRO_TIMBRADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86860332567648310)
,p_name=>'P64_FECHA_INICIO'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_item_source_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_prompt=>'Fecha inicio'
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'FECHA_INICIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86860783156648310)
,p_name=>'P64_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_item_source_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_prompt=>'Sucursal'
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_SUCURSAL_MIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.id_suc_entidad AS r',
'      ,s.descripcion AS d',
'FROM sucursal_entidad s',
'WHERE s.ent_id_entidad = :APP_MI_ID_ENTIDAD'))
,p_cSize=>32
,p_cMaxlength=>255
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
 p_id=>wwv_flow_imp.id(86861147312648310)
,p_name=>'P64_TIP_ID_TIPO_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_item_source_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_prompt=>'Tipo Comprobante'
,p_source=>'TIP_ID_TIPO_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TIPO_COMPROBANTE_ACT_DESCRIPCION'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tipo_comprobante r,',
'       descripcion d ',
'  from TIPO_COMPROBANTE',
' where estado = ''ACTIVO'' '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86861553977648311)
,p_name=>'P64_ESTABLECIMIENTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_item_source_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_prompt=>'Establecimiento'
,p_source=>'ESTABLECIMIENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>3
,p_cMaxlength=>3
,p_colspan=>3
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86862017438648311)
,p_name=>'P64_PUNTO_EXPEDICION'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_item_source_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_prompt=>unistr('Punto expedici\00F3n')
,p_source=>'PUNTO_EXPEDICION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>3
,p_cMaxlength=>3
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86862412688648311)
,p_name=>'P64_NRO_INICIAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_item_source_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_prompt=>'Nro inicial'
,p_source=>'NRO_INICIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_cMaxlength=>7
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86862749300648312)
,p_name=>'P64_NRO_FINAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_item_source_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_prompt=>'Nro final'
,p_source=>'NRO_FINAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_cMaxlength=>7
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86863140122648312)
,p_name=>'P64_NRO_UTILIZADO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_item_source_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_item_default=>'0'
,p_prompt=>'Nro utilizado'
,p_source=>'NRO_UTILIZADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_cMaxlength=>7
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86863617567648312)
,p_name=>'P64_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_item_source_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_item_default=>'ACTIVO'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ESTADO'
,p_lov=>'.'||wwv_flow_imp.id(89273472179480473)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86863921730648312)
,p_name=>'P64_FECHA_VENCIMIENTO'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_item_source_plug_id=>wwv_flow_imp.id(86859272674648308)
,p_prompt=>'Fecha vencimiento'
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'FECHA_VENCIMIENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>1609122147107268652
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
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(85174567610016286)
,p_validation_name=>'ValorCorrecto'
,p_validation_sequence=>10
,p_validation=>':P64_NRO_INICIAL <= :P64_NRO_FINAL'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('N\00FAmero final no es correcto, verifique.')
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_imp.id(86862749300648312)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(86868467654648317)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(86868354893648317)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(86869227080648318)
,p_event_id=>wwv_flow_imp.id(86868467654648317)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(86871333798648320)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(86859272674648308)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>unistr('Process form Crear/Editar puntos de expedici\00F3n')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>13138314734641580
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(86871765438648320)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>13138746374641580
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(86870987667648320)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(86859272674648308)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>unistr('Initialize form Crear/Editar puntos de expedici\00F3n')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>13137968603641580
);
wwv_flow_imp.component_end;
end;
/
