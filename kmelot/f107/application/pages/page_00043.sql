prompt --application/pages/page_00043
begin
--   Manifest
--     PAGE: 00043
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
 p_id=>43
,p_name=>'Crear o editar solicitud de vacaciones'
,p_alias=>'CREA-EDITA-SOLICITUD-VACACION'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear o editar solicitud de vacaciones'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'var fecDesde = new Cleave(''.fecDesde'', {',
'    date: true,',
'    datePattern: [''d'', ''m'', ''Y'']',
'});',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.text-dark {',
'    color:black !important;',
'    opacity: 1 !important;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(204050422229138129)
,p_plug_name=>'Detalle de solicitud'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_SOLICITUD_VACACIONES,',
'       FECHA_GUARDADO,',
'       FECHA_SOLICITUD,',
'       COL_ID_COLABORADOR,',
'       DEP_ID_DEPARTAMENTO,',
'       SEC_ID_SECCION,',
'       ESTADO,',
'       PER_ID_PERIODO,',
'       HABILES_PENDIENTES,',
'       HABILES_SOLICITADOS,',
'       FECHA_DESDE,',
'       FECHA_HASTA,',
'       COD_REEMPLAZANTE,',
'       OBSERVACION,',
'       JEF_ID_JEFE,',
'       GER_ID_GERENTE,',
'       RH_ID_RRHH,',
'       PRE_ID_PRESIDENCIA',
'  from SOLICITUD_VACACIONES'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(204063266677138138)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(204077984347138159)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(206180564029405200)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(204063690262138139)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(204063266677138138)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(204065339337138141)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(204063266677138138)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P43_ID_SOLICITUD_VACACIONES'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(205874960721704663)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(204065707587138142)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(204063266677138138)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P43_ID_SOLICITUD_VACACIONES'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(205874596270702612)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(204066115941138142)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(204063266677138138)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P43_ID_SOLICITUD_VACACIONES'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(205874772027703555)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204050697964138129)
,p_name=>'P43_ID_SOLICITUD_VACACIONES'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_prompt=>'ID Solicitud'
,p_source=>'ID_SOLICITUD_VACACIONES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204051050586138130)
,p_name=>'P43_FECHA_GUARDADO'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_default=>'to_char(current_date,''DD/MM/YYYY HH24:MI'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Fecha generado'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_GUARDADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_css_classes=>'is-readonly apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204051536504138132)
,p_name=>'P43_FECHA_SOLICITUD'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_default=>'to_char(current_date,''dd/mm/yyyy'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Fecha Solicitud'
,p_source=>'FECHA_SOLICITUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204051872657138132)
,p_name=>'P43_COL_ID_COLABORADOR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_prompt=>'Colaborador'
,p_source=>'COL_ID_COLABORADOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_COLABORADOR_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT c.id_colaborador, e.nombre',
'FROM colaborador c, entidad e',
'WHERE e.id_entidad  = c.ent_id_entidad ',
'AND   e.es_empleado = ''SI''',
'AND   e.estado      = ''ACTIVO''',
'AND   c.estado      = ''ACTIVO''',
'order by nombre'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--'
,p_cHeight=>1
,p_field_template=>1609122147107268652
,p_item_css_classes=>'is-readonly apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204052317300138132)
,p_name=>'P43_DEP_ID_DEPARTAMENTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_prompt=>'Departamento'
,p_source=>'DEP_ID_DEPARTAMENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_DEPARTAMENTO'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>3031561666792084173
,p_item_css_classes=>'is-readonly apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204052646980138132)
,p_name=>'P43_SEC_ID_SECCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_prompt=>unistr('Secci\00F3n')
,p_source=>'SEC_ID_SECCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SECCION'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>3031561666792084173
,p_item_css_classes=>'is-readonly apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204053137698138133)
,p_name=>'P43_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_default=>'PEDIDO'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>40
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'is-readonly apex_disabled text-dark'
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
 p_id=>wwv_flow_imp.id(204053458545138133)
,p_name=>'P43_PER_ID_PERIODO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_prompt=>'Periodo'
,p_source=>'PER_ID_PERIODO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.descripcion, vd.per_id_periodo',
'FROM vacaciones_disponibles vd, periodo p',
'WHERE vd.estado = ''ACTIVO''',
'AND   vd.col_id_colaborador = 1',
'AND ( vd.dias_disponibles - (',
'                      SELECT Nvl(Sum(sv.habiles_solicitados),0)',
'                      FROM solicitud_vacaciones sv',
'                      WHERE sv.col_id_colaborador = vd.col_id_colaborador  ',
'                      AND   sv.per_id_periodo     = vd.per_id_periodo',
'                      AND   sv.estado NOT IN (''RECHAZADO'',''ANULADO'')',
'                            ) > 0 )',
'AND id_periodo = vd.per_id_periodo',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204053850904138133)
,p_name=>'P43_HABILES_PENDIENTES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_prompt=>unistr('H\00E1biles Pendientes')
,p_source=>'HABILES_PENDIENTES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_css_classes=>'is-readonly apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204054315618138133)
,p_name=>'P43_HABILES_SOLICITADOS'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_default=>'0'
,p_prompt=>unistr('H\00E1biles Solicitados')
,p_source=>'HABILES_SOLICITADOS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204054650317138133)
,p_name=>'P43_FECHA_DESDE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_prompt=>'Fecha desde'
,p_source=>'FECHA_DESDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'fecDesde'
,p_colspan=>4
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204055139998138134)
,p_name=>'P43_FECHA_HASTA'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_prompt=>'Fecha hasta'
,p_source=>'FECHA_HASTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204055468928138134)
,p_name=>'P43_COD_REEMPLAZANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_prompt=>'Reemplazante'
,p_source=>'COD_REEMPLAZANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_COLABORADOR_ACT_CI'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.numero_documento||'' ''||e.nombre D, c.id_colaborador R',
'FROM colaborador c, entidad e',
'WHERE c.estado    = ''ACTIVO''',
'AND e.id_entidad  = c.ent_id_entidad',
'AND e.estado      = ''ACTIVO''',
'AND e.es_empleado = ''SI''',
''))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_icon_css_classes=>'fa-users-alt'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_inline_help_text=>'Solo en caso de que cuente con un reemplazante.'
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
 p_id=>wwv_flow_imp.id(204055924784138134)
,p_name=>'P43_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>1200
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
 p_id=>wwv_flow_imp.id(204056289085138134)
,p_name=>'P43_JEF_ID_JEFE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_prompt=>'Jef Id Jefe'
,p_source=>'JEF_ID_JEFE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_display_when_type=>'NEVER'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204056723618138134)
,p_name=>'P43_GER_ID_GERENTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_prompt=>'Ger Id Gerente'
,p_source=>'GER_ID_GERENTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_display_when_type=>'NEVER'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204057136753138135)
,p_name=>'P43_RH_ID_RRHH'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_prompt=>'Rh Id Rrhh'
,p_source=>'RH_ID_RRHH'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_display_when_type=>'NEVER'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204057526626138135)
,p_name=>'P43_PRE_ID_PRESIDENCIA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_item_source_plug_id=>wwv_flow_imp.id(204050422229138129)
,p_prompt=>'Pre Id Presidencia'
,p_source=>'PRE_ID_PRESIDENCIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_display_when_type=>'NEVER'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204063833587138139)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(204063690262138139)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204064611283138140)
,p_event_id=>wwv_flow_imp.id(204063833587138139)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204168135313028479)
,p_name=>'SerDiasDisponibles'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P43_PER_ID_PERIODO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P43_ID_SOLICITUD_VACACIONES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204168234273028480)
,p_event_id=>wwv_flow_imp.id(204168135313028479)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'  SELECT  vd.dias_disponibles - (',
'            SELECT Nvl(Sum(sv.habiles_solicitados),0)',
'            FROM solicitud_vacaciones sv',
'            WHERE sv.col_id_colaborador = vd.col_id_colaborador  ',
'            AND   sv.per_id_periodo     = vd.per_id_periodo',
'            AND   sv.estado NOT IN (''RECHAZADO'',''ANULADO'')',
'                                ) dias_disponibles',
'  INTO :P43_HABILES_PENDIENTES',
'  FROM vacaciones_disponibles vd',
'  WHERE vd.estado = ''ACTIVO''',
'  AND   vd.col_id_colaborador = :P43_COL_ID_COLABORADOR',
'  AND   vd.per_id_periodo     = :P43_PER_ID_PERIODO;',
'  :P43_HABILES_SOLICITADOS := :P43_HABILES_PENDIENTES;',
'EXCEPTION',
'  WHEN No_Data_Found THEN ',
'    :P43_HABILES_PENDIENTES     := 0;',
'    :P43_HABILES_SOLICITADOS    := 0;',
'END;',
''))
,p_attribute_02=>'P43_COL_ID_COLABORADOR,P43_PER_ID_PERIODO'
,p_attribute_03=>'P43_HABILES_PENDIENTES,P43_HABILES_SOLICITADOS'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(202872568876632081)
,p_event_id=>wwv_flow_imp.id(204168135313028479)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P43_HABILES_SOLICITADOS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(202872415766632079)
,p_name=>'IrA'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(202872510425632080)
,p_event_id=>wwv_flow_imp.id(202872415766632079)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P43_PER_ID_PERIODO'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204066898220138143)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(204050422229138129)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Detalle de solicitud'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>11100353584475265
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204067261726138143)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>11100717090475265
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204066464811138143)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(204050422229138129)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Detalle de solicitud'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>11099920175475265
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(203391260516524997)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ObtenerColaborador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    SELECT c.id_colaborador, c.dep_id_departamento, c.sec_id_seccion',
'      INTO :P43_COL_ID_COLABORADOR, :P43_DEP_ID_DEPARTAMENTO, :P43_SEC_ID_SECCION',
'      FROM entidad e, colaborador c, usuarios u',
'     WHERE e.estado         = ''ACTIVO''',
'       AND e.es_empleado    = ''SI''',
'       AND e.es_usuario     = ''SI''',
'       AND c.ent_id_entidad = e.id_entidad',
'       AND e.estado         = ''ACTIVO''',
'       AND u.usuario        = Nvl(v(''APP_USER''),USER)',
'       AND u.id_usuario     = e.usu_id_usuario;',
'exception   ',
'    when others then ',
'        RAISE_APPLICATION_ERROR(-20000,''NO SE ENCUENTRAN DATOS, MALA DEFINICION DEL COLABORADOR, VERIFICAR FICHAS'');',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>10424715880862119
);
wwv_flow_imp.component_end;
end;
/
