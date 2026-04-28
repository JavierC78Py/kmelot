prompt --application/pages/page_00184
begin
--   Manifest
--     PAGE: 00184
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
 p_id=>184
,p_name=>'Detalle Servicio OT'
,p_alias=>'DETALLE-SERVICIO-OT'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle Servicio OT'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function calcular_monto() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("calcular_monto", {',
'        pageItems: [',
'            "P184_IVA_ID_IVA"',
'           ,"P184_CANTIDAD"',
'           ,"P184_PRECIO_UNITARIO"',
'           ,"P184_PORC_DESCUENTO" ',
'           ,"P184_P_ID_MONEDA"',
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
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>'.t-Body-contentInner{ padding-top: 0px; }'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_required_role=>wwv_flow_imp.id(132641974324456297)
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800184010)
,p_plug_name=>'Detalle Servicio'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_DET_OT_SERVICIO,',
'       OT_ID_ORDEN_TRABAJO,',
'       PRO_ID_PRODUCTO,',
'       DESCRIPCION,',
'       IVA_ID_IVA,',
'       UNI_ID_UNIDAD_MEDIDA,',
'       MAQ_ID_MAQUINA,',
'       CANTIDAD,',
'       PRECIO_UNITARIO,',
'       PORC_DESCUENTO,',
'       MONTO_DESCUENTO,',
'       EXENTO,',
'       GRAVADO,',
'       IVA,',
'       TOTAL,',
'       HORAS_ESTIMADAS,',
'       HORAS_REALES',
'  FROM DET_OT_SERVICIO'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800184020)
,p_plug_name=>'Buttons'
,p_parent_plug_id=>wwv_flow_imp.id(800184010)
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
 p_id=>wwv_flow_imp.id(800184060)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(155498722991448612)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800184201)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(800184020)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:179:&SESSION.::&DEBUG.::P179_ID_ORDEN_TRABAJO:&P184_OT_ID_ORDEN_TRABAJO.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800184202)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(800184020)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P184_ID_DET_OT_SERVICIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(132643334503452140)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800184203)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(800184020)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'NEXT'
,p_button_condition=>'P184_ID_DET_OT_SERVICIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(132642559882454090)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800184204)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(800184020)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P184_ID_DET_OT_SERVICIO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(132642995094453132)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(800184401)
,p_branch_name=>'Go To 179'
,p_branch_action=>'f?p=&APP_ID.:179:&SESSION.::&DEBUG.::P179_ID_ORDEN_TRABAJO:&P184_OT_ID_ORDEN_TRABAJO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800184101)
,p_name=>'P184_ID_DET_OT_SERVICIO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_source=>'ID_DET_OT_SERVICIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800184102)
,p_name=>'P184_OT_ID_ORDEN_TRABAJO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_source=>'OT_ID_ORDEN_TRABAJO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800184103)
,p_name=>'P184_PRO_ID_PRODUCTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>'Servicio'
,p_source=>'PRO_ID_PRODUCTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DESCRIPCION d, ID_PRODUCTO r',
'  FROM PRODUCTO',
' WHERE TIPO = ''SRV''',
' ORDER BY 1'))
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(800184104)
,p_name=>'P184_DESCRIPCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>unistr('Descripci\00F3n (trabajo realizado)')
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
 p_id=>wwv_flow_imp.id(800184105)
,p_name=>'P184_IVA_ID_IVA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>'I.V.A.'
,p_source=>'IVA_ID_IVA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DESCRIPCION d, ID_IVA r',
'  FROM IVA',
' ORDER BY 1'))
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800184106)
,p_name=>'P184_UNI_ID_UNIDAD_MEDIDA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>'Unidad medida'
,p_source=>'UNI_ID_UNIDAD_MEDIDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DESCRIPCION d, ID_UNIDAD_MEDIDA r',
'  FROM UNIDAD_MEDIDA',
' ORDER BY 1'))
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800184107)
,p_name=>'P184_MAQ_ID_MAQUINA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>unistr('M\00E1quina')
,p_source=>'MAQ_ID_MAQUINA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DESCRIPCION d, ID_MAQUINA r',
'  FROM MAQUINA_TORNERIA',
' WHERE ESTADO = ''ACTIVO''',
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
 p_id=>wwv_flow_imp.id(800184108)
,p_name=>'P184_CANTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>'Cantidad'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'CANTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800184109)
,p_name=>'P184_PRECIO_UNITARIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>'Precio unitario'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'PRECIO_UNITARIO'
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
 p_id=>wwv_flow_imp.id(800184110)
,p_name=>'P184_PORC_DESCUENTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>'% Descuento'
,p_format_mask=>'990'
,p_source=>'PORC_DESCUENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800184111)
,p_name=>'P184_MONTO_DESCUENTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>'Monto  descuento'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'MONTO_DESCUENTO'
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
 p_id=>wwv_flow_imp.id(800184112)
,p_name=>'P184_EXENTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>'Exento'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'EXENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800184113)
,p_name=>'P184_GRAVADO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>'Gravado'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'GRAVADO'
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
 p_id=>wwv_flow_imp.id(800184114)
,p_name=>'P184_IVA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>'I.V.A. monto'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'IVA'
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
 p_id=>wwv_flow_imp.id(800184115)
,p_name=>'P184_TOTAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>'Total'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'TOTAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800184116)
,p_name=>'P184_HORAS_ESTIMADAS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>'Horas estimadas'
,p_format_mask=>'990D00'
,p_source=>'HORAS_ESTIMADAS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800184117)
,p_name=>'P184_HORAS_REALES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(800184010)
,p_item_source_plug_id=>wwv_flow_imp.id(800184010)
,p_prompt=>'Horas reales'
,p_format_mask=>'990D00'
,p_source=>'HORAS_REALES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(155498842428448613)
,p_name=>'P184_P_ID_MONEDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(155498722991448612)
,p_prompt=>'P Id Moneda'
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
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(132788675784876046)
,p_validation_name=>'Validar descuento'
,p_validation_sequence=>10
,p_validation=>':P184_PORC_DESCUENTO BETWEEN 0 AND 100'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Porcentaje de descuento fuera de rango'
,p_associated_item=>wwv_flow_imp.id(800184110)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(132788345822876043)
,p_name=>'Obtener monto_change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P184_PRECIO_UNITARIO,P184_PORC_DESCUENTO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(132788483480876044)
,p_event_id=>wwv_flow_imp.id(132788345822876043)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calcular_monto();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(155498540018448610)
,p_name=>'Obtener monto_lose'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P184_PRECIO_UNITARIO,P184_PORC_DESCUENTO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(155498678131448611)
,p_event_id=>wwv_flow_imp.id(155498540018448610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calcular_monto();'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800184302)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(800184010)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Servicio'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Servicio guardado.'
,p_internal_uid=>800184302
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800184303)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Recalcular Totales OT'
,p_process_sql_clob=>'BEGIN PKG_ORDEN_TRABAJO.P_RECALCULAR_TOTALES(:P184_OT_ID_ORDEN_TRABAJO); END;'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>800184303
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800184301)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(800184010)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Servicio'
,p_internal_uid=>800184301
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(132788245072876042)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P184_ID_DET_OT_SERVICIO IS NULL THEN',
'    :P184_UNI_ID_UNIDAD_MEDIDA := 1; -- Unidad',
'    :P184_IVA_ID_IVA := 1; -- 10%',
'    :P184_PORC_DESCUENTO := 0;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>132788245072876042
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(132788563223876045)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'calcular_monto'
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
'    :P184_PRECIO_UNITARIO := TO_NUMBER(:P184_PRECIO_UNITARIO,''999G999G999G999'');',
'    IF NVL(:P184_PORC_DESCUENTO,0) > 0 THEN',
'        :P184_MONTO_DESCUENTO := ((:P184_PRECIO_UNITARIO * :P184_PORC_DESCUENTO)/100);',
'    ELSE',
'        :P184_MONTO_DESCUENTO := 0;    ',
'    END IF;',
'    p_dev_valores_factura(',
'        p_id_iva => :P184_IVA_ID_IVA',
'      , p_id_moneda => :P184_P_ID_MONEDA',
'      , p_precio_unitario => (:P184_PRECIO_UNITARIO - :P184_MONTO_DESCUENTO)',
'      , p_cantidad => :P184_CANTIDAD',
'      , p_exento => :P184_EXENTO',
'      , p_gravado => :P184_GRAVADO',
'      , p_iva => :P184_IVA',
'      , p_total => :P184_TOTAL',
'    );',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P184_MONTO_DESCUENTO'', :P184_MONTO_DESCUENTO);',
'    output_json_item(''P184_EXENTO'', :P184_EXENTO);',
'    output_json_item(''P184_GRAVADO'', :P184_GRAVADO);',
'    output_json_item(''P184_IVA'', :P184_IVA);',
'    output_json_item(''P184_TOTAL'', :P184_TOTAL);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        ROLLBACK;',
'        apex_json.open_object;',
'        apex_json.write(''success'', FALSE);',
'        apex_json.write(''message'', utl_call_stack.error_msg(1));',
'        apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>132788563223876045
);
wwv_flow_imp.component_end;
end;
/
