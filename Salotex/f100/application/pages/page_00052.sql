prompt --application/pages/page_00052
begin
--   Manifest
--     PAGE: 00052
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
 p_id=>52
,p_name=>unistr('Agregar o editar rol por p\00E1gina')
,p_alias=>unistr('AGREGAR-O-EDITAR-ROL-POR-P\00C1GINA')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Agregar o editar rol por p\00E1gina')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86253431514327379)
,p_plug_name=>unistr('Agregar o editar rol por p\00E1gina')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'PAGINA_ROL'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86258524578327408)
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
 p_id=>wwv_flow_imp.id(86258998500327408)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(86258524578327408)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(86260225562327412)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(86258524578327408)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P52_ID_PERMISO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(86682626975601163)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(86260682580327413)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(86258524578327408)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P52_ID_PERMISO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(86682254732599449)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(86261021309327413)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(86258524578327408)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P52_ID_PERMISO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(86682485855600274)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(84536546369826675)
,p_name=>'P52_MODULO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(86253431514327379)
,p_prompt=>unistr('M\00F3dulo')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_PAGINA_MODULO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct modulo d, modulo r',
'FROM pagina',
'order by 1 '))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_read_only_when=>'P52_ID_PERMISO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(84536696907826676)
,p_name=>'P52_GRUPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(86253431514327379)
,p_prompt=>'Grupo'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_GRUPO_PERMISO'
,p_lov=>'.'||wwv_flow_imp.id(85117714733916837)||'.'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P52_ID_PERMISO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(86253787100327382)
,p_name=>'P52_ID_PERMISO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(86253431514327379)
,p_item_source_plug_id=>wwv_flow_imp.id(86253431514327379)
,p_prompt=>'Id permiso'
,p_source=>'ID_PERMISO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>2
,p_display_when=>'P52_ID_PERMISO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86254167874327391)
,p_name=>'P52_PAG_ID_PAGINA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(86253431514327379)
,p_item_source_plug_id=>wwv_flow_imp.id(86253431514327379)
,p_prompt=>unistr('P\00E1gina')
,p_source=>'PAG_ID_PAGINA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT descripcion d, id_pagina r',
'FROM pagina',
'WHERE modulo = :P52_MODULO',
'AND grupo = :P52_GRUPO',
'ORDER BY DESCRIPCION'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P52_MODULO,P52_GRUPO'
,p_ajax_items_to_submit=>'P52_PAG_ID_PAGINA'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_read_only_when=>'P52_ID_PERMISO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609122147107268652
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
 p_id=>wwv_flow_imp.id(86254915122327404)
,p_name=>'P52_ROL_ID_ROL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(86253431514327379)
,p_item_source_plug_id=>wwv_flow_imp.id(86253431514327379)
,p_prompt=>'Rol'
,p_source=>'ROL_ID_ROL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ROL_NOMBRE'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P52_ID_PERMISO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609122147107268652
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
 p_id=>wwv_flow_imp.id(86255553754327405)
,p_name=>'P52_INSERTAR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(86253431514327379)
,p_item_source_plug_id=>wwv_flow_imp.id(86253431514327379)
,p_item_default=>'NO'
,p_prompt=>'Insertar'
,p_source=>'INSERTAR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_column=>3
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(86255953555327405)
,p_name=>'P52_ACTUALIZAR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(86253431514327379)
,p_item_source_plug_id=>wwv_flow_imp.id(86253431514327379)
,p_item_default=>'NO'
,p_prompt=>'Actualizar'
,p_source=>'ACTUALIZAR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(86256326032327405)
,p_name=>'P52_ELIMINAR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(86253431514327379)
,p_item_source_plug_id=>wwv_flow_imp.id(86253431514327379)
,p_item_default=>'NO'
,p_prompt=>'Eliminar'
,p_source=>'ELIMINAR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'NO',
  'off_value', 'NO',
  'on_label', 'SI',
  'on_value', 'SI',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(86259081176327408)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(86258998500327408)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(86259820328327412)
,p_event_id=>wwv_flow_imp.id(86259081176327408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(86261867748327415)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(86253431514327379)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>unistr('Process form Agregar o editar rol por p\00E1gina')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>12528848684320675
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(86262317816327415)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>12529298752320675
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(86261515400327415)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(86253431514327379)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>unistr('Initialize form Agregar o editar rol por p\00E1gina')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>12528496336320675
);
wwv_flow_imp.component_end;
end;
/
