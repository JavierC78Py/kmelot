prompt --application/pages/page_00110
begin
--   Manifest
--     PAGE: 00110
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
 p_id=>110
,p_name=>'Escanear instancia Qr'
,p_alias=>'ESCANEAR-INSTANCIA-QR'
,p_page_mode=>'MODAL'
,p_step_title=>'Escanear instancia Qr'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function getQr(){',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors();',
'    apex.server.process("getQr", {',
'       pageItems: [',
'         "P110_KEY"',
'       ]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                $("#qrcode_box").attr("src", apex.item(''P110_QR_B64'').getValue());                ',
'            } else {      ',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }       ',
'        }',
'    }).always( function() {',
'        waitPopup.remove();',
'    });    ',
'}',
'function saveInstance(){',
'  apex.server.process(',
'    "saveInstance",',
'    {',
'      x01: apex.item(''P110_KEY'').getValue(),',
'      x02: apex.item(''P110_NAME'').getValue(),',
'      x03: apex.item(''P110_QR_B64'').getValue(),',
'      x04: apex.item(''P110_PUSH_NAME'').getValue(),',
'      x05: apex.item(''P110_PHONE_NUMBER'').getValue(),',
'      x06: apex.item(''P110_ID_DEVICE'').getValue(),',
'      x07: apex.item(''P110_ID_SUCURSAL'').getValue()',
'    },',
'    {',
'      success: function (pData) {',
'        if (pData.status == ''OK'') {',
'          apex.message.showPageSuccess(pData.message);',
'          apex.navigation.dialog.close(true);',
'        } else {',
'          apex.message.showErrors(pData.message);',
'        }',
'        setTimeout(function () {',
'          apex.message.hidePageSuccess();',
'        }, 3000);',
'      },',
'    }',
'  );',
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'        #qr-container{',
'            display: flex;',
'            justify-content: center;',
'            align-items: center;',
'        }'))
,p_step_template=>2121795032473542284
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'800'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(181436711196280031)
,p_plug_name=>'Wizard Progress'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2010149141494510257
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(181436780861280031)
,p_plug_name=>'Scan Instance Qr'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(180604709695470364)
,p_plug_name=>'Qr'
,p_parent_plug_id=>wwv_flow_imp.id(181436780861280031)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container" id="qr-container">',
'    <img src="" alt="" id="qrcode_box" width="250" />',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(181436888759280031)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(123176934417900102)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(181436888759280031)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Cancelar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(123177405314900101)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(181436888759280031)
,p_button_name=>'FINISH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Finalizar'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_comment=>'javascript:saveInstance();'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(123177782927900101)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(181436888759280031)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Anterior'
,p_button_position=>'PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(123184723453900096)
,p_branch_name=>'Go To Page 100'
,p_branch_action=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(123177782927900101)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(65341453026574942)
,p_name=>'P110_ID_SUCURSAL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(181436780861280031)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89531085568599542)
,p_name=>'P110_ID_DEVICE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(181436780861280031)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(180604893603470354)
,p_name=>'P110_KEY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(181436780861280031)
,p_prompt=>'P110_KEY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(180605212194470357)
,p_name=>'P110_QR_B64'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(181436780861280031)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(180605896444470364)
,p_name=>'P110_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(181436780861280031)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(181519757184539631)
,p_name=>'P110_PUSH_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(181436780861280031)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(181519833360539632)
,p_name=>'P110_PHONE_NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(181436780861280031)
,p_prompt=>unistr('N\00FAmero celular')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(181837112261819817)
,p_name=>'P110_SCANNED'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(181436780861280031)
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(123180336637900099)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(123176934417900102)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(123180867393900098)
,p_event_id=>wwv_flow_imp.id(123180336637900099)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(123181259639900098)
,p_name=>'getQr'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P110_KEY'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(123181755023900098)
,p_event_id=>wwv_flow_imp.id(123181259639900098)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''Obteniendo Qr de la instancia: '' + apex.item(''P110_KEY'').getValue());',
'$(''#P110_KEY'').attr(''disabled'', true);',
'$(''#P110_PHONE_NUMBER'').attr(''disabled'', true);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(123184245148900096)
,p_event_id=>wwv_flow_imp.id(123181259639900098)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'getQr()'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(123183767151900096)
,p_event_id=>wwv_flow_imp.id(123181259639900098)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var intervalID = setInterval(function () {',
'  apex.server.process("checkInstance",',
'    {',
'      x01: apex.item(''P110_KEY'').getValue()',
'    },',
'    {',
'      success: function (datos) {',
'        if (!datos.error) {',
'          if (datos.connected == 1) {',
'            console.log(''conectado: '',datos);',
'            apex.item(''P110_PUSH_NAME'').setValue(datos.push_name);',
'          //apex.item(''P110_PHONE_NUMBER'').setValue(datos.phone_number);',
'            apex.message.showPageSuccess("Instancia Conectada!");',
'            apex.message.clearErrors();',
'            clearInterval(intervalID);',
'            setTimeout(function(){',
'                $(''#P110_KEY'').attr(''disabled'', false);',
'                $(''#P110_PHONE_NUMBER'').attr(''disabled'', false);',
'                saveInstance();',
'            },2000);',
'          }',
'        } else {',
'          apex.message.clearErrors();',
'          apex.message.showErrors({',
'            type: "errors",',
'            location: "page",',
'            message: "Error al crear la instancia.",',
'            unsafe: false',
'          });',
'        }',
'      }',
'    }',
'  );',
'}, 1000); // 1000 milisegundos = 1 segundo',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(123182731988900097)
,p_event_id=>wwv_flow_imp.id(123181259639900098)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P110_QR'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(65344197495574969)
,p_name=>'Fin'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(123177405314900101)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(65344321721574970)
,p_event_id=>wwv_flow_imp.id(65344197495574969)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(181436780861280031)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(123179216031900099)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SaveInstance'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  INSERT INTO DEVICES',
'    (USER_ID, NAME, CREATED, MODIFIED, KEY, QR_B64)',
'  VALUES',
'    (1, :P110_NAME, SYSDATE, NULL, :P110_KEY, :P110_QR_B64);',
'',
'    if sql%rowcount <= 0 then',
'        RAISE_APPLICATION_ERROR(-20099, SQLERRM);',
'    end if;',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    RAISE_APPLICATION_ERROR(-20099, SQLERRM);',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(123177405314900101)
,p_process_when_type=>'NEVER'
,p_internal_uid=>49446196967893359
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(123178387802900101)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>49445368738893361
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(123179521004900099)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'getQr'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
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
'    :P110_QR_B64 := pkg_wapi.qr_b64(:P110_KEY);',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P110_QR_B64'', :P110_QR_B64);',
'    apex_json.close_array;',
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
,p_internal_uid=>49446501940893359
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(123179919499900099)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'saveInstance'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    p_key varchar2(250) := apex_application.g_x01;',
'    p_name  varchar2(250) := apex_application.g_x02;',
'    p_qr   clob := apex_application.g_x03;',
'    p_push_name  varchar2(250) := apex_application.g_x04;',
'    p_id_device number(10) := apex_application.g_x06;',
'begin',
'    if p_id_device is null then',
'        insert into devices',
'            ( user_name',
'            , name',
'            , created',
'            , modified',
'            , key',
'            , qr_b64',
'            , push_name',
'            , phone_number',
'            , suc_id_sucursal',
'            , es_bot',
'            )',
'        values',
'            (:APP_USER',
'            , p_name',
'            , sysdate',
'            , null',
'            , p_key',
'            , p_qr',
'            , p_name',
'            , apex_application.g_x05',
'            , apex_application.g_x07',
'            , 0',
'            );',
'    else',
'        update devices',
'        set  key = p_key',
'            ,qr_b64 = p_qr',
'        where id = p_id_device;',
'    end if;    ',
'    if sql%rowcount > 0 then',
'        apex_json.open_object;',
'        apex_json.write(''success'', true);',
'        apex_json.write(''status'', ''OK'');',
'        apex_json.write(''message'', ''Instancia creada correctamente!'');',
'        apex_json.close_object;',
'    else',
'        apex_json.open_object;',
'        apex_json.write(''success'', false);',
'        apex_json.write(''status'', ''ERROR'');',
'        apex_json.write(''message'', sqlerrm);',
'        apex_json.close_object;',
'    end if;',
'exception',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''success'', false);',
'        apex_json.write(''status'', ''ERROR'');',
'        apex_json.write(''message'', sqlerrm);',
'        apex_json.close_object;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#SQLERRM_TEXT#',
''))
,p_internal_uid=>49446900435893359
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(123178738365900100)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'checkInstance'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_qr clob;',
'  v_user varchar2(50);',
'  v_phone varchar2(50);',
'  v_connected number;',
'begin',
'  v_connected := pkg_wapi.check_session(  p_key => apex_application.g_x01);    ',
'  apex_json.open_object; --Abrimos el objeto -- {',
'  apex_json.write(p_name => ''error'', p_value => false);',
'  apex_json.write(p_name => ''message'', p_value => ''OK'');',
'  apex_json.write(p_name => ''connected'', p_value => v_connected);',
'  apex_json.write(p_name => ''push_name'', p_value => v_user);',
'  apex_json.write(p_name => ''phone_number'', p_value => v_phone);',
'  apex_json.close_object; --Cerramos el objeto -- }',
'exception',
'  when others then ',
'    apex_json.open_object; --Abrimos el objeto -- {  ',
'    apex_json.write(p_name => ''error'', p_value => true);',
'    apex_json.write(p_name => ''message'', p_value => sqlerrm || chr(10) || ''Trace: '' || dbms_utility.format_error_backtrace());      ',
'    apex_json.close_object; --Cerramos el objeto -- }',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>49445719301893360
);
wwv_flow_imp.component_end;
end;
/
