prompt --application/pages/page_00148
begin
--   Manifest
--     PAGE: 00148
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
 p_id=>148
,p_name=>unistr('Crear/editar adjunto licitaci\00F3n')
,p_alias=>unistr('CREAR-EDITAR-ADJUNTO-LICITACI\00D3N')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Crear/editar adjunto licitaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function descargar(){',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors();',
'    apex.server.process("descargar", {',
'       pageItems: [',
'            "P148_NOMBRE_ARCHIVO",',
'            "OCI_BUCKET_NAME",',
'            "OCI_PATH_BUCKET"',
'       ]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                apex.navigation.openInNewWindow(data.descargar);',
'//                for (var i=0; i < data.items.length; i++){',
'//                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'//                } ',
'            } else {',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }',
'        }',
'    }).always( function() {',
'        waitPopup.remove();',
'    });',
'}'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#template-floating-minimalista.min.css',
''))
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(136746654737244833)
,p_plug_name=>unistr('Crear/editar adjunto licitaci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'ADJUNTO_LICITACION'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(136750019583244843)
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
 p_id=>wwv_flow_imp.id(139571288138728553)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(136746654737244833)
,p_button_name=>'BTN_DESCARGAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar'
,p_button_redirect_url=>'javascript: descargar()'
,p_button_execute_validations=>'N'
,p_button_condition=>'P148_ID_ADJUNTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(136750396544244843)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(136750019583244843)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(136751798242244845)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(136750019583244843)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P148_ID_ADJUNTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(136779086982846416)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(136752192947244845)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(136750019583244843)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition_type=>'NEVER'
,p_security_scheme=>wwv_flow_imp.id(136778643096844433)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(136752606672244845)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(136750019583244843)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P148_ID_ADJUNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(136779086982846416)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(136746990709244834)
,p_name=>'P148_ID_ADJUNTO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(136746654737244833)
,p_item_source_plug_id=>wwv_flow_imp.id(136746654737244833)
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
 p_id=>wwv_flow_imp.id(136747239778244838)
,p_name=>'P148_LIC_ID_LICITACION'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(136746654737244833)
,p_item_source_plug_id=>wwv_flow_imp.id(136746654737244833)
,p_prompt=>unistr('Id licitaci\00F3n')
,p_source=>'LIC_ID_LICITACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(136747995053244841)
,p_name=>'P148_NOMBRE_ARCHIVO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(136746654737244833)
,p_item_source_plug_id=>wwv_flow_imp.id(136746654737244833)
,p_prompt=>'Nombre archivo'
,p_source=>'NOMBRE_ARCHIVO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609122147107268652
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(136748343801244841)
,p_name=>'P148_MIME_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(136746654737244833)
,p_item_source_plug_id=>wwv_flow_imp.id(136746654737244833)
,p_prompt=>'Mime type'
,p_source=>'MIME_TYPE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(136760120734266361)
,p_name=>'P148_IMAGEN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(136746654737244833)
,p_prompt=>'Documento'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_display_when=>'P148_NOMBRE_ARCHIVO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_multiple_files', 'N',
  'display_as', 'DROPZONE_INLINE',
  'dropzone_title', 'Imagen del documento',
  'max_file_size', '8000',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(136760408286269362)
,p_name=>'P148_IMAGEN_MOSTRAR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(136746654737244833)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.prepare_url (',
'    p_url       => ''f?p='' || :APP_ID || '':'' || :APP_PAGE_ID || '':'' || :APP_SESSION || '':application_process=get_oci_object:::OCI_OBJECT_NAME,OCI_BUCKET_NAME,OCI_PATH_BUCKET,OCI_DISPOSITION:'' || ''licitacion/'' || :P148_NOMBRE_ARCHIVO || '','' || :OCI_BUC'
||'KET_NAME || '','' || :OCI_PATH_BUCKET || '','' || ''apex_data_export.c_inline'' || '':''',
'  , p_plain_url =>  true)'))
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when=>'P148_NOMBRE_ARCHIVO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'URL')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(136750462677244843)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(136750396544244843)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(136751233943244844)
,p_event_id=>wwv_flow_imp.id(136750462677244843)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(136761225218343231)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar imagen'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'pkg_oci_bucket.p_eliminar_archivo_bucket',
'    (  p_vObjectName => :P148_NOMBRE_ARCHIVO',
'      ,p_vBucketName => :OCI_BUCKET_NAME',
'      ,p_vBucketPath => :OCI_PATH_BUCKET||''/licitacion''',
'    );',
'EXCEPTION',
'    WHEN others then',
'        print_error(sqlerrm);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(136751798242244845)
,p_internal_uid=>17527699646687093
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(136760829600341989)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar imagen'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_name apex_application_temp_files.name%type;',
'v_filename apex_application_temp_files.filename%type;',
'v_mime_type apex_application_temp_files.mime_type%type;',
'dummy number;',
'begin',
'    SELECT /*+ INDEX(a ADJUNTO_LICITACION_IDX1)*/ Count(*)',
'    INTO dummy',
'    FROM adjunto_licitacion a',
'    WHERE a.lic_id_licitacion = :P148_LIC_ID_LICITACION;',
'',
'    if nvl(dummy,0) > 5 then',
unistr('        raise_application_error(-20000,''La cantidad limite es de 5 archivos por licitaci\00F3n.'');'),
'    end if;',
'',
'    select ''id''|| :P148_LIC_ID_LICITACION || ''_'' ||filename, name, mime_type',
'    into v_filename, v_name, v_mime_type',
'    from apex_application_temp_files',
'    where APPLICATION_ID = :APP_ID',
'    and name = :P148_IMAGEN;',
'    begin',
'        select /*+ INDEX(a adjunto_licitacion_arc_uk)*/ 1',
'        into dummy',
'        from adjunto_licitacion a',
'        where a.nombre_archivo = v_filename;',
'        raise_application_error(-20000,''Archivo ya existe en la base de datos, favor verificar.'');',
'    exception',
'        when no_data_found then',
'            null;    ',
'    end;',
'    :P148_NOMBRE_ARCHIVO := v_filename;',
'    :P148_MIME_TYPE := v_mime_type;',
'    pkg_oci_bucket.p_subir_archivo_bucket( p_vFile         => v_name,',
'                                           p_vObjectName   => v_filename,',
'                                           p_vBucketName   => :OCI_BUCKET_NAME,',
'                                           p_vBucketPath   => :OCI_PATH_BUCKET||''/licitacion''',
'                                           );',
'exception',
'    when no_data_found then ',
'        null;    ',
'end;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,CREATE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>17527304028685851
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(136753331321244846)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(136746654737244833)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>unistr('Process form Crear/editar adjunto licitaci\00F3n')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>17519805749588708
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(136753750443244846)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>17520224871588708
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(136752938477244845)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(136746654737244833)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>unistr('Initialize form Crear/editar adjunto licitaci\00F3n')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>17519412905588707
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(139571392442728554)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'descargar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_url   varchar2(1000);',
'PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'BEGIN',
'    v_url := apex_page.get_url (',
'        p_request => ''application_process=get_oci_object'', ',
'        p_items => ''OCI_OBJECT_NAME,OCI_BUCKET_NAME,OCI_PATH_BUCKET,OCI_DISPOSITION'',',
'        p_values => ''licitacion/'' || :P148_NOMBRE_ARCHIVO || '','' || :OCI_BUCKET_NAME || '','' || :OCI_PATH_BUCKET || '','' || '''',',
'        p_plain_url => true',
'    );',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.write(''descargar'',v_url);',
'    apex_json.close_object;  ',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>20337866871072416
);
wwv_flow_imp.component_end;
end;
/
