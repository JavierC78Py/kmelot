prompt --application/pages/page_00101
begin
--   Manifest
--     PAGE: 00101
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
 p_id=>101
,p_name=>'Escanear QR'
,p_alias=>'ESCANEAR-QR'
,p_page_mode=>'MODAL'
,p_step_title=>'Escanear QR'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const delay = ms => new Promise(res => setTimeout(res, ms));',
'',
'function saveInstance() {',
'  if (apex.item(''P101_SCANNED'').getValue() == 1) {',
'    apex.server.process(',
'      "saveInstance",',
'      {',
'        x01: apex.item(''P101_KEY'').getValue(),',
'        x02: apex.item(''P101_NAME'').getValue(),',
'        x03: apex.item(''P101_QR_B64'').getValue(),',
'        x04: apex.item(''P101_PUSH_NAME'').getValue(),',
'        x05: apex.item(''P101_PHONE_NUMBER'').getValue(),',
'        x06: apex.item(''P101_ID_DEVICE'').getValue()',
'      },',
'      {',
'        success: function (pData) {',
'          if (pData.status == ''OK'') {',
'              console.log(''Instancia guardada...'');',
'            apex.message.showPageSuccess(pData.message);',
'            apex.navigation.dialog.close(true);',
'          } else {',
'            apex.message.showErrors(pData.message);',
'          }',
'          setTimeout(function () {',
'            apex.message.hidePageSuccess();',
'          }, 3000);',
'        },',
'      }',
'    );',
'  } else {',
'    apex.message.showErrors(''Escanee el QR para continuar...'');',
'  }',
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#qr-container{',
'    display: flex;',
'    justify-content: center;',
'    align-items: center;',
'}'))
,p_step_template=>2121795032473542284
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(207262209028834252)
,p_plug_name=>'Escanear QR'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(207267553778772187)
,p_plug_name=>'Qr'
,p_parent_plug_id=>wwv_flow_imp.id(207262209028834252)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container" id="qr-container">',
'    <img src="" alt="" id="qrcode_box" width="250" />',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(207262338011834252)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(232764527946923987)
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
 p_id=>wwv_flow_imp.id(207263798897834251)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(207262338011834252)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(207265645801834250)
,p_branch_name=>'Go To Page 100'
,p_branch_action=>'f?p=&APP_ID.:100:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(207267248811772184)
,p_name=>'P101_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(207262209028834252)
,p_prompt=>'Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(207267346008772185)
,p_name=>'P101_KEY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(207262209028834252)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT sys_guid()',
'FROM DUAL'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Key'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(207267452317772186)
,p_name=>'P101_QR_B64'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(207262209028834252)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(207267736871772188)
,p_name=>'P101_SCANNED'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(207267553778772187)
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(207267816086772189)
,p_name=>'P101_PUSH_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(207267553778772187)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(207267877127772190)
,p_name=>'P101_PHONE_NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(207267553778772187)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(232764573073923988)
,p_name=>'P101_ID_DEVICE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(232764527946923987)
,p_prompt=>'Id Device'
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
 p_id=>wwv_flow_imp.id(207264182188834251)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(207263798897834251)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(207265007995834250)
,p_event_id=>wwv_flow_imp.id(207264182188834251)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(207268309453772194)
,p_name=>'getQr'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P101_KEY'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(207268433500772195)
,p_event_id=>wwv_flow_imp.id(207268309453772194)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process(',
'  "getQr",',
'  {',
'    x01: apex.item(''P101_KEY'').getValue()',
'  },',
'  {',
'    success: function (pData) {',
'        console.log(''entramos1'');',
'      if (pData.status == ''OK'') {',
'        console.log(''entramos2'');',
'',
'        $("#qrcode_box").attr("src", pData.qrcode);',
'        apex.item(''P101_QR_B64'').setValue(pData.qrcode);',
'        delay(5000);',
'        var intervalID = setInterval(function () {',
'console.log(''entramos3''+apex.item(''P101_KEY'').getValue());',
'          apex.server.process("checkInstance",',
'            {',
'              x01: apex.item(''P101_KEY'').getValue()',
'            },',
'            {',
'              success: function (datos) {',
'',
'                console.log(''datos.error  :''+datos.error);',
'                console.log(''datos.message  :''+datos.message);',
'                console.log(''datos.connected  :''+datos.connected);',
'                console.log(''datos.push_name  :''+datos.push_name);',
'                console.log(''datos.phone_number  :''+datos.phone_number);',
'',
'                if (!datos.error) {',
'                  if (datos.connected == 1) {',
'                    console.log(datos);',
'                    apex.item(''P101_PUSH_NAME'').setValue(datos.push_name);',
'                    apex.item(''P101_PHONE_NUMBER'').setValue(datos.phone_number);',
'                    apex.item(''P101_SCANNED'').setValue(datos.connected);',
'                    //$(''button#SAVE_INSTANCE'').prop(''disabled'', false);',
'                    apex.message.showPageSuccess("Instancia Conectada!");',
'                    apex.message.clearErrors();',
'                    clearInterval(intervalID);',
'                    setTimeout(function(){',
'                        saveInstance()',
'                    },2000);                    ',
'                  }',
'                } else {',
'                  apex.message.clearErrors();',
'                  apex.message.showErrors({',
'                    type: "errors",',
'                    location: "page",',
'                    message: "Error al crear la instancia.",',
'                    unsafe: false',
'                  });',
'                }',
'              }',
'            }            ',
'          );',
'          console.log(''entramos6  :''+apex.item(''P101_KEY'').getValue());              ',
'        }, 1000);',
'        ',
'      } else {',
'        apex.message.showErrors(pData.message);',
'      }',
'      setTimeout(function () {',
'        apex.message.hidePageSuccess();',
'      }, 3000);',
'    },',
'  }',
');'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(207266515633834248)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>14299970998171370
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(207268032125772191)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'getQr'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  p_key          varchar2(250) := apex_application.g_x01;',
'  v_qr          clob;',
'begin',
'',
'  --v_qr := pkg_wapi.qr_b64(p_key);',
'    v_qr := pkg_wapi.start_session(p_key);',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', true);',
'    apex_json.write(''status'', ''OK'');',
'    apex_json.write(''message'', ''OK'');',
'    apex_json.write(''qrcode'', v_qr);',
'    apex_json.close_object;',
'',
'exception',
'  when no_data_found then',
'  ',
'        apex_json.open_object;',
'        apex_json.write(''success'', false);',
'        apex_json.write(''status'', ''ERROR'');',
'        apex_json.write(''message'', sqlerrm);',
'        apex_json.close_object;',
'  ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>14301487490109313
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(207268094659772192)
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
'    p_phone_number  varchar2(250) := apex_application.g_x05;',
'    p_id_device number(10) := apex_application.g_x06;',
'begin',
'    if p_id_device is null then',
'        insert into devices',
'            (user_name, name, created, modified, key, qr_b64, push_name, phone_number)',
'        values',
'            (:APP_USER, p_name, sysdate, null, p_key, p_qr, p_push_name, p_phone_number)',
'        ;',
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
,p_internal_uid=>14301550024109314
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(207268157146772193)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'checkInstance'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_key varchar2(255) := apex_application.g_x01;',
'  v_qr clob;',
'  v_push_name varchar2(255);',
'  v_remote_jid varchar2(255);',
'  v_connected number;',
'begin',
'  v_connected := pkg_wapi.get_session(p_key => v_key, p_push_name => v_push_name, p_remote_jid => v_remote_jid);',
'  apex_json.open_object;',
'  apex_json.write(p_name => ''error'', p_value => false);',
'  apex_json.write(p_name => ''message'', p_value => ''OK'');',
'  apex_json.write(p_name => ''connected'', p_value => v_connected);',
'  apex_json.write(p_name => ''push_name'', p_value => v_push_name);',
'  apex_json.write(p_name => ''phone_number'', p_value => v_remote_jid);',
'  apex_json.close_object;',
'exception',
'  when others then',
'    apex_json.open_object;  ',
'    apex_json.write(p_name => ''error'', p_value => true);',
'    apex_json.write(p_name => ''message'', p_value => sqlerrm || chr(10) || ''Trace: '' || dbms_utility.format_error_backtrace()); ',
'    apex_json.close_object;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>14301612511109315
);
wwv_flow_imp.component_end;
end;
/
