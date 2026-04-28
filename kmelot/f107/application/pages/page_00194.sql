prompt --application/pages/page_00194
begin
--   Manifest
--     PAGE: 00194
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
 p_id=>194
,p_name=>'Linea de Nota de Credito'
,p_alias=>'NC-VENTA-DET-FORM'
,p_page_mode=>'MODAL'
,p_step_title=>'Linea de Nota de Credito'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Al cambiar la linea de factura, cargar datos y disponible',
'apex.jQuery(''#P194_DET_ID_DET_FACTURA_VENTA'').change(function(){',
'    var detFacId = apex.item(''P194_DET_ID_DET_FACTURA_VENTA'').getValue();',
'    if(detFacId){',
'        apex.server.process(''cargar_det_factura'', {',
'            x01: detFacId,',
'            x02: apex.item(''P194_ID_DET_NCREDITO_VENTA'').getValue()',
'        }, {',
'            success: function(data){',
'                if(data.success){',
'                    data.items.forEach(function(item){',
'                        apex.item(item.id).setValue(item.value);',
'                    });',
'                    calcularTotales();',
'                }',
'            }',
'        });',
'    }',
'});',
'',
'function calcularTotales() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors();',
'    apex.server.process("calcular_montos_nc", {',
'        pageItems: ["P194_CANTIDAD"',
'        ,"P194_PRECIO_UNITARIO"',
'        ,"P194_PORC_DESCUENTO"',
'        ,"P194_IVA_ID_IVA"',
'        ,"P194_NCA_ID_NCREDITO_VENTA"',
'        ]',
'    },',
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
'}',
'',
'apex.jQuery(''#P194_CANTIDAD, #P194_PRECIO_UNITARIO, #P194_PORC_DESCUENTO'').on(''change'', calcularTotales);'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.apex_disabled {',
'    opacity: 65%!important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(159049052521448528)
,p_dialog_height=>'650'
,p_dialog_width=>'600'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900194001)
,p_plug_name=>'Linea NC'
,p_region_name=>'REG_DET_NC_ABM'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_DET_NCREDITO_VENTA,',
'       NCA_ID_NCREDITO_VENTA,',
'       DET_ID_DET_FACTURA_VENTA,',
'       PRO_ID_PRODUCTO,',
'       DESCRIPCION,',
'       IVA_ID_IVA,',
'       UNI_ID_UNIDAD_MEDIDA,',
'       PRECIO_UNITARIO,',
'       CANTIDAD,',
'       PORC_DESCUENTO,',
'       MONTO_DESCUENTO,',
'       EXENTO,',
'       GRAVADO,',
'       IVA,',
'       TOTAL',
'  FROM DET_NCREDITO_VENTA'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900194201)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900194001)
,p_button_name=>'CERRAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Regresar'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900194203)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(900194001)
,p_button_name=>'ELIMINAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>unistr('\00BFConfirma eliminar esta l\00EDnea? Se revertir\00E1 el monto en la nota de cr\00E9dito y en la factura.')
,p_confirm_style=>'danger'
,p_button_condition=>'P194_ID_DET_NCREDITO_VENTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(159049648728446849)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900194202)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(900194001)
,p_button_name=>'GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_security_scheme=>wwv_flow_imp.id(159049648728446849)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194401)
,p_name=>'P194_ID_DET_NCREDITO_VENTA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_source=>'ID_DET_NCREDITO_VENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194402)
,p_name=>'P194_NCA_ID_NCREDITO_VENTA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_source=>'NCA_ID_NCREDITO_VENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194403)
,p_name=>'P194_FAC_ID_FACTURA_VENTA'
,p_item_sequence=>22
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194404)
,p_name=>'P194_DET_ID_DET_FACTURA_VENTA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_prompt=>unistr('L\00EDnea de Factura')
,p_source=>'DET_ID_DET_FACTURA_VENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUBSTR(D.DESCRIPCION, 1, 60) ||',
'       '' (Disponible: '' || TO_CHAR(PKG_NCREDITO_VENTA.F_DISPONIBLE_DET_FAC(D.ID_DET_FACTURA_VENTA), ''999G990D00'') || '')'' AS display,',
'       D.ID_DET_FACTURA_VENTA AS return',
'  FROM DET_FACTURA_VENTA D',
' WHERE D.FAC_ID_FACTURA_VENTA = :P194_FAC_ID_FACTURA_VENTA',
' ORDER BY D.ID_DET_FACTURA_VENTA'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>unistr('- Seleccione l\00EDnea -')
,p_colspan=>8
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194405)
,p_name=>'P194_DISPONIBLE'
,p_item_sequence=>32
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_prompt=>'Disponible'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194406)
,p_name=>'P194_PRO_ID_PRODUCTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>35
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_source=>'PRO_ID_PRODUCTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194407)
,p_name=>'P194_DESCRIPCION'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DESCRIPCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>2000
,p_cHeight=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194408)
,p_name=>'P194_IVA_ID_IVA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_prompt=>'IVA'
,p_source=>'IVA_ID_IVA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IVA'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione -'
,p_colspan=>6
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194409)
,p_name=>'P194_UNI_ID_UNIDAD_MEDIDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>52
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_prompt=>'Unidad'
,p_source=>'UNI_ID_UNIDAD_MEDIDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_UNIDAD_MEDIDA_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT descripcion||'' (''||abreviatura||'')'' AS d',
'      ,id_unidad_medida AS r ',
'from unidad_medida',
'where estado = ''ACTIVO'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione -'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194410)
,p_name=>'P194_CANTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_prompt=>'Cantidad'
,p_source=>'CANTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_colspan=>4
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194411)
,p_name=>'P194_PRECIO_UNITARIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>62
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_prompt=>'Precio Unitario'
,p_format_mask=>'999G999G999G990D00'
,p_source=>'PRECIO_UNITARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194412)
,p_name=>'P194_PORC_DESCUENTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>64
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_prompt=>'% Descuento'
,p_source=>'PORC_DESCUENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194413)
,p_name=>'P194_MONTO_DESCUENTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>66
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_source=>'MONTO_DESCUENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194414)
,p_name=>'P194_EXENTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_prompt=>'Exento'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'EXENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194415)
,p_name=>'P194_GRAVADO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>72
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_prompt=>'Gravado'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'GRAVADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194416)
,p_name=>'P194_IVA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>74
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_prompt=>'I.V.A.'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'IVA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900194417)
,p_name=>'P194_TOTAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>76
,p_item_plug_id=>wwv_flow_imp.id(900194001)
,p_item_source_plug_id=>wwv_flow_imp.id(900194001)
,p_prompt=>'Total'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'TOTAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900194801)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar linea NC'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  IF :REQUEST IN (''GUARDAR'', ''CREATE'', ''SAVE'') THEN',
'    PKG_NCREDITO_VENTA.P_GUARDAR_DET_NCREDITO(',
'      p_id_det_ncredito_venta    => :P194_ID_DET_NCREDITO_VENTA,',
'      p_nca_id_ncredito_venta    => :P194_NCA_ID_NCREDITO_VENTA,',
'      p_det_id_det_factura_venta => :P194_DET_ID_DET_FACTURA_VENTA,',
'      p_pro_id_producto          => :P194_PRO_ID_PRODUCTO,',
'      p_descripcion              => :P194_DESCRIPCION,',
'      p_iva_id_iva               => :P194_IVA_ID_IVA,',
'      p_uni_id_unidad_medida     => :P194_UNI_ID_UNIDAD_MEDIDA,',
'      p_precio_unitario          => TO_NUMBER(:P194_PRECIO_UNITARIO,''999G999G999D00''),',
'      p_cantidad                 => :P194_CANTIDAD,',
'      p_porc_descuento           => NVL(:P194_PORC_DESCUENTO, 0),',
'      p_exento                   => TO_NUMBER(:P194_EXENTO,''999G999G999G999D00''),',
'      p_gravado                  => TO_NUMBER(:P194_GRAVADO,''999G999G999G999D00''),',
'      p_iva                      => TO_NUMBER(:P194_IVA,''999G999G999G999D00''),',
'      p_monto_descuento          => TO_NUMBER(:P194_MONTO_DESCUENTO,''999G999G999G999D00''),',
'      p_total                    => TO_NUMBER(:P194_TOTAL,''999G999G999G999D00'')',
'    );',
'  ELSIF :REQUEST = ''ELIMINAR'' THEN',
'    PKG_NCREDITO_VENTA.P_ELIMINAR_DET_NCREDITO(:P194_ID_DET_NCREDITO_VENTA);',
'  END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'GUARDAR,CREATE,SAVE,ELIMINAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>900194801
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900194802)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar dialogo'
,p_attribute_02=>'Y'
,p_internal_uid=>900194802
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900194701)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(900194001)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Init Form DET NC'
,p_internal_uid=>900194701
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900194702)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre-cargar desde linea de factura'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  IF :P194_ID_DET_NCREDITO_VENTA IS NULL AND :P194_DET_ID_DET_FACTURA_VENTA IS NOT NULL THEN',
'    -- Pre-cargar datos desde DET_FACTURA_VENTA',
'    SELECT D.PRO_ID_PRODUCTO',
'          ,D.DESCRIPCION',
'          ,D.IVA_ID_IVA',
'          ,D.UNI_ID_UNIDAD_MEDIDA',
'          ,D.PRECIO_UNITARIO',
'          ,D.CANTIDAD',
'    INTO :P194_PRO_ID_PRODUCTO',
'        ,:P194_DESCRIPCION',
'        ,:P194_IVA_ID_IVA',
'        ,:P194_UNI_ID_UNIDAD_MEDIDA',
'        ,:P194_PRECIO_UNITARIO',
'        ,:P194_CANTIDAD',
'    FROM DET_FACTURA_VENTA D',
'    WHERE D.ID_DET_FACTURA_VENTA = :P194_DET_ID_DET_FACTURA_VENTA;',
'  END IF;',
'  -- Cargar disponible para la linea',
'  IF :P194_DET_ID_DET_FACTURA_VENTA IS NOT NULL THEN',
'    :P194_DISPONIBLE :=  PKG_NCREDITO_VENTA.F_DISPONIBLE_DET_FAC(:P194_DET_ID_DET_FACTURA_VENTA)',
'      + NVL(TO_NUMBER(:P194_TOTAL,''999G999G999G999D00''),0);',
'  END IF;',
'EXCEPTION WHEN NO_DATA_FOUND THEN NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900194702
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900194901)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar_det_factura'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_det_fac_id  NUMBER := TO_NUMBER(APEX_APPLICATION.G_X01);',
'  v_det_nc_id   NUMBER := CASE WHEN APEX_APPLICATION.G_X02 IS NOT NULL AND APEX_APPLICATION.G_X02 != '''' THEN TO_NUMBER(APEX_APPLICATION.G_X02) ELSE NULL END;',
'  v_total_old   NUMBER := 0;',
'  v_disponible  NUMBER;',
'  v_pro_id      DET_FACTURA_VENTA.PRO_ID_PRODUCTO%TYPE;',
'  v_desc        DET_FACTURA_VENTA.DESCRIPCION%TYPE;',
'  v_iva_id      DET_FACTURA_VENTA.IVA_ID_IVA%TYPE;',
'  v_uni_id      DET_FACTURA_VENTA.UNI_ID_UNIDAD_MEDIDA%TYPE;',
'  v_precio      DET_FACTURA_VENTA.PRECIO_UNITARIO%TYPE;',
'  v_cant        DET_FACTURA_VENTA.CANTIDAD%TYPE;',
'  PROCEDURE out_item(p_id IN VARCHAR2, p_val IN VARCHAR2) AS',
'  BEGIN',
'    APEX_JSON.OPEN_OBJECT;',
'    APEX_JSON.WRITE(''id'', p_id);',
'    APEX_JSON.WRITE(''value'', p_val, TRUE);',
'    APEX_JSON.CLOSE_OBJECT;',
'  END;',
'BEGIN',
'  SELECT PRO_ID_PRODUCTO, DESCRIPCION, IVA_ID_IVA, UNI_ID_UNIDAD_MEDIDA, PRECIO_UNITARIO, CANTIDAD',
'  INTO v_pro_id, v_desc, v_iva_id, v_uni_id, v_precio, v_cant',
'  FROM DET_FACTURA_VENTA WHERE ID_DET_FACTURA_VENTA = v_det_fac_id;',
'',
'  IF v_det_nc_id IS NOT NULL THEN',
'    SELECT NVL(TOTAL,0) INTO v_total_old FROM DET_NCREDITO_VENTA WHERE ID_DET_NCREDITO_VENTA = v_det_nc_id;',
'  END IF;',
'',
'  v_disponible := PKG_NCREDITO_VENTA.F_DISPONIBLE_DET_FAC(v_det_fac_id) + v_total_old;',
'',
'  APEX_JSON.OPEN_OBJECT;',
'  APEX_JSON.WRITE(''success'', TRUE);',
'  APEX_JSON.OPEN_ARRAY(''items'');',
'  out_item(''P194_PRO_ID_PRODUCTO'', TO_CHAR(v_pro_id));',
'  out_item(''P194_DESCRIPCION'', v_desc);',
'  out_item(''P194_IVA_ID_IVA'', TO_CHAR(v_iva_id));',
'  out_item(''P194_UNI_ID_UNIDAD_MEDIDA'', TO_CHAR(v_uni_id));',
'  out_item(''P194_PRECIO_UNITARIO'', TO_CHAR(v_precio));',
'  out_item(''P194_CANTIDAD'', TO_CHAR(v_cant));',
'  out_item(''P194_DISPONIBLE'', TO_CHAR(v_disponible, ''999G999G990D00''));',
'  APEX_JSON.CLOSE_ARRAY;',
'  APEX_JSON.CLOSE_OBJECT;',
'EXCEPTION WHEN OTHERS THEN',
'  APEX_JSON.OPEN_OBJECT;',
'  APEX_JSON.WRITE(''success'', FALSE);',
'  APEX_JSON.WRITE(''message'', UTL_CALL_STACK.ERROR_MSG(1));',
'  APEX_JSON.CLOSE_OBJECT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900194901
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900194902)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'calcular_montos_nc'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_moneda     cab_ncredito_venta.mon_id_moneda%TYPE;',
'v_subtotal   det_ncredito_venta.total%TYPE;',
'v_descuento  det_ncredito_venta.total%TYPE;',
'v_neto       det_ncredito_venta.total%TYPE;',
'v_exento     det_ncredito_venta.exento%TYPE;',
'v_gravado    det_ncredito_venta.gravado%TYPE;',
'v_iva        det_ncredito_venta.iva%TYPE;',
'v_total      det_ncredito_venta.total%TYPE;',
'PROCEDURE output_json_item (',
'     p_item_name  IN VARCHAR2',
'    ,p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''   , p_item_name);',
'    apex_json.write(''value'', p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'BEGIN',
'    IF :P194_IVA_ID_IVA IS NULL THEN',
'        raise_application_error(-20000,''IVA no definido, favor verifique.'');',
'    END IF;',
'    IF :P194_NCA_ID_NCREDITO_VENTA IS NULL THEN',
'        raise_application_error(-20000,''Nota de credito no identificada.'');',
'    END IF;',
'    BEGIN',
'        SELECT mon_id_moneda',
'        INTO v_moneda',
'        FROM cab_ncredito_venta',
'        WHERE id_ncredito_venta = :P194_NCA_ID_NCREDITO_VENTA;',
'    EXCEPTION',
'        WHEN No_Data_Found THEN',
'            raise_application_error(-20000,''Cabecera de nota de credito no encontrada.'');',
'    END;',
'    v_subtotal  := NVL(TO_NUMBER(:P194_CANTIDAD,''999G999G999G999D00''),0)',
'                 * NVL(TO_NUMBER(:P194_PRECIO_UNITARIO,''999G999G999G999D00''),0);',
'    v_descuento := ROUND(v_subtotal',
'                 * NVL(TO_NUMBER(:P194_PORC_DESCUENTO,''999G999D00''),0) / 100);',
'    v_neto      := v_subtotal - v_descuento;',
'    p_dev_valores_factura( P_ID_IVA          => :P194_IVA_ID_IVA',
'                          ,P_ID_MONEDA       => v_moneda',
'                          ,P_PRECIO_UNITARIO => v_neto',
'                          ,P_CANTIDAD        => 1',
'                          ,P_EXENTO          => v_exento',
'                          ,P_GRAVADO         => v_gravado',
'                          ,P_IVA             => v_iva',
'                          ,P_TOTAL           => v_total',
'                          );',
'    :P194_EXENTO          := v_exento;',
'    :P194_GRAVADO         := v_gravado;',
'    :P194_IVA             := v_iva;',
'    :P194_TOTAL           := v_total;',
'    :P194_MONTO_DESCUENTO := v_descuento;',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P194_EXENTO''         , TO_CHAR(:P194_EXENTO));',
'    output_json_item(''P194_GRAVADO''        , TO_CHAR(:P194_GRAVADO));',
'    output_json_item(''P194_IVA''            , TO_CHAR(:P194_IVA));',
'    output_json_item(''P194_TOTAL''          , TO_CHAR(:P194_TOTAL));',
'    output_json_item(''P194_MONTO_DESCUENTO'', TO_CHAR(:P194_MONTO_DESCUENTO));',
'    apex_json.close_array;',
'    apex_json.close_object;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        ROLLBACK;',
'        apex_json.open_object;',
'        apex_json.write(''success'', FALSE);',
'        apex_json.write(''message'', utl_call_stack.error_msg(1));',
'        apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900194902
);
wwv_flow_imp.component_end;
end;
/
