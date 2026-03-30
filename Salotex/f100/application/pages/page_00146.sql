prompt --application/pages/page_00146
begin
--   Manifest
--     PAGE: 00146
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
 p_id=>146
,p_name=>unistr('Crear/editar licitaci\00F3n')
,p_alias=>'CREAR-EDITAR-LICITACION'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Crear/editar licitaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#mascara_fecha_hora.js'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'mascaraFechaHoraRegex("#P146_FECHA_PUBLICACION_CONVOCATORIA");',
'mascaraFechaHoraRegex("#P146_FECHA_ENTREGA_OFERTA");',
'mascaraFechaHoraRegex("#P146_FECHA_VISITA_TECNICA");',
'mascaraFechaHoraRegex("#P146_FECHA_CONTRATACION");',
'mascaraFechaHoraRegex("#P146_FECHA_FIN_ADJUDICACION");',
'mascaraFechaHoraRegex("#P146_FECHA_ESTIMADA");',
'mascaraFechaHoraRegex("#P146_EMISION_DEL_CC");'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#template-floating-minimalista.min.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.aling_derecha {',
'    text-align: right;',
'}',
'.text-dark {',
'    color:black !important;',
'    opacity: 1 !important;',
'}',
''))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_required_role=>wwv_flow_imp.id(17504168320439176)
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17332508082376897)
,p_plug_name=>'Crear/editar licitacion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_LICITACION,',
'       FECHA_INSERT,',
'       USUARIO_INSERT,',
'       CONVOCATORIA_SLUG,',
'       NRO_LICITACION,',
'       NOMBRE_LICITACION,',
'       TIPO_PROCEDIMIENTO,',
'       CATEGORIA,',
'       CONVOCANTE,',
'       ENT_ID_ENTIDAD_CONVOCANTE,',
'       ETA_ID_ETAPA,',
'       FECHA_ENTREGA_OFERTA,',
'       TIPO_LICITACION,',
'       FECHA_ESTIMADA,',
'       FECHA_PUBLICACION_CONVOCATORIA,',
'       ENT_ID_ENTIDAD_VENDEDOR,',
'       FECHA_VISITA_TECNICA,',
'       OBSERVACION,',
'       TIPO_DE_GARANTIA,',
'       FECHA_CONTRATACION,',
'       FECHA_FIN_ADJUDICACION,',
'       CODIGO_CONTRATACION,',
'       MON_ID_MONEDA,',
'       TIPO_CAMBIO,',
'       MONTO_ADJUDICADO,',
'       EMISION_DEL_CC,',
'       MONTO_ESTIMADO',
'  from LICITACION'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17351332070376935)
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
 p_id=>wwv_flow_imp.id(17351738494376935)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(17351332070376935)
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
 p_id=>wwv_flow_imp.id(17353185424376939)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(17351332070376935)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P146_ID_LICITACION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(17503992199437799)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(20341115690072449)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(17351332070376935)
,p_button_name=>'COMISION'
,p_button_static_id=>'BTN_COMISION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>unistr('Comisi\00F3n')
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:154:&SESSION.::&DEBUG.:154:P154_P_ID_LICITACION,P154_ID_LICITACION,P154_P_MONTO_LICITACION:&P146_ID_LICITACION.,&P146_ID_LICITACION.,&P146_MONTO_ADJUDICADO.'
,p_button_condition=>':P146_ID_LICITACION IS NOT NULL AND :P146_ETA_ID_ETAPA IN (''ADJU'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(25974932763007944)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(20338357772072421)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(17351332070376935)
,p_button_name=>'ARTICULOS'
,p_button_static_id=>'BTN_ARTICULOS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>unistr('Art\00EDculos')
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:152:&SESSION.::&DEBUG.:152:P152_P_ID_LICITACION,P152_P_ETAPA:&P146_ID_LICITACION.,&P146_ETA_ID_ETAPA.'
,p_button_condition=>':P146_ID_LICITACION IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(24003974348488334)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17412796677706250)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(17351332070376935)
,p_button_name=>'POLIZAS'
,p_button_static_id=>'BTN_POLIZAS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>unistr('P\00F3lizas ')
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:149:&SESSION.::&DEBUG.:146:P149_P_ID_LICITACION:&P146_ID_LICITACION.'
,p_button_condition=>':P146_ID_LICITACION IS NOT NULL AND :P146_ENT_ID_ENTIDAD_CONVOCANTE IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(19733791121314938)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17410919534706232)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(17351332070376935)
,p_button_name=>'ADJUNTOS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Adjuntos'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:147:&SESSION.::&DEBUG.:147:P147_P_ID_LICITACION:&P146_ID_LICITACION.'
,p_button_condition=>':P146_ID_LICITACION IS NOT NULL AND :P146_ENT_ID_ENTIDAD_CONVOCANTE IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17410449404706227)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(17351332070376935)
,p_button_name=>'CONTACTOS'
,p_button_static_id=>'BTN_IR_CONTACTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Contactos'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12:P12_ID_ENTIDAD:&P146_ENT_ID_ENTIDAD_CONVOCANTE.'
,p_button_condition=>':P146_ID_LICITACION IS NOT NULL AND :P146_ENT_ID_ENTIDAD_CONVOCANTE IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17353579139376939)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(17351332070376935)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition=>'P146_ID_LICITACION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(17503585537436192)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17353946830376940)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(17351332070376935)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P146_ID_LICITACION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(17503746568436951)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15933031225247307)
,p_name=>'P146_MONTO_ESTIMADO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>'Monto estimado'
,p_source=>'MONTO_ESTIMADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>30
,p_tag_css_classes=>'aling_derecha'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    '    decimalPlaces: 0',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17332863552376904)
,p_name=>'P146_ID_LICITACION'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Licitacion'
,p_source=>'ID_LICITACION'
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
 p_id=>wwv_flow_imp.id(17333221391376911)
,p_name=>'P146_FECHA_INSERT'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>'Fecha insertado'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_INSERT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>2
,p_display_when=>'P146_ID_LICITACION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17333636833376913)
,p_name=>'P146_USUARIO_INSERT'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>'Usuario inserto'
,p_source=>'USUARIO_INSERT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P146_ID_LICITACION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17334013565376913)
,p_name=>'P146_CONVOCATORIA_SLUG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_source=>'CONVOCATORIA_SLUG'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17334460716376913)
,p_name=>'P146_NRO_LICITACION'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>unistr('Nro. licitaci\00F3n')
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'NRO_LICITACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17334862596376913)
,p_name=>'P146_NOMBRE_LICITACION'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>unistr('Nombre licitaci\00F3n')
,p_source=>'NOMBRE_LICITACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>500
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17335268549376914)
,p_name=>'P146_TIPO_PROCEDIMIENTO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>'Tipo Procedimiento'
,p_source=>'TIPO_PROCEDIMIENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(17335669853376914)
,p_name=>'P146_CATEGORIA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>'Categoria'
,p_source=>'CATEGORIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(17336039514376914)
,p_name=>'P146_CONVOCANTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>'Convocante (dato importado desde csv)'
,p_source=>'CONVOCANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17336414463376914)
,p_name=>'P146_ENT_ID_ENTIDAD_CONVOCANTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>'Entidad (id)'
,p_source=>'ENT_ID_ENTIDAD_CONVOCANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ENTIDAD_ESTATAL_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.nombre d',
'       ,e.id_entidad r',
'FROM entidad e, tipo_documento t',
'WHERE e.es_cliente = ''SI''',
'AND e.es_estatal = ''SI''',
'AND e.estado = ''ACTIVO''',
'AND t.id_tipo_documento = e.tip_id_tipo_documento'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'ID entidad',
  'width', '600')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17336816789376916)
,p_name=>'P146_ETA_ID_ETAPA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>'Etapa convocatoria'
,p_source=>'ETA_ID_ETAPA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ETAPA_CONVOCATORIA'
,p_lov=>'.'||wwv_flow_imp.id(17386699805584356)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17337501556376926)
,p_name=>'P146_FECHA_ENTREGA_OFERTA'
,p_source_data_type=>'DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>'Fecha entrega oferta'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_ENTREGA_OFERTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(17337909345376927)
,p_name=>'P146_TIPO_LICITACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>unistr('Tipo licitaci\00F3n')
,p_source=>'TIPO_LICITACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(17338367053376927)
,p_name=>'P146_FECHA_ESTIMADA'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>'Fecha estimada'
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'FECHA_ESTIMADA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(17338748485376927)
,p_name=>'P146_FECHA_PUBLICACION_CONVOCATORIA'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>unistr('Fecha publicaci\00F3n conv.')
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_PUBLICACION_CONVOCATORIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(17339110198376928)
,p_name=>'P146_ENT_ID_ENTIDAD_VENDEDOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_source=>'ENT_ID_ENTIDAD_VENDEDOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17339517780376928)
,p_name=>'P146_FECHA_VISITA_TECNICA'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>unistr('Fecha visita t\00E9cnica')
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_VISITA_TECNICA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(17339912559376928)
,p_name=>'P146_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>1000
,p_cHeight=>4
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
 p_id=>wwv_flow_imp.id(17340338004376929)
,p_name=>'P146_TIPO_DE_GARANTIA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>unistr('Tipo de garant\00EDa')
,p_source=>'TIPO_DE_GARANTIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(17340773779376929)
,p_name=>'P146_FECHA_CONTRATACION'
,p_source_data_type=>'DATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>unistr('Fecha contrataci\00F3n')
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_CONTRATACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(17341177454376929)
,p_name=>'P146_FECHA_FIN_ADJUDICACION'
,p_source_data_type=>'DATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>unistr('Fin adjudicaci\00F3n')
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_FIN_ADJUDICACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(17341502891376929)
,p_name=>'P146_CODIGO_CONTRATACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>unistr('Codigo contrataci\00F3n(CC)')
,p_source=>'CODIGO_CONTRATACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(17341985378376930)
,p_name=>'P146_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>'Moneda'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA'
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17342386389376930)
,p_name=>'P146_TIPO_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_source=>'TIPO_CAMBIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17342722661376930)
,p_name=>'P146_MONTO_ADJUDICADO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>'Monto adjudicado'
,p_source=>'MONTO_ADJUDICADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'aling_derecha'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    '    decimalPlaces: 0',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17343120089376930)
,p_name=>'P146_EMISION_DEL_CC'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_item_source_plug_id=>wwv_flow_imp.id(17332508082376897)
,p_prompt=>unistr('Emisi\00F3n del C.C.')
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'EMISION_DEL_CC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17351869600376935)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(17351738494376935)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17352682519376938)
,p_event_id=>wwv_flow_imp.id(17351869600376935)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(34544590220185331)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Nuevo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  dummy   NUMBER;',
'BEGIN',
'  SELECT /*+ INDEX(l LICITACION_UK)*/ 1',
'  INTO dummy',
'  FROM licitacion l',
'  WHERE l.nro_licitacion = TO_NUMBER(:P146_NRO_LICITACION,''999G999G999'')',
'  ;',
'  :P146_ID_LICITACION := SEQ_LICITACION.NEXTVAL;',
'EXCEPTION',
'  WHEN No_Data_Found THEN',
'    :P146_ID_LICITACION := TO_NUMBER(:P146_NRO_LICITACION,''999G999G999'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(17353946830376940)
,p_internal_uid=>34544590220185331
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(17354773872376941)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(17332508082376897)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Crear/editar licitacion'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>17354773872376941
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(17355134083376941)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>17355134083376941
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(17354337007376940)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(17332508082376897)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear/editar licitacion'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>17354337007376940
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(17407885192706201)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P146_ID_LICITACION IS NULL THEN',
'    :P146_MON_ID_MONEDA := 1;',
'    :P146_TIPO_CAMBIO := 1;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>17407885192706201
);
wwv_flow_imp.component_end;
end;
/
