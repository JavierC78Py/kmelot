prompt --application/pages/page_00153
begin
--   Manifest
--     PAGE: 00153
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
 p_id=>153
,p_name=>'Crear/editar articulo'
,p_alias=>'CREAR-EDITAR-ARTICULO'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear/editar articulo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function() {',
'if (!apex.item("P153_ID_DET_LICITACION").isEmpty()) {',
'    $("#P153_PRODUCTO_CODIGO").addClass("apex_disabled");',
'    $("#P153_PRODUCTO_CODIGO").attr("tabindex", "-1");',
'}',
'},250)'))
,p_css_file_urls=>'#WORKSPACE_IMAGES#template-floating-minimalista.min.css'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'900'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(143198894294121681)
,p_plug_name=>unistr('Crear/editar art\00EDculo')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_DET_LICITACION,',
'       FECHA_INSERT,',
'       LIC_ID_LICITACION,',
'       ETA_ID_ETAPA,',
'       ID,',
'       NUMERO,',
'       PRODUCTO_CODIGO,',
'       PRODUCTO_NOMBRE_CATALOGO,',
'       PRODUCTO_NOMBRE_CONVOCANTE,',
'       PRECIO_UNITARIO,',
'       CANTIDAD_MINIMA,',
'       CANTIDAD,',
'       MONTO_MINIMO,',
'       MONTO,',
'       MONEDA,',
'       A_UNIDAD_MEDIDA,',
'       UNIDAD_MEDIDA,',
'       A_PRESENTACION,',
'       PRESENTACION,',
'       ZONA,',
'       A_CONTRATO_ABIERTO,',
'       CONTRATO_ABIERTO,',
'       ABASTECIMIENTO_SIMULTANEO,',
'       SUB_ITEM,',
'       PLANTILLA,',
'       ESTADO_IMPUGNACION,',
'       LOTE',
'  from LICITACION_DET_PRODUCTO'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(143218010300121696)
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
 p_id=>wwv_flow_imp.id(143218386692121696)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(143218010300121696)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(143219794870121698)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(143218010300121696)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P153_ID_DET_LICITACION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(143236830180139514)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(143220132084121698)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(143218010300121696)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition=>'P153_ID_DET_LICITACION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(143237270745143567)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(143220572848121698)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(143218010300121696)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P153_ID_DET_LICITACION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(143237104209142103)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(143199150305121681)
,p_name=>'P153_ID_DET_LICITACION'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Det Licitacion'
,p_source=>'ID_DET_LICITACION'
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
 p_id=>wwv_flow_imp.id(143199606566121684)
,p_name=>'P153_FECHA_INSERT'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_default=>'to_char(current_date,''dd-mm-yyyy hh24:mi'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Fecha insertado'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_INSERT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>3
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(143199995306121685)
,p_name=>'P153_LIC_ID_LICITACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_source=>'LIC_ID_LICITACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(143200717847121687)
,p_name=>'P153_ETA_ID_ETAPA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Etapa'
,p_source=>'ETA_ID_ETAPA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>4
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(143201110275121687)
,p_name=>'P153_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(143201514744121687)
,p_name=>'P153_NUMERO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>unistr('N\00FAmero')
,p_source=>'NUMERO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'center',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(143201908709121688)
,p_name=>'P153_PRODUCTO_CODIGO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>unistr('Producto c\00F3digo')
,p_source=>'PRODUCTO_CODIGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(143202609646121688)
,p_name=>'P153_PRODUCTO_NOMBRE_CATALOGO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Nombre catalogo'
,p_source=>'PRODUCTO_NOMBRE_CATALOGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(143202959384121688)
,p_name=>'P153_PRODUCTO_NOMBRE_CONVOCANTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Nombre convocante'
,p_source=>'PRODUCTO_NOMBRE_CONVOCANTE'
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
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(143203386265121688)
,p_name=>'P153_PRECIO_UNITARIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Precio unitario'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'PRECIO_UNITARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(143203791788121689)
,p_name=>'P153_CANTIDAD_MINIMA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Cantidad minima'
,p_source=>'CANTIDAD_MINIMA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_tag_attributes=>'tabindex="-1"'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(143204157988121689)
,p_name=>'P153_CANTIDAD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Cantidad'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'CANTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(143204622294121689)
,p_name=>'P153_MONTO_MINIMO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Monto minimo'
,p_source=>'MONTO_MINIMO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(143205019060121689)
,p_name=>'P153_MONTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Monto'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'MONTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(143205410007121690)
,p_name=>'P153_MONEDA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Moneda'
,p_source=>'MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA_ABREV_RETURN'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select abreviatura as r',
',abreviatura as d',
'from moneda'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(143206193953121690)
,p_name=>'P153_UNIDAD_MEDIDA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_source=>'UNIDAD_MEDIDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(143206996269121691)
,p_name=>'P153_PRESENTACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_source=>'PRESENTACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(143207416181121691)
,p_name=>'P153_ZONA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Zona'
,p_source=>'ZONA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(143208199078121691)
,p_name=>'P153_CONTRATO_ABIERTO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_source=>'CONTRATO_ABIERTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(143208540375121691)
,p_name=>'P153_ABASTECIMIENTO_SIMULTANEO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Abastecimiento simultaneo'
,p_source=>'ABASTECIMIENTO_SIMULTANEO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(143208931017121692)
,p_name=>'P153_SUB_ITEM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Sub item'
,p_source=>'SUB_ITEM'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(143209336343121692)
,p_name=>'P153_PLANTILLA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Plantilla'
,p_source=>'PLANTILLA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(143209762769121692)
,p_name=>'P153_ESTADO_IMPUGNACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>unistr('Estado impugnaci\00F3n')
,p_source=>'ESTADO_IMPUGNACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(153031683598325668)
,p_name=>'P153_LOTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Lote'
,p_source=>'LOTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'center',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(154707068340352175)
,p_name=>'P153_A_UNIDAD_MEDIDA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Uni.medida'
,p_source=>'A_UNIDAD_MEDIDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_UNIDAD_MEDIDA_ABREV_RETURN'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select abreviatura as r',
',descripcion||'' (''||abreviatura||'')'' as d',
'from unidad_medida'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(154707212306352176)
,p_name=>'P153_A_PRESENTACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>unistr('Presentaci\00F3n')
,p_source=>'A_PRESENTACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(154707262456352177)
,p_name=>'P153_A_CONTRATO_ABIERTO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_item_source_plug_id=>wwv_flow_imp.id(143198894294121681)
,p_prompt=>'Contrato abierto'
,p_source=>'A_CONTRATO_ABIERTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_tag_attributes=>'tabindex="-1"'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(143218467878121696)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(143218386692121696)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(143219225995121697)
,p_event_id=>wwv_flow_imp.id(143218467878121696)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(147397963286953361)
,p_name=>'Set monto'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P153_PRECIO_UNITARIO,P153_CANTIDAD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(147398064464953362)
,p_event_id=>wwv_flow_imp.id(147397963286953361)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P153_MONTO := TO_NUMBER(NVL(:P153_CANTIDAD,0),''999G999G999D99'') * TO_NUMBER(NVL(:P153_PRECIO_UNITARIO,0),''999G999G999D99'');'
,p_attribute_02=>'P153_PRECIO_UNITARIO,P153_CANTIDAD'
,p_attribute_03=>'P153_MONTO'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(147399742133953379)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar ficha producto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_descripcion  producto.descripcion%TYPE;',
'BEGIN ',
'  SELECT p.descripcion',
'  INTO v_descripcion',
'  FROM producto p',
'  WHERE p.producto_codigo = :P153_PRODUCTO_CODIGO;',
'',
'  IF v_descripcion != :P153_PRODUCTO_NOMBRE_CONVOCANTE THEN',
'    UPDATE producto p',
'    SET p.descripcion = :P153_PRODUCTO_NOMBRE_CONVOCANTE',
'    WHERE p.producto_codigo = :P153_PRODUCTO_CODIGO;',
'  END IF;',
'EXCEPTION',
'  WHEN No_Data_Found THEN',
'    INSERT INTO producto (',
'            id_producto',
'          , descripcion',
'          , ori_id_origen',
'          , mar_id_marca',
'          , gru_id_grupo',
'          , iva_id_iva',
'          , codigo_barra_fabrica',
'          , codigo_barra_interno',
'          , estado',
'          , cue_con_id_cta_compra',
'          , cue_con_id_cta_venta',
'          , cue_con_id_cta_costo_v',
'          , cue_con_id_cta_devol_cli',
'          , cue_con_id_cta_dscto_prov',
'          , es_unico',
'          , nombre_archivo',
'          , mime_type_archivo',
'          , stock_minimo',
'          , tipo',
'          , producto_codigo',
'    ) VALUES (',
'            NULL    --id_producto',
'          , :P153_PRODUCTO_NOMBRE_CONVOCANTE  --descripcion',
'          , NULL    --ori_id_origen',
'          , NULL    --mar_id_marca',
'          , 1001001 --gru_id_grupo',
'          , 1       --iva_id_iva',
'          , NULL    --codigo_barra_fabrica',
'          , NULL    --codigo_barra_interno',
'          , ''ACTIVO''--estado',
'          , NULL    --cue_con_id_cta_compra',
'          , NULL    --cue_con_id_cta_venta',
'          , NULL    --cue_con_id_cta_costo_v',
'          , NULL    --cue_con_id_cta_devol_cli',
'          , NULL    --cue_con_id_cta_dscto_prov',
'          , ''NO''    --es_unico',
'          , NULL    --nombre_archivo',
'          , NULL    --mime_type_archivo',
'          , NULL    --stock_minimo',
'          , ''ART''   --tipo',
'          , :P153_PRODUCTO_CODIGO --producto_codigo',
'    );',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>28166216562297241
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(147399842080953380)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar ficha producto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_error VARCHAR2(1000);',
'BEGIN',
'  DELETE producto p',
'  WHERE p.producto_codigo = :P153_PRODUCTO_CODIGO;',
'  COMMIT;',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    v_error := SQLERRM;',
'    IF SQLCODE = -2292 THEN',
'      NULL;',
'    ELSE',
'      Raise_Application_Error(-20999,v_error);',
'    END IF;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>28166316509297242
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(143221414547121699)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(143198894294121681)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Crear/editar articulo'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23987888975465561
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(143221801884121699)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>23988276312465561
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(143220949745121698)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(143198894294121681)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear/editar articulo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23987424173465560
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(147397904511953360)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P153_ID_DET_LICITACION IS NULL THEN',
'    SELECT nvl(Max(l.lote),1)',
'    INTO :P153_LOTE',
'    FROM licitacion_det_producto l',
'    WHERE l.lic_id_licitacion = :P153_LIC_ID_LICITACION;',
'',
'    :P153_LOTE := 1;',
'    SELECT Max(l.numero)+1',
'    INTO :P153_NUMERO',
'    FROM licitacion_det_producto l',
'    WHERE l.lic_id_licitacion = :P153_LIC_ID_LICITACION',
'    AND l.lote = :P153_LOTE;',
'    :P153_MONEDA := ''PYG'';',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>28164378940297222
);
wwv_flow_imp.component_end;
end;
/
