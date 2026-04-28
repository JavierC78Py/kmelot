prompt --application/pages/page_00131
begin
--   Manifest
--     PAGE: 00131
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
 p_id=>131
,p_name=>'Crear o Editar Servicio'
,p_alias=>'CREAR-O-EDITAR-SERVICIO'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear o Editar Servicio'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_javascript_code_onload=>'$("#P131_ID_PRODUCTO").prop( ''readOnly'', true);'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.aling_derecha {',
'text-align: right;}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1200'
,p_protection_level=>'C'
,p_read_only_when_type=>'EXPRESSION'
,p_read_only_when=>'nvl(:P131_SOLO_CONSULTA,''NO'') = ''SI'''
,p_read_only_when2=>'PLSQL'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(270073417947357944)
,p_plug_name=>'Crear o Editar Producto'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_PRODUCTO,',
'       DESCRIPCION,',
'       ORI_ID_ORIGEN,',
'       MAR_ID_MARCA,',
'       GRU_ID_GRUPO,',
'       IVA_ID_IVA,',
'       CODIGO_BARRA_FABRICA,',
'       CODIGO_BARRA_INTERNO,',
'       ESTADO,',
'       CUE_CON_ID_CTA_COMPRA,',
'       CUE_CON_ID_CTA_VENTA,',
'       CUE_CON_ID_CTA_COSTO_V,',
'       CUE_CON_ID_CTA_DEVOL_CLI,',
'       CUE_CON_ID_CTA_DSCTO_PROV,',
'       ES_UNICO,',
'       NOMBRE_ARCHIVO,',
'       MIME_TYPE_ARCHIVO,',
'       STOCK_MINIMO,',
'       TIPO',
'  from PRODUCTO'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(253416930142912738)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'CHANGE'
,p_button_condition=>':P131_ID_PRODUCTO IS NOT NULL AND nvl(:P131_SOLO_CONSULTA,''NO'') != ''SI'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(253515734866884083)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(253417218245912739)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(253417594796912740)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'CREATE'
,p_button_condition=>'P131_ID_PRODUCTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(253515865102893787)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(253418039566912740)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>':P131_ID_PRODUCTO IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(253516125037904959)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(253437836068912797)
,p_branch_name=>'Go To Page 130'
,p_branch_action=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(154704102084352145)
,p_name=>'P131_ORI_ID_ORIGEN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_source=>'ORI_ID_ORIGEN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(154704163971352146)
,p_name=>'P131_MAR_ID_MARCA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_source=>'MAR_ID_MARCA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(154704283716352147)
,p_name=>'P131_CODIGO_BARRA_FABRICA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_source=>'CODIGO_BARRA_FABRICA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(154704351593352148)
,p_name=>'P131_CODIGO_BARRA_INTERNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_source=>'CODIGO_BARRA_INTERNO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(154704497106352149)
,p_name=>'P131_STOCK_MINIMO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_source=>'STOCK_MINIMO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(261554233421632575)
,p_name=>'P131_GRU_ID_GRUPO_N1'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_prompt=>'Familia'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_GRUPO_SRV_NIVEL_1'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select grupo_nivel_1 r, descripcion d',
'from grupo_producto',
'where estado = ''ACTIVO''',
'and tipo = ''SRV''',
'and grupo_nivel_2 is null',
'and grupo_nivel_3 is null',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(261554537256632578)
,p_name=>'P131_GRU_ID_GRUPO_N2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_prompt=>'Sub familia'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select descripcion d, grupo_nivel_2 r',
'from grupo_producto',
'where grupo_nivel_1 = :P131_GRU_ID_GRUPO_N1',
'and grupo_nivel_2 is not null',
'and grupo_nivel_3 is null',
'and estado = ''ACTIVO''',
'and tipo = ''SRV'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P131_GRU_ID_GRUPO_N1'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(261555348205632586)
,p_name=>'P131_NOMBRE_ARCHIVO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_source=>'NOMBRE_ARCHIVO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(261555476267632587)
,p_name=>'P131_MIME_TYPE_ARCHIVO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_source=>'MIME_TYPE_ARCHIVO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(267999259312559952)
,p_name=>'P131_SOLO_CONSULTA'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(270076006898358016)
,p_name=>'P131_ID_PRODUCTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_prompt=>'Id servicio'
,p_source=>'ID_PRODUCTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>2
,p_display_when=>'P131_ID_PRODUCTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(270076337170358016)
,p_name=>'P131_DESCRIPCION'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DESCRIPCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
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
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(270077576768358019)
,p_name=>'P131_GRU_ID_GRUPO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_prompt=>'Grupo'
,p_source=>'GRU_ID_GRUPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select descripcion d, id_grupo r',
'from grupo_producto',
'where grupo_nivel_1 = :P131_GRU_ID_GRUPO_N1',
'and grupo_nivel_2 = :P131_GRU_ID_GRUPO_N2',
'and grupo_nivel_3 is not null',
'and estado = ''ACTIVO''',
'and tipo = ''SRV'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P131_GRU_ID_GRUPO_N1,P131_GRU_ID_GRUPO_N2'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
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
 p_id=>wwv_flow_imp.id(270077932139358020)
,p_name=>'P131_IVA_ID_IVA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_prompt=>'% I.V.A.'
,p_source=>'IVA_ID_IVA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IVA'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(270079156192358022)
,p_name=>'P131_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_default=>'ACTIVO'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ESTADO'
,p_lov=>'.'||wwv_flow_imp.id(208506997751136611)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(270079571210358023)
,p_name=>'P131_CUE_CON_ID_CTA_COMPRA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_source=>'CUE_CON_ID_CTA_COMPRA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(270079911880358024)
,p_name=>'P131_CUE_CON_ID_CTA_VENTA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_source=>'CUE_CON_ID_CTA_VENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(270080368191358025)
,p_name=>'P131_CUE_CON_ID_CTA_COSTO_V'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_source=>'CUE_CON_ID_CTA_COSTO_V'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(270080774842358025)
,p_name=>'P131_CUE_CON_ID_CTA_DEVOL_CLI'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_source=>'CUE_CON_ID_CTA_DEVOL_CLI'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(270081143395358026)
,p_name=>'P131_CUE_CON_ID_CTA_DSCTO_PROV'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_source=>'CUE_CON_ID_CTA_DSCTO_PROV'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(270081531263358027)
,p_name=>'P131_ES_UNICO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_default=>'NO'
,p_source=>'ES_UNICO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(312217586845317546)
,p_name=>'P131_TIPO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_source_plug_id=>wwv_flow_imp.id(270073417947357944)
,p_item_default=>'SRV'
,p_source=>'TIPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(253436809388912793)
,p_name=>'Cancel'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(253417218245912739)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(253437312128912796)
,p_event_id=>wwv_flow_imp.id(253436809388912793)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(154704641950352151)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Unidad medida eliminar'
,p_process_sql_clob=>'DELETE det_uni_medi_prod WHERE pro_id_producto = :P131_ID_PRODUCTO;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>35471116378696013
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(253432372952912767)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(270073417947357944)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Crear o Editar Producto'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,CREATE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>60465828317249889
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(154704573730352150)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Unidad medida crear'
,p_process_sql_clob=>'INSERT INTO det_uni_medi_prod VALUES(NULL, :P131_ID_PRODUCTO, 1, ''ACTIVO'');'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>35471048158696012
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(253432025954912765)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(270073417947357944)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear o Editar Producto'
,p_internal_uid=>60465481319249887
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(253436027430912792)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RecuperaValores'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    select g.grupo_nivel_1, g.grupo_nivel_2',
'    into :P131_GRU_ID_GRUPO_N1, :P131_GRU_ID_GRUPO_N2',
'    from grupo_producto g',
'    where g.id_grupo = :P131_GRU_ID_GRUPO;',
'EXCEPTION',
'    WHEN no_data_found then ',
'        null;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P131_ID_PRODUCTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>60469482795249914
);
wwv_flow_imp.component_end;
end;
/
