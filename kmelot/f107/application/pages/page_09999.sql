prompt --application/pages/page_09999
begin
--   Manifest
--     PAGE: 09999
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
 p_id=>9999
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'Principal - Sign In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'span.t-Login-logo {',
'  background-size: cover;',
'  width: 100px;',
'  height: 100px;',
'  background-color: transparent;',
'}',
'',
'.t-Login-container {',
'    background-image: url(#WORKSPACE_FILES#texture-4.png);',
'    background-attachment: fixed;',
'    background-color: #989393;',
'    background-position: 100% 100%;',
'    /*background-repeat: no-repeat*/',
'',
'}',
'',
'.b-WorkflowApp {',
'    outline-color: #377e55',
'}',
'',
'.u-color-1 {',
'    color: #fff',
'}',
''))
,p_step_template=>2101157952850466385
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'12'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(134310373675216014)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>50
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206334060115406080)
,p_plug_name=>'&APP_NOMBRE_EMPRESA.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2674157997338192145
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206338764027406148)
,p_plug_name=>'Language Selector'
,p_parent_plug_id=>wwv_flow_imp.id(206334060115406080)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>'apex_lang.emit_language_selector_list;'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_num_rows=>15
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(206336816622406137)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(206334060115406080)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ingresar'
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(206952619383719179)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(206334060115406080)
,p_button_name=>'Informacion'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--simple:t-Button--hoverIconSpin'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>unistr('Informaci\00F3n')
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:10050:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-info-square-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(134310426526216015)
,p_name=>'P9999_N_EMPRESA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(134310373675216014)
,p_prompt=>'N Empresa'
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
 p_id=>wwv_flow_imp.id(203767279756482785)
,p_name=>'P9999_IMAGEN'
,p_item_sequence=>20
,p_source=>'#APP_FILES#kmelot.png'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'URL')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206334408292406099)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(206334060115406080)
,p_prompt=>'Usuario'
,p_placeholder=>'Usuario'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206334882084406102)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(206334060115406080)
,p_prompt=>unistr('Contrase\00F1a')
,p_placeholder=>unistr('Contrase\00F1a')
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206335969092406118)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(206334060115406080)
,p_prompt=>'Recordar usuario'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'LOGIN_REMEMBER_USERNAME'
,p_lov=>'.'||wwv_flow_imp.id(206335102972406104)||'.'
,p_display_when=>'apex_authentication.persistent_cookies_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
unistr('Si selecciona esta casilla de verificaci\00F3n, la aplicaci\00F3n guardar\00E1 su nombre de usuario en una cookie persistente del navegador llamada "LOGIN_USERNAME_COOKIE".'),
unistr('Cuando vaya a la p\00E1gina de inicio de sesi\00F3n la pr\00F3xima vez,'),
unistr('el campo de nombre de usuario se completar\00E1 autom\00E1ticamente con este valor.'),
'</p>',
'<p>',
unistr('Si anula la selecci\00F3n de esta casilla de verificaci\00F3n y su nombre de usuario ya est\00E1 guardado en la cookie,'),
unistr('la aplicaci\00F3n lo sobrescribir\00E1 con un valor vac\00EDo.'),
unistr('Tambi\00E9n puede usar las herramientas de desarrollo de su navegador para eliminar completamente la cookie.'),
'</p>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(207000000000001)
,p_process_sequence=>5
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Logo Dinamico desde PARAMETROS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  l_blob  BLOB;',
'  l_b64   CLOB;',
'  l_len   PLS_INTEGER;',
'  l_off   PLS_INTEGER := 1;',
'  l_chunk VARCHAR2(30000);',
'  l_mime  VARCHAR2(20);',
'BEGIN',
'  BEGIN',
'    SELECT logo_blob INTO l_blob FROM parametros WHERE ROWNUM = 1;',
'  EXCEPTION WHEN NO_DATA_FOUND THEN RETURN;',
'  END;',
'  IF l_blob IS NULL OR DBMS_LOB.getlength(l_blob) = 0 THEN RETURN; END IF;',
'  l_mime := CASE DBMS_LOB.substr(l_blob, 2, 1)',
'    WHEN HEXTORAW(''FFD8'') THEN ''image/jpeg''',
'    WHEN HEXTORAW(''8950'') THEN ''image/png''',
'    ELSE ''image/jpeg''',
'  END;',
'  l_b64 := apex_web_service.blob2clobbase64(l_blob);',
'  l_len := DBMS_LOB.getlength(l_b64);',
'  htp.prn(''<style>span.t-Login-logo{background-image:url("data:''||l_mime||'';base64,'');',
'  WHILE l_off <= l_len LOOP',
'    l_chunk := DBMS_LOB.substr(l_b64, 30000, l_off);',
'    l_chunk := REPLACE(REPLACE(l_chunk, CHR(13), ''''), CHR(10), '''');',
'    htp.prn(l_chunk);',
'    l_off := l_off + 30000;',
'  END LOOP;',
'  htp.prn(''");background-size:cover;width:100px;height:100px;background-color:transparent;}</style>'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>207000000000001
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(206337610446406142)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P9999_USERNAME),',
'    p_consent  => :P9999_REMEMBER = ''Y'' );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>13371065810743264
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(206337225464406140)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P9999_USERNAME,',
'    p_password => :P9999_PASSWORD );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>13370680828743262
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(205563897931327096)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CargarPermiso'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'gen_permiso_apx( p_vUsuario => :P9999_USERNAME);',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'USER_IS_NOT_PUBLIC_USER'
,p_internal_uid=>12597353295664218
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(206338496413406145)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>13371951777743267
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(206338021636406143)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>13371477000743265
);
wwv_flow_imp.component_end;
end;
/
