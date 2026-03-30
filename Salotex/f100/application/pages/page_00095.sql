prompt --application/pages/page_00095
begin
--   Manifest
--     PAGE: 00095
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
 p_id=>95
,p_name=>'Crear/editar pedido de venta'
,p_alias=>'CREAR-EDITAR-PEDIDO-DE-VENTA'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear/editar pedido de venta'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function eliminar_reg(item) {',
'   var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("eliminar_producto", {',
'        x01 : item',
'    },',
'    {       ',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.region("REG_CARRITO").refresh();',
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
'    });            ',
'}',
'function agregarproducto() {',
'   var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("agregar_producto", {',
'        pageItems: [',
'             "P95_PRO_ID_PRODUCTO"',
'            ,"P95_CANTIDAD"',
'            ,"P95_UNI_ID_UNIDAD_MEDIDA"',
'            ,"P95_PRECIO_UNITARIO"',
'            ,"P95_TOTAL" ',
'            ,"P95_PORC_DESCUENTO"',
'        ]',
'    },',
'    {       ',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.region("REG_CARRITO").refresh();',
'                setTimeout( function(){',
'                    apex.item("P95_PRO_ID_PRODUCTO").setFocus();',
'                },500);',
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
'    });            ',
'}',
'function datosproducto() {',
'   var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("datos_producto", {',
'        pageItems: [',
'             "P95_PRO_ID_PRODUCTO"',
'            ,"P95_MON_ID_MONEDA" ',
'        ]',
'    },',
'    {       ',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.item("P95_CANTIDAD").setFocus();',
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
'    });            ',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#P95_UNI_ID_UNIDAD_MEDIDA'').attr(''disabled'',true);',
'$(''#P95_PRECIO_UNITARIO'').prop(''readonly'',true);',
'$("#P95_TOTAL").prop(''readonly'',true);',
'$("#P95_MON_ID_MONEDA").attr(''disabled'',true);',
'$("#P95_TIPO_CAMBIO").prop(''readonly'',true);',
'$("#P95_TOTAL_SIN_DCTO").prop(''readonly'',true);',
'$("#P95_MONTO_DESCUENTO").prop(''readonly'',true);',
'$("#P95_MONTO_FACTURA").prop(''readonly'',true);'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#BTN_CREAR, #BTN_PRODUCTO {    ',
'    margin-top: 17px;',
'}',
'.aling_derecha {',
'    text-align: right;',
'}',
'.texto-negro {',
'    color:black !important;',
'    opacity: 1 !important;',
'}',
''))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_height=>'900'
,p_dialog_width=>'900'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(98744199501574705)
,p_plug_name=>'Crear/editar pedido de venta'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_PEDIDO,',
'       FECHA_PEDIDO,',
'       USU_ID_USUARIO,',
'       ENT_ID_ENTIDAD,',
'       FOR_ID_FORMA_PAGO,',
'       QR,',
'       TELEFONO,',
'       FECHA_ENTREGA_DESDE,',
'       FECHA_ENTREGA_HASTA,',
'       MON_ID_MONEDA,',
'       TIPO_CAMBIO,',
'       OBSERVACION,',
'       ESTADO,',
'       DIRECCION,',
'       CIU_COD_CIUDAD,',
'       COSTO_ENVIO,',
'       PORC_DESCUENTO',
'  from CAB_PEDIDO_VENTA'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(98754197285574734)
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
 p_id=>wwv_flow_imp.id(98770810732674458)
,p_plug_name=>'Detalle productos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_query_type=>'TABLE'
,p_query_table=>'DET_PEDIDO_VENTA'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P95_ID_PEDIDO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Detalle productos'
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
 p_id=>wwv_flow_imp.id(98771617214674466)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>25038598150667726
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98771707755674467)
,p_db_column_name=>'ID_DETALLE_PEDIDO'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id Detalle Pedido'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98771812468674468)
,p_db_column_name=>'PED_ID_PEDIDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Ped Id Pedido'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98771858824674469)
,p_db_column_name=>'PRO_ID_PRODUCTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Pro Id Producto'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98771978274674470)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98772026195674471)
,p_db_column_name=>'UNI_ID_UNIDAD_MEDIDA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Uni Id Unidad Medida'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98772127798674472)
,p_db_column_name=>'PRECIO_UNITARIO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Precio Unitario'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98772281659674473)
,p_db_column_name=>'TOTAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(98914258580790814)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'251813'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DETALLE_PEDIDO:PED_ID_PEDIDO:PRO_ID_PRODUCTO:CANTIDAD:UNI_ID_UNIDAD_MEDIDA:PRECIO_UNITARIO:TOTAL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(98772519039674475)
,p_plug_name=>'Producto'
,p_region_name=>'REG_ADD_PRODUCTO'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_DETALLE_PEDIDO,',
'       PED_ID_PEDIDO,',
'       PRO_ID_PRODUCTO,',
'       CANTIDAD,',
'       UNI_ID_UNIDAD_MEDIDA,',
'       PRECIO_UNITARIO,',
'       TOTAL',
'  from DET_PEDIDO_VENTA',
' where PED_ID_PEDIDO = :P95_ID_PEDIDO'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P95_ID_PEDIDO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(99074625670895753)
,p_plug_name=>'Detalle carrito'
,p_region_name=>'REG_CARRITO'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT seq_id Item',
'      ,n001 PRO_ID_PRODUCTO',
'      ,n002 CANTIDAD',
'      ,n003 UNI_ID_UNIDAD_MEDIDA',
'      ,n004 PRECIO_UNITARIO',
'      ,n005 TOTAL',
'      ,to_number(c002) MONTO_DESCUENTO',
'      ,to_number(c003) MONTO_FACTURA',
'      ,seq_id eliminar',
'FROM apex_collections a',
'WHERE a.collection_name = ''COLL_DET_PRODUCTOS''',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P95_ID_PEDIDO'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Detalle carrito'
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
 p_id=>wwv_flow_imp.id(99074888435895755)
,p_name=>'ITEM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEM'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Item'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>true
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(99074968487895756)
,p_name=>'PRO_ID_PRODUCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRO_ID_PRODUCTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Producto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(87525104521547661)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(99075024879895757)
,p_name=>'CANTIDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(99075184021895758)
,p_name=>'UNI_ID_UNIDAD_MEDIDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNI_ID_UNIDAD_MEDIDA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Unidad medida'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(90414763095478669)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(99075242222895759)
,p_name=>'PRECIO_UNITARIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRECIO_UNITARIO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Precio unitario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(99075374814895760)
,p_name=>'TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(99075799806895764)
,p_name=>'ELIMINAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ELIMINAR'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript: eliminar_reg(&ITEM.)'
,p_link_text=>' <span aria-hidden="true" class="t-Icon fa fa-trash-o"></span>'
,p_link_attributes=>' title="Eliminar del carrito" class="t-Button t-Button--noLabel t-Button--icon t-Button--danger t-Button--link"'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(99076361545895770)
,p_name=>'MONTO_DESCUENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MONTO_DESCUENTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Monto descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(99076509529895771)
,p_name=>'MONTO_FACTURA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MONTO_FACTURA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Monto factura'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(99074723677895754)
,p_internal_uid=>25341704613889014
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(99089539887321060)
,p_interactive_grid_id=>wwv_flow_imp.id(99074723677895754)
,p_static_id=>'253566'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(99089755940321061)
,p_report_id=>wwv_flow_imp.id(99089539887321060)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99090279095321067)
,p_view_id=>wwv_flow_imp.id(99089755940321061)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(99074888435895755)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99091186285321077)
,p_view_id=>wwv_flow_imp.id(99089755940321061)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(99074968487895756)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99092045535321080)
,p_view_id=>wwv_flow_imp.id(99089755940321061)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(99075024879895757)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99092944705321083)
,p_view_id=>wwv_flow_imp.id(99089755940321061)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(99075184021895758)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99093853575321086)
,p_view_id=>wwv_flow_imp.id(99089755940321061)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(99075242222895759)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99094786948321088)
,p_view_id=>wwv_flow_imp.id(99089755940321061)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(99075374814895760)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99109208519524096)
,p_view_id=>wwv_flow_imp.id(99089755940321061)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(99075799806895764)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99124471752373726)
,p_view_id=>wwv_flow_imp.id(99089755940321061)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(99076361545895770)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99125414667373729)
,p_view_id=>wwv_flow_imp.id(99089755940321061)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(99076509529895771)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(98769687658674447)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_button_name=>'BTN_CREAR'
,p_button_static_id=>'BTN_CREAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Crear'
,p_icon_css_classes=>'fa-plus-square-o'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(98772400815674474)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_button_name=>'BTN_PRODUCTO'
,p_button_static_id=>'BTN_PRODUCTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Producto'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus-circle-o'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(98754589974574734)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(98754197285574734)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(99074216956895748)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_button_name=>'Retornar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(99074487017895751)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_button_name=>'Agregar'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'javascript: agregarproducto()'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-cart-plus'
,p_security_scheme=>wwv_flow_imp.id(113303889121561293)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(98755907177574752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(98754197285574734)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P95_ID_PEDIDO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(113304102662560347)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(98756250763574752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(98754197285574734)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambio'
,p_button_position=>'NEXT'
,p_button_condition=>'P95_ID_PEDIDO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(113303658498562336)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(98756676868574752)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(98754197285574734)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P95_ID_PEDIDO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(113303889121561293)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98744500974574709)
,p_name=>'P95_ID_PEDIDO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Pedido'
,p_source=>'ID_PEDIDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98744880204574716)
,p_name=>'P95_FECHA_PEDIDO'
,p_source_data_type=>'DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'Fecha pedido'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_PEDIDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>2
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98745283449574719)
,p_name=>'P95_USU_ID_USUARIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'Usuario'
,p_source=>'USU_ID_USUARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_USUARIO R, USUARIO D',
'FROM usuarios',
'WHERE ESTADO = ''ACTIVO'''))
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'LOV',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98745937632574728)
,p_name=>'P95_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
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
,p_cSize=>100
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(98746339420574728)
,p_name=>'P95_FOR_ID_FORMA_PAGO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'Forma de pago'
,p_source=>'FOR_ID_FORMA_PAGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_FORMA_PAGO_DESCRIP_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_forma_pago r',
'      ,descripcion d',
'from forma_pago',
'where estado = ''ACTIVO''      '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98747070946574729)
,p_name=>'P95_QR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'QR'
,p_source=>'QR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'NO',
  'off_value', 'NO',
  'on_label', 'SI',
  'on_value', 'SI',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98747477934574729)
,p_name=>'P95_TELEFONO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>unistr('Tel\00E9fono')
,p_placeholder=>'981123456'
,p_source=>'TELEFONO'
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
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98747876051574729)
,p_name=>'P95_FECHA_ENTREGA_DESDE'
,p_source_data_type=>'DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'Fecha/hora entrega desde'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_ENTREGA_DESDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'Y',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98748277618574730)
,p_name=>'P95_FECHA_ENTREGA_HASTA'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'Fecha/hora entrega hasta'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_ENTREGA_HASTA'
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
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'Y',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98748695954574730)
,p_name=>'P95_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'Moneda'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA'
,p_lov_display_null=>'YES'
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
 p_id=>wwv_flow_imp.id(98749034905574730)
,p_name=>'P95_TIPO_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'Tipo cambio'
,p_source=>'TIPO_CAMBIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'texto_negro'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98749448024574730)
,p_name=>'P95_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>400
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(98749833744574731)
,p_name=>'P95_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_default=>'ACTIVO'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>40
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'Y',
  'send_on_page_submit', 'Y',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98769808450674448)
,p_name=>'P95_DIRECCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>unistr('Direcci\00F3n')
,p_source=>'DIRECCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>20
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98769873708674449)
,p_name=>'P95_CIU_COD_CIUDAD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'Ciudad'
,p_source=>'CIU_COD_CIUDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT l.ciudad d',
'      ,l.cod_ciudad r',
'from localidad l',
'where l.cod_distrito = :P95_DISTRITO',
'order by ciudad',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_lov_cascade_parent_items=>'P95_DISTRITO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(98772649373674477)
,p_name=>'P95_ID_DETALLE_PEDIDO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_item_source_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_source=>'ID_DETALLE_PEDIDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98772724282674478)
,p_name=>'P95_PED_ID_PEDIDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_item_source_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_source=>'PED_ID_PEDIDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98772823797674479)
,p_name=>'P95_PRO_ID_PRODUCTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_item_source_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_prompt=>'Producto'
,p_source=>'PRO_ID_PRODUCTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.descripcion ||'' Gs.''||Trim(To_Char(f_devuelve_precio_venta(p_id_producto => p.id_producto',
'                             , p_fecha => current_date',
'                             , p_id_moneda => :P95_MON_ID_MONEDA',
'                             , p_mensaje => 0',
'       ),''999,999,999''))||'' - ''||u.abreviatura||'' - ''||o.descripcion AS D',
'      ,p.id_producto AS R',
'FROM producto p',
'    ,origen_producto o',
'    ,unidad_medida u',
'WHERE p.estado = ''ACTIVO'' ',
'AND o.id_origen = p.ori_id_origen',
'AND u.id_unidad_medida = p.uni_id_unidad_medida'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_lov_cascade_parent_items=>'P95_MON_ID_MONEDA'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(98772945717674480)
,p_name=>'P95_CANTIDAD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_item_source_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_prompt=>'Cantidad'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'CANTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'max_value', '99',
  'min_value', '1',
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98773065562674481)
,p_name=>'P95_UNI_ID_UNIDAD_MEDIDA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_item_source_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_prompt=>'Un. medida'
,p_source=>'UNI_ID_UNIDAD_MEDIDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_UNIDAD_MEDIDA'
,p_cHeight=>1
,p_tag_css_classes=>'texto-negro'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98773155956674482)
,p_name=>'P95_PRECIO_UNITARIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_item_source_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_prompt=>'Precio unitario'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'PRECIO_UNITARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'texto-negro'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98773305348674483)
,p_name=>'P95_TOTAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_item_source_plug_id=>wwv_flow_imp.id(98772519039674475)
,p_prompt=>'Total (I.V.A. incluido)'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'TOTAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'texto-negro'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98786190225445345)
,p_name=>'P95_DEPARTAMENTO'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_LOCALIDAD_DEPARTAMENTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct',
'       l.departamento d',
'      ,l.cod_departamento r',
'from localidad l',
'order by departamento',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
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
 p_id=>wwv_flow_imp.id(98786248994445346)
,p_name=>'P95_DISTRITO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'Distrito'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct',
'       l.distrito d',
'      ,l.cod_distrito r',
'from localidad l',
'where l.cod_departamento = :P95_DEPARTAMENTO',
'order by distrito',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_lov_cascade_parent_items=>'P95_DEPARTAMENTO'
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
 p_id=>wwv_flow_imp.id(98786431901445348)
,p_name=>'P95_COSTO_ENVIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'Costo envio'
,p_source=>'COSTO_ENVIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>30
,p_tag_css_classes=>'aling_derecha'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    'decimalPlaces : 0',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98786539832445349)
,p_name=>'P95_PORC_DESCUENTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_item_source_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'% descuento'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'PORC_DESCUENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>30
,p_tag_css_classes=>'aling_derecha'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    'decimalPlaces : 2',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99076024401895767)
,p_name=>'P95_TOTAL_SIN_DCTO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'Total sin descuento'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99076205371895768)
,p_name=>'P95_MONTO_DESCUENTO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'Descuento'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99076237592895769)
,p_name=>'P95_MONTO_FACTURA'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(98744199501574705)
,p_prompt=>'Monto factura'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(98754645202574734)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(98754589974574734)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(98755412025574748)
,p_event_id=>wwv_flow_imp.id(98754645202574734)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(98773442167674485)
,p_name=>'Abrir'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(98772400815674474)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(98773596623674486)
,p_event_id=>wwv_flow_imp.id(98773442167674485)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(98772519039674475)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(99073496134895741)
,p_name=>'Obt datos'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P95_PRO_ID_PRODUCTO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99073545551895742)
,p_event_id=>wwv_flow_imp.id(99073496134895741)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'datosproducto()'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(99073896030895745)
,p_name=>'PrecioTotal'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P95_CANTIDAD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99073978820895746)
,p_event_id=>wwv_flow_imp.id(99073896030895745)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P95_TOTAL := :P95_CANTIDAD * to_number(:P95_PRECIO_UNITARIO,''999,999,999'');',
''))
,p_attribute_02=>'P95_CANTIDAD,P95_PRECIO_UNITARIO'
,p_attribute_03=>'P95_TOTAL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(99074297182895749)
,p_name=>'Regresar'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(99074216956895748)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99074382623895750)
,p_event_id=>wwv_flow_imp.id(99074297182895749)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(98772519039674475)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(98757500548574757)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(98744199501574705)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Crear/editar pedido de venta'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25024481484568017
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(98757892668574757)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>25024873604568017
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(98773361548674484)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(98772519039674475)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Producto'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25040342484667744
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(98757099935574754)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(98744199501574705)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear/editar pedido de venta'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25024080871568014
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(98769089337674441)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InicioNew'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P95_FECHA_PEDIDO := to_char(current_date,''dd/mm/yyyy hh24:mi'');',
':P95_USU_ID_USUARIO := f_id_usuario(v(''APP_USER''));',
':P95_FECHA_ENTREGA_DESDE := to_char( (current_date + INTERVAL ''60'' MINUTE) ,''dd-mm-yyyy hh24:mi'');',
':P95_FECHA_ENTREGA_HASTA := to_char( (current_date + INTERVAL ''120'' MINUTE) ,''dd-mm-yyyy hh24:mi'');',
':P95_MON_ID_MONEDA := :APP_ID_MONEDA_PRINCIPAL;',
':P95_TIPO_CAMBIO := 1;',
':P95_ESTADO := ''ACTIVO'';',
':P95_COSTO_ENVIO := 0;',
':P95_PORC_DESCUENTO := 0;',
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''COLL_DET_PRODUCTOS'');',
''))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P95_ID_PEDIDO'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>25036070273667701
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(98786322793445347)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InicioOld'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P95_ID_PEDIDO IS NOT NULL THEN',
'    IF :P95_CIU_COD_CIUDAD IS NOT NULL THEN',
'        BEGIN',
'            SELECT l.cod_departamento',
'                  ,l.cod_distrito',
'            INTO :P95_DEPARTAMENTO',
'                ,:P95_DISTRITO      ',
'            FROM localidad l',
'            WHERE l.cod_ciudad = :P95_CIU_COD_CIUDAD;',
'        EXCEPTION',
'            WHEN OTHERS THEN',
'                NULL;',
'        END;',
'    END IF;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P95_ID_PEDIDO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>25053303729438607
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99073639529895743)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'datos_producto'
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
'    pkg_pedido_venta.obtener_datos_producto(',
'                    pi_id_producto => :P95_PRO_ID_PRODUCTO',
'                  , pi_id_moneda => :P95_MON_ID_MONEDA',
'                  , po_id_unidad_medida => :P95_UNI_ID_UNIDAD_MEDIDA',
'                  , po_precio_venta => :P95_PRECIO_UNITARIO );',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P95_UNI_ID_UNIDAD_MEDIDA'', :P95_UNI_ID_UNIDAD_MEDIDA);',
'    output_json_item(''P95_PRECIO_UNITARIO'', :P95_PRECIO_UNITARIO);',
'    output_json_item(''P95_CANTIDAD'', 1);',
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
,p_internal_uid=>25340620465889003
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99074600678895752)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'agregar_producto'
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
'    APEX_COLLECTION.ADD_MEMBER(',
'        p_collection_name => ''COLL_DET_PRODUCTOS''',
'       ,p_n001            => :P95_PRO_ID_PRODUCTO',
'       ,p_n002            => :P95_CANTIDAD',
'       ,p_n003            => :P95_UNI_ID_UNIDAD_MEDIDA',
'       ,p_n004            => to_number(:P95_PRECIO_UNITARIO,''999,999,999'')',
'       ,p_n005            => to_number(:P95_TOTAL,''999,999,999'')',
'       ,p_c001            => :P95_PORC_DESCUENTO',
'       ,p_c002            => (to_number(:P95_TOTAL,''999,999,999'')*nvl(:P95_PORC_DESCUENTO,0)/100)',
'       ,p_c003            => to_number(:P95_TOTAL,''999,999,999'') - (to_number(:P95_TOTAL,''999,999,999'')*nvl(:P95_PORC_DESCUENTO,0)/100)',
'    );',
'',
'    select sum(c.n005)',
'    into :P95_TOTAL_SIN_DCTO',
'    from apex_collections c',
'    where c.collection_name = ''COLL_DET_PRODUCTOS'';',
'',
'    select sum(to_number(c.c002))',
'    into :P95_MONTO_DESCUENTO',
'    from apex_collections c',
'    where c.collection_name = ''COLL_DET_PRODUCTOS'';',
'',
'    select sum(to_number(c.c003))',
'    into :P95_MONTO_FACTURA',
'    from apex_collections c',
'    where c.collection_name = ''COLL_DET_PRODUCTOS'';',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P95_PRO_ID_PRODUCTO'', NULL);',
'    output_json_item(''P95_PRECIO_UNITARIO'', NULL);',
'    output_json_item(''P95_TOTAL'', NULL);',
'    output_json_item(''P95_TOTAL_SIN_DCTO'', :P95_TOTAL_SIN_DCTO);',
'    output_json_item(''P95_MONTO_DESCUENTO'', :P95_MONTO_DESCUENTO);',
'    output_json_item(''P95_MONTO_FACTURA'', :P95_MONTO_FACTURA);',
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
,p_internal_uid=>25341581614889012
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99075891184895765)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'eliminar_producto'
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
'    APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''COLL_DET_PRODUCTOS''',
'       ,p_seq             => apex_application.g_x01',
'    );',
'',
'    select sum(c.n005)',
'    into :P95_TOTAL_SIN_DCTO',
'    from apex_collections c',
'    where c.collection_name = ''COLL_DET_PRODUCTOS'';',
'',
'    select sum(to_number(c.c002))',
'    into :P95_MONTO_DESCUENTO',
'    from apex_collections c',
'    where c.collection_name = ''COLL_DET_PRODUCTOS'';',
'',
'    select sum(to_number(c.c003))',
'    into :P95_MONTO_FACTURA',
'    from apex_collections c',
'    where c.collection_name = ''COLL_DET_PRODUCTOS'';',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P95_TOTAL_SIN_DCTO'', :P95_TOTAL_SIN_DCTO);',
'    output_json_item(''P95_MONTO_DESCUENTO'', :P95_MONTO_DESCUENTO);',
'    output_json_item(''P95_MONTO_FACTURA'', :P95_MONTO_FACTURA);',
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
,p_internal_uid=>25342872120889025
);
wwv_flow_imp.component_end;
end;
/
