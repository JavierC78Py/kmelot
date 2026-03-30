prompt --application/pages/page_00122
begin
--   Manifest
--     PAGE: 00122
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
 p_id=>122
,p_name=>'Crear/editar adjunto solicitud'
,p_alias=>'CREAR-EDITAR-ADJUNTO-SOLICITUD'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear/editar adjunto solicitud'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function archivo(){',
'    let url = $v("P122_P_URL_ARCHIVO");',
'    apex.navigation.redirect(url);',
'};',
''))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(124969546444783774)
,p_plug_name=>'Crear/editar adjunto solicitud'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'ADJUNTO_PEDIDO_IT'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(124974343513783749)
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
 p_id=>wwv_flow_imp.id(124996577553695746)
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
 p_id=>wwv_flow_imp.id(124996725345695748)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(124969546444783774)
,p_button_name=>'Descargar'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Descargar archivo'
,p_button_redirect_url=>'javascript:archivo()'
,p_button_execute_validations=>'N'
,p_button_condition=>'P122_NOMBRE_ARCHIVO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-database-arrow-down'
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(124974732421783749)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(124974343513783749)
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
 p_id=>wwv_flow_imp.id(124976162671783744)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(124974343513783749)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P122_ID_ADJUNTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(124976579975783744)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(124974343513783749)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition=>'P122_ID_ADJUNTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(124976961554783744)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(124974343513783749)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P122_ID_ADJUNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(124969823685783772)
,p_name=>'P122_ID_ADJUNTO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(124969546444783774)
,p_item_source_plug_id=>wwv_flow_imp.id(124969546444783774)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Adjunto'
,p_source=>'ID_ADJUNTO'
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
 p_id=>wwv_flow_imp.id(124970314608783764)
,p_name=>'P122_PED_ID_PEDIDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(124969546444783774)
,p_item_source_plug_id=>wwv_flow_imp.id(124969546444783774)
,p_source=>'PED_ID_PEDIDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(124970975695783752)
,p_name=>'P122_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(124969546444783774)
,p_item_source_plug_id=>wwv_flow_imp.id(124969546444783774)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_cMaxlength=>200
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(124971372646783752)
,p_name=>'P122_NOMBRE_ARCHIVO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(124969546444783774)
,p_item_source_plug_id=>wwv_flow_imp.id(124969546444783774)
,p_prompt=>'Nombre archivo'
,p_source=>'NOMBRE_ARCHIVO'
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
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(124971727315783751)
,p_name=>'P122_MIME_TYPE_ARCHIVO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(124969546444783774)
,p_item_source_plug_id=>wwv_flow_imp.id(124969546444783774)
,p_prompt=>'Tipo archivo'
,p_source=>'MIME_TYPE_ARCHIVO'
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
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(124996070262695741)
,p_name=>'P122_SUBIR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(124969546444783774)
,p_prompt=>'Subir'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_display_when=>'P122_NOMBRE_ARCHIVO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_multiple_files', 'N',
  'display_as', 'DROPZONE_INLINE',
  'dropzone_title', 'Archivo',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(124996656889695747)
,p_name=>'P122_P_URL_ARCHIVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(124996577553695746)
,p_prompt=>'New'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(124974826967783749)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(124974732421783749)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(124975692315783745)
,p_event_id=>wwv_flow_imp.id(124974826967783749)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(124996893967695749)
,p_name=>'Desactiva'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(124996970135695750)
,p_event_id=>wwv_flow_imp.id(124996893967695749)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P122_NOMBRE_ARCHIVO,P122_MIME_TYPE_ARCHIVO'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(124977773472783741)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(124969546444783774)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Crear/editar adjunto solicitud'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>51244754408777001
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(124996176286695742)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar imagen'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_name apex_application_temp_files.name%type;',
'v_filename apex_application_temp_files.filename%type;',
'v_mime_type apex_application_temp_files.mime_type%type;',
'begin',
'    select ''id''|| :P122_PED_ID_PEDIDO || ''_'' ||filename, name, mime_type',
'    into v_filename, v_name, v_mime_type',
'    from apex_application_temp_files',
'    where APPLICATION_ID = :APP_ID',
'    and name = :P122_SUBIR;',
'',
'    pkg_oci_bucket.p_subir_archivo_bucket( p_vFile         => v_name,',
'                                           p_vObjectName   => v_filename,',
'                                           p_vBucketName   => :OCI_BUCKET_NAME,',
'                                           p_vBucketPath   => :OCI_PATH_BUCKET||''/pedido_it''',
'                                           ); ',
'    insert into adjunto_pedido_it (',
'        ped_id_pedido   ',
'       ,observacion',
'       ,nombre_archivo',
'       ,mime_type_archivo',
'    ) values (',
'        :P122_PED_ID_PEDIDO',
'       ,:P122_OBSERVACION',
'       ,v_filename',
'       ,v_mime_type ',
'    );',
'exception',
'    when no_data_found then ',
'        null;    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,CREATE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>51263157222689002
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(124996241939695743)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar imagen'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    pkg_oci_bucket.p_eliminar_archivo_bucket',
'        (  p_vObjectName => :P122_NOMBRE_ARCHIVO',
'          ,p_vBucketName => :OCI_BUCKET_NAME',
'          ,p_vBucketPath => :OCI_PATH_BUCKET||''/pedido_it''',
'        );',
'    delete adjunto_pedido_it',
'    where id_adjunto = :P122_ID_ADJUNTO;',
'EXCEPTION',
'    WHEN others then',
'        print_error(sqlerrm);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(124976162671783744)
,p_internal_uid=>51263222875689003
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(124978141958783741)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>51245122894777001
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(124977329964783742)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(124969546444783774)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear/editar adjunto solicitud'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>51244310900777002
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(124996487977695745)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>':P122_P_URL_ARCHIVO := apex_util.prepare_url(''f?p='' || :APP_ID || '':'' || :APP_PAGE_ID || '':'' || :APP_SESSION || '':application_process=get_oci_object:::OCI_OBJECT_NAME,OCI_BUCKET_NAME,OCI_PATH_BUCKET,OCI_DISPOSITION:'' || ''pedido_it/'' || :P122_NOMBRE_A'
||'RCHIVO || '','' || :OCI_BUCKET_NAME || '','' || :OCI_PATH_BUCKET || '','' || ''apex_data_export.c_attachment'' ||'':'');'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>51263468913689005
);
wwv_flow_imp.component_end;
end;
/
