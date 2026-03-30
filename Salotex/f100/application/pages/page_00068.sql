prompt --application/pages/page_00068
begin
--   Manifest
--     PAGE: 00068
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
 p_id=>68
,p_name=>'Crear/editar factura venta'
,p_alias=>'CREAR-EDITAR-FACTURA-VENTA'
,p_step_title=>'Crear/editar factura venta'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#mascara_fecha#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function agregaProducto() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("agregar_producto", {',
'        pageItems: ["P68_DEPOSITO_ADD"',
'        ,"P68_PRODUCTO_ADD"',
'        ,"P68_FECHA_FACTURA"',
'        ,"P68_MON_ID_MONEDA"',
'        ,"P68_CANTIDAD_ADD"',
'        ,"P68_P_ID_UNIDAD_MEDIDA"',
'        ,"P68_P_ID_PRODUCTO"',
'        ]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.region("IG_DETALLE").refresh();',
'                if (apex.item("P68_CONDICION_VENTA").getValue() == ''CREDITO'') {',
'                    apex.item("BTN_CUOTAS").enable();',
'                }',
'                apex.item("BTN_CREAR").enable();                 ',
'            } else {      ',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }       ',
'        }',
'    }).always( function() {',
'        waitPopup.remove();',
'    });',
'}    ',
'function buscarNroFactura() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("buscar_nro_factura", {',
'        pageItems: ["P68_TIM_ID_TIMBRADO"',
'        ,"P68_SUC_ID_SUCURSAL"',
'        ,"P68_TIP_ID_TIPO_COMPROBANTE"',
'        ,"P68_SUC_ID_SUCURSAL"',
'        ,"P68_FECHA_FACTURA"',
'        ]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'            } else {      ',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }       ',
'        }',
'    }).always( function() {',
'        waitPopup.remove();',
'    });',
'}',
'function anularFactura() {',
'    apex.message.confirm(''Proceder con la ANULACION?'',function(okPressed) {',
'        if (okPressed) {',
'            var waitPopup = apex.widget.waitPopup();',
'            apex.message.clearErrors(); ',
'            apex.server.process("anular_factura", {',
'                pageItems: ["P68_ID_FACTURA_TMP"]',
'            },',
'            {',
'                success: function( data ) {',
'                    if ( data.success === true ) {',
'                        for (var i=0; i < data.items.length; i++){',
'                            apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                        } ',
'                        var waitPopup = apex.widget.waitPopup();',
'                        let url = $v("P68_URL_ACTUAL");',
'                        apex.navigation.redirect(url);',
'                    } else {      ',
'                        apex.message.showErrors([',
'                            {',
'                                type: "error",',
'                                location: "page",',
'                                message: data.message,',
'                                unsafe: false',
'                            }',
'                        ]);',
'                    }       ',
'                }',
'            }).always( function() {',
'                waitPopup.remove();',
'            });',
'        }',
'    });',
'}',
'function verProducto(){',
'    apex.item("P68_ID_ENVIAR").setValue(apex.item("P68_P_ID_PRODUCTO").getValue());',
'    apex.submit ("IR_A_VER");',
'}',
'',
'function urlVerPDF(){',
'    apex.navigation.openInNewWindow( "f?p=&APP_ID.:&APP_PAGE_ID.:&APP_SESSION.:application_process=ver_pdf:NO:RP::" );',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'mascaraFechaRegex("#P68_FECHA_FACTURA");',
'if (!apex.item("P68_ID_FACTURA_VENTA").isEmpty()) {',
'    if (apex.item("P68_ID_FACTURA_VENTA").getValue() != apex.item("P68_NRO_FACTURA").getValue() || apex.item("P68_ESTADO").getValue() == ''ANULADO'' ) {',
'        $("#P68_FECHA_FACTURA").prop("disabled", true);',
'        $("#P68_FECHA_FACTURA").attr("tabindex", "-1");',
'        $("#P68_CONDICION_VENTA").prop("disabled", true);',
'        $("#P68_CONDICION_VENTA").attr("tabindex", "-1");',
'        $("#P68_FECHA_VENCIMIENTO").prop("disabled", true);',
'        $("#P68_FECHA_VENCIMIENTO").attr("tabindex", "-1");',
'        $("#P68_TIP_ID_TIPO_COMPROBANTE").prop("disabled", true);',
'        $("#P68_TIP_ID_TIPO_COMPROBANTE").attr("tabindex", "-1");',
'        $("#P68_NRO_FACTURA").prop("disabled", true);',
'        $("#P68_NRO_FACTURA").attr("tabindex", "-1");',
'        $("#P68_LIC_ID_LICITACION").prop("disabled", true);',
'        $("#P68_LIC_ID_LICITACION").attr("tabindex", "-1");',
'        $("#P68_ORDEN_COMPRA").prop("disabled", true);',
'        $("#P68_ORDEN_COMPRA").attr("tabindex", "-1");',
'        apex.item("BTN_APLICAR").disable();',
'    } else {',
'        apex.item("P68_FECHA_FACTURA").setFocus();',
'    }',
'    $("#P68_ENT_ID_ENTIDAD").prop("disabled", true);',
'    $("#P68_ENT_ID_ENTIDAD").attr("tabindex", "-1");',
'    $("#P68_MON_ID_MONEDA").prop("disabled", true);',
'    $("#P68_MON_ID_MONEDA").attr("tabindex", "-1");',
'}',
'$("#P68_TIPO_CAMBIO").prop("disabled", true);',
'$("#P68_TIPO_CAMBIO").attr("tabindex", "-1");',
'$("#P68_ID_FACTURA_VENTA").prop( ''readOnly'', true);',
'$("#P68_ESTADO").prop("disabled", true);',
'$("#P68_ESTADO").attr("tabindex", "-1");',
'$("#P68_MONTO").prop("disabled", true);',
'$("#P68_MONTO").attr("tabindex", "-1");',
'$("#P68_DCTO_SEDECO").prop("disabled", true);',
'$("#P68_DCTO_SEDECO").attr("tabindex", "-1");',
'$("#P68_SALDO").prop("disabled", true);',
'$("#P68_SALDO").attr("tabindex", "-1");',
'$(''#P68_USUARIO_REGISTRO'').prop(''readonly'', true);',
'$(''#P68_USUARIO_ANULO'').prop(''readonly'', true);',
'$(''#P68_FECHA_REGISTRO'').prop(''readonly'', true);',
'$(''#P68_FECHA_ANULO'').prop(''readonly'', true);',
'$(''#P68_SUC_ID_SUCURSAL'').attr(''disabled'', true);',
'if (apex.item("P68_ID_FACTURA_VENTA").getValue() != apex.item("P68_NRO_FACTURA")) {',
'    if (apex.item("P68_ID_FACTURA_VENTA").isEmpty()) {',
'        apex.item("BTN_CUOTAS").disable();',
'    }',
'}',
'apex.item("BTN_CREAR").disable();',
'setTimeout(() => {',
'    $("#P68_ESTADO").addClass($("#P68_ESTADO").val()); ',
'},200);',
'',
''))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 2px;',
'}',
'',
'.text-dark {',
'    color:black !important;',
'    opacity: 1 !important;',
'}',
'',
'.aling_derecha {',
'text-align: right;}',
'',
'#P68_ESTADO.ACTIVO {',
'    background-color: rgb(117, 206, 105);',
'    text-align: center;',
'    opacity: 1 !important;',
'}',
'',
'#P68_ESTADO.ANULADO {',
'    background-color: rgb(206, 105, 105);',
'    color :white;',
'    text-align: center;',
'    opacity: 1 !important;',
'}',
'',
'#P68_ID_FACTURA_VENTA {',
'    background-color: rgb(190, 190, 190);',
'    color :rgb(0, 0, 0);',
'    text-align: center;',
'}',
' ',
'#P68_CANTIDAD_ADD,',
'#P68_PRODUCTO_ADD,',
'#P68_DEPOSITO_ADD,',
'#P68_CONDICION_VENTA,',
'#P68_TIP_ID_TIPO_COMPROBANTE,',
'#P68_ENT_ID_ENTIDAD',
'{',
'    background-color: rgb(240, 215, 102);',
'}',
'',
'#btn_ver_info, #btn_add_producto, #btn_add_cliente, #btn_ver_pdf, #btn_cobrar, #BTN_ANULAR, #BTN_VER_CUOTAS {    ',
'    margin-top: 17px;',
'    }',
'',
'a-Button a-Toolbar-item {',
'    display: none;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(89028484964483715)
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86991608406966381)
,p_plug_name=>'Crear/editar factura venta'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'CAB_FACTURA_VENTA'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87047294638819056)
,p_plug_name=>'Detalle'
,p_region_name=>'IG_DETALLE'
,p_parent_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>410
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'  To_Number(c001) ID_DET_FACTURA_VENTA',
' ,To_Number(c002) FAC_ID_FACTURA_VENTA',
' ,To_Number(c003) PRO_ID_PRODUCTO',
' ,c004            DESCRIPCION',
' ,To_Number(c005) IVA_ID_IVA',
' ,To_Number(c006) UNI_ID_UNIDAD_MEDIDA',
' ,To_Number(c007) PRECIO_UNITARIO',
' ,To_Number(c008) CANTIDAD',
' ,To_Number(c009) EXENTO',
' ,To_Number(c010) GRAVADO',
' ,To_Number(c011) IVA',
' ,To_Number(c012) MONTO_DESCUENTO',
' ,To_Number(c013) PORC_DESCUENTO',
' ,c014            LOTE',
' ,To_Date(c015,''dd/mm/yyyy'') VENCIMIENTO',
' ,To_Number(c016) TOTAL',
' ,To_Number(c017) CEN_ID_CENTRO_COSTO',
' ,To_Number(c018) DEP_ID_DEPOSITO',
' ,SEQ_ID',
'FROM apex_collections f',
'WHERE collection_name = ''COLL_DETALLE_FVENTA''',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Detalle'
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87047507201819058)
,p_name=>'ID_DET_FACTURA_VENTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DET_FACTURA_VENTA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87047554788819059)
,p_name=>'FAC_ID_FACTURA_VENTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FAC_ID_FACTURA_VENTA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87047694629819060)
,p_name=>'PRO_ID_PRODUCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRO_ID_PRODUCTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Id producto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87047787116819061)
,p_name=>'DESCRIPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87047903654819062)
,p_name=>'IVA_ID_IVA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IVA_ID_IVA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'I.V.A.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(90414572990473615)
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87047950869819063)
,p_name=>'UNI_ID_UNIDAD_MEDIDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNI_ID_UNIDAD_MEDIDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Uni.med.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(34805528510739251)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87048082108819064)
,p_name=>'PRECIO_UNITARIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRECIO_UNITARIO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Precio unitario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87048213495819065)
,p_name=>'CANTIDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87048249030819066)
,p_name=>'EXENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXENTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Exento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87048331919819067)
,p_name=>'GRAVADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GRAVADO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Gravado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87048462677819068)
,p_name=>'IVA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IVA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'I.V.A.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87048615332819069)
,p_name=>'MONTO_DESCUENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MONTO_DESCUENTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87048707275819070)
,p_name=>'PORC_DESCUENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PORC_DESCUENTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87048788000819071)
,p_name=>'LOTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOTE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87048838239819072)
,p_name=>'VENCIMIENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VENCIMIENTO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87048976257819073)
,p_name=>'TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87049032357819074)
,p_name=>'CEN_ID_CENTRO_COSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CEN_ID_CENTRO_COSTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87049159406819075)
,p_name=>'DEP_ID_DEPOSITO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEP_ID_DEPOSITO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Dep\00F3sito')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(87767137282040737)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87752756947160351)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_display_condition_type=>'ITEM_IS_NULL'
,p_display_condition=>'P68_ID_FACTURA_VENTA'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87752893413160352)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(87753190241160355)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(87047381418819057)
,p_internal_uid=>13314362354812317
,p_is_editable=>true
,p_edit_operations=>'d'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>false
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    var $ = apex.jQuery,',
'        toolbarData = $.apex.interactiveGrid.copyDefaultToolbar(),',
'        reportsGroupControls = toolbarData.toolbarFind( "actions4" ).controls;',
'    toolbarData.toolbarRemove( "actions2" );',
'    options.toolbarData = toolbarData;',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(87093157242017584)
,p_interactive_grid_id=>wwv_flow_imp.id(87047381418819057)
,p_static_id=>'133602'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(87093393961017585)
,p_report_id=>wwv_flow_imp.id(87093157242017584)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87093769311017589)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(87047507201819058)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87094637789017592)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(87047554788819059)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87095557577017594)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(87047694629819060)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>30
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87096420621017596)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(87047787116819061)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87097369004017598)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(87047903654819062)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>20
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87098284108017601)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(87047950869819063)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>25
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87099192472017603)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(87048082108819064)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87100089349017605)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(87048213495819065)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87100987972017607)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(87048249030819066)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87101883865017609)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(87048331919819067)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87102783849017611)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(87048462677819068)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87103675014017613)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(87048615332819069)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87104618742017615)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(87048707275819070)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87105500151017617)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(87048788000819071)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87106388709017619)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(87048838239819072)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87107222062017621)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(87048976257819073)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87108178626017623)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(87049032357819074)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87109074138017625)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(87049159406819075)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87778111501353042)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(87752756947160351)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(87788424826601355)
,p_view_id=>wwv_flow_imp.id(87093393961017585)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(87753190241160355)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87018302848966407)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--compactTitle:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(86947038457749062)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(97315654865340342)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88314129596653954)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_button_name=>'AddCliente'
,p_button_static_id=>'btn_add_cliente'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--success:t-Button--simple:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'+Cliente'
,p_button_redirect_url=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:71::'
,p_button_condition=>'P68_ID_FACTURA_VENTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-address-book'
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(87752586801160349)
,p_button_sequence=>230
,p_button_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_button_name=>'VerDetalleProducto'
,p_button_static_id=>'btn_ver_info'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--simple:t-Button--stretch'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>unistr('Informaci\00F3n del producto')
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P68_ID_FACTURA_VENTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-map-marker-shine-o'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88390065072671750)
,p_button_sequence=>280
,p_button_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_button_name=>'VerPDF'
,p_button_static_id=>'btn_ver_pdf'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--simple:t-Button--iconLeft:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Ver'
,p_button_redirect_url=>'javascript: urlVerPDF();'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P68_ESTADO != ''ANULADO'' ',
'AND :P68_ID_FACTURA_VENTA IS NOT NULL',
'AND TO_NUMBER(:P68_ID_FACTURA_VENTA) != TO_NUMBER(:P68_NRO_FACTURA,''999g999g9999999'')'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(96714516514739641)
,p_button_sequence=>310
,p_button_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_button_name=>'Anular'
,p_button_static_id=>'BTN_ANULAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'ANULAR'
,p_button_redirect_url=>'javascript: anularFactura()'
,p_button_condition=>':P68_ESTADO = ''ACTIVO'' and :P68_ID_FACTURA_VENTA is not null'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-money'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(87752667672160350)
,p_button_sequence=>320
,p_button_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_button_name=>'Agregar'
,p_button_static_id=>'btn_add_producto'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--success:t-Button--simple:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Agregar a la factura'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P68_ID_FACTURA_VENTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-cart-plus'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(84189569425729942)
,p_button_sequence=>330
,p_button_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_button_name=>'VER_CUOTAS'
,p_button_static_id=>'BTN_VER_CUOTAS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Ver plazos'
,p_button_redirect_url=>'f?p=&APP_ID.:74:&SESSION.::&DEBUG.:74:P74_P_ID_FACTURA:&P68_ID_FACTURA_VENTA.'
,p_button_condition=>':P68_ID_FACTURA_VENTA IS NOT NULL AND :P68_CONDICION_VENTA = ''CREDITO'' AND :P68_ESTADO = ''ACTIVO'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(87041774325827371)
,p_button_sequence=>340
,p_button_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_button_name=>'Cobrar'
,p_button_static_id=>'btn_cobrar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Cobrar'
,p_button_redirect_url=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:84:P84_ENT_ID_ENTIDAD,P84_TIPO_FACS,P84_TIP_ID_TIPO_COMPROBANTE:&P68_ENT_ID_ENTIDAD.,CO,3'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'TO_NUMBER(:P68_SALDO,''999G999G999G999D99'') > 0 ',
'and :P68_ESTADO = ''ACTIVO'' ',
'and :P68_CONDICION_VENTA = ''CONTADO''',
'and :P68_ID_FACTURA_VENTA != to_number(:P68_NRO_FACTURA,''999g999g9999999'')'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-money'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(87006060385966393)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_button_name=>'SAVE'
,p_button_static_id=>'BTN_APLICAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P68_ID_FACTURA_VENTA IS NOT NULL',
'AND :P68_ESTADO != ''ANULADO'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(89028702268485477)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(87005045578966391)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&APP_SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(87006486940966393)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_button_name=>'CREATE'
,p_button_static_id=>'BTN_CREAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear venta'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P68_ID_FACTURA_VENTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(89028911658486423)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(87746376938017674)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_button_name=>'Definir_cuotas'
,p_button_static_id=>'BTN_CUOTAS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Definir pagos'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:74:&SESSION.::&DEBUG.:74:P74_MONTO:&P68_MONTO.'
,p_button_condition=>':P68_ESTADO != ''ANULADO'' AND (:P68_ID_FACTURA_VENTA IS NULL OR (to_number(:P68_ID_FACTURA_VENTA) = to_number(:P68_NRO_FACTURA,''999g999g9999999'')))'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(87005709317966393)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>':P68_ESTADO = ''ANULADO'' AND TO_NUMBER(:P68_ID_FACTURA_VENTA) = TO_NUMBER(:P68_NRO_FACTURA,''999g999g9999999'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(89029020023487408)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(87006785334966394)
,p_branch_name=>'Go To Page 67'
,p_branch_action=>'f?p=&APP_ID.:67:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(87005045578966391)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(28059869120557348)
,p_branch_name=>'Go To Page 67 Eliminar'
,p_branch_action=>'f?p=&APP_ID.:67:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>11
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(88389304768671742)
,p_branch_name=>'Go To Page 68'
,p_branch_action=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.::P68_ID_FACTURA_VENTA:&P68_ID_FACTURA_VENTA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(87006486940966393)
,p_branch_sequence=>21
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(88313686646653949)
,p_branch_name=>'VerProducto'
,p_branch_action=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:31:P31_ID_PRODUCTO,P31_SOLO_CONSULTA:&P68_ID_ENVIAR.,SI&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>31
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'IR_A_VER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33797865948669527)
,p_name=>'P68_LIC_ID_LICITACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>unistr('Licitaci\00F3n')
,p_source=>'LIC_ID_LICITACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_LICITACIONES_ALL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT l.id_licitacion AS r',
'      ,l.nro_licitacion||'' CC: ''||l.codigo_contratacion||'' ''||l.convocante AS d',
'FROM licitacion l'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column_css_classes=>'apex_disabled'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'tabindex="-1"'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33797929192669528)
,p_name=>'P68_ORDEN_COMPRA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'Orden compra'
,p_source=>'ORDEN_COMPRA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34544689718185332)
,p_name=>'P68_P_ID_UNIDAD_MEDIDA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(97315654865340342)
,p_prompt=>'P Id Unidad Medida'
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
 p_id=>wwv_flow_imp.id(34544754908185333)
,p_name=>'P68_P_ID_PRODUCTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(97315654865340342)
,p_prompt=>'P Id Producto'
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
 p_id=>wwv_flow_imp.id(86991912925966382)
,p_name=>'P68_ID_FACTURA_VENTA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'Id factura venta'
,p_source=>'ID_FACTURA_VENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'center',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86992267934966382)
,p_name=>'P68_FECHA_FACTURA'
,p_source_data_type=>'DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_default=>'to_char(trunc(current_date,''DD''),''DD-MM-YYYY'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Fecha factura'
,p_source=>'FECHA_FACTURA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86992702352966383)
,p_name=>'P68_FECHA_VENCIMIENTO'
,p_source_data_type=>'DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'Fecha vencimiento'
,p_source=>'FECHA_VENCIMIENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:CLEAR-BUTTON',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86993100118966383)
,p_name=>'P68_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'Cliente'
,p_source=>'ENT_ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ENTIDAD_CLIENTE_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.abreviatura||'' ''||e.numero_documento||'', ''||e.nombre d',
'       ,e.id_entidad r',
'FROM entidad e, tipo_documento t',
'WHERE e.es_cliente = ''SI''',
'AND e.estado = ''ACTIVO''',
'AND t.id_tipo_documento = e.tip_id_tipo_documento'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(86993498688966383)
,p_name=>'P68_TIP_ID_TIPO_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_default=>'APP_ID_TIPO_COMP_FACTURA'
,p_item_default_type=>'ITEM'
,p_prompt=>'Tipo comprobante'
,p_source=>'TIP_ID_TIPO_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TIPO_COMPROBANTE_EN_VENTA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tipo_comprobante r,',
'       descripcion d ',
'  from TIPO_COMPROBANTE',
' where estado = ''ACTIVO'' ',
'   and venta = ''SI'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86993849548966383)
,p_name=>'P68_CONDICION_VENTA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>unistr('Condici\00F3n venta')
,p_source=>'CONDICION_VENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CONDICION_FACTURA'
,p_lov=>'.'||wwv_flow_imp.id(85166822237741586)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86994279966966384)
,p_name=>'P68_TIM_ID_TIMBRADO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>unistr('Punto de expedici\00F3n')
,p_source=>'TIM_ID_TIMBRADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT LPad(t.establecimiento,3,''0'')||''-''||LPad(t.punto_expedicion,3,''0'')||'' ''||tc.descripcion||'' ''||t.nro_timbrado',
'      ,t.id_timbrado r',
'FROM usuarios u, entidad e, usuario_punto_expedicion up, timbrado t, tipo_comprobante tc',
'WHERE u.usuario       = Nvl(v(''APP_USER''),USER)',
'AND u.estado          = ''ACTIVO''',
'AND e.usu_id_usuario  = u.id_usuario',
'AND e.estado          = ''ACTIVO''',
'AND up.ent_id_entidad = e.id_entidad',
'AND up.estado         = ''ACTIVO''',
'AND t.id_timbrado     = up.tim_id_timbrado',
'AND t.estado          = ''ACTIVO''',
'AND t.suc_id_sucursal         = :P68_SUC_ID_SUCURSAL',
'AND t.tip_id_tipo_comprobante = :P68_TIP_ID_TIPO_COMPROBANTE',
'AND t.nro_final               > t.nro_utilizado ',
'AND to_date(:P68_FECHA_FACTURA,''DD-MM-YYYY'') BETWEEN trunc(t.fecha_inicio,''DD'') AND trunc(t.fecha_vencimiento,''DD'')',
'AND tc.id_tipo_comprobante   = t.tip_id_tipo_comprobante',
''))
,p_lov_cascade_parent_items=>'P68_SUC_ID_SUCURSAL,P68_TIP_ID_TIPO_COMPROBANTE,P68_FECHA_FACTURA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P68_ID_FACTURA_VENTA IS NULL',
'OR ( TO_NUMBER(:P68_ID_FACTURA_VENTA) = TO_NUMBER(:P68_NRO_FACTURA,''999g999g9999999'')',
'    AND :P68_ESTADO = ''ACTIVO'' )'))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86994666886966384)
,p_name=>'P68_NRO_FACTURA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'Nro. Factura'
,p_format_mask=>'999G999G9999999'
,p_source=>'NRO_FACTURA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P68_NRO_FACTURA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86995029773966384)
,p_name=>'P68_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'Moneda'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA_ABREVIADO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_moneda as r',
',abreviatura as d',
'from moneda'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86995480435966384)
,p_name=>'P68_TIPO_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'Tipo cambio'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'TIPO_CAMBIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86995841173966385)
,p_name=>'P68_MONTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'Monto'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'MONTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86996256796966385)
,p_name=>'P68_SALDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'Saldo'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'SALDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86996663161966385)
,p_name=>'P68_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'Sucursal'
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SUCURSAL_MIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.id_suc_entidad AS r',
'      ,s.descripcion AS d',
'FROM sucursal_entidad s',
'WHERE s.ent_id_entidad = :APP_MI_ID_ENTIDAD'))
,p_cHeight=>1
,p_tag_css_classes=>'text-dark'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86997042859966385)
,p_name=>'P68_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_default=>'ACTIVO'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_display_when=>'P68_ID_FACTURA_VENTA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86997482439966386)
,p_name=>'P68_DCTO_SEDECO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'SEDECO'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'DCTO_SEDECO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86997894523966386)
,p_name=>'P68_USUARIO_REGISTRO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>unistr('Usuario registr\00F3')
,p_source=>'USUARIO_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>80
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_display_when_type=>'NEVER'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86998317545966386)
,p_name=>'P68_FECHA_REGISTRO'
,p_source_data_type=>'DATE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>unistr('Fecha registr\00F3')
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_source=>'FECHA_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when_type=>'NEVER'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86998701921966386)
,p_name=>'P68_USUARIO_ANULO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'Usuario anulo'
,p_source=>'USUARIO_ANULO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>80
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_display_when_type=>'NEVER'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86999076092966387)
,p_name=>'P68_FECHA_ANULO'
,p_source_data_type=>'DATE'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_item_source_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'Fecha anulo'
,p_format_mask=>'DD-MM-YYYY HH24:MI:SS'
,p_source=>'FECHA_ANULO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when_type=>'NEVER'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(87752247657160346)
,p_name=>'P68_PRODUCTO_ADD'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'Producto'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_PRODUCTO_COD_BARRA_ID_UNI_MEDI_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(P.PRODUCTO_CODIGO,P.CODIGO_BARRA_FABRICA)||'' * ''||P.ID_PRODUCTO||'' - ''||P.DESCRIPCION||'' (''||U.ABREVIATURA||'')'' D',
'      ,P.ID_PRODUCTO R',
'      ,U.ID_UNIDAD_MEDIDA',
'      ,P.ROWID AS ID_REGISTRO',
'FROM PRODUCTO P, DET_UNI_MEDI_PROD D, UNIDAD_MEDIDA U',
'WHERE P.ESTADO = ''ACTIVO''',
'AND P.TIPO = ''ART''',
'AND D.PRO_ID_PRODUCTO = P.ID_PRODUCTO',
'AND U.ID_UNIDAD_MEDIDA = D.UNI_ID_UNIDAD_MEDIDA',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P68_ID_FACTURA_VENTA'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'ID_UNIDAD_MEDIDA:P68_P_ID_UNIDAD_MEDIDA',
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Producto',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(87752410970160347)
,p_name=>'P68_CANTIDAD_ADD'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>'Cantidad'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_display_when=>'P68_ID_FACTURA_VENTA'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(87752460939160348)
,p_name=>'P68_DEPOSITO_ADD'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_prompt=>unistr('Dep\00F3sito')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_DEPOSITO'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P68_ID_FACTURA_VENTA'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88313791061653950)
,p_name=>'P68_ID_ENVIAR'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(86991608406966381)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(97315737476340343)
,p_name=>'P68_URL_ACTUAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(97315654865340342)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Url Actual'
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
 p_id=>wwv_flow_imp.id(97315868609340344)
,p_name=>'P68_ID_FACTURA_TMP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(97315654865340342)
,p_use_cache_before_default=>'NO'
,p_item_default=>'P68_ID_FACTURA_VENTA'
,p_item_default_type=>'ITEM'
,p_prompt=>'Id Factura Tmp'
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
 p_id=>wwv_flow_imp.id(87819924596985341)
,p_name=>'SetValoresMoneda'
,p_event_sequence=>5
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_TIP_ID_TIPO_COMPROBANTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87820074025985342)
,p_event_id=>wwv_flow_imp.id(87819924596985341)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_MON_ID_MONEDA'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':APP_ID_MONEDA_PRINCIPAL'
,p_attribute_07=>'APP_ID_MONEDA_PRINCIPAL'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87046835231819052)
,p_name=>'Ir a cliente'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_TIP_ID_TIPO_COMPROBANTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87046990843819053)
,p_event_id=>wwv_flow_imp.id(87046835231819052)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_ENT_ID_ENTIDAD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87047118687819054)
,p_name=>'Obtener TC'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_MON_ID_MONEDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87047127481819055)
,p_event_id=>wwv_flow_imp.id(87047118687819054)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_compra moneda.tc_compra%type;',
'v_venta  moneda.tc_venta%type;',
'begin ',
'    p_devuelve_tipo_cambio ( P_FECHA => :P68_FECHA_FACTURA',
'                            ,P_ID_MONEDA => :P68_MON_ID_MONEDA',
'                            ,P_COMPRA => v_compra',
'                            ,P_VENTA => v_venta',
'    );',
'    :P68_TIPO_CAMBIO := v_venta;',
'end;'))
,p_attribute_02=>'P68_FECHA_FACTURA,P68_MON_ID_MONEDA'
,p_attribute_03=>'P68_TIPO_CAMBIO'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P68_ID_FACTURA_VENTA'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(85174922211016290)
,p_name=>'IrA'
,p_event_sequence=>40
,p_condition_element=>'P68_ID_FACTURA_VENTA'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88314103243653953)
,p_event_id=>wwv_flow_imp.id(85174922211016290)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(87752667672160350)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87743091119017641)
,p_event_id=>wwv_flow_imp.id(85174922211016290)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_CONDICION_VENTA'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87743136682017642)
,p_name=>'DefinirVto'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_CONDICION_VENTA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87743269336017643)
,p_event_id=>wwv_flow_imp.id(87743136682017642)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEXUTILS.EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'case :P68_CONDICION_VENTA ',
'    when ''CONTADO'' then ',
'        :P68_FECHA_VENCIMIENTO := trunc(current_date,''DD'');',
'    when ''CREDITO'' then',
'        :P68_FECHA_VENCIMIENTO := trunc(current_date,''DD'')+30;',
'    else',
'        :P68_FECHA_VENCIMIENTO := null;',
'end case;'))
,p_attribute_02=>'P68_CONDICION_VENTA'
,p_attribute_03=>'P68_FECHA_VENCIMIENTO'
,p_attribute_05=>'#SQLERRM#'
,p_attribute_06=>'spinner'
,p_attribute_07=>'body'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87753296007160356)
,p_name=>'Agregar a detalle'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(87752667672160350)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89846378411773250)
,p_event_id=>wwv_flow_imp.id(87753296007160356)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'agregaProducto()'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87743773962017648)
,p_name=>'IrA Tipo documento'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_CONDICION_VENTA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87743868387017649)
,p_event_id=>wwv_flow_imp.id(87743773962017648)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_TIP_ID_TIPO_COMPROBANTE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87743925077017650)
,p_name=>'IrA Producto'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_ENT_ID_ENTIDAD'
,p_condition_element=>'P68_ENT_ID_ENTIDAD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88314016119653952)
,p_event_id=>wwv_flow_imp.id(87743925077017650)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(87752667672160350)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87744102297017651)
,p_event_id=>wwv_flow_imp.id(87743925077017650)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_PRODUCTO_ADD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87744432416017655)
,p_name=>'Set cantidad'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_PRODUCTO_ADD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(34544873534185334)
,p_event_id=>wwv_flow_imp.id(87744432416017655)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_P_ID_PRODUCTO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'To_Number(SubStr(:P68_PRODUCTO_ADD,1,(InStr(:P68_PRODUCTO_ADD,''.'')-1)))'
,p_attribute_07=>'P68_PRODUCTO_ADD'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87744416814017654)
,p_event_id=>wwv_flow_imp.id(87744432416017655)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_CANTIDAD_ADD'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'1'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87820543348985347)
,p_event_id=>wwv_flow_imp.id(87744432416017655)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_DEPOSITO_ADD'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select min(d.id_deposito)',
'from deposito d',
'where d.suc_id_sucursal = :APP_ID_SUCURSAL;'))
,p_attribute_07=>'APP_ID_SUCURSAL'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P68_PRODUCTO_ADD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87744119516017652)
,p_name=>'IrA Deposito'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_PRODUCTO_ADD'
,p_condition_element=>'P68_PRODUCTO_ADD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'DEBOUNCE'
,p_execution_time=>100
,p_execution_immediate=>false
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87744236992017653)
,p_event_id=>wwv_flow_imp.id(87744119516017652)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_DEPOSITO_ADD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90330387949178643)
,p_name=>'Activa SUC'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(87006486940966393)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90330516625178644)
,p_event_id=>wwv_flow_imp.id(90330387949178643)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#P68_SUC_ID_SUCURSAL'').attr(''disabled'', false);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87745369491017664)
,p_name=>'Boton limpiar registros'
,p_event_sequence=>110
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P68_ID_FACTURA_VENTA'
,p_security_scheme=>wwv_flow_imp.id(89028911658486423)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87745501155017665)
,p_event_id=>wwv_flow_imp.id(87745369491017664)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.FOS.INTERACTIVE_GRID_ADD_BUTTON'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(87047294638819056)
,p_attribute_01=>'toolbar-actions4'
,p_attribute_02=>'first'
,p_attribute_05=>'Limpiar registros eliminados'
,p_attribute_07=>'save'
,p_attribute_09=>'do-nothing'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87820386819985345)
,p_name=>'Ir a producto add'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(87752667672160350)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87820485818985346)
,p_event_id=>wwv_flow_imp.id(87820386819985345)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_PRODUCTO_ADD'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P68_ID_FACTURA_VENTA'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88313423605653947)
,p_name=>'Ver producto'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(87752586801160349)
,p_condition_element=>'P68_PRODUCTO_ADD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88313570170653948)
,p_event_id=>wwv_flow_imp.id(88313423605653947)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'javascript:verProducto();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88368436613445941)
,p_name=>'Tomar id cliente nuevo'
,p_event_sequence=>140
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data && this.data.dialogPageId == 71'
,p_bind_type=>'bind'
,p_execution_type=>'DEBOUNCE'
,p_execution_time=>500
,p_execution_immediate=>false
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88368565697445942)
,p_event_id=>wwv_flow_imp.id(88368436613445941)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_ENT_ID_ENTIDAD'
,p_attribute_01=>'DIALOG_RETURN_ITEM'
,p_attribute_09=>'N'
,p_attribute_10=>'P71_ID_ENTIDAD'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88389394294671743)
,p_name=>'Submit'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(87006486940966393)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88389464166671744)
,p_event_id=>wwv_flow_imp.id(88389394294671743)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CREAR'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88956885522267671)
,p_name=>'Al regresar cuotas'
,p_event_sequence=>170
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(86991608406966381)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88957093936267673)
,p_event_id=>wwv_flow_imp.id(88956885522267671)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P68_MONTO_CUOTAS'
,p_attribute_01=>'DIALOG_RETURN_ITEM'
,p_attribute_09=>'N'
,p_attribute_10=>'P74_MONTO_CUOTAS'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88957261223267675)
,p_event_id=>wwv_flow_imp.id(88956885522267671)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(87006486940966393)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88957353487267676)
,p_event_id=>wwv_flow_imp.id(88956885522267671)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(87746376938017674)
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28056928748557319)
,p_name=>'Buscar numero'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_TIM_ID_TIMBRADO'
,p_condition_element=>'P68_ID_FACTURA_VENTA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28057041219557320)
,p_event_id=>wwv_flow_imp.id(28056928748557319)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buscarNroFactura();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28059317988557343)
,p_name=>'Aplicar'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(87006060385966393)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28059484490557344)
,p_event_id=>wwv_flow_imp.id(28059317988557343)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('\00BFDesea continuar con la actualizaci\00F3n del documento?')
,p_attribute_02=>'Numerar factura'
,p_attribute_03=>'danger'
,p_attribute_04=>'fa-alert'
,p_attribute_06=>'Continuar'
,p_attribute_07=>'Cancelar'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28059528621557345)
,p_event_id=>wwv_flow_imp.id(28059317988557343)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'APLICAR'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(87752930425160353)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(87047294638819056)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Detalle - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    case :APEX$ROW_STATUS',
'    when ''D'' then',
'        APEX_COLLECTION.DELETE_MEMBER (',
'        p_collection_name => ''COLL_DETALLE_FVENTA'',',
'        p_seq             => :seq_id);',
'    end case;',
'end;'))
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>14019911361153613
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(88389183665671641)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar factura'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    p_guarda_factura_venta (',
'            P_ID_FACTURA_VENTA        => :P68_ID_FACTURA_VENTA',
'           ,P_FECHA_FACTURA           => To_Date(:P68_FECHA_FACTURA,''DD/MM/YYYY'')',
'           ,P_FECHA_VENCIMIENTO       => To_Date(:P68_FECHA_VENCIMIENTO,''DD/MM/YYYY'')',
'           ,P_ENT_ID_ENTIDAD          => :P68_ENT_ID_ENTIDAD',
'           ,P_TIP_ID_TIPO_COMPROBANTE => :P68_TIP_ID_TIPO_COMPROBANTE',
'           ,P_CONDICION_VENTA  => :P68_CONDICION_VENTA',
'           ,P_TIM_ID_TIMBRADO  => :P68_TIM_ID_TIMBRADO',
'           ,P_MON_ID_MONEDA    => :P68_MON_ID_MONEDA',
'           ,P_TIPO_CAMBIO      => to_number(:P68_TIPO_CAMBIO,''9g999g999g999d99'')',
'           ,P_SUC_ID_SUCURSAL  => :P68_SUC_ID_SUCURSAL',
'           ,P_ESTADO           => :P68_ESTADO',
'           ,P_DCTO_SEDECO      => :P68_DCTO_SEDECO',
'           ,P_MONTO            => to_number(:P68_MONTO,''9g999g999g999d99'')',
'           ,P_SALDO            => to_number(:P68_SALDO,''9g999g999g999d99'')',
'           ,P_ID_LICITACION    => :P68_LIC_ID_LICITACION',
'           ,P_ORDEN_COMPRA     => :P68_ORDEN_COMPRA',
'           );',
'end;           '))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Factura procesada correctamente.'
,p_internal_uid=>14656164601664901
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(28059616441557346)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_factura_venta.p_update_factura(',
'    pi_id_factura_venta => to_number(:P68_ID_ENVIAR)',
'  , pi_fecha_factura => :P68_FECHA_FACTURA',
'  , pi_condicion_vta => :P68_CONDICION_VENTA',
'  , pi_fecha_vencimiento => :P68_FECHA_VENCIMIENTO',
'  , pi_id_tipo_comprobante => :P68_TIP_ID_TIPO_COMPROBANTE',
'  , pi_id_timbrado => :P68_TIM_ID_TIMBRADO',
'  , pi_nro_factura => to_number(:P68_NRO_FACTURA,''999g999g9999999'')',
'  , pi_orden_compra => :P68_ORDEN_COMPRA',
'  );',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'APLICAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Factura actualizada...'
,p_internal_uid=>28059616441557346
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(28059747072557347)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar'
,p_process_sql_clob=>'pkg_factura_venta.p_eliminar_reg_venta(pi_id_factura_venta => :P68_ID_ENVIAR);'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Registro eliminado...'
,p_internal_uid=>28059747072557347
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(87007316275966395)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(86991608406966381)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear/editar factura venta'
,p_internal_uid=>13274297211959655
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(87753075081160354)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Iniciar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_collection.create_or_truncate_collection(p_collection_name=>''COLL_DETALLE_FVENTA'');',
'apex_collection.create_or_truncate_collection(p_collection_name=>''COLL_DETALLE_PAGOS'');',
'',
'IF :P68_ID_FACTURA_VENTA IS NOT NULL THEN',
'    PKG_FACTURA_VENTA.CARGAR_COLL_ESTADO_CUENTA(P_ID_FACTURA => :P68_ID_FACTURA_VENTA);',
'    PKG_FACTURA_VENTA.CARGAR_COLL_DETALLE_VENTA(P_ID_FACTURA => :P68_ID_FACTURA_VENTA);',
'    :P68_ID_ENVIAR             := :P68_ID_FACTURA_VENTA;',
'    :P68_SUC_ID_SUCURSAL       := :APP_ID_SUCURSAL;',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>14020056017153614
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(88554832320388241)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ver_pdf'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  vl_vNomReporte VARCHAR2(255);',
'BEGIN',
'  vl_vNomReporte := ''FACT_VENTA_PRINCIPAL_V1'';',
'',
'  pkg_jasperreports_server.descarga_reporte(p_vNomReporte  => vl_vNomReporte',
'                                           ,p_aNomParams   => apex_util.string_to_table(''P_ID_FACTURA'')',
'                                           ,p_aValParams   => apex_util.string_to_table(:P68_ID_ENVIAR )',
'                                            );',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>14821813256381501
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(96714571941739642)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'anular_factura'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'PROCEDURE output_json_item (',
'     p_item_name  IN VARCHAR2',
'    ,p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'BEGIN',
'    p_anular_factura_venta(P_ID_FACTURA => :P68_ID_FACTURA_TMP);',
'    :P68_URL_ACTUAL := apex_page.get_url(',
'            p_page   => 68,',
'            p_items  => ''P68_ID_FACTURA_VENTA'',',
'            p_values => :P68_ID_FACTURA_TMP',
'        );',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P68_URL_ACTUAL'', :P68_URL_ACTUAL);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>22981552877732902
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(89845903731773245)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'agregar_producto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_descripcion   producto.descripcion%TYPE;',
'v_id_iva        producto.iva_id_iva%TYPE; ',
'v_precio        det_factura_venta.precio_unitario%TYPE;',
'v_exento        det_factura_venta.exento%TYPE;',
'v_gravado       det_factura_venta.gravado%TYPE;',
'v_iva           det_factura_venta.iva%TYPE;',
'v_total         det_factura_venta.total%TYPE;',
'v_stock         NUMBER;',
'v_controla_stock deposito.bloqueo_stock%TYPE;',
'v_id_producto   producto.id_producto%TYPE := :P68_P_ID_PRODUCTO;',
'PROCEDURE output_json_item (',
'     p_item_name  IN VARCHAR2',
'    ,p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'BEGIN',
'    IF :P68_DEPOSITO_ADD IS NULL THEN ',
unistr('        raise_application_error(-20000,''Favor defina dep\00F3sito de origen del producto'');'),
'    END IF;',
'    IF :P68_CANTIDAD_ADD IS NULL THEN ',
'        raise_application_error(-20000,''Favor defina cantidad de producto para la venta.'');',
'    END IF;',
'    IF :P68_CANTIDAD_ADD <= 0 THEN ',
'        raise_application_error(-20000,''Cantidad del producto mal definido, verifique.'');',
'    END IF;',
'    IF :P68_PRODUCTO_ADD IS NULL THEN ',
'        raise_application_error(-20000,''Producto no fue definido, favor verifique.'');',
'    END IF;',
'    IF :P68_P_ID_UNIDAD_MEDIDA IS NULL THEN',
'        raise_application_error(-20000,''Unidad de medida no definida, favor verificar.'');',
'    END IF;',
'    BEGIN',
'        SELECT /*+ INDEX(p PRO_PK)*/',
'                p.descripcion, p.iva_id_iva',
'        INTO v_descripcion, v_id_iva',
'        FROM producto p',
'        WHERE p.id_producto = v_id_producto;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            raise_application_error(-20000,''ERROR en la busqueda de producto.'');',
'    END;',
'',
'    v_precio := f_devuelve_precio_venta(',
'            P_ID_PRODUCTO => v_id_producto',
'           ,P_ID_UNIDAD_MEDIDA => :P68_P_ID_UNIDAD_MEDIDA ',
'           ,P_ID_MONEDA => :P68_MON_ID_MONEDA',
'           ,P_FECHA     => :P68_FECHA_FACTURA',
'           ,P_MENSAJE   => 1 ); ',
'    BEGIN',
'        SELECT d.bloqueo_stock',
'        INTO v_controla_stock',
'        FROM deposito d',
'        WHERE d.id_deposito = :P68_DEPOSITO_ADD;',
'    EXCEPTION',
'        WHEN No_Data_Found THEN ',
unistr('            Raise_Application_Error(-20999,''Error en devuelve stock, no se encuentra dep\00F3sito.'');'),
'    END;',
'    IF v_controla_stock = ''NO'' THEN',
'        v_stock := :P68_CANTIDAD_ADD;',
'    ELSE',
'        v_stock :=  f_devuelve_stock ( ',
'                P_ID_PRODUCTO => v_id_producto',
'               ,P_FECHA_HASTA => NULL',
'               ,P_ID_DEPOSITO => :P68_DEPOSITO_ADD',
'               ,P_ID_UNIDAD_MEDIDA => :P68_P_ID_UNIDAD_MEDIDA); ',
'    END IF;',
'    IF v_stock < :P68_CANTIDAD_ADD THEN',
'        raise_application_error(-20000,''No posee stock suficiente para la venta, favor verifique.'');',
'    END IF;                                                                ',
'    p_dev_valores_factura( P_ID_IVA          => v_id_iva          ',
'                          ,P_ID_MONEDA       => :P68_MON_ID_MONEDA ',
'                          ,P_PRECIO_UNITARIO => v_precio',
'                          ,P_CANTIDAD        => :P68_CANTIDAD_ADD',
'                          ,P_EXENTO          => v_exento',
'                          ,P_GRAVADO         => v_gravado',
'                          ,P_IVA             => v_iva',
'                          ,P_TOTAL           => v_total',
'                          );',
'    APEX_COLLECTION.ADD_MEMBER (',
'        p_collection_name => ''COLL_DETALLE_FVENTA''',
'       ,p_c001 => NULL',
'       ,p_c002 => NULL',
'       ,p_c003 => v_id_producto',
'       ,p_c004 => v_descripcion',
'       ,p_c005 => v_id_iva',
'       ,p_c006 => :P68_P_ID_UNIDAD_MEDIDA',
'       ,p_c007 => v_precio',
'       ,p_c008 => :P68_CANTIDAD_ADD',
'       ,p_c009 => v_exento',
'       ,p_c010 => v_gravado',
'       ,p_c011 => v_iva',
'       ,p_c012 => 0',
'       ,p_c013 => 0',
'       ,p_c014 => NULL',
'       ,p_c015 => NULL',
'       ,p_c016 => v_total',
'       ,p_c017 => NULL',
'       ,p_c018 => :P68_DEPOSITO_ADD',
'            );',
'    :P68_CANTIDAD_ADD := 0;',
'    :P68_PRODUCTO_ADD := null;',
'    :P68_DEPOSITO_ADD := null;',
'    :P68_P_ID_UNIDAD_MEDIDA := null;',
'    BEGIN',
'        SELECT Sum(To_Number(c016))',
'        INTO :P68_MONTO',
'        FROM apex_collections',
'        WHERE collection_name = ''COLL_DETALLE_FVENTA'';',
'        :P68_DCTO_SEDECO := 0;',
'        :P68_SALDO := :P68_MONTO;',
'    END;',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P68_CANTIDAD_ADD'', :P68_CANTIDAD_ADD);',
'    output_json_item(''P68_PRODUCTO_ADD'', :P68_PRODUCTO_ADD);',
'    output_json_item(''P68_DEPOSITO_ADD'', :P68_DEPOSITO_ADD);',
'    output_json_item(''P68_MONTO'', :P68_MONTO);',
'    output_json_item(''P68_DCTO_SEDECO'', :P68_DCTO_SEDECO);',
'    output_json_item(''P68_SALDO'', :P68_SALDO);',
'    output_json_item(''P68_P_ID_UNIDAD_MEDIDA'', :P68_P_ID_UNIDAD_MEDIDA);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>16112884667766505
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49475522136583601)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'buscar_nro_factura'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'PROCEDURE output_json_item (',
'     p_item_name  IN VARCHAR2',
'    ,p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'BEGIN',
'    pkg_factura_venta.p_obtener_nro_comprobante(',
'        pi_tim_id_timbrado => :P68_TIM_ID_TIMBRADO',
'      , pi_suc_id_sucursal => :P68_SUC_ID_SUCURSAL',
'      , pi_tip_id_tipo_comprobante => :P68_TIP_ID_TIPO_COMPROBANTE',
'      , pi_usuario => :APP_USER',
'      , pi_fecha_factura => :P68_FECHA_FACTURA',
'      , po_nro_factura => :P68_NRO_FACTURA);',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P68_NRO_FACTURA'', :P68_NRO_FACTURA);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>49475522136583601
);
wwv_flow_imp.component_end;
end;
/
