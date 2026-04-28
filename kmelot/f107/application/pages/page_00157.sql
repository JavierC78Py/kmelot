prompt --application/pages/page_00157
begin
--   Manifest
--     PAGE: 00157
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
 p_id=>157
,p_name=>'Crear/editar reserva'
,p_alias=>'CREAR-EDITAR-RESERVA'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear/editar reserva'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function setear() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("Setear", {',
'        pageItems: [',
'            "P157_NOMBRE_PACIENTE"',
'            ,"P157_TIP_ID_TIPO_DOCUMENTO"',
'            ,"P157_NUMERO_DOCUMENTO"',
'            ,"P157_CELULAR_PACIENTE"',
'            ,"P157_CORREO_PACIENTE"',
'            ,"P157_ENT_ID_ENTIDAD_PREPAGA"',
'    ]},',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
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
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'document.getElementById(''P157_CELULAR_PACIENTE'').addEventListener(''input'',function(y) {',
'    var output = y.target.value.replace(/\D/g,'''').match(/(\d{0,3})(\d{0,3})(\d{0,6})/);',
'    y.target.value = !output[2]?output[1]:''(''+output[1]+'')''+output[2]+(output[3]?''-''+output[3]:'''');',
'})',
''))
,p_css_file_urls=>'#WORKSPACE_IMAGES#template-floating-minimalista.min.css'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(147209388478524007)
,p_plug_name=>'Crear/editar reserva'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'RESERVA_CONSULTA'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(147227035199524022)
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
 p_id=>wwv_flow_imp.id(147227496018524022)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(147227035199524022)
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
 p_id=>wwv_flow_imp.id(147228904820524023)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(147227035199524022)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P157_ID_RESERVA_CONSULTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(147358390249921197)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(147229312083524023)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(147227035199524022)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P157_ID_RESERVA_CONSULTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(147358007036919099)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(147229688523524024)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(147227035199524022)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P157_ID_RESERVA_CONSULTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(147358187869919964)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(147396618635953347)
,p_branch_name=>'Ir a 140'
,p_branch_action=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.::P140_ID_RESERVA_CONSULTA,P140_ESTADO_RESERVA:&P157_ID_RESERVA_CONSULTA.,&P157_ESTADO_TURNO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147209720754524008)
,p_name=>'P157_ID_RESERVA_CONSULTA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_source=>'ID_RESERVA_CONSULTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147210035491524010)
,p_name=>'P157_ENT_ID_ENTIDAD_PRESTADOR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>'Prestador'
,p_source=>'ENT_ID_ENTIDAD_PRESTADOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ENTIDAD_ALL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nombre as d',
'      ,id_entidad as r',
'from entidad'))
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609122147107268652
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147210771040524013)
,p_name=>'P157_SUC_ID_SUC_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>'Sucursal'
,p_source=>'SUC_ID_SUC_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SUCURSAL_ENTIDAD_ALL'
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609122147107268652
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147211200358524013)
,p_name=>'P157_ESP_ID_ESPECIALIDAD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>'Especialidad'
,p_source=>'ESP_ID_ESPECIALIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ESPECIALIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_ESPECIALIDAD AS R',
'      ,DESCRIPCION AS D',
'from ESPECIALIDAD'))
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147211891185524014)
,p_name=>'P157_FECHA_TURNO'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>'Fecha turno'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_TURNO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'tabindex="-1"'
,p_field_template=>1609122147107268652
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147212283035524014)
,p_name=>'P157_ESTADO_TURNO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>'Estado turno'
,p_source=>'ESTADO_TURNO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_tag_attributes=>'tabindex="-1"'
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
 p_id=>wwv_flow_imp.id(147212663506524014)
,p_name=>'P157_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_cMaxlength=>100
,p_cHeight=>2
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
 p_id=>wwv_flow_imp.id(147213113777524014)
,p_name=>'P157_ENT_ID_ENTIDAD_PACIENTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>'Paciente'
,p_source=>'ENT_ID_ENTIDAD_PACIENTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_PACIENTE_VAR_COL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select numero_documento||'' - ''||nombre as d',
'      ,id_entidad as r',
'      ,tip_id_tipo_documento',
'      ,numero_documento',
'      ,nombre',
'      ,nro_celular',
'      ,correo',
'from entidad',
'where es_paciente = ''SI'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'TIP_ID_TIPO_DOCUMENTO:P157_TIP_ID_TIPO_DOCUMENTO,NUMERO_DOCUMENTO:P157_NUMERO_DOCUMENTO,NRO_CELULAR:P157_CELULAR_PACIENTE,CORREO:P157_CORREO_PACIENTE,NOMBRE:P157_NOMBRE_PACIENTE',
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Paciente',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147213458055524015)
,p_name=>'P157_TIP_ID_TIPO_DOCUMENTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>'Tipo documento'
,p_source=>'TIP_ID_TIPO_DOCUMENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TIPO_DOCUMENTO_ABREVIATURA'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147213896145524015)
,p_name=>'P157_NUMERO_DOCUMENTO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>'Numero documento'
,p_source=>'NUMERO_DOCUMENTO'
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
 p_id=>wwv_flow_imp.id(147214323431524015)
,p_name=>'P157_NOMBRE_PACIENTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>'Nombre paciente'
,p_source=>'NOMBRE_PACIENTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(147214635689524015)
,p_name=>'P157_CELULAR_PACIENTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>'Celular paciente'
,p_source=>'CELULAR_PACIENTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
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
 p_id=>wwv_flow_imp.id(147215044357524015)
,p_name=>'P157_CORREO_PACIENTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>'Correo paciente'
,p_source=>'CORREO_PACIENTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(147215449650524015)
,p_name=>'P157_MOTIVO_CONSULTA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>'Motivo de la consulta'
,p_source=>'MOTIVO_CONSULTA'
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
 p_id=>wwv_flow_imp.id(147215866049524016)
,p_name=>'P157_DIA_ID_DIAGNOSTICO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>unistr('Diagn\00F3stico')
,p_source=>'DIA_ID_DIAGNOSTICO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_DIAGNOSTICO'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', unistr('Diagn\00F3stico'),
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147216303091524016)
,p_name=>'P157_FECHA_RESERVA'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_source=>'FECHA_RESERVA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147216684679524016)
,p_name=>'P157_FECHA_CANCELA'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_source=>'FECHA_CANCELA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147217078086524016)
,p_name=>'P157_OBS_CANCELACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_source=>'OBS_CANCELACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147217467275524016)
,p_name=>'P157_HORA_CONFIRMA'
,p_source_data_type=>'DATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_source=>'HORA_CONFIRMA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147217827532524017)
,p_name=>'P157_HORA_RECEPCION'
,p_source_data_type=>'DATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_source=>'HORA_RECEPCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147218280806524017)
,p_name=>'P157_HORA_ENTRADA_CONSULTA'
,p_source_data_type=>'DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_source=>'HORA_ENTRADA_CONSULTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147218721844524017)
,p_name=>'P157_HORA_SALIDA_CONSULTA'
,p_source_data_type=>'DATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_source=>'HORA_SALIDA_CONSULTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147219077319524017)
,p_name=>'P157_FECHA_INSERTADO'
,p_source_data_type=>'DATE'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_source=>'FECHA_INSERTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147219464830524018)
,p_name=>'P157_ENT_ID_ENTIDAD_PREPAGA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_item_source_plug_id=>wwv_flow_imp.id(147209388478524007)
,p_prompt=>'Prepaga'
,p_source=>'ENT_ID_ENTIDAD_PREPAGA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ENTIDAD_PREPAGA_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nombre as d',
'      ,id_entidad as r',
'from entidad',
'where es_prepaga = ''SI''',
'and estado = ''ACTIVO'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cSize=>30
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
  'min_chars', '0',
  'title', 'Prepaga')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(147227580773524022)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(147227496018524022)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(147228383825524023)
,p_event_id=>wwv_flow_imp.id(147227580773524022)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(147395743927953339)
,p_name=>'Habilita campos'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P157_ENT_ID_ENTIDAD_PACIENTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(147395854025953340)
,p_event_id=>wwv_flow_imp.id(147395743927953339)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.item("P157_ENT_ID_ENTIDAD_PACIENTE").isEmpty()) {',
'    $("#P157_TIP_ID_TIPO_DOCUMENTO").prop("disabled", false);',
'    $("#P157_NUMERO_DOCUMENTO").prop("disabled", false);',
'    $("#P157_CELULAR_PACIENTE").prop("disabled", false);',
'    $("#P157_CORREO_PACIENTE").prop("disabled", false);',
'    $("#P157_NOMBRE_PACIENTE").prop("disabled", false);',
'',
'    $("#P157_TIP_ID_TIPO_DOCUMENTO").attr("tabindex", "0");',
'    $("#P157_NUMERO_DOCUMENTO").attr("tabindex", "0");',
'    $("#P157_CELULAR_PACIENTE").attr("tabindex", "0");',
'    $("#P157_CORREO_PACIENTE").attr("tabindex", "0");',
'    $("#P157_NOMBRE_PACIENTE").attr("tabindex", "0");',
'} else {',
'    $("#P157_TIP_ID_TIPO_DOCUMENTO").addClass("apex_disabled");',
'    $("#P157_NUMERO_DOCUMENTO").addClass("apex_disabled");',
'    $("#P157_CELULAR_PACIENTE").addClass("apex_disabled");',
'    $("#P157_CORREO_PACIENTE").addClass("apex_disabled");',
'    $("#P157_NOMBRE_PACIENTE").addClass("apex_disabled");',
'',
'    $("#P157_TIP_ID_TIPO_DOCUMENTO").attr("tabindex", "-1");',
'    $("#P157_NUMERO_DOCUMENTO").attr("tabindex", "-1");',
'    $("#P157_CELULAR_PACIENTE").attr("tabindex", "-1");',
'    $("#P157_CORREO_PACIENTE").attr("tabindex", "-1");',
'    $("#P157_NOMBRE_PACIENTE").attr("tabindex", "-1");',
'}',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(147396202722953343)
,p_name=>'Save'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(147229312083524023)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(147396293835953344)
,p_event_id=>wwv_flow_imp.id(147396202722953343)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setear();',
'apex.submit({',
'    request: "SAVE"',
'   ,shoWait: true ',
'})'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(147395976555953341)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar paciente'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_reserva_consulta.p_guarda_paciente(',
'    p_id_paciente => :P157_ENT_ID_ENTIDAD_PACIENTE',
'  , pi_nombre => :P157_NOMBRE_PACIENTE',
'  , pi_id_tipo_documento => :P157_TIP_ID_TIPO_DOCUMENTO',
'  , pi_numero_documento => :P157_NUMERO_DOCUMENTO',
'  , pi_nro_celular => :P157_CELULAR_PACIENTE',
'  , pi_correo => :P157_CORREO_PACIENTE',
'  , pi_id_prepaga => :P157_ENT_ID_ENTIDAD_PREPAGA',
');',
'IF :P157_ESTADO_TURNO = ''DISPONIBLE'' THEN',
'    :P157_ESTADO_TURNO := ''RESERVADO'';',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>28162450984297203
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(147230472565524024)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(147209388478524007)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Crear/editar reserva'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Guardado'
,p_internal_uid=>27996946993867886
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(147230030454524024)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(147209388478524007)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear/editar reserva'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>27996504882867886
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(147396036504953342)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Setear'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'  AS',
'  BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'  END output_json_item;',
'BEGIN',
'    apex_util.set_session_state(',
'        p_name  => ''P157_NOMBRE_PACIENTE'',',
'        p_value => :P157_NOMBRE_PACIENTE',
'    );',
'    apex_util.set_session_state(',
'        p_name  => ''P157_TIP_ID_TIPO_DOCUMENTO'',',
'        p_value => :P157_TIP_ID_TIPO_DOCUMENTO',
'    );',
'    apex_util.set_session_state(',
'        p_name  => ''P157_NUMERO_DOCUMENTO'',',
'        p_value => :P157_NUMERO_DOCUMENTO',
'    );',
'    apex_util.set_session_state(',
'        p_name  => ''P157_CELULAR_PACIENTE'',',
'        p_value => :P157_CELULAR_PACIENTE',
'    );',
'    apex_util.set_session_state(',
'        p_name  => ''P157_CORREO_PACIENTE'',',
'        p_value => :P157_CORREO_PACIENTE',
'    );',
'    apex_util.set_session_state(',
'        p_name  => ''P157_ENT_ID_ENTIDAD_PREPAGA'',',
'        p_value => :P157_ENT_ID_ENTIDAD_PREPAGA',
'    );  ',
'  apex_json.open_object;',
'  apex_json.write(''success'', TRUE);',
'  apex_json.open_array(''items'');',
'  apex_json.close_array;',
'  apex_json.close_object;  ',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>28162510933297204
);
wwv_flow_imp.component_end;
end;
/
