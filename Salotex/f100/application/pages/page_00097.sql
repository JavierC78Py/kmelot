prompt --application/pages/page_00097
begin
--   Manifest
--     PAGE: 00097
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
 p_id=>97
,p_name=>'Crear/editar descuento'
,p_alias=>'CREAR-EDITAR-DESCUENTO'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear/editar descuento'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(99129547345774139)
,p_plug_name=>'Crear/editar descuento'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_DESCUENTO,',
'       ESTADO,',
'       FECHA_DESDE,',
'       FECHA_HASTA,',
'       ORI_ID_ORIGEN,',
'       GRU_ID_GRUPO,',
'       MAR_ID_MARCA,',
'       MONTO_DESDE,',
'       PORC_DESCUENTO,',
'       MON_ID_MONEDA',
'  from DESCUENTO_VENTA'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(99136074723774153)
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
 p_id=>wwv_flow_imp.id(99136504491774153)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(99136074723774153)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(99137907561774155)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(99136074723774153)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P97_ID_DESCUENTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(113308104497506489)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(99138245840774155)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(99136074723774153)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition=>'P97_ID_DESCUENTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(113307674535508498)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(99138716863774156)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(99136074723774153)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P97_ID_DESCUENTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(113307824784507341)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99077449826895781)
,p_name=>'P97_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_item_source_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_prompt=>'Moneda'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99129828448774140)
,p_name=>'P97_ID_DESCUENTO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_item_source_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Descuento'
,p_source=>'ID_DESCUENTO'
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
 p_id=>wwv_flow_imp.id(99130149476774145)
,p_name=>'P97_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_item_source_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ESTADO'
,p_lov=>'.'||wwv_flow_imp.id(89273472179480473)||'.'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99130523587774146)
,p_name=>'P97_FECHA_DESDE'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_item_source_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_prompt=>'Fecha/hora desde'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_DESDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99130970308774148)
,p_name=>'P97_FECHA_HASTA'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_item_source_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_prompt=>'Fecha/hora hasta'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_HASTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'Y',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99131337914774148)
,p_name=>'P97_ORI_ID_ORIGEN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_item_source_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_prompt=>'Origen'
,p_source=>'ORI_ID_ORIGEN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ORIGEN'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'TODOS'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99131800869774149)
,p_name=>'P97_GRU_ID_GRUPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_item_source_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_prompt=>'Grupo'
,p_source=>'GRU_ID_GRUPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_GRUPO_PRODUCTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT id_grupo AS r',
'      ,descripcion AS d',
'FROM grupo_producto',
'WHERE tipo = ''ART'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'TODOS'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99132214626774149)
,p_name=>'P97_MAR_ID_MARCA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_item_source_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_prompt=>'Marca'
,p_source=>'MAR_ID_MARCA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MARCA'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'TODOS'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99132581924774149)
,p_name=>'P97_MONTO_DESDE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_item_source_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_prompt=>'Monto desde'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'MONTO_DESDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99132962607774150)
,p_name=>'P97_PORC_DESCUENTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_item_source_plug_id=>wwv_flow_imp.id(99129547345774139)
,p_prompt=>'% descuento'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'PORC_DESCUENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(99076710580895773)
,p_validation_name=>'ValidarPorc'
,p_validation_sequence=>10
,p_validation=>':P97_PORC_DESCUENTO > 0 AND :P97_PORC_DESCUENTO <= 100'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Ingrese valores correctos para el descuento.'
,p_associated_item=>wwv_flow_imp.id(99132962607774150)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(99136612740774153)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(99136504491774153)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99137336592774155)
,p_event_id=>wwv_flow_imp.id(99136612740774153)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99139501020774158)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(99129547345774139)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Crear/editar descuento'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25406481956767418
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99139858364774159)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>25406839300767419
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99139112622774157)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(99129547345774139)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear/editar descuento'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25406093558767417
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99076606586895772)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P97_ESTADO := ''ACTIVO'';',
':P97_FECHA_DESDE := to_char(current_date,''DD-MM-YYYY HH24:MI'');',
':P97_FECHA_HASTA := to_char(add_months(current_date,1),''DD-MM-YYYY HH24:MI'');',
':P97_MON_ID_MONEDA := :APP_ID_MONEDA_PRINCIPAL;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P97_ID_DESCUENTO'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>25343587522889032
);
wwv_flow_imp.component_end;
end;
/
