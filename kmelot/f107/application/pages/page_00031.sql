prompt --application/pages/page_00031
begin
--   Manifest
--     PAGE: 00031
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
 p_id=>31
,p_name=>'Crear o Editar Producto'
,p_alias=>'CREAR-O-EDITAR-PRODUCTO'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear o Editar Producto'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_javascript_code_onload=>'$("#P31_ID_PRODUCTO").prop( ''readOnly'', true);'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.aling_derecha {',
'text-align: right;}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(205695387855832506)
,p_dialog_width=>'1200'
,p_protection_level=>'C'
,p_read_only_when_type=>'EXPRESSION'
,p_read_only_when=>'nvl(:P31_SOLO_CONSULTA,''NO'') = ''SI'''
,p_read_only_when2=>'PLSQL'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(173048442295819770)
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
 p_id=>wwv_flow_imp.id(209623702502108152)
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
'       TIPO,',
'       SEXO,',
'       TIP_ID_TIPO_LOGO',
'  from PRODUCTO'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(173048267698819768)
,p_plug_name=>'Izquierda'
,p_parent_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>130
,p_plug_grid_column_span=>3
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(173048417018819769)
,p_plug_name=>'Derecha'
,p_parent_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>140
,p_plug_new_grid_row=>false
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(207546419121310079)
,p_name=>'<< Disponibilidades >>'
,p_region_name=>'reg_disponibilidades'
,p_parent_plug_id=>wwv_flow_imp.id(173048417018819769)
,p_template=>4072358936313175081
,p_display_sequence=>180
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--noBorders'
,p_new_grid_row=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d.id_deposito',
'      ,s.descripcion sucursal',
'      ,d.descripcion deposito',
'      ,f_devuelve_stock( P_ID_PRODUCTO => :P31_ID_PRODUCTO',
'                        ,P_ID_UNIDAD_MEDIDA => du.uni_id_unidad_medida',
'                        ,P_ID_DEPOSITO => d.id_deposito',
'                        ,P_FECHA_HASTA => CURRENT_DATE',
'                        ,P_MOMENTO     => ''PREVIO''',
'                        ) stock',
'      ,u.descripcion||''(''||u.abreviatura||'')'' AS unidad_medida',
'FROM deposito d',
'    ,sucursal_entidad s',
'    ,det_uni_medi_prod du',
'    ,unidad_medida u',
'WHERE s.id_suc_entidad = d.suc_id_sucursal',
'AND du.pro_id_producto = :P31_ID_PRODUCTO',
'AND u.id_unidad_medida = du.uni_id_unidad_medida',
'ORDER BY 4 DESC'))
,p_display_when_condition=>'P31_ID_PRODUCTO'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P31_ID_PRODUCTO'
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
 p_id=>wwv_flow_imp.id(207546505538310080)
,p_query_column_id=>1
,p_column_alias=>'ID_DEPOSITO'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(207546909669310084)
,p_query_column_id=>2
,p_column_alias=>'SUCURSAL'
,p_column_display_sequence=>10
,p_column_heading=>'Sucursal'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(153778513808841473)
,p_query_column_id=>3
,p_column_alias=>'DEPOSITO'
,p_column_display_sequence=>30
,p_column_heading=>'Deposito'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(207546800419310083)
,p_query_column_id=>4
,p_column_alias=>'STOCK'
,p_column_display_sequence=>50
,p_column_heading=>'Stock'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(153778570931841474)
,p_query_column_id=>5
,p_column_alias=>'UNIDAD_MEDIDA'
,p_column_display_sequence=>60
,p_column_heading=>'Unidad dedida'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(209646371309108192)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(206180564029405200)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168712903337239777)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_button_name=>'BTN_TAMANHO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>unistr('Tama\00F1os disponibles')
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:174:&SESSION.::&DEBUG.:174:P174_P_ID_PRODUCTO:&P31_ID_PRODUCTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P31_ID_PRODUCTO IS NOT NULL ',
'AND :P31_TIPO = ''ART'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(206805067312874342)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(153778752426841476)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_button_name=>'BTN_PRECIO_VENTA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Precios de venta'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:70:P70_PRO_ID_PRODUCTO_ART,P70_P_TIPO:&P31_ID_PRODUCTO.,ART'
,p_button_condition=>'P31_ID_PRODUCTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(206805067312874342)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(145222898169903270)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_button_name=>'BTN_UNIDAD_MEDIDA'
,p_button_static_id=>'BTN_UNIDAD_MEDIDA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Unidades de medida'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:156:&SESSION.::&DEBUG.:156:P156_P_ID_PRODUCTO:&P31_ID_PRODUCTO.'
,p_button_condition=>'P31_ID_PRODUCTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(205695808920834929)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(209636462318108174)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'CHANGE'
,p_button_condition=>':P31_ID_PRODUCTO IS NOT NULL AND nvl(:P31_SOLO_CONSULTA,''NO'') != ''SI'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(205695588978833761)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(209635203061108173)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_button_name=>'CANCEL'
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
 p_id=>wwv_flow_imp.id(209636893902108175)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'CREATE'
,p_button_condition=>'P31_ID_PRODUCTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(205695808920834929)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(209636004645108174)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar imagen'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>':P31_ID_PRODUCTO IS NOT NULL AND nvl(:P31_SOLO_CONSULTA,''NO'') != ''SI'' AND :P31_NOMBRE_ARCHIVO IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(205696029710835885)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(209637179956108175)
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(173048123453819766)
,p_name=>'P31_SEXO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(173048267698819768)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>'Sexo'
,p_source=>'SEXO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SEXO_PRODUCTO'
,p_lov=>'.'||wwv_flow_imp.id(173166185700427161)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Sin definir'
,p_cHeight=>1
,p_colspan=>8
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(173048205563819767)
,p_name=>'P31_TIP_ID_TIPO_LOGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(173048267698819768)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>'Tipo logo'
,p_source=>'TIP_ID_TIPO_LOGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TIPO_LOGO_PRODUCTO'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Sin definir'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(173048617222819771)
,p_name=>'P31_P_PAGINA_ORIGEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(173048442295819770)
,p_prompt=>'P Pagina Origen'
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
 p_id=>wwv_flow_imp.id(201102355836382712)
,p_name=>'P31_GRU_ID_GRUPO_N1'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>'Familia'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_GRUPO_PRO_NIVEL_1'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select grupo_nivel_1 r, descripcion d',
'from grupo_producto',
'where estado = ''ACTIVO''',
'and tipo = ''ART''',
'and grupo_nivel_2 is null',
'and grupo_nivel_3 is null',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(201102659671382715)
,p_name=>'P31_GRU_ID_GRUPO_N2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>'Sub familia'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select descripcion d, grupo_nivel_2 r',
'from grupo_producto',
'where grupo_nivel_1 = :P31_GRU_ID_GRUPO_N1',
'and grupo_nivel_2 is not null',
'and grupo_nivel_3 is null',
'and estado = ''ACTIVO''',
'and tipo = ''ART'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P31_GRU_ID_GRUPO_N1'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(201103470620382723)
,p_name=>'P31_NOMBRE_ARCHIVO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_source=>'NOMBRE_ARCHIVO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(201103598682382724)
,p_name=>'P31_MIME_TYPE_ARCHIVO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_source=>'MIME_TYPE_ARCHIVO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(201103728707382725)
,p_name=>'P31_STOCK_MINIMO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>unistr('Stock m\00EDnimo')
,p_source=>'STOCK_MINIMO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>30
,p_tag_css_classes=>'aling_derecha'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when_type=>'NEVER'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    '    decimalPlaces : 3',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(201103786110382726)
,p_name=>'P31_IMAGEN'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>unistr('Ilustraci\00F3n del producto')
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_display_when=>'P31_NOMBRE_ARCHIVO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_multiple_files', 'N',
  'display_as', 'DROPZONE_INLINE',
  'dropzone_title', 'Imagen del producto',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(201104039759382728)
,p_name=>'P31_IMAGEN_MOSTRAR'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>unistr('Ilustraci\00F3n del producto')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.prepare_url (',
'    p_url       => ''f?p='' || :APP_ID || '':'' || :APP_PAGE_ID || '':'' || :APP_SESSION || '':application_process=get_oci_object:::OCI_OBJECT_NAME,OCI_BUCKET_NAME,OCI_PATH_BUCKET,OCI_DISPOSITION:'' || ''productos/'' || :P31_NOMBRE_ARCHIVO || '','' || :OCI_BUCKE'
||'T_NAME || '','' || :OCI_PATH_BUCKET || '','' || ''apex_data_export.c_inline'' || '':''',
'  , p_plain_url =>  true)'))
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when=>'P31_NOMBRE_ARCHIVO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'URL')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(207547381727310089)
,p_name=>'P31_SOLO_CONSULTA'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209624129313108153)
,p_name=>'P31_ID_PRODUCTO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>'Id producto'
,p_source=>'ID_PRODUCTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>1
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
 p_id=>wwv_flow_imp.id(209624459585108153)
,p_name=>'P31_DESCRIPCION'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DESCRIPCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(209624858176108154)
,p_name=>'P31_ORI_ID_ORIGEN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>'Origen'
,p_source=>'ORI_ID_ORIGEN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ORIGEN'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(209625266041108155)
,p_name=>'P31_MAR_ID_MARCA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>'Marca'
,p_source=>'MAR_ID_MARCA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_MARCA'
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(209625699183108156)
,p_name=>'P31_GRU_ID_GRUPO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>'Grupo'
,p_source=>'GRU_ID_GRUPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select descripcion d, id_grupo r',
'from grupo_producto',
'where grupo_nivel_1 = :P31_GRU_ID_GRUPO_N1',
'and grupo_nivel_2 = :P31_GRU_ID_GRUPO_N2',
'and grupo_nivel_3 is not null',
'and estado = ''ACTIVO''',
'and tipo = ''ART'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P31_GRU_ID_GRUPO_N1,P31_GRU_ID_GRUPO_N2'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(209626054554108157)
,p_name=>'P31_IVA_ID_IVA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>'% I.V.A.'
,p_source=>'IVA_ID_IVA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IVA'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209626492531108158)
,p_name=>'P31_CODIGO_BARRA_FABRICA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>unistr('C\00F3digo de barra fabrica')
,p_source=>'CODIGO_BARRA_FABRICA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(209626866993108158)
,p_name=>'P31_CODIGO_BARRA_INTERNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_prompt=>unistr('C\00F3digo de barra interno')
,p_source=>'CODIGO_BARRA_INTERNO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(209627278607108159)
,p_name=>'P31_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(173048267698819768)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_default=>'ACTIVO'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ESTADO'
,p_lov=>'.'||wwv_flow_imp.id(208506997751136611)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>8
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209627693625108160)
,p_name=>'P31_CUE_CON_ID_CTA_COMPRA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_source=>'CUE_CON_ID_CTA_COMPRA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209628034295108161)
,p_name=>'P31_CUE_CON_ID_CTA_VENTA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_source=>'CUE_CON_ID_CTA_VENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209628490606108162)
,p_name=>'P31_CUE_CON_ID_CTA_COSTO_V'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_source=>'CUE_CON_ID_CTA_COSTO_V'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209628897257108162)
,p_name=>'P31_CUE_CON_ID_CTA_DEVOL_CLI'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_source=>'CUE_CON_ID_CTA_DEVOL_CLI'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209629265810108163)
,p_name=>'P31_CUE_CON_ID_CTA_DSCTO_PROV'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_source=>'CUE_CON_ID_CTA_DSCTO_PROV'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209629653678108164)
,p_name=>'P31_ES_UNICO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_default=>'NO'
,p_source=>'ES_UNICO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(251765709260067683)
,p_name=>'P31_TIPO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_source_plug_id=>wwv_flow_imp.id(209623702502108152)
,p_item_default=>'ART'
,p_source=>'TIPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(206021035636012614)
,p_name=>'Cancel'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(209635203061108173)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206021091469012615)
,p_event_id=>wwv_flow_imp.id(206021035636012614)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(209638015548108178)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(209623702502108152)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Crear o Editar Producto'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,CREATE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>16671470912445300
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(201103928271382727)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar imagen'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_name apex_application_temp_files.name%type;',
'v_filename apex_application_temp_files.filename%type;',
'v_mime_type apex_application_temp_files.mime_type%type;',
'begin',
'    select ''id''|| :P31_ID_PRODUCTO || ''_'' ||filename, name, mime_type',
'    into v_filename, v_name, v_mime_type',
'    from apex_application_temp_files',
'    where APPLICATION_ID=:APP_ID',
'    and name = :P31_IMAGEN;',
'',
'pkg_oci_bucket.p_subir_archivo_bucket( p_vFile         => v_name,',
'                                       p_vObjectName   => v_filename,',
'                                       p_vBucketName   => :OCI_BUCKET_NAME,',
'                                       p_vBucketPath   => :OCI_PATH_BUCKET||''/productos''',
'                                       ); ',
'    update producto',
'    set nombre_archivo = v_filename,',
'        mime_type_archivo = v_mime_type',
'    where id_producto = :P31_ID_PRODUCTO;',
'exception',
'    when no_data_found then ',
'        null;    ',
'end;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,CREATE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>8137383635719849
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(203767585853482788)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar imagen'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'pkg_oci_bucket.p_eliminar_archivo_bucket',
'    (  p_vObjectName => :P31_NOMBRE_ARCHIVO',
'      ,p_vBucketName => :OCI_BUCKET_NAME',
'      ,p_vBucketPath => :OCI_PATH_BUCKET||''/productos''',
'    );',
'    update producto p',
'    set p.nombre_archivo = null',
'       ,p.mime_type_archivo = null',
'    where p.id_producto = :P31_ID_PRODUCTO;',
'EXCEPTION',
'    WHEN others then',
'        print_error(sqlerrm);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(209636004645108174)
,p_internal_uid=>10801041217819910
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(173048823221819773)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar modal'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P31_P_PAGINA_ORIGEN'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'170'
,p_internal_uid=>53815297650163635
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(209637691876108178)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(209623702502108152)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear o Editar Producto'
,p_internal_uid=>16671147240445300
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(203767472704482787)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RecuperaValores'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    select g.grupo_nivel_1, g.grupo_nivel_2',
'    into :P31_GRU_ID_GRUPO_N1, :P31_GRU_ID_GRUPO_N2',
'    from grupo_producto g',
'    where g.id_grupo = :P31_GRU_ID_GRUPO;',
'EXCEPTION',
'    WHEN no_data_found then ',
'        null;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P31_ID_PRODUCTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>10800928068819909
);
wwv_flow_imp.component_end;
end;
/
