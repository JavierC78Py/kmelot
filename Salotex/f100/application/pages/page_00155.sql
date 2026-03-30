prompt --application/pages/page_00155
begin
--   Manifest
--     PAGE: 00155
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
 p_id=>155
,p_name=>unistr('Crear/editar comisi\00F3n')
,p_alias=>unistr('CREAR-EDITAR-COMISI\00D3N')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Crear/editar comisi\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P155_MON_ID_MONEDA").addClass("apex_disabled");',
'$("#P155_MON_ID_MONEDA").attr("tabindex", "-1");',
'$("#P155_TIPO_CAMBIO").addClass("apex_disabled");',
'$("#P155_TIPO_CAMBIO").attr("tabindex", "-1");',
'',
'$("#P155_LIC_ID_LICITACION").addClass("apex_disabled");',
'$("#P155_LIC_ID_LICITACION").attr("tabindex", "-1");',
'',
'$(document).ready(function() {',
'    if (apex.item("P155_ID_REGISTRO_COMISION").isEmpty()){',
'        $("#P155_PORCENTAJE").addClass("apex_disabled");',
'        $("#P155_PORCENTAJE").attr("tabindex", "-1");',
'        $("#P155_MONTO_COMISION").addClass("apex_disabled");',
'        $("#P155_MONTO_COMISION").attr("tabindex", "-1");',
'    } else {',
'        if (apex.item("P155_MODALIDAD").getValue()==''PORC''){',
'            $("#P155_MONTO_COMISION").addClass("apex_disabled");',
'            $("#P155_MONTO_COMISION").attr("tabindex", "-1");',
'        }',
'    }',
'    apex.item("P155_ENT_ID_ENTIDAD").setFocus();',
'})'))
,p_css_file_urls=>'#WORKSPACE_IMAGES#template-floating-minimalista.min.css'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>wwv_flow_imp.id(25974932763007944)
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25754135337418863)
,p_plug_name=>unistr('Crear/editar comisi\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'LICITACION_COMISION'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25760778344418867)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25988577396247124)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25761186982418867)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(25760778344418867)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25762561275418867)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(25760778344418867)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P155_ID_REGISTRO_COMISION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(25975553689011008)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25762905912418868)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(25760778344418867)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition=>'P155_ID_REGISTRO_COMISION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(25975162920009296)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25763327376418868)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(25760778344418867)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P155_ID_REGISTRO_COMISION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(25975360361010193)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25754415645418864)
,p_name=>'P155_ID_REGISTRO_COMISION'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_item_source_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Registro Comision'
,p_source=>'ID_REGISTRO_COMISION'
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
 p_id=>wwv_flow_imp.id(25754832805418864)
,p_name=>'P155_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_item_source_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_prompt=>'Entidad (prestador)'
,p_source=>'ENT_ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ENTIDAD_PROVEEDOR_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.id_entidad AS r',
'      ,e.nombre AS d',
'FROM entidad e',
'WHERE e.es_proveedor = ''SI''',
'AND e.estado = ''ACTIVO'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Proveedor')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25755235900418864)
,p_name=>'P155_MODALIDAD'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_item_source_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_prompt=>'Modalidad'
,p_source=>'MODALIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MODALIDAD_COMISION_LICI'
,p_lov=>'.'||wwv_flow_imp.id(25775597182482549)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25755618287418864)
,p_name=>'P155_PORCENTAJE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_item_source_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_prompt=>'Porcentaje'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'PORCENTAJE'
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
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25756079491418865)
,p_name=>'P155_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_item_source_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_prompt=>'Moneda'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25756488679418865)
,p_name=>'P155_MONTO_COMISION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_item_source_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_prompt=>unistr('Monto comisi\00F3n')
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'MONTO_COMISION'
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
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25756800916418865)
,p_name=>'P155_TIPO_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_item_source_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_prompt=>'Tipo cambio'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'TIPO_CAMBIO'
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
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25757212481418865)
,p_name=>'P155_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_item_source_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
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
 p_id=>wwv_flow_imp.id(25757683309418865)
,p_name=>'P155_LIC_ID_LICITACION'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_item_source_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_prompt=>unistr('Licitaci\00F3n')
,p_source=>'LIC_ID_LICITACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_LICITACIONES_ALL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT l.id_licitacion AS r',
'      ,l.nro_licitacion||'' CC: ''||l.codigo_contratacion||'' ''||l.convocante AS d',
'FROM licitacion l'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cHeight=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25988648807247125)
,p_name=>'P155_P_MONTO_LICITACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25988577396247124)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25989066568247129)
,p_name=>'P155_MONTO_ADJUDICADO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(25754135337418863)
,p_prompt=>'Monto adjudicado'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25761212933418867)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(25761186982418867)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25762042435418867)
,p_event_id=>wwv_flow_imp.id(25761212933418867)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20340076382072438)
,p_name=>'Habilitar'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_MODALIDAD'
,p_condition_element=>'P155_MODALIDAD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'PORC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20340156280072439)
,p_event_id=>wwv_flow_imp.id(20340076382072438)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_PORCENTAJE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25989157290247130)
,p_event_id=>wwv_flow_imp.id(20340076382072438)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_PORCENTAJE'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20340427049072442)
,p_event_id=>wwv_flow_imp.id(20340076382072438)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_PORCENTAJE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20340620290072444)
,p_event_id=>wwv_flow_imp.id(20340076382072438)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_PORCENTAJE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20340394749072441)
,p_event_id=>wwv_flow_imp.id(20340076382072438)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_MONTO_COMISION'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20340512624072443)
,p_event_id=>wwv_flow_imp.id(20340076382072438)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_MONTO_COMISION'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20340789784072445)
,p_event_id=>wwv_flow_imp.id(20340076382072438)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_MONTO_COMISION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25988849530247127)
,p_name=>'SetValor'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_PORCENTAJE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25988947019247128)
,p_event_id=>wwv_flow_imp.id(25988849530247127)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P155_MONTO_COMISION := ROUND(((:P155_P_MONTO_LICITACION * :P155_PORCENTAJE)/100),0);'
,p_attribute_02=>'P155_P_MONTO_LICITACION,P155_PORCENTAJE'
,p_attribute_03=>'P155_MONTO_COMISION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25989283537247131)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P155_PORCENTAJE IS NOT NULL THEN',
'    :P155_MONTO_COMISION := ROUND(((:P155_P_MONTO_LICITACION * :P155_PORCENTAJE)/100),0);',
'ELSE',
'   :P155_MONTO_COMISION := to_number(NVL(:P155_MONTO_COMISION,0),''999g999g999'');',
'END IF;    ',
'IF :P155_ENT_ID_ENTIDAD IS NULL THEN ',
unistr('    RAISE_APPLICATION_ERROR(-20000,''Seleccione benerficiario de la comisi\00F3n a pagar.'');'),
'END IF;',
'IF :P155_MODALIDAD IS NULL THEN',
unistr('    RAISE_APPLICATION_ERROR(-20000,''Modalidad de la comisi\00F3n no fue seleccionada.'');'),
'END IF;',
'IF NVL(:P155_MONTO_COMISION,0) = 0 THEN',
unistr('    RAISE_APPLICATION_ERROR(-20000,''Monto de la comisi\00F3n no fue declarado, favor verificar.''||:P155_MONTO_COMISION);'),
'END IF;',
'IF :P155_PORCENTAJE IS NOT NULL AND :P155_MODALIDAD = ''PORC'' AND to_number(:P155_PORCENTAJE,''999g999d99'') NOT BETWEEN 0 AND 100 THEN',
'    RAISE_APPLICATION_ERROR(-20000,''Favor verificar valores de porcentaje en base a la modalidad.'');',
'END IF;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25989283537247131
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25764185979418868)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(25754135337418863)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>unistr('Process form Crear/editar comisi\00F3n')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25764185979418868
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25764542021418868)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>25764542021418868
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25763719832418868)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(25754135337418863)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>unistr('Initialize form Crear/editar comisi\00F3n')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25763719832418868
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20339950744072437)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P155_ID_REGISTRO_COMISION IS NULL THEN',
'    :P155_MON_ID_MONEDA := 1;',
'    :P155_TIPO_CAMBIO := 1;',
'END IF;',
':P155_MONTO_ADJUDICADO := :P155_P_MONTO_LICITACION;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>20339950744072437
);
wwv_flow_imp.component_end;
end;
/
