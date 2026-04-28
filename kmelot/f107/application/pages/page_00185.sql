prompt --application/pages/page_00185
begin
--   Manifest
--     PAGE: 00185
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
 p_id=>185
,p_name=>'Detalle Material OT'
,p_alias=>'DETALLE-MATERIAL-OT'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle Material OT'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>'.t-Body-contentInner{ padding-top: 0px; }'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_required_role=>wwv_flow_imp.id(132641974324456297)
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800185010)
,p_plug_name=>'Detalle Material'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_DET_OT_MATERIAL,',
'       OT_ID_ORDEN_TRABAJO,',
'       PRO_ID_PRODUCTO,',
'       DESCRIPCION,',
'       UNI_ID_UNIDAD_MEDIDA,',
'       CANTIDAD,',
'       DEP_ID_DEPOSITO,',
'       OBSERVACIONES',
'  FROM DET_OT_MATERIAL'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800185020)
,p_plug_name=>'Buttons'
,p_parent_plug_id=>wwv_flow_imp.id(800185010)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800185060)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>60
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(206180564029405200)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800185201)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(800185020)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:179:&SESSION.::&DEBUG.::P179_ID_ORDEN_TRABAJO:&P185_OT_ID_ORDEN_TRABAJO.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800185202)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(800185020)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P185_ID_DET_OT_MATERIAL'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(132643334503452140)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800185203)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(800185020)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'NEXT'
,p_button_condition=>'P185_ID_DET_OT_MATERIAL'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(132642559882454090)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800185204)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(800185020)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P185_ID_DET_OT_MATERIAL'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(132642995094453132)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(800185401)
,p_branch_name=>'Go To 179'
,p_branch_action=>'f?p=&APP_ID.:179:&SESSION.::&DEBUG.::P179_ID_ORDEN_TRABAJO:&P185_OT_ID_ORDEN_TRABAJO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800185101)
,p_name=>'P185_ID_DET_OT_MATERIAL'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(800185010)
,p_item_source_plug_id=>wwv_flow_imp.id(800185010)
,p_source=>'ID_DET_OT_MATERIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800185102)
,p_name=>'P185_OT_ID_ORDEN_TRABAJO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(800185010)
,p_item_source_plug_id=>wwv_flow_imp.id(800185010)
,p_source=>'OT_ID_ORDEN_TRABAJO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800185103)
,p_name=>'P185_PRO_ID_PRODUCTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(800185010)
,p_item_source_plug_id=>wwv_flow_imp.id(800185010)
,p_prompt=>'Material'
,p_source=>'PRO_ID_PRODUCTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_PRODUCTO_ART_VAR_COL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT P.ID_PRODUCTO||'' - ''||P.DESCRIPCION D',
'      ,P.ID_PRODUCTO R',
'      ,P.TIPO',
'FROM PRODUCTO P',
'WHERE P.ESTADO = ''ACTIVO''',
'AND P.TIPO = ''ART''',
'ORDER BY P.DESCRIPCION ASC'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_field_template=>1609121967514267634
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
  'title', 'Producto',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800185104)
,p_name=>'P185_DESCRIPCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(800185010)
,p_item_source_plug_id=>wwv_flow_imp.id(800185010)
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DESCRIPCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>500
,p_cHeight=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800185105)
,p_name=>'P185_UNI_ID_UNIDAD_MEDIDA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(800185010)
,p_item_source_plug_id=>wwv_flow_imp.id(800185010)
,p_prompt=>'Unidad medida'
,p_source=>'UNI_ID_UNIDAD_MEDIDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DESCRIPCION d, ID_UNIDAD_MEDIDA r',
'  FROM UNIDAD_MEDIDA',
' ORDER BY 1'))
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800185106)
,p_name=>'P185_CANTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(800185010)
,p_item_source_plug_id=>wwv_flow_imp.id(800185010)
,p_prompt=>'Cantidad'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'CANTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800185107)
,p_name=>'P185_DEP_ID_DEPOSITO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(800185010)
,p_item_source_plug_id=>wwv_flow_imp.id(800185010)
,p_prompt=>unistr('Dep\00F3sito')
,p_source=>'DEP_ID_DEPOSITO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DESCRIPCION d, ID_DEPOSITO r',
'  FROM DEPOSITO',
' ORDER BY 1'))
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800185108)
,p_name=>'P185_OBSERVACIONES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(800185010)
,p_item_source_plug_id=>wwv_flow_imp.id(800185010)
,p_prompt=>'Observaciones'
,p_source=>'OBSERVACIONES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>500
,p_cHeight=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800185303)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(800185010)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Material'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Material guardado.'
,p_internal_uid=>800185303
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800185301)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(800185010)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Material'
,p_internal_uid=>800185301
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800185302)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P185_ID_DET_OT_MATERIAL IS NULL THEN',
'    :P185_UNI_ID_UNIDAD_MEDIDA := 1;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>800185302
);
wwv_flow_imp.component_end;
end;
/
