prompt --application/pages/page_00175
begin
--   Manifest
--     PAGE: 00175
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
 p_id=>175
,p_name=>unistr('Tama\00F1o a producir')
,p_alias=>unistr('TAMA\00D1O-A-PRODUCIR')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Tama\00F1o a producir')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168713295408239781)
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
 p_id=>wwv_flow_imp.id(168713915264239787)
,p_plug_name=>unistr('Tama\00F1os disponibles')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(173045706906819742)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(168713915264239787)
,p_button_name=>'BTN_RETORNAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(173045572099819741)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(168713915264239787)
,p_button_name=>'BTN_APLICAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'CREATE'
,p_show_processing=>'Y'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(173046781821819753)
,p_branch_name=>'170'
,p_branch_action=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.:170:P170_ID_RECETA:&P175_P_ID_RECETA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(168713366845239782)
,p_name=>'P175_P_ID_RECETA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(168713295408239781)
,p_prompt=>'P Id Receta'
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
 p_id=>wwv_flow_imp.id(168713947106239788)
,p_name=>'P175_P_TAMANHOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(168713915264239787)
,p_prompt=>unistr('Tama\00F1os disponibles en la ficha del producto / Seleccionados para prorucci\00F3n')
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT pt.tamanho as d, pt.id_tamanho as r',
'FROM producto_tamanho pt',
'WHERE pt.pro_id_producto = :P175_P_ID_PRODUCTO_FINAL',
'AND pt.estado = ''ACTIVO''',
''))
,p_lov_cascade_parent_items=>'P175_P_ID_PRODUCTO_FINAL'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_controls', 'ALL')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(173046034741819746)
,p_name=>'P175_P_ID_PRODUCTO_FINAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(168713295408239781)
,p_prompt=>'P Id Producto Final'
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
 p_id=>wwv_flow_imp.id(173045808764819743)
,p_name=>'Retornar'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(173045706906819742)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(173045904199819744)
,p_event_id=>wwv_flow_imp.id(173045808764819743)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(173045425906819740)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guarda'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  DECLARE                                                                                                                                                                               ',
'      v_id_receta NUMBER := :P175_P_ID_RECETA;                                                                                                                                          ',
'      v_tamanhos  VARCHAR2(4000) := :P175_P_TAMANHOS;                                                                                                                                   ',
'  BEGIN                                                                                                                                                                                 ',
unistr('      -- DELETE: quitar los que ya no est\00E1n seleccionados                                                                                                                               '),
'      DELETE FROM RECETA_PRODUCCION_TAMANHO                                                                                                                                             ',
'      WHERE REC_ID_RECETA = v_id_receta                                                                                                                                                 ',
'        AND (v_tamanhos IS NULL                                                                                                                                                         ',
'             OR INSTR('','' || v_tamanhos || '','', '','' || TAM_ID_TAMANHO || '','') = 0);                                                                                                     ',
'                                                                                                                                                                                        ',
'      -- INSERT: agregar los nuevos seleccionados                                                                                                                                       ',
'      IF v_tamanhos IS NOT NULL THEN                                                                                                                                                    ',
'          INSERT INTO RECETA_PRODUCCION_TAMANHO (REC_ID_RECETA, TAM_ID_TAMANHO)                                                                                                         ',
'          SELECT v_id_receta, TO_NUMBER(COLUMN_VALUE)                                                                                                                                   ',
'            FROM APEX_STRING.SPLIT(v_tamanhos, '','') s',
'           WHERE NOT EXISTS (                                                                                                                                                           ',
'                  SELECT 1',
'                    FROM RECETA_PRODUCCION_TAMANHO                                                                                                                                      ',
'                   WHERE REC_ID_RECETA = v_id_receta                                                                                                                                    ',
'                     AND TAM_ID_TAMANHO = TO_NUMBER(s.COLUMN_VALUE)',
'                 );                                                                                                                                                                     ',
'      END IF;     ',
'  END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>53811900335163602
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(173046412531819749)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT listagg(r.tam_id_tamanho,'','') within group (ORDER BY r.tam_id_tamanho)',
'INTO :P175_P_TAMANHOS',
'FROM receta_produccion_tamanho r',
'WHERE r.rec_id_receta = :P175_P_ID_RECETA;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>53812886960163611
);
wwv_flow_imp.component_end;
end;
/
