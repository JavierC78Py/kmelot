prompt --application/pages/page_00186
begin
--   Manifest
--     PAGE: 00186
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
 p_id=>186
,p_name=>'Detalle de Entrega de Insumos'
,p_alias=>'DETALLE-ENTREGA-INSUMOS'
,p_step_title=>'Detalle de Entrega de Insumos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#mascara_fecha#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function urlVerPDF(){',
'    apex.navigation.openInNewWindow(',
'        apex.server.url( {',
'            p_request: "application_process=ver_pdf",',
'            x01: apex.item("P186_ID_ENTREGA_INSUMO").getValue()',
'        })',
'    );',
'}'))
,p_javascript_code_onload=>'mascaraFechaRegex("#P186_FECHA_ENTREGA");'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(157141760771806441)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(119233526371842239)
,p_plug_name=>'Entrega de Insumos &P186_NRO_REMISION.'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_ENTREGA_INSUMO,',
'       NRO_REMISION,',
'       ORD_ID_ORDEN_PROD,',
'       FECHA_ENTREGA,',
'       OBSERVACION,',
'       USUARIO_REGISTRO,',
'       FECHA_REGISTRO,',
'       ESTADO,',
'       DEP_ID_DEPOSITO ',
'  FROM CAB_ENTREGA_INSUMO'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(119233526371842338)
,p_plug_name=>'Materiales entregados'
,p_region_name=>'REG_DET_ENTREGA'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d.ID_DET_ENTREGA,',
'       d.ENT_ID_ENTREGA_INSUMO,',
'       d.DET_ID_DET_ORDEN_MAT,',
'       d.CANTIDAD_ENTREGADA',
'  FROM DET_ENTREGA_INSUMO d',
' WHERE d.ENT_ID_ENTREGA_INSUMO = :P186_ID_ENTREGA_INSUMO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P186_ID_ENTREGA_INSUMO'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P186_ID_ENTREGA_INSUMO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
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
,p_plug_header=>'Materiales entregados'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(119233526371842339)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(119233526371842340)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Actions'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(119233526371842348)
,p_name=>'ID_DET_ENTREGA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DET_ENTREGA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(119233526371842349)
,p_name=>'ENT_ID_ENTREGA_INSUMO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ENT_ID_ENTREGA_INSUMO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P186_ID_ENTREGA_INSUMO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(119233526371842350)
,p_name=>'DET_ID_DET_ORDEN_MAT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DET_ID_DET_ORDEN_MAT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Material'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'INLINE_POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.descripcion || '' ('' || u.abreviatura || '') - Est: '' ||',
'       TRIM(TO_CHAR(m.cantidad_estimada,''999G999G990D00'')) || '' | Pend: '' ||',
'       TRIM(TO_CHAR(m.cantidad_estimada - NVL((SELECT SUM(di.cantidad_entregada)',
'        FROM det_entrega_insumo di',
'        WHERE di.det_id_det_orden_mat = m.id_det_orden_mat), 0),''999G999G990D00'')) AS d,',
'       m.id_det_orden_mat AS r',
'FROM det_orden_produccion_mat m,',
'     producto p,',
'     unidad_medida u',
'WHERE m.ord_id_orden_prod = :P186_ORD_ID_ORDEN_PROD',
'AND p.id_producto = m.pro_id_producto_mat',
'AND u.id_unidad_medida = m.uni_id_unidad_medida'))
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(119233526371842351)
,p_name=>'CANTIDAD_ENTREGADA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD_ENTREGADA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad entregada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(119233526371842358)
,p_internal_uid=>800186220
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_add_authorization_scheme=>wwv_flow_imp.id(157142358551804586)
,p_update_authorization_scheme=>wwv_flow_imp.id(157142029546805403)
,p_delete_authorization_scheme=>wwv_flow_imp.id(157142765293803734)
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>false
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(119233526371842359)
,p_interactive_grid_id=>wwv_flow_imp.id(119233526371842358)
,p_static_id=>'RPT_DET_ENTREGA'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(119233526371842360)
,p_report_id=>wwv_flow_imp.id(119233526371842359)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(119233526371842368)
,p_view_id=>wwv_flow_imp.id(119233526371842360)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(119233526371842339)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(119233526371842369)
,p_view_id=>wwv_flow_imp.id(119233526371842360)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(119233526371842340)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(119233526371842370)
,p_view_id=>wwv_flow_imp.id(119233526371842360)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(119233526371842348)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(119233526371842371)
,p_view_id=>wwv_flow_imp.id(119233526371842360)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(119233526371842349)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(119233526371842372)
,p_view_id=>wwv_flow_imp.id(119233526371842360)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(119233526371842350)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>400
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(119233526371842373)
,p_view_id=>wwv_flow_imp.id(119233526371842360)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(119233526371842351)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(134310238853216013)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(206180564029405200)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(119233526371842278)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'CHANGE'
,p_button_condition=>':P186_ID_ENTREGA_INSUMO IS NOT NULL'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(157142029546805403)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(119233526371842280)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.::P173_ID_ORDEN_PROD:&P186_ORD_ID_ORDEN_PROD.'
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(119233526371842279)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'CREATE'
,p_button_condition=>':P186_ID_ENTREGA_INSUMO IS NULL'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(157142358551804586)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800186500)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_button_name=>'VER_PDF'
,p_button_static_id=>'btn_ver_pdf'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ver PDF'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript: urlVerPDF();'
,p_button_condition=>':P186_ID_ENTREGA_INSUMO IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(119233526371842281)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_condition=>':P186_ID_ENTREGA_INSUMO IS NOT NULL'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(157142765293803734)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800186145)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_button_name=>'BTN_ANULAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Anular'
,p_button_position=>'DELETE'
,p_button_condition=>':P186_ID_ENTREGA_INSUMO IS NOT NULL AND :P186_ESTADO = ''ACTIVO'''
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(157142029546805403)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(119233526371842298)
,p_branch_name=>'Go To Page 186 after create'
,p_branch_action=>'f?p=&APP_ID.:186:&SESSION.::&DEBUG.::P186_ID_ENTREGA_INSUMO,P186_ORD_ID_ORDEN_PROD:&P186_ID_ENTREGA_INSUMO.,&P186_ORD_ID_ORDEN_PROD.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'CREATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(119233526371842299)
,p_branch_name=>'Go To Page 173 after delete'
,p_branch_action=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.::P173_ID_ORDEN_PROD:&P186_ORD_ID_ORDEN_PROD.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800186120)
,p_name=>'P186_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_item_source_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_item_default=>'ACTIVO'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800186701)
,p_name=>'P186_DEP_ID_DEPOSITO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>45
,p_item_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_item_source_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_prompt=>unistr('Dep\00F3sito de Salida')
,p_source=>'DEP_ID_DEPOSITO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_DEPOSITO'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione -'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(119233526371842248)
,p_name=>'P186_ID_ENTREGA_INSUMO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_item_source_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_source=>'ID_ENTREGA_INSUMO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(119233526371842249)
,p_name=>'P186_ORD_ID_ORDEN_PROD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_item_source_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_source=>'ORD_ID_ORDEN_PROD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(119233526371842250)
,p_name=>'P186_NRO_REMISION'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_item_source_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_prompt=>unistr('Nro. Remisi\00F3n')
,p_source=>'NRO_REMISION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>20
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(119233526371842251)
,p_name=>'P186_FECHA_ENTREGA'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_item_source_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_prompt=>'Fecha Entrega'
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'FECHA_ENTREGA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(119233526371842252)
,p_name=>'P186_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_item_source_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>500
,p_cHeight=>3
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(119233526371842253)
,p_name=>'P186_USUARIO_REGISTRO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_item_source_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_prompt=>'Usuario'
,p_source=>'USUARIO_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(119233526371842254)
,p_name=>'P186_FECHA_REGISTRO'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_item_source_plug_id=>wwv_flow_imp.id(119233526371842239)
,p_source=>'FECHA_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(119233526371842290)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar cantidades'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Validar que las entregas no excedan la cantidad estimada de cada material',
'DECLARE',
'    v_estimada       NUMBER;',
'    v_ya_entregado   NUMBER;',
'    v_material       VARCHAR2(200);',
'BEGIN',
'    FOR r IN (',
'        SELECT det_id_det_orden_mat, cantidad_entregada',
'        FROM det_entrega_insumo',
'        WHERE ent_id_entrega_insumo = :P186_ID_ENTREGA_INSUMO',
'    ) LOOP',
'        SELECT m.cantidad_estimada, p.descripcion',
'        INTO v_estimada, v_material',
'        FROM det_orden_produccion_mat m, producto p',
'        WHERE m.id_det_orden_mat = r.det_id_det_orden_mat',
'        AND p.id_producto = m.pro_id_producto_mat;',
'',
'        SELECT NVL(SUM(di.cantidad_entregada), 0)',
'        INTO v_ya_entregado',
'        FROM det_entrega_insumo di',
'        WHERE di.det_id_det_orden_mat = r.det_id_det_orden_mat;',
'',
'        IF v_ya_entregado > v_estimada THEN',
'            RAISE_APPLICATION_ERROR(-20999,',
'                ''Material "'' || v_material || ''": entrega excede cantidad estimada. '' ||',
'                ''Estimado: '' || v_estimada || '', Total entregado: '' || v_ya_entregado);',
'        END IF;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>800186152
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800186155)
,p_process_sequence=>15
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Anular entrega'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE cab_entrega_insumo',
'    SET estado = ''ANULADO''',
'    WHERE id_entrega_insumo = :P186_ID_ENTREGA_INSUMO;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_ANULAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Entrega anulada correctamente.'
,p_internal_uid=>800186155
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(119233526371842291)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(119233526371842239)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form CAB_ENTREGA_INSUMO'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'Error al procesar el registro.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Registro procesado correctamente.'
,p_internal_uid=>800186153
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(119233526371842292)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(119233526371842338)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Materiales entregados - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_exec_cond_for_each_row=>'Y'
,p_internal_uid=>800186154
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800186702)
,p_process_sequence=>35
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar stock disponible'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Si el deposito de salida tiene BLOQUEO_STOCK = ''SI'', valida que',
'-- la cantidad entregada no exceda el stock disponible (descontando',
'-- otras entregas activas pendientes del mismo producto y deposito).',
'DECLARE',
'    v_bloqueo         VARCHAR2(2);',
'    v_dep_desc        VARCHAR2(50);',
'    v_fecha_entrega   DATE;',
'    v_dep_id          NUMBER;',
'    v_stock           NUMBER;',
'    v_otras_entregas  NUMBER;',
'    v_disponible      NUMBER;',
'BEGIN',
'    SELECT c.dep_id_deposito, c.fecha_entrega',
'      INTO v_dep_id, v_fecha_entrega',
'      FROM cab_entrega_insumo c',
'     WHERE c.id_entrega_insumo = :P186_ID_ENTREGA_INSUMO;',
'',
'    SELECT d.bloqueo_stock, d.descripcion',
'      INTO v_bloqueo, v_dep_desc',
'      FROM deposito d',
'     WHERE d.id_deposito = v_dep_id;',
'',
'    IF NVL(v_bloqueo, ''NO'') = ''SI'' THEN',
'        FOR r IN (',
'            SELECT m.pro_id_producto_mat   pro_id,',
'                   m.uni_id_unidad_medida  uni_id,',
'                   p.descripcion           descripcion,',
'                   SUM(d.cantidad_entregada) cantidad_entregada',
'              FROM det_entrega_insumo d, det_orden_produccion_mat m, producto p',
'             WHERE d.ent_id_entrega_insumo = :P186_ID_ENTREGA_INSUMO',
'               AND m.id_det_orden_mat = d.det_id_det_orden_mat',
'               AND p.id_producto = m.pro_id_producto_mat',
'             GROUP BY m.pro_id_producto_mat, m.uni_id_unidad_medida, p.descripcion',
'        ) LOOP',
'            v_stock := f_devuelve_stock(',
'                p_id_producto      => r.pro_id,',
'                p_fecha_hasta      => v_fecha_entrega,',
'                p_id_deposito      => v_dep_id,',
'                p_momento          => ''PREVIO'',',
'                p_id_unidad_medida => r.uni_id);',
'',
'            -- Otras entregas activas del mismo producto y deposito',
'            -- de ordenes no finalizadas (excluyendo la entrega actual)',
'            SELECT NVL(SUM(d2.cantidad_entregada), 0)',
'              INTO v_otras_entregas',
'              FROM det_entrega_insumo d2,',
'                   cab_entrega_insumo c2,',
'                   det_orden_produccion_mat m2,',
'                   cab_orden_produccion op2',
'             WHERE c2.id_entrega_insumo = d2.ent_id_entrega_insumo',
'               AND m2.id_det_orden_mat = d2.det_id_det_orden_mat',
'               AND op2.id_orden_prod = c2.ord_id_orden_prod',
'               AND c2.estado = ''ACTIVO''',
'               AND op2.estado IN (''PENDIENTE'',''EN_PROCESO'')',
'               AND m2.pro_id_producto_mat = r.pro_id',
'               AND c2.dep_id_deposito = v_dep_id',
'               AND c2.id_entrega_insumo <> :P186_ID_ENTREGA_INSUMO;',
'',
'            v_disponible := NVL(v_stock, 0) - NVL(v_otras_entregas, 0);',
'',
'            IF r.cantidad_entregada > v_disponible THEN',
'                RAISE_APPLICATION_ERROR(-20999,',
'                    ''Stock insuficiente en deposito "'' || v_dep_desc || ''" '' ||',
'                    ''para "'' || r.descripcion || ''". Solicitado: '' ||',
'                    r.cantidad_entregada || '', Disponible: '' || v_disponible ||',
'                    '' (stock fisico: '' || NVL(v_stock,0) ||',
'                    '', en otras entregas pendientes: '' || NVL(v_otras_entregas,0) || '').'');',
'            END IF;',
'        END LOOP;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>800186702
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(119233526371842288)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(119233526371842239)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form CAB_ENTREGA_INSUMO'
,p_internal_uid=>800186150
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(119233526371842289)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P186_ID_ENTREGA_INSUMO IS NULL THEN',
'    :P186_NRO_REMISION := ''REM-'' || LPAD(SEQ_NRO_REMISION.NEXTVAL, 6, ''0'');',
'    :P186_FECHA_ENTREGA := TO_CHAR(CURRENT_DATE,''DD/MM/YYYY'');',
'    :P186_USUARIO_REGISTRO := :APP_USER;',
'    :P186_FECHA_REGISTRO := TO_CHAR(CURRENT_DATE,''DD/MM/YYYY'');',
'    -- Default deposito desde la orden de produccion',
'    BEGIN',
'        SELECT TO_CHAR(op.dep_id_deposito_orig)',
'          INTO :P186_DEP_ID_DEPOSITO',
'          FROM cab_orden_produccion op',
'         WHERE op.id_orden_prod = :P186_ORD_ID_ORDEN_PROD;',
'    EXCEPTION WHEN NO_DATA_FOUND THEN NULL;',
'    END;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>800186151
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800186510)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ver_pdf'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  vl_vNomReporte VARCHAR2(255);',
'  vl_empresa parametros.nombre%type;',
'BEGIN',
'    SELECT p.nombre',
'    INTO vl_empresa',
'    FROM parametros p;',
'  vl_vNomReporte := ''ENTREGA_INSUMO'';',
'',
'  pkg_jasperreports_server.descarga_reporte(p_vNomReporte  => vl_vNomReporte',
'                                           ,p_aNomParams   => apex_util.string_to_table(''P_ID_ENTREGA_INSUMO:P_USUARIO:P_EMPRESA'')',
'                                           ,p_aValParams   => apex_util.string_to_table(apex_application.g_x01||'':''||:APP_USER||'':''||vl_empresa)',
'                                            );',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>800186510
);
wwv_flow_imp.component_end;
end;
/
