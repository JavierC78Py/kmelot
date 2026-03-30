prompt --application/pages/page_00103
begin
--   Manifest
--     PAGE: 00103
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
 p_id=>103
,p_name=>unistr('Detalle de flujo de conversaci\00F3n')
,p_alias=>unistr('DETALLE-DE-FLUJO-DE-CONVERSACI\00D3N')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Detalle de flujo de conversaci\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://www.jqueryscript.net/demo/minimal-tags-input/js/taginput.js',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function goToModal(flowId) {',
'',
'    ajaxCallback = {',
'        success: function (resp)',
'        {           ',
'            apex.navigation.redirect(resp.url); //do this instead of eval()',
'        },',
'                error: function(a,b,c){ console.log(a,b,c)}',
'    }',
'',
'    dataSent = {x01: flowId};',
'',
'    apex.server.process(''AJAXCB_GOTO_MODAL'',dataSent,ajaxCallback);',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*$(''.Keywords'').TagsInput({',
'',
'  // placeholder text',
'  tagInputPlaceholder:''ej. hola'',',
'',
'  // hidden input',
'  tagHiddenInput: $(''#P609_KEYWORDS''),',
'',
'  // border color',
'  tagContainerBorderColor: ''#222'',',
'  ',
'  // background color',
'  tagBackgroundColor: ''#222'',',
'',
'  // tag color',
'  tagColor: ''#fff'',',
'',
'  // border color of tags',
'  tagBorderColor: ''#688eac''',
'',
'});*/'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://www.jqueryscript.net/demo/minimal-tags-input/css/taginput.css',
'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'950'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(99123466627093504)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(86947038457749062)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(555919161877775143)
,p_plug_name=>'Respuestas del Flujo'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       FLOW_ID,',
'       ANSWER_NAME,',
'       ANSWER_TEXT,',
'       CAPTURE,',
'       GOTO_FLOW,',
'       IDLE,',
'       CREATED_AT,',
'       CREATED_BY,',
'       CAPTURE_OPTION',
'  from BOT_ANSWERS',
' where FLOW_ID = :P103_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P103_ID'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P103_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Respuestas del Flujo'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(555919209100775144)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:104:P104_ID,P104_FLOW_ID:#ID#,#FLOW_ID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'SILVIO'
,p_internal_uid=>482186190036768404
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(555919375823775145)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(555919428906775146)
,p_db_column_name=>'FLOW_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Flow Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(555919601205775147)
,p_db_column_name=>'ANSWER_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Answer Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(555919701544775148)
,p_db_column_name=>'ANSWER_TEXT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Respuesta'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(555919755149775149)
,p_db_column_name=>'CAPTURE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Capturar respuesta?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(555919831018775150)
,p_db_column_name=>'GOTO_FLOW'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Ir al Flow'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(99624990031417745)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(555919992240775151)
,p_db_column_name=>'IDLE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Tipo de Inactividad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(555920036630775152)
,p_db_column_name=>'CREATED_AT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Creado El'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(555920123557775153)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88035207083116060)
,p_db_column_name=>'CAPTURE_OPTION'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Respuesta'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(557316996502422948)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4329087'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:ANSWER_TEXT:CAPTURE:GOTO_FLOW:IDLE:CAPTURE_OPTION:'
,p_sort_column_1=>'ID'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(557286321981203970)
,p_plug_name=>'Flujo Conversacional'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       FLOW_NAME,',
'       PARENT_FLOW,',
'       GOTO_FLOW,',
'       STATUS,',
'       CREATED_AT,',
'       CREATED_BY,',
'       START_CHAT,',
'       SUC_ID_SUCURSAL',
'  from BOT_FLOWS'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(557292200572204121)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(99121730804093505)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(557292200572204121)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.:102::'
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(99122194194093505)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(557292200572204121)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--danger:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Eliminar Flujo'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P103_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-remove'
,p_security_scheme=>wwv_flow_imp.id(109439166088886676)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(99122587504093505)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(557292200572204121)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Guardar Flujo'
,p_button_position=>'NEXT'
,p_button_condition=>'P103_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_security_scheme=>wwv_flow_imp.id(109438733718888465)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(99122938638093504)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(557292200572204121)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Crear Flujo'
,p_button_position=>'NEXT'
,p_button_condition=>'P103_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_security_scheme=>wwv_flow_imp.id(109438926384887602)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(99115007834093511)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(555919161877775143)
,p_button_name=>'CREATE_ANSWER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Nueva Respuesta'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:104:P104_FLOW_ID:&P103_ID.'
,p_icon_css_classes=>'fa-check'
,p_security_scheme=>wwv_flow_imp.id(109438926384887602)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(99125166619093502)
,p_branch_name=>'Go To Page 102'
,p_branch_action=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.:102::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'DELETE,SAVE,CREATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(65343768711574965)
,p_name=>'P103_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_item_source_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_prompt=>'Sucursal'
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SUCURSAL'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(113531501109267854)
,p_name=>'P103_START_CHAT'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_item_source_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_prompt=>'Iniciar chat'
,p_source=>'START_CHAT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Si esta opci\00F3n esta ACTIVA, al recibir un mensaje el BOT responder\00E1, si esta INACTIVO solo responder\00E1 si el BOT inicio la conversaci\00F3n.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'N',
  'off_value', 'N',
  'on_label', 'S',
  'on_value', 'S',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(557291228438203961)
,p_name=>'P103_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_item_source_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(557291538774204006)
,p_name=>'P103_FLOW_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_item_source_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_prompt=>'Nombre del Flujo'
,p_source=>'FLOW_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>255
,p_colspan=>6
,p_field_template=>1609122147107268652
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
 p_id=>wwv_flow_imp.id(557292267973204043)
,p_name=>'P103_PARENT_FLOW'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_item_source_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_prompt=>'Parent Flow'
,p_source=>'PARENT_FLOW'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select flow_name as d, id as r from bot_flows where id != :P103_ID'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Flow Padre --'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(557292713140204062)
,p_name=>'P103_GOTO_FLOW'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_item_source_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_prompt=>'Go To Flow'
,p_source=>'GOTO_FLOW'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select flow_name as d, id as r from bot_flows where parent_flow is not null'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Ir al Flow --'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(557293103325204078)
,p_name=>'P103_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_item_source_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_prompt=>'Activo'
,p_source=>'STATUS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', '0',
  'off_value', '0',
  'on_label', '1',
  'on_value', '1',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(557293422117204091)
,p_name=>'P103_CREATED_AT'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_item_source_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_source=>'CREATED_AT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(557293850887204106)
,p_name=>'P103_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_item_source_plug_id=>wwv_flow_imp.id(557286321981203970)
,p_source=>'CREATED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(114242912847252243)
,p_name=>'Refresca'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(555919161877775143)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(114242990858252244)
,p_event_id=>wwv_flow_imp.id(114242912847252243)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(555919161877775143)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(65343889607574966)
,p_name=>'Inicio'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(65343970147574967)
,p_event_id=>wwv_flow_imp.id(65343889607574966)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.item("P103_SUC_ID_SUCURSAL").setFocus()'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99121036602093506)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(557286321981203970)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Flujo Conversacional'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25388017538086766
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99124280318093503)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>25391261254086763
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99120649593093506)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(557286321981203970)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Flujo Conversacional'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25387630529086766
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99124673972093502)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AJAXCB_GOTO_MODAL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'        DECLARE',
'            l_url varchar2(2000);',
'',
'        BEGIN',
'            l_url := APEX_PAGE.GET_URL(p_page => 610,',
'                                       p_items => ''P610_FLOW_ID'',',
'                                       p_values => apex_application.g_x01);         ',
'',
'          apex_json.open_object; ',
'          apex_json.write(''url'', l_url); ',
'          apex_json.close_all; ',
'',
'        END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25391654908086762
);
wwv_flow_imp.component_end;
end;
/
