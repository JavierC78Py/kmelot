prompt --application/pages/page_00129
begin
--   Manifest
--     PAGE: 00129
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
 p_id=>129
,p_name=>'Crear o editar responsable'
,p_alias=>'CREAR-O-EDITAR-RESPONSABLE'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear o editar responsable'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function mascaraFechaRegex(campo) {',
'    $(campo).on(''input'', function(e) {',
'        let value = e.target.value.replace(/\D/g, '''');',
'        value = value.replace(/^(\d{2})(\d)/g, "$1-$2");',
'        value = value.replace(/^(\d{2})\-(\d{2})(\d)/g, "$1-$2-$3");',
'        $(this).val(value);',
'    });',
'}',
'document.getElementById(''P129_NRO_CELULAR'').addEventListener(''input'',function(y) {',
'    var output = y.target.value.replace(/\D/g,'''').match(/(\d{0,3})(\d{0,3})(\d{0,6})/);',
'    y.target.value = !output[2]?output[1]:''(''+output[1]+'')''+output[2]+(output[3]?''-''+output[3]:'''');',
'})',
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'))
,p_javascript_code_onload=>'mascaraFechaRegex("#P129_FECHA_NACIMIENTO");'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#BTN_LIMITE_CREDITO {    ',
'    margin-top: 17px;',
'    }',
''))
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(208489353160269311)
,p_plug_name=>'Crear o Editar Entidad'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_ENTIDAD,',
'       NOMBRE,',
'       TIP_ID_TIPO_DOCUMENTO,',
'       NUMERO_DOCUMENTO,',
'       ES_CLIENTE,',
'       ES_PROVEEDOR,',
'       ES_EMPLEADO,',
'       ES_USUARIO,',
'       ESTADO,',
'       FECHA_NACIMIENTO,',
'       OBSERVACION,',
'       USU_ID_USUARIO,',
'       TIPO_ENTIDAD,',
'       SUC_ID_SUCURSAL,',
'       ENT_ID_ENTIDAD,',
'       ES_PRESTADOR,',
'       ES_PACIENTE,',
'       SEXO,',
'       NRO_CELULAR,',
'       CORREO,',
'       FACT_RESPONSABLE,',
'       RESP_ENT_ID_ENTIDAD',
'  from ENTIDAD'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(208497356161269339)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(132887301993472125)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_button_name=>'Limite'
,p_button_static_id=>'BTN_LIMITE_CREDITO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--danger:t-Button--link:t-Button--stretch'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>unistr('Limite de cr\00E9dito')
,p_button_redirect_url=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:48:P48_ID_ENTIDAD:&P129_ID_ENTIDAD.'
,p_button_condition=>'P129_ES_CLIENTE'
,p_button_condition2=>'SI'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(132904879064472166)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(208497356161269339)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--simple:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(132904496796472166)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(208497356161269339)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P129_ID_ENTIDAD'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(132948295923673248)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(132903671613472165)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(208497356161269339)
,p_button_name=>'Contactos'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Contactos'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12:P12_ID_ENTIDAD:&P129_ID_ENTIDAD.'
,p_button_condition=>'P129_ID_ENTIDAD'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(132948105419672293)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(132903255711472165)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(208497356161269339)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'NEXT'
,p_button_condition=>'P129_ID_ENTIDAD'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(132947913629671282)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(132902900178472165)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(208497356161269339)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear responsable'
,p_button_position=>'NEXT'
,p_button_condition=>'P129_ID_ENTIDAD'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(132948105419672293)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(200134170203338670)
,p_name=>'P129_USU_ID_USUARIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_prompt=>'Usuario'
,p_source=>'USU_ID_USUARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_USUARIO R, USUARIO D',
'FROM usuarios',
'WHERE ESTADO = ''ACTIVO'''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>2
,p_display_when_type=>'NEVER'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(202800885330438761)
,p_name=>'P129_TIPO_ENTIDAD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_default=>'FISICA'
,p_prompt=>'Tipo'
,p_source=>'TIPO_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:FISICA;FISICA,JURIDICA;JURIDICA'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204973995919534940)
,p_name=>'P129_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_prompt=>'Sucursal'
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_SUCURSAL'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>unistr('title="Sucursal del usuario, podr\00E1 acceder a los dep\00F3sitos de esta sucursal"')
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_display_when_type=>'NEVER'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(208491616209269316)
,p_name=>'P129_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_source=>'ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208492031684269323)
,p_name=>'P129_NOMBRE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_prompt=>unistr('Apellido Nombre / Raz\00F3n Social')
,p_source=>'NOMBRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>800
,p_colspan=>8
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208492479553269329)
,p_name=>'P129_TIP_ID_TIPO_DOCUMENTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_default=>'1'
,p_prompt=>'Tipo de documento'
,p_source=>'TIP_ID_TIPO_DOCUMENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TIPO_DOCUMENTO_ABREVIATURA'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208492811033269329)
,p_name=>'P129_NUMERO_DOCUMENTO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_prompt=>unistr('N\00FAmero de documento')
,p_source=>'NUMERO_DOCUMENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>80
,p_begin_on_new_line=>'N'
,p_field_template=>1609122147107268652
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
 p_id=>wwv_flow_imp.id(208493210628269330)
,p_name=>'P129_ES_CLIENTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_default=>'SI'
,p_source=>'ES_CLIENTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208493654411269331)
,p_name=>'P129_ES_PROVEEDOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P129_ES_PROVEEDOR is null then',
'  return ''NO'';',
'end if;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Proveedor'
,p_source=>'ES_PROVEEDOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when_type=>'NEVER'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'NO',
  'off_value', 'NO',
  'on_label', 'SI',
  'on_value', 'SI',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208494019453269331)
,p_name=>'P129_ES_EMPLEADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_default=>'NO'
,p_prompt=>'Colaborador'
,p_source=>'ES_EMPLEADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when_type=>'NEVER'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'NO',
  'off_value', 'NO',
  'on_label', 'SI',
  'on_value', 'SI',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208494489627269332)
,p_name=>'P129_ES_USUARIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_default=>'NO'
,p_prompt=>'Usuario'
,p_source=>'ES_USUARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when_type=>'NEVER'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'NO',
  'off_value', 'NO',
  'on_label', 'SI',
  'on_value', 'SI',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208494816716269333)
,p_name=>'P129_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_default=>'ACTIVO'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ESTADO'
,p_lov=>'.'||wwv_flow_imp.id(89273472179480473)||'.'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208495199197269333)
,p_name=>'P129_FECHA_NACIMIENTO'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_prompt=>unistr('Nacimiento/constituci\00F3n')
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'FECHA_NACIMIENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
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
 p_id=>wwv_flow_imp.id(208495609340269334)
,p_name=>'P129_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>800
,p_cHeight=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(231491440728560751)
,p_name=>'P129_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_prompt=>'Entidad (empresa donde trabaja)'
,p_source=>'ENT_ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ENTIDAD_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nombre as d',
'      ,id_entidad as r',
'from entidad',
'where estado = ''ACTIVO'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Seleccione'
,p_cSize=>30
,p_colspan=>4
,p_display_when_type=>'NEVER'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(250797267432023639)
,p_name=>'P129_ES_PRESTADOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_prompt=>'Prestador'
,p_source=>'ES_PRESTADOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_tag_attributes=>'title=''Prestador de servicio interno'''
,p_colspan=>3
,p_display_when_type=>'NEVER'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'NO',
  'off_value', 'NO',
  'on_label', 'SI',
  'on_value', 'SI',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(250895386917997840)
,p_name=>'P129_ES_PACIENTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_default=>'NO'
,p_source=>'ES_PACIENTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(250895715510997843)
,p_name=>'P129_SEXO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_default=>'S'
,p_prompt=>'Sexo'
,p_source=>'SEXO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SEXO'
,p_lov=>'.'||wwv_flow_imp.id(132823305171535705)||'.'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(250895826646997844)
,p_name=>'P129_NRO_CELULAR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_prompt=>'Nro. celular'
,p_placeholder=>'595981429971'
,p_source=>'NRO_CELULAR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(250895901506997845)
,p_name=>'P129_CORREO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_prompt=>'Correo'
,p_source=>'CORREO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'LOWER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(250895948977997846)
,p_name=>'P129_FACT_RESPONSABLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_prompt=>'Facturar a responsable'
,p_source=>'FACT_RESPONSABLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>4
,p_grid_label_column_span=>3
,p_display_when_type=>'NEVER'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'NO',
  'off_value', 'NO',
  'on_label', 'SI',
  'on_value', 'SI',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(250896115012997847)
,p_name=>'P129_RESP_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_item_source_plug_id=>wwv_flow_imp.id(208489353160269311)
,p_prompt=>'Responsable'
,p_source=>'RESP_ENT_ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ENTIDAD_CLIENTE_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.abreviatura||'' ''||e.numero_documento||'', ''||e.nombre d',
'       ,e.id_entidad r',
'FROM entidad e, tipo_documento t',
'WHERE e.es_cliente = ''SI''',
'AND e.estado = ''ACTIVO''',
'AND t.id_tipo_documento = e.tip_id_tipo_documento'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>1609121967514267634
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(132907694843472168)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(132904879064472166)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(132908202282472170)
,p_event_id=>wwv_flow_imp.id(132907694843472168)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(132906257093472167)
,p_name=>'HabilitaUser'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P129_ES_USUARIO'
,p_condition_element=>'P129_ES_USUARIO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SI'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(132906809461472167)
,p_event_id=>wwv_flow_imp.id(132906257093472167)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P129_USU_ID_USUARIO,P129_SUC_ID_SUCURSAL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(132907318286472167)
,p_event_id=>wwv_flow_imp.id(132906257093472167)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P129_USU_ID_USUARIO,P129_SUC_ID_SUCURSAL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(132908558213472170)
,p_name=>'Al cambiar'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P129_FACT_RESPONSABLE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(132909054809472170)
,p_event_id=>wwv_flow_imp.id(132908558213472170)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.item("P129_FACT_RESPONSABLE").getValue()==''NO''){',
'    apex.item("P129_RESP_ENT_ID_ENTIDAD").setValue(null);',
'    $("#P129_RESP_ENT_ID_ENTIDAD_CONTAINER").addClass("apex_disabled");    ',
'} else {',
'    $("#P129_RESP_ENT_ID_ENTIDAD_CONTAINER").removeClass("apex_disabled");    ',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(132909517699472170)
,p_name=>'Inicio'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(132909968208472171)
,p_event_id=>wwv_flow_imp.id(132909517699472170)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P129_NOMBRE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(132910840868472171)
,p_name=>'Foco a documento'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P129_FECHA_NACIMIENTO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(132911353994472171)
,p_event_id=>wwv_flow_imp.id(132910840868472171)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P129_NUMERO_DOCUMENTO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(132632098532385764)
,p_name=>'Actualiza'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P129_TIPO_ENTIDAD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(132632119383385765)
,p_event_id=>wwv_flow_imp.id(132632098532385764)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.item("P129_TIPO_ENTIDAD").getValue()==''JURIDICA''){',
'    $("#P129_ES_USUARIO_CONTAINER").addClass("apex_disabled");',
'    $("#P129_ES_PACIENTE_CONTAINER").addClass("apex_disabled");',
'    $("#P129_ES_EMPLEADO_CONTAINER").addClass("apex_disabled");',
'    $("#P129_SEXO_CONTAINER").addClass("apex_disabled");',
'    $("#P129_FACT_RESPONSABLE_CONTAINER").addClass("apex_disabled");',
'    $("#P129_RESP_ENT_ID_ENTIDAD_CONTAINER").addClass("apex_disabled");    ',
'    apex.item("P129_ES_USUARIO").setValue("NO");',
'    apex.item("P129_ES_PACIENTE").setValue("NO");',
'    apex.item("P129_ES_EMPLEADO").setValue("NO");',
'    apex.item("P129_USU_ID_USUARIO").setValue(null);',
'    apex.item("P129_SUC_ID_SUCURSAL").setValue(null);',
'    apex.item("P129_SEXO").setValue(null);',
'    apex.item("P129_FACT_RESPONSABLE").setValue(''NO'');',
'    apex.item("P129_RESP_ENT_ID_ENTIDAD").setValue(null);',
'} else {',
'    $("#P129_ES_USUARIO_CONTAINER").removeClass("apex_disabled");',
'    $("#P129_ES_PACIENTE_CONTAINER").removeClass("apex_disabled");',
'    $("#P129_ES_EMPLEADO_CONTAINER").removeClass("apex_disabled");',
'    $("#P129_SEXO_CONTAINER").removeClass("apex_disabled");',
'    $("#P129_FACT_RESPONSABLE_CONTAINER").removeClass("apex_disabled");',
'    $("#P129_RESP_ENT_ID_ENTIDAD_CONTAINER").removeClass("apex_disabled");    ',
'}'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(132905479275472166)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Al ser un cliente y usuario, no necesita crear sucursal',
'if nvl(:P129_ES_USUARIO,''NO'') = ''SI'' and :P129_SUC_ID_SUCURSAL is null then ',
'    if nvl(:P129_ES_CLIENTE,''NO'') = ''NO'' then',
'        raise_application_error(-20000,''Defina sucursal del usuario para continuar.'');',
'    end if;    ',
'end if;',
'if nvl(:P129_ES_USUARIO,''NO'') = ''NO'' then ',
'  :P129_USU_ID_USUARIO  := null;',
'  :P129_SUC_ID_SUCURSAL := null;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Verifique sucursal del usuario.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>59172460211465426
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(132901408910472164)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(208489353160269311)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Crear o Editar Entidad'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>59168389846465424
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(132905861173472167)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>59172842109465427
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(132900919965472164)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(208489353160269311)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear o Editar Entidad'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>59167900901465424
);
wwv_flow_imp.component_end;
end;
/
