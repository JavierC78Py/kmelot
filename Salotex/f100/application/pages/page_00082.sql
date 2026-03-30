prompt --application/pages/page_00082
begin
--   Manifest
--     PAGE: 00082
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
 p_id=>82
,p_name=>'Abrir/Cerrar caja'
,p_alias=>'ABRIR-CERRAR-CAJA'
,p_page_mode=>'MODAL'
,p_step_title=>'Abrir/Cerrar caja'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!apex.item("P82_ID_RENDICION_CAJA").isEmpty()) {',
'    $("#P82_ENT_ID_ENTIDAD").addClass("apex_disabled");',
'    $("#P82_ENT_ID_ENTIDAD").attr("tabindex", "-1");',
'    $("#P82_SUC_ID_SUCURSAL").addClass("apex_disabled");',
'    $("#P82_SUC_ID_SUCURSAL").attr("tabindex", "-1");',
'    $("#P82_FECHA_DESDE").addClass("apex_disabled");',
'    $("#P82_FECHA_DESDE").attr("tabindex", "-1");',
'    $("#P82_FECHA_HASTA").addClass("apex_disabled");',
'    $("#P82_FECHA_HASTA").attr("tabindex", "-1");',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(89098141737391075)
,p_plug_name=>'Abrir/Cerrar caja'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_RENDICION_CAJA,',
'       FECHA_DESDE,',
'       FECHA_HASTA,',
'       ENT_ID_ENTIDAD,',
'       SUC_ID_SUCURSAL,',
'       ESTADO',
'  from RENDICION_CAJA'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(89101974966391078)
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
 p_id=>wwv_flow_imp.id(89102418127391078)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(89101974966391078)
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
 p_id=>wwv_flow_imp.id(89103788264391082)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(89101974966391078)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P82_ID_RENDICION_CAJA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(89164960168906952)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(89104172849391082)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(89101974966391078)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cerrar caja'
,p_button_position=>'NEXT'
,p_button_condition=>'P82_ID_RENDICION_CAJA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(89164541537905194)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(89104577120391082)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(89101974966391078)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Abrir caja'
,p_button_position=>'NEXT'
,p_button_condition=>'P82_ID_RENDICION_CAJA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(89164731569906034)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34545885833185344)
,p_name=>'P82_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(89098141737391075)
,p_item_source_plug_id=>wwv_flow_imp.id(89098141737391075)
,p_item_default=>'ABIERTO'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89098506486391076)
,p_name=>'P82_ID_RENDICION_CAJA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(89098141737391075)
,p_item_source_plug_id=>wwv_flow_imp.id(89098141737391075)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Rendicion Caja'
,p_source=>'ID_RENDICION_CAJA'
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
 p_id=>wwv_flow_imp.id(89098883966391076)
,p_name=>'P82_FECHA_DESDE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(89098141737391075)
,p_item_source_plug_id=>wwv_flow_imp.id(89098141737391075)
,p_prompt=>'Apertura desde'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_DESDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>16
,p_cMaxlength=>16
,p_colspan=>4
,p_field_template=>1609122147107268652
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
 p_id=>wwv_flow_imp.id(89099256358391076)
,p_name=>'P82_FECHA_HASTA'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(89098141737391075)
,p_item_source_plug_id=>wwv_flow_imp.id(89098141737391075)
,p_prompt=>'Apertura hasta'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_HASTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>16
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
 p_id=>wwv_flow_imp.id(89099664978391077)
,p_name=>'P82_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(89098141737391075)
,p_item_source_plug_id=>wwv_flow_imp.id(89098141737391075)
,p_prompt=>'Usuario'
,p_source=>'ENT_ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ENTIDAD_USUARIO_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.nombre||''(''||u.usuario||'') - sucursal: ''||s.descripcion d',
'      ,e.id_entidad r',
'FROM entidad e, usuarios u, sucursal_entidad s',
'WHERE e.es_usuario = ''SI''',
'AND e.estado = ''ACTIVO''',
'AND u.id_usuario = e.usu_id_usuario',
'AND s.id_suc_entidad = e.suc_id_sucursal',
'AND s.estado = ''ACTIVO'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cHeight=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89100066068391077)
,p_name=>'P82_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(89098141737391075)
,p_item_source_plug_id=>wwv_flow_imp.id(89098141737391075)
,p_prompt=>'Sucursal'
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SUCURSAL_ENTIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.id_suc_entidad AS r',
'      ,s.descripcion AS d',
'FROM sucursal_entidad s',
'WHERE s.ent_id_entidad = :APP_ID_ENTIDAD',
'AND s.estado = ''ACTIVO''',
''))
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89102514109391078)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(89102418127391078)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89103238950391082)
,p_event_id=>wwv_flow_imp.id(89102514109391078)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(89138756955422242)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Verificar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'dummy number;',
'begin ',
'    SELECT 1',
'    INTO dummy',
'    FROM rendicion_caja c',
'    WHERE c.ent_id_entidad = :P82_ENT_ID_ENTIDAD',
'    AND c.suc_id_sucursal = :P82_SUC_ID_SUCURSAL',
'    AND c.estado = ''ABIERTO'';',
'    raise_application_error(-20000,''Existe otra caja ABIERTA, favor verifique antes de poder ABRIR una nueva.'');',
'exception',
'    when no_data_found then ',
'        null;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(89104577120391082)
,p_internal_uid=>15405737891415502
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(34545990152185345)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cerrar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P82_ESTADO := ''CERRADO'';',
':P82_FECHA_HASTA := to_char(SYSDATE,''dd-mm-yyyy hh24:mi'');'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(89104172849391082)
,p_internal_uid=>34545990152185345
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(89105340261391083)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(89098141737391075)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Abrir/Cerrar caja'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>15372321197384343
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(89105765704391083)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>15372746640384343
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(89105000153391082)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(89098141737391075)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Abrir/Cerrar caja'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>15371981089384342
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(89138685351422241)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Iniciar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P82_ID_RENDICION_CAJA is null then ',
'    :P82_FECHA_DESDE := to_char(current_date,''dd/mm/yyyy hh24:mi'');',
'    :P82_FECHA_HASTA := to_char(current_date ,''dd/mm/yyyy'')||'' 23:59'';',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>15405666287415501
);
wwv_flow_imp.component_end;
end;
/
