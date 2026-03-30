prompt --application/pages/page_00137
begin
--   Manifest
--     PAGE: 00137
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
 p_id=>137
,p_name=>'Crear/editar parametro reserva'
,p_alias=>'CREAR-EDITAR-PARAMETRO-RESERVA'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear/editar parametro reserva'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function formatAndValidateHora(input) {',
'    // Obtener el valor actual',
'    let valor = input.value;',
'    ',
unistr('    // Eliminar caracteres no num\00E9ricos, excepto :'),
'    valor = valor.replace(/[^0-9:]/g, '''');',
'    ',
unistr('    // Si ya tiene :, solo formatear los n\00FAmeros'),
'    if (valor.includes('':'')) {',
'        let partes = valor.split('':'');',
'        let horas = partes[0] ? Math.min(parseInt(partes[0]), 23) : 0;',
'        let minutos = partes[1] ? Math.min(parseInt(partes[1]), 59) : 0;',
'        ',
'        valor = ',
'            (horas < 10 && horas.toString().length === 1 ? ''0'' + horas : horas) + ',
'            '':'' + ',
'            (minutos < 10 && minutos.toString().length === 1 ? ''0'' + minutos : minutos);',
'    } ',
'    // Si no tiene :, permitir ingreso parcial',
'    else {',
unistr('        // Si hay m\00E1s de 2 d\00EDgitos, insertar :'),
'        if (valor.length > 2) {',
'            valor = valor.substr(0, 2) + '':'' + valor.substr(2);',
'        }',
'    }',
'    ',
'    // Limitar a 5 caracteres',
'    valor = valor.substr(0, 5);',
'    ',
'    input.value = valor;',
'}',
'',
unistr('// Validaci\00F3n final'),
'function validarHora(input) {',
'    let valor = input.value;',
'    ',
unistr('    // Expresi\00F3n regular para formato HH:MM entre 00:00 y 23:59'),
'    let regex = /^([01]\d|2[0-3]):[0-5]\d$/;',
'    ',
'    if (valor && !regex.test(valor)) {',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: ["page"],',
unistr('            message: "Ingrese una hora v\00E1lida entre 00:00 y 23:59",'),
'            unsafe: false',
'        }]);',
'        ',
'        input.value = '''';',
'        return false;',
'    }',
'    ',
'    return true;',
'}',
'',
'$(document).ready(function() {',
'    $(''#P137_HORA_DESDE'')',
'    .on(''input'', function() {',
'        formatAndValidateHora(this);',
'    })',
'    .on(''blur'', function() {',
'        validarHora(this);',
'    });',
'});'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(134459498943800011)
,p_plug_name=>'Crear/editar parametro reserva'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'RESERVA_PARAMETROS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(134466361492800016)
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
 p_id=>wwv_flow_imp.id(134466801270800016)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(134466361492800016)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134468204180800017)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(134466361492800016)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P137_ID_PARAMETRO_RESERVA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(134548726090477369)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134468581633800017)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(134466361492800016)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition=>'P137_ID_PARAMETRO_RESERVA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(134548382555475366)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134468956638800018)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(134466361492800016)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P137_ID_PARAMETRO_RESERVA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(134548603786476258)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132634379917385787)
,p_name=>'P137_SUC_ID_SUC_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_item_source_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_prompt=>'Sucursal (consultorio)'
,p_source=>'SUC_ID_SUC_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.descripcion AS d',
'      ,s.id_suc_entidad AS r',
'FROM sucursal_entidad s',
'WHERE s.ent_id_entidad = :P137_ENT_ID_ENTIDAD',
'AND s.estado = ''ACTIVO'''))
,p_lov_cascade_parent_items=>'P137_ENT_ID_ENTIDAD'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(134459773794800012)
,p_name=>'P137_ID_PARAMETRO_RESERVA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_item_source_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Parametro Reserva'
,p_source=>'ID_PARAMETRO_RESERVA'
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
 p_id=>wwv_flow_imp.id(134460173885800012)
,p_name=>'P137_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_item_source_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_prompt=>'Prestador'
,p_source=>'ENT_ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ENTIDAD_PRESTADOR_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nombre as d',
'      ,id_entidad as r',
'from entidad',
'where es_prestador = ''SI''',
'and estado = ''ACTIVO'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(134460912261800013)
,p_name=>'P137_DET_ID_DET_ESPECIALIDAD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_item_source_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_prompt=>'Especialidad'
,p_source=>'DET_ID_DET_ESPECIALIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.descripcion AS d',
'      ,e.id_especialidad AS r',
'FROM det_especialidad d',
'    ,especialidad e',
'WHERE d.ent_id_entidad = :P137_ENT_ID_ENTIDAD',
'AND d.estado = ''ACTIVO''',
'AND e.id_especialidad = d.esp_id_especialidad'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--  Sin definir'
,p_lov_cascade_parent_items=>'P137_ENT_ID_ENTIDAD'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(134461295647800013)
,p_name=>'P137_NRO_DIA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_item_source_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_prompt=>unistr('D\00EDas de la semana')
,p_source=>'NRO_DIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SHUTTLE'
,p_named_lov=>'LV_DIAS_SEMANA_NRO'
,p_lov=>'.'||wwv_flow_imp.id(134481325577881482)||'.'
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_controls', 'ALL')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(134461703052800013)
,p_name=>'P137_HORA_DESDE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_item_source_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_prompt=>'Hora desde'
,p_source=>'HORA_DESDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH parametros AS (',
'    SELECT to_number(:P137_FRECUENCIA_ATENCION) AS intervalo_minutos FROM dual',
')',
'SELECT ',
'    LPAD(To_Char(Trunc((LEVEL-1) * (SELECT intervalo_minutos FROM parametros) / 60)), 2, ''0'') || '':'' || ',
'    LPAD(To_Char(Mod((LEVEL-1) * (SELECT intervalo_minutos FROM parametros), 60)), 2, ''0'') AS hora_value,',
'    LPAD(To_Char(Trunc((LEVEL-1) * (SELECT intervalo_minutos FROM parametros) / 60)), 2, ''0'') || '':'' || ',
'    LPAD(To_Char(Mod((LEVEL-1) * (SELECT intervalo_minutos FROM parametros), 60)), 2, ''0'') AS hora_display',
'FROM dual',
'CONNECT BY LEVEL <= TRUNC(24 * 60 / (SELECT intervalo_minutos FROM parametros))',
'ORDER BY hora_value'))
,p_lov_cascade_parent_items=>'P137_FRECUENCIA_ATENCION'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_imp.id(134462050235800013)
,p_name=>'P137_HORA_HASTA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_item_source_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_prompt=>'Hora hasta'
,p_source=>'HORA_HASTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH parametros AS (',
'    SELECT :P137_FRECUENCIA_ATENCION AS intervalo_minutos FROM dual',
')',
'SELECT hora_value',
'      ,hora_display',
'FROM (',
'SELECT ',
'    LPAD(To_Char(Trunc((LEVEL-1) * (SELECT intervalo_minutos FROM parametros) / 60)), 2, ''0'') || '':'' || ',
'    LPAD(To_Char(Mod((LEVEL-1) * (SELECT intervalo_minutos FROM parametros), 60)), 2, ''0'') AS hora_value,',
'    LPAD(To_Char(Trunc((LEVEL-1) * (SELECT intervalo_minutos FROM parametros) / 60)), 2, ''0'') || '':'' || ',
'    LPAD(To_Char(Mod((LEVEL-1) * (SELECT intervalo_minutos FROM parametros), 60)), 2, ''0'') AS hora_display',
'FROM dual',
'CONNECT BY LEVEL <= TRUNC(24 * 60 / (SELECT intervalo_minutos FROM parametros))',
'ORDER BY hora_value',
')',
'WHERE hora_value > :P137_HORA_DESDE'))
,p_lov_cascade_parent_items=>'P137_FRECUENCIA_ATENCION,P137_HORA_DESDE'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_imp.id(134462439892800014)
,p_name=>'P137_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_item_source_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_item_default=>'ACTIVO'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ESTADO'
,p_lov=>'.'||wwv_flow_imp.id(89273472179480473)||'.'
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
 p_id=>wwv_flow_imp.id(134462887066800014)
,p_name=>'P137_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_item_source_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(134463256439800014)
,p_name=>'P137_FRECUENCIA_ATENCION'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_item_source_plug_id=>wwv_flow_imp.id(134459498943800011)
,p_item_default=>'30'
,p_prompt=>unistr('Frecuencia atenci\00F3n')
,p_source=>'FRECUENCIA_ATENCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:15:00;15,30:00;30,45:00;45,60:00;60'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134466912228800016)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134466801270800016)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134467666594800017)
,p_event_id=>wwv_flow_imp.id(134466912228800016)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(132633188964385775)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Hora a numero'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P137_HORA_DESDE := hora_a_numero(:P137_HORA_DESDE);',
':P137_HORA_HASTA := hora_a_numero(:P137_HORA_HASTA);'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>58900169900379035
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134469809268800018)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(134459498943800011)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Crear/editar parametro reserva'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>60736790204793278
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134470164640800018)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>60737145576793278
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134469330424800018)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(134459498943800011)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear/editar parametro reserva'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>60736311360793278
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(132633309956385776)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set hora'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P137_HORA_DESDE := numero_a_hora(:P137_HORA_DESDE);',
':P137_HORA_HASTA := numero_a_hora(:P137_HORA_HASTA);'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>58900290892379036
);
wwv_flow_imp.component_end;
end;
/
