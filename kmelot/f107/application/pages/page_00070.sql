prompt --application/pages/page_00070
begin
--   Manifest
--     PAGE: 00070
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
 p_id=>70
,p_name=>'Agregar precio de venta'
,p_alias=>'AGREGAR-PRECIO-DE-VENTA'
,p_page_mode=>'MODAL'
,p_step_title=>'Agregar/editar precio de venta'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.item("P70_PRO_ID_PRODUCTO_ART").isEmpty() && apex.item("P70_PRO_ID_PRODUCTO_SRV").isEmpty()) {',
'    if (apex.item("P70_P_TIPO").getValue() == ''ART'') {',
'        apex.item("P70_PRO_ID_PRODUCTO_ART").setFocus();',
'    } else {',
'        apex.item("P70_PRO_ID_PRODUCTO_SRV").setFocus();',
'    }',
'}',
'if (!apex.item("P70_PRO_ID_PRODUCTO_ART").isEmpty()){',
'    $("#P70_PRO_ID_PRODUCTO_ART").addClass("apex_disabled");',
'    $("#P70_PRO_ID_PRODUCTO_ART").attr("tabindex", "-1");',
'    apex.item("P70_PRECIO").setFocus();',
'}',
'if (!apex.item("P70_PRO_ID_PRODUCTO_SRV").isEmpty()){',
'    $("#P70_PRO_ID_PRODUCTO_SRV").addClass("apex_disabled");',
'    $("#P70_PRO_ID_PRODUCTO_SRV").attr("tabindex", "-1");',
'    apex.item("P70_PRECIO").setFocus();',
'}'))
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>wwv_flow_imp.id(206804734067872096)
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(153777167829841460)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206757386858203788)
,p_plug_name=>'Agregar precio de venta'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_PRECIO_VENTA,',
'       MON_ID_MONEDA,',
'       PRO_ID_PRODUCTO,',
'       PRECIO,',
'       USUARIO,',
'       FECHA,',
'       FECHA_VIGENCIA_DESDE',
'  from PRODUCTO_PRECIO_VENTA'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(206781533595141080)
,p_name=>unistr('Hist\00F3rico de precios')
,p_parent_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_template=>4072358936313175081
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_PRECIO_VENTA,',
'       MON_ID_MONEDA,',
'       PRO_ID_PRODUCTO,',
'       PRECIO,',
'       USUARIO,',
'       FECHA,',
'       FECHA_VIGENCIA_DESDE',
'  from PRODUCTO_PRECIO_VENTA',
' where PRO_ID_PRODUCTO = NVL(:P70_PRO_ID_PRODUCTO_ART,:P70_PRO_ID_PRODUCTO_SRV)',
'order by FECHA_VIGENCIA_DESDE DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P70_PRO_ID_PRODUCTO_SRV,P70_PRO_ID_PRODUCTO_ART'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(206781601976141081)
,p_query_column_id=>1
,p_column_alias=>'ID_PRECIO_VENTA'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(206781672023141082)
,p_query_column_id=>2
,p_column_alias=>'MON_ID_MONEDA'
,p_column_display_sequence=>40
,p_column_heading=>'Moneda'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(203774852436037054)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(206781795578141083)
,p_query_column_id=>3
,p_column_alias=>'PRO_ID_PRODUCTO'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(206781888599141084)
,p_query_column_id=>4
,p_column_alias=>'PRECIO'
,p_column_display_sequence=>60
,p_column_heading=>'Precio'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(206782031165141085)
,p_query_column_id=>5
,p_column_alias=>'USUARIO'
,p_column_display_sequence=>70
,p_column_heading=>'Usuario'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(206782065529141086)
,p_query_column_id=>6
,p_column_alias=>'FECHA'
,p_column_display_sequence=>80
,p_column_heading=>'Fecha de carga'
,p_column_format=>'DD-MM-YYYY HH24:MI:SS'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(206782219034141087)
,p_query_column_id=>7
,p_column_alias=>'FECHA_VIGENCIA_DESDE'
,p_column_display_sequence=>30
,p_column_heading=>'Vigencia desde'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206762215749203809)
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
 p_id=>wwv_flow_imp.id(206762621706203809)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(206762215749203809)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(206764001064203812)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(206762215749203809)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P70_ID_PRECIO_VENTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(206805256719875128)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(206764431917203812)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(206762215749203809)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition=>'P70_ID_PRECIO_VENTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(206804940624873551)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(206764832898203812)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(206762215749203809)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P70_ID_PRECIO_VENTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(206805067312874342)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(153776829376841457)
,p_name=>'P70_PRO_ID_PRODUCTO_ART'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_item_source_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_prompt=>unistr('Art\00EDculo')
,p_source=>'PRO_ID_PRODUCTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_PRODUCTO_ID_UNI_MEDI_ACTIVO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT P.ID_PRODUCTO||'' - ''||P.DESCRIPCION||'' (''||U.ABREVIATURA||'')'' D',
'      ,P.ID_PRODUCTO R',
'FROM PRODUCTO P',
'    ,DET_UNI_MEDI_PROD D',
'    ,UNIDAD_MEDIDA U',
'WHERE P.ESTADO = ''ACTIVO''',
'AND P.TIPO = ''ART''',
'AND D.PRO_ID_PRODUCTO = P.ID_PRODUCTO',
'AND D.ESTADO = ''ACTIVO''',
'AND U.ID_UNIDAD_MEDIDA = D.UNI_ID_UNIDAD_MEDIDA'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_display_when=>'P70_P_TIPO'
,p_display_when2=>'ART'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(153777292077841461)
,p_name=>'P70_P_TIPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(153777167829841460)
,p_prompt=>'P Tipo'
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
 p_id=>wwv_flow_imp.id(206757699624203790)
,p_name=>'P70_ID_PRECIO_VENTA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_item_source_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_source=>'ID_PRECIO_VENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206758071813203796)
,p_name=>'P70_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_item_source_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_prompt=>'Moneda'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA'
,p_cHeight=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206758538712203798)
,p_name=>'P70_PRO_ID_PRODUCTO_SRV'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_item_source_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_prompt=>'Servicio'
,p_source=>'PRO_ID_PRODUCTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_SERVICIO_DESCRIPCION'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_producto as r',
'      ,descripcion as d',
'from PRODUCTO',
'where tipo = ''SRV'''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_display_when=>'P70_P_TIPO'
,p_display_when2=>'SRV'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(206759243493203804)
,p_name=>'P70_PRECIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_item_source_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_prompt=>'Precio'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'PRECIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206759616068203804)
,p_name=>'P70_USUARIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_item_source_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_source=>'USUARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206759989958203805)
,p_name=>'P70_FECHA'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_item_source_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_source=>'FECHA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206781430019141079)
,p_name=>'P70_FECHA_VIGENCIA_DESDE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_item_source_plug_id=>wwv_flow_imp.id(206757386858203788)
,p_item_default=>'current_date'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Vigencia Desde'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_VIGENCIA_DESDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(206762658866203809)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(206762621706203809)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206763446567203812)
,p_event_id=>wwv_flow_imp.id(206762658866203809)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(206782625776141091)
,p_name=>'Actualiza historico'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P70_PRO_ID_PRODUCTO_SRV,P70_PRO_ID_PRODUCTO_ART'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206782675750141092)
,p_event_id=>wwv_flow_imp.id(206782625776141091)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(206781533595141080)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(206765590574203816)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(206757386858203788)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Agregar precio de venta'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>13799045938540938
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(206765988587203816)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>13799443951540938
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(206765244044203813)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(206757386858203788)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Agregar precio de venta'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>13798699408540935
);
wwv_flow_imp.component_end;
end;
/
