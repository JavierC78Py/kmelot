prompt --application/pages/page_00196
begin
--   Manifest
--     PAGE: 00196
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
 p_id=>196
,p_name=>'Crear/Editar Presupuesto'
,p_alias=>'CREAR-EDITAR-PRESUPUESTO'
,p_step_title=>'Crear/Editar Presupuesto'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function urlVerPDF(){',
'    apex.navigation.openInNewWindow(',
'        apex.server.url({',
'            p_request: "application_process=ver_pdf",',
'            x01: apex.item("P196_ID_PRESUPUESTO").getValue()',
'        })',
'    );',
'}',
'function abrirDialogoNuevo(){',
'    apex.item("P196_DLG_SEQ_ID").setValue("");',
'    apex.item("P196_DLG_PRO_ID_PRODUCTO").setValue("");',
'    apex.item("P196_DLG_DESCRIPCION").setValue("");',
'    apex.item("P196_DLG_UMA_DESC").setValue("");',
'    apex.item("P196_DLG_UNI_ID_UNIDAD_MEDIDA").setValue("");',
'    apex.item("P196_DLG_IVA_ID_IVA").setValue("");',
'    apex.item("P196_DLG_IVA_DESC").setValue("");',
'    apex.item("P196_DLG_CANTIDAD").setValue("");',
'    apex.item("P196_DLG_PRECIO_UNITARIO").setValue("");',
'    apex.item("P196_DLG_PORC_DESCUENTO").setValue("0");',
'    apex.item("P196_DLG_MONTO_DESCUENTO").setValue("0");',
'    apex.item("P196_DLG_EXENTO").setValue("0");',
'    apex.item("P196_DLG_GRAVADO").setValue("0");',
'    apex.item("P196_DLG_IVA").setValue("0");',
'    apex.item("P196_DLG_TOTAL").setValue("0");',
'    apex.theme.openRegion("DLG_DETALLE");',
'}',
'function abrirDialogoEditar(seqId){',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors();',
'    apex.server.process("cargar_detalle", { x01: seqId },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                var umaVal = "";',
'                for (var i=0; i < data.items.length; i++){',
'                    if (data.items[i].id === "P196_DLG_UNI_ID_UNIDAD_MEDIDA") {',
'                        umaVal = data.items[i].value;',
'                    } else {',
'                        apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                    }',
'                }',
'                if (umaVal) {',
'                    $("#P196_DLG_UNI_ID_UNIDAD_MEDIDA").one("apexafterrefresh", function(){',
'                        apex.item("P196_DLG_UNI_ID_UNIDAD_MEDIDA").setValue(umaVal);',
'                    });',
'                }',
'                apex.theme.openRegion("DLG_DETALLE");',
'            } else {',
'                apex.message.showErrors([{type:"error", location:"page", message:data.message, unsafe:false}]);',
'            }',
'        }',
'    }).always(function(){ waitPopup.remove(); });',
'}',
'function guardarDetalle(){',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors();',
'    apex.server.process("guardar_detalle", {',
'        pageItems: ["P196_DLG_SEQ_ID","P196_DLG_PRO_ID_PRODUCTO","P196_DLG_DESCRIPCION",',
'                    "P196_DLG_IVA_ID_IVA","P196_DLG_UNI_ID_UNIDAD_MEDIDA",',
'                    "P196_DLG_CANTIDAD","P196_DLG_PRECIO_UNITARIO","P196_DLG_PORC_DESCUENTO",',
'                    "P196_DLG_MONTO_DESCUENTO","P196_DLG_EXENTO","P196_DLG_GRAVADO",',
'                    "P196_DLG_IVA","P196_DLG_TOTAL"]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                apex.theme.closeRegion("DLG_DETALLE");',
'                apex.region("REG_DET_PRESUPUESTO").refresh();',
'                refrescarTotal();',
'            } else {',
'                apex.message.showErrors([{type:"error", location:"page", message:data.message, unsafe:false}]);',
'            }',
'        }',
'    }).always(function(){ waitPopup.remove(); });',
'}',
'function eliminarDetalle(seqId){',
'    apex.message.confirm("Confirma eliminar esta linea?", function(ok){',
'        if (!ok) return;',
'        var waitPopup = apex.widget.waitPopup();',
'        apex.message.clearErrors();',
'        apex.server.process("eliminar_detalle", { x01: seqId },',
'        {',
'            success: function( data ) {',
'                if ( data.success === true ) {',
'                    apex.region("REG_DET_PRESUPUESTO").refresh();',
'                    refrescarTotal();',
'                } else {',
'                    apex.message.showErrors([{type:"error", location:"page", message:data.message, unsafe:false}]);',
'                }',
'            }',
'        }).always(function(){ waitPopup.remove(); });',
'    });',
'}',
'function refrescarTotal(){',
'    apex.server.process("refrescar_total", {},',
'    { success: function(data){',
'        if (data.success===true) apex.item("P196_MONTO_TOTAL").setValue(data.total);',
'    }});',
'}',
'function calcularIva(){',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors();',
'    apex.server.process("calcular_iva", {',
'        pageItems: ["P196_DLG_IVA_ID_IVA"',
'                    ,"P196_DLG_CANTIDAD"',
'                    ,"P196_DLG_PRECIO_UNITARIO"',
'                    ,"P196_DLG_PORC_DESCUENTO"',
'                    ,"P196_MON_ID_MONEDA"]',
'    },',
'    { success: function(data){',
'        if (data.success===true){',
'            for (var i=0;i<data.items.length;i++){ ',
'                apex.item(data.items[i].id).setValue(data.items[i].value); ',
'            }',
'            apex.item("btn_dlg_guardar").setFocus();',
'        } else {',
'            apex.message.showErrors([{type:"error", location:"page", message:data.message, unsafe:false}]);',
'        }',
'    }}).always(function(){ waitPopup.remove(); });',
'}',
'function cargarProducto(){',
'    var pid = apex.item("P196_DLG_PRO_ID_PRODUCTO").getValue();',
'    if (!pid) return;',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors();',
'    apex.server.process("cargar_producto", {',
'        pageItems: ["P196_DLG_PRO_ID_PRODUCTO","P196_ENT_ID_ENTIDAD","P196_MON_ID_MONEDA"]',
'    },',
'    { success: function(data){',
'        if (data.success===true){',
'            for (var i=0;i<data.items.length;i++){ ',
'                apex.item(data.items[i].id).setValue(data.items[i].value); ',
'            }',
'        } else {',
'            apex.message.showErrors([{type:"error", location:"page", message:data.message, unsafe:false}]);',
'        }',
'    }}).always(function(){ waitPopup.remove(); });',
'}',
'function cargarPrecio(){',
'    var pid = apex.item("P196_DLG_PRO_ID_PRODUCTO").getValue();',
'    var uid = apex.item("P196_DLG_UNI_ID_UNIDAD_MEDIDA").getValue();',
'    if (!pid || !uid) return;',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors();',
'    apex.server.process("cargar_precio", {',
'        pageItems: ["P196_DLG_PRO_ID_PRODUCTO","P196_DLG_UNI_ID_UNIDAD_MEDIDA",',
'                    "P196_MON_ID_MONEDA","P196_FECHA_PRESUPUESTO"]',
'    },',
'    { success: function(data){',
'        if (data.success===true){',
'            for (var i=0;i<data.items.length;i++){ ',
'                apex.item(data.items[i].id).setValue(data.items[i].value); ',
'            }',
'        } else {',
'            apex.message.showErrors([{type:"error", location:"page", message:data.message, unsafe:false}]);',
'        }',
'    }}).always(function(){ waitPopup.remove(); });',
'}',
'function anularPresupuesto(){',
'    apex.message.confirm("Proceder con la ANULACION del presupuesto?", function(ok){',
'        if (!ok) return;',
'        var waitPopup = apex.widget.waitPopup();',
'        apex.message.clearErrors();',
'        apex.server.process("anular_presupuesto", { pageItems: ["P196_ID_PRESUPUESTO"] },',
'        { success: function(data){',
'            if (data.success===true){ apex.navigation.redirect("f?p=&APP_ID.:195:&SESSION."); }',
'            else { apex.message.showErrors([{type:"error",location:"page",message:data.message,unsafe:false}]); }',
'        }}).always(function(){ waitPopup.remove(); });',
'    });',
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}',
'.apex_disabled {',
'    opacity: 70% !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(171712708822432905)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900000000000196001)
,p_plug_name=>unistr('Presupuesto N\00B0 &P196_NRO_PRESUPUESTO.')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_PRESUPUESTO,',
'       NRO_PRESUPUESTO,',
'       FECHA_PRESUPUESTO,',
'       FECHA_VALIDEZ,',
'       ENT_ID_ENTIDAD,',
'       CONDICION_VENTA,',
'       MON_ID_MONEDA,',
'       TIPO_CAMBIO,',
'       SUC_ID_SUCURSAL,',
'       OBSERVACION,',
'       ESTADO,',
'       MONTO,',
'       USUARIO_REGISTRO',
'  FROM CAB_PRESUPUESTO'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900000000000196100)
,p_plug_name=>unistr('L\00EDneas del presupuesto')
,p_region_name=>'REG_DET_PRESUPUESTO'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT TO_NUMBER(c001) AS ID_DET_PRESUPUESTO,',
'       TO_NUMBER(c003) AS PRO_ID_PRODUCTO,',
'       c004            AS DESCRIPCION,',
'       (SELECT u.descripcion FROM unidad_medida u WHERE u.id_unidad_medida = TO_NUMBER(c006)) AS UMA,',
'       (SELECT i.descripcion FROM iva i WHERE i.id_iva = TO_NUMBER(c005)) AS IVA_DESC,',
'       TO_NUMBER(c008) AS CANTIDAD,',
'       TO_NUMBER(c007) AS PRECIO_UNITARIO,',
'       TO_NUMBER(c013) AS PORC_DESC,',
'       TO_NUMBER(c012) AS MONTO_DESC,',
'       TO_NUMBER(c009) AS EXENTO,',
'       TO_NUMBER(c010) AS GRAVADO,',
'       TO_NUMBER(c011) AS IVA,',
'       TO_NUMBER(c014) AS TOTAL,',
'       SEQ_ID,',
'       ''<button type="button" class="t-Button t-Button--link" onclick="abrirDialogoEditar(''||SEQ_ID||'');" title="Editar"><span class="fa fa-edit"></span></button>'' AS ACC_EDIT,',
'       ''<button type="button" class="t-Button t-Button--link t-Button--danger" onclick="eliminarDetalle(''||SEQ_ID||'');" title="Eliminar"><span class="fa fa-trash"></span></button>'' AS ACC_DEL',
'FROM apex_collections',
'WHERE collection_name = ''COLL_DET_PRESUPUESTO'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_header=>unistr('L\00EDneas del presupuesto')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(900000000000196150)
,p_max_row_count=>'100000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_enable_mail_download=>'Y'
,p_owner=>'KMELOT'
,p_internal_uid=>900000000000196150
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196151)
,p_db_column_name=>'ID_DET_PRESUPUESTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Det'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196152)
,p_db_column_name=>'PRO_ID_PRODUCTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Producto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196153)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196154)
,p_db_column_name=>'UMA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Uni.medida'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196155)
,p_db_column_name=>'IVA_DESC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'I.V.A.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196156)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196157)
,p_db_column_name=>'PRECIO_UNITARIO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Precio Unit.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196158)
,p_db_column_name=>'PORC_DESC'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'% Desc'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196159)
,p_db_column_name=>'MONTO_DESC'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Desc.'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196160)
,p_db_column_name=>'EXENTO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Exento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196161)
,p_db_column_name=>'GRAVADO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Gravado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196162)
,p_db_column_name=>'IVA'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'I.V.A.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196163)
,p_db_column_name=>'TOTAL'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196164)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196165)
,p_db_column_name=>'ACC_EDIT'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'&nbsp;'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P196_ESTADO'
,p_display_condition2=>'VIGENTE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900000000000196166)
,p_db_column_name=>'ACC_DEL'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'&nbsp;'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P196_ESTADO'
,p_display_condition2=>'VIGENTE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(900000000000196199)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'P196_DEF'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DESCRIPCION:UMA:IVA_DESC:CANTIDAD:PRECIO_UNITARIO:PORC_DESC:MONTO_DESC:EXENTO:GRAVADO:IVA:TOTAL:ACC_EDIT:ACC_DEL'
,p_sum_columns_on_break=>'EXENTO:GRAVADO:IVA:TOTAL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900000000000196200)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(206180564029405200)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900000000000196700)
,p_plug_name=>unistr('L\00EDnea del presupuesto')
,p_region_name=>'DLG_DETALLE'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x540'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900000000000196302)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'CHANGE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P196_ID_PRESUPUESTO IS NOT NULL',
'AND :P196_ESTADO = ''VIGENTE'''))
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(171713083746432017)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900000000000196305)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_button_name=>'BTN_GENERAR_FACTURA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Generar factura'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.::P68_PRE_ID,P68_P_ORIGEN:&P196_ID_PRESUPUESTO.,196'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P196_ID_PRESUPUESTO IS NOT NULL',
'AND :P196_ESTADO = ''VIGENTE'''))
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-text-o'
,p_security_scheme=>wwv_flow_imp.id(208262437230142561)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900000000000196306)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_button_name=>'BTN_VER_PDF'
,p_button_static_id=>'btn_ver_pdf'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Ver PDF'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'javascript:urlVerPDF();'
,p_button_condition=>':P196_ID_PRESUPUESTO IS NOT NULL'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900000000000196301)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Volver'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:195:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900000000000196710)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_button_name=>'BTN_DLG_CANCELAR'
,p_button_static_id=>'btn_dlg_cancelar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900000000000196711)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_button_name=>'BTN_DLG_GUARDAR'
,p_button_static_id=>'btn_dlg_guardar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar linea'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_security_scheme=>wwv_flow_imp.id(171713083746432017)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900000000000196303)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'CREATE'
,p_button_condition=>':P196_ID_PRESUPUESTO IS NULL'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(171713341674431177)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900000000000196304)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_button_name=>'BTN_ANULAR'
,p_button_static_id=>'btn_anular'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Anular'
,p_button_position=>'DELETE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P196_ID_PRESUPUESTO IS NOT NULL',
'AND :P196_ESTADO = ''VIGENTE'''))
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(171713083746432017)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900000000000196401)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900000000000196100)
,p_button_name=>'BTN_AGREGAR_LINEA'
,p_button_static_id=>'btn_agregar_linea'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Agregar linea'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P196_ESTADO IS NULL OR :P196_ESTADO = ''VIGENTE'''
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus-circle'
,p_security_scheme=>wwv_flow_imp.id(171713341674431177)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(900000000000196501)
,p_branch_name=>'Go To 196 after CREATE/SAVE'
,p_branch_action=>'f?p=&APP_ID.:196:&SESSION.::&DEBUG.::P196_ID_PRESUPUESTO:&P196_ID_PRESUPUESTO.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'CREATE,SAVE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196601)
,p_name=>'P196_ID_PRESUPUESTO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_item_source_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_source=>'ID_PRESUPUESTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196602)
,p_name=>'P196_NRO_PRESUPUESTO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_item_source_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_prompt=>'Nro. Presupuesto'
,p_source=>'NRO_PRESUPUESTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>40
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(900000000000196603)
,p_name=>'P196_FECHA_PRESUPUESTO'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_item_source_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_prompt=>'Fecha'
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'FECHA_PRESUPUESTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(900000000000196604)
,p_name=>'P196_FECHA_VALIDEZ'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_item_source_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_prompt=>'Fecha Validez'
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'FECHA_VALIDEZ'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(900000000000196605)
,p_name=>'P196_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_item_source_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(900000000000196606)
,p_name=>'P196_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_item_source_plug_id=>wwv_flow_imp.id(900000000000196001)
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
,p_lov_null_text=>'- Seleccione cliente -'
,p_colspan=>6
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Cliente',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196607)
,p_name=>'P196_CONDICION_VENTA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_item_source_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_prompt=>unistr('Condici\00F3n')
,p_source=>'CONDICION_VENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CONDICION_FACTURA'
,p_lov=>'.'||wwv_flow_imp.id(204400347809397724)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione -'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196608)
,p_name=>'P196_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_item_source_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_prompt=>'Moneda'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA_ABREVIADO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_moneda as r',
',abreviatura as d',
'from moneda'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione -'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196609)
,p_name=>'P196_TIPO_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_item_source_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_prompt=>'T. Cambio'
,p_format_mask=>'999G999G990D00'
,p_source=>'TIPO_CAMBIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196610)
,p_name=>'P196_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_item_source_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_prompt=>'Sucursal'
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SUCURSAL_MIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.id_suc_entidad AS r',
'      ,s.descripcion AS d',
'FROM sucursal_entidad s',
'WHERE s.ent_id_entidad = :APP_ID_ENTIDAD'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione -'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196611)
,p_name=>'P196_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_item_source_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>400
,p_cHeight=>3
,p_colspan=>9
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196612)
,p_name=>'P196_MONTO_TOTAL'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_prompt=>'Monto Total'
,p_format_mask=>'999G999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196613)
,p_name=>'P196_USUARIO_REGISTRO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_item_source_plug_id=>wwv_flow_imp.id(900000000000196001)
,p_source=>'USUARIO_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196720)
,p_name=>'P196_DLG_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196721)
,p_name=>'P196_DLG_PRO_ID_PRODUCTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_prompt=>'Producto'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_PRODUCTO_DESCRI_ART_SRV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.id_producto AS r',
'      ,p.descripcion AS d',
'FROM producto p'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione producto -'
,p_colspan=>12
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Producto',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196722)
,p_name=>'P196_DLG_DESCRIPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_prompt=>unistr('Descripci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>400
,p_cHeight=>2
,p_colspan=>12
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196723)
,p_name=>'P196_DLG_UMA_DESC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196724)
,p_name=>'P196_DLG_UNI_ID_UNIDAD_MEDIDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>45
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_prompt=>'Unidad de Medida'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT u.descripcion D, d.uni_id_unidad_medida R',
'FROM det_uni_medi_prod d, unidad_medida u',
'WHERE d.pro_id_producto = :P196_DLG_PRO_ID_PRODUCTO',
'AND u.id_unidad_medida = d.uni_id_unidad_medida',
'AND d.estado = ''ACTIVO''',
'ORDER BY u.descripcion'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_lov_cascade_parent_items=>'P196_DLG_PRO_ID_PRODUCTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196725)
,p_name=>'P196_DLG_IVA_DESC'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_prompt=>'IVA'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(900000000000196726)
,p_name=>'P196_DLG_IVA_ID_IVA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>55
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196727)
,p_name=>'P196_DLG_CANTIDAD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_prompt=>'Cantidad'
,p_format_mask=>'999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196728)
,p_name=>'P196_DLG_PRECIO_UNITARIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_prompt=>'Precio Unit.'
,p_format_mask=>'999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196729)
,p_name=>'P196_DLG_PORC_DESCUENTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196730)
,p_name=>'P196_DLG_MONTO_DESCUENTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_format_mask=>'999G999G990D00'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196731)
,p_name=>'P196_DLG_EXENTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_prompt=>'Exento'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196732)
,p_name=>'P196_DLG_GRAVADO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_prompt=>'Gravado'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196733)
,p_name=>'P196_DLG_IVA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_prompt=>'I.V.A.'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900000000000196734)
,p_name=>'P196_DLG_TOTAL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(900000000000196700)
,p_prompt=>'Total'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900000000000196801)
,p_name=>'DA_PRODUCTO_CHANGE'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P196_DLG_PRO_ID_PRODUCTO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900000000000196802)
,p_event_id=>wwv_flow_imp.id(900000000000196801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'cargarProducto();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900000000000196805)
,p_name=>'DA_UMA_CHANGE'
,p_event_sequence=>15
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P196_DLG_UNI_ID_UNIDAD_MEDIDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900000000000196806)
,p_event_id=>wwv_flow_imp.id(900000000000196805)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'cargarPrecio();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900000000000196810)
,p_name=>'DA_RECALC'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P196_DLG_CANTIDAD,P196_DLG_PRECIO_UNITARIO,P196_DLG_PORC_DESCUENTO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900000000000196811)
,p_event_id=>wwv_flow_imp.id(900000000000196810)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calcularIva();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900000000000196820)
,p_name=>'DA_DLG_GUARDAR'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(900000000000196711)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900000000000196821)
,p_event_id=>wwv_flow_imp.id(900000000000196820)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'guardarDetalle();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900000000000196830)
,p_name=>'DA_DLG_CANCELAR'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(900000000000196710)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900000000000196831)
,p_event_id=>wwv_flow_imp.id(900000000000196830)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.theme.closeRegion("DLG_DETALLE");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900000000000196840)
,p_name=>'DA_AGREGAR_LINEA'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(900000000000196401)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900000000000196841)
,p_event_id=>wwv_flow_imp.id(900000000000196840)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'abrirDialogoNuevo();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900000000000196850)
,p_name=>'DA_ANULAR'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(900000000000196304)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900000000000196851)
,p_event_id=>wwv_flow_imp.id(900000000000196850)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'anularPresupuesto();'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900000000000196910)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar presupuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_id NUMBER := :P196_ID_PRESUPUESTO;',
'BEGIN',
'    PKG_PRESUPUESTO.P_GUARDA_PRESUPUESTO(',
'        p_id_presupuesto    => v_id,',
'        p_fecha_presupuesto => TO_DATE(:P196_FECHA_PRESUPUESTO, ''DD-MM-YYYY''),',
'        p_fecha_validez     => TO_DATE(:P196_FECHA_VALIDEZ, ''DD-MM-YYYY''),',
'        p_ent_id_entidad    => TO_NUMBER(:P196_ENT_ID_ENTIDAD),',
'        p_condicion_venta   => :P196_CONDICION_VENTA,',
'        p_mon_id_moneda     => TO_NUMBER(:P196_MON_ID_MONEDA),',
'        p_tipo_cambio       => TO_NUMBER(:P196_TIPO_CAMBIO),',
'        p_suc_id_sucursal   => TO_NUMBER(:P196_SUC_ID_SUCURSAL),',
'        p_observacion       => :P196_OBSERVACION);',
'    :P196_ID_PRESUPUESTO := v_id;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Presupuesto guardado correctamente.'
,p_internal_uid=>900000000000196910
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900000000000196901)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(900000000000196001)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form CAB_PRESUPUESTO'
,p_internal_uid=>900000000000196901
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900000000000196902)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P196_ID_PRESUPUESTO IS NULL THEN',
'        :P196_NRO_PRESUPUESTO := ''(Se asignara al guardar)'';',
'        :P196_FECHA_PRESUPUESTO := TO_CHAR(SYSDATE, ''DD-MM-YYYY'');',
'        :P196_FECHA_VALIDEZ     := TO_CHAR(SYSDATE+15, ''DD-MM-YYYY'');',
'        :P196_USUARIO_REGISTRO  := NVL(V(''APP_USER''), USER);',
'        :P196_ESTADO            := ''VIGENTE'';',
'        :P196_MON_ID_MONEDA     := 1;',
'        :P196_TIPO_CAMBIO       := 1;',
'        :P196_MONTO_TOTAL       := 0;',
'        BEGIN',
'            SELECT id_suc_entidad INTO :P196_SUC_ID_SUCURSAL',
'              FROM sucursal_entidad',
'             WHERE rownum = 1',
'             ORDER BY id_suc_entidad;',
'        EXCEPTION WHEN NO_DATA_FOUND THEN NULL;',
'        END;',
'        APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''COLL_DET_PRESUPUESTO'');',
'    ELSE',
'        PKG_PRESUPUESTO.P_CARGAR_COLL_DETALLE(:P196_ID_PRESUPUESTO);',
'        SELECT NVL(SUM(TO_NUMBER(c014)),0) INTO :P196_MONTO_TOTAL',
'          FROM apex_collections WHERE collection_name = ''COLL_DET_PRESUPUESTO'';',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900000000000196902
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900000000000196930)
,p_process_sequence=>5
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ver_pdf'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  vl_vNomReporte VARCHAR2(255);',
'  vl_empresa parametros.nombre%type;',
'BEGIN',
'    SELECT p.nombre INTO vl_empresa FROM parametros p;',
'    vl_vNomReporte := ''PRESUPUESTO'';',
'    pkg_jasperreports_server.descarga_reporte(',
'        p_vNomReporte  => vl_vNomReporte',
'       ,p_aNomParams   => apex_util.string_to_table(''P_ID_PRESUPUESTO:P_USUARIO:P_EMPRESA'')',
'       ,p_aValParams   => apex_util.string_to_table(apex_application.g_x01||'':''||:APP_USER||'':''||vl_empresa)',
'    );',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900000000000196930
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900000000000196920)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar_detalle'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_seq      NUMBER := TO_NUMBER(apex_application.g_x01);',
'    v_pro_id   NUMBER;',
'    v_desc     VARCHAR2(400);',
'    v_iva_id   NUMBER;',
'    v_uma_id   NUMBER;',
'    v_precio   NUMBER;',
'    v_cantidad NUMBER;',
'    v_porc     NUMBER;',
'    v_mdesc    NUMBER;',
'    v_exento   NUMBER;',
'    v_gravado  NUMBER;',
'    v_iva_v    NUMBER;',
'    v_total    NUMBER;',
'    v_uma_desc VARCHAR2(80);',
'    v_iva_desc VARCHAR2(80);',
'  PROCEDURE output_json_item (',
'        p_item_name  IN VARCHAR2',
'      , p_item_value IN VARCHAR2)',
'  AS',
'  BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'  END output_json_item;',
'BEGIN',
'    SELECT TO_NUMBER(c003), c004, TO_NUMBER(c005), TO_NUMBER(c006),',
'           TO_NUMBER(c007), TO_NUMBER(c008), TO_NUMBER(c013), TO_NUMBER(c012),',
'           TO_NUMBER(c009), TO_NUMBER(c010), TO_NUMBER(c011), TO_NUMBER(c014)',
'      INTO v_pro_id, v_desc, v_iva_id, v_uma_id, v_precio, v_cantidad,',
'           v_porc, v_mdesc, v_exento, v_gravado, v_iva_v, v_total',
'      FROM apex_collections',
'     WHERE collection_name = ''COLL_DET_PRESUPUESTO'' AND seq_id = v_seq;',
'    BEGIN SELECT descripcion INTO v_uma_desc FROM unidad_medida WHERE id_unidad_medida=v_uma_id; EXCEPTION WHEN OTHERS THEN v_uma_desc:=NULL; END;',
'    BEGIN SELECT descripcion INTO v_iva_desc FROM iva WHERE id_iva=v_iva_id; EXCEPTION WHEN OTHERS THEN v_iva_desc:=NULL; END;',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P196_DLG_SEQ_ID'',              TO_CHAR(v_seq));',
'    output_json_item(''P196_DLG_PRO_ID_PRODUCTO'',     TO_CHAR(v_pro_id));',
'    output_json_item(''P196_DLG_DESCRIPCION'',         v_desc);',
'    output_json_item(''P196_DLG_IVA_ID_IVA'',          TO_CHAR(v_iva_id));',
'    output_json_item(''P196_DLG_IVA_DESC'',            v_iva_desc);',
'    output_json_item(''P196_DLG_UNI_ID_UNIDAD_MEDIDA'',TO_CHAR(v_uma_id));',
'    output_json_item(''P196_DLG_UMA_DESC'',            v_uma_desc);',
'    output_json_item(''P196_DLG_CANTIDAD'',            TO_CHAR(v_cantidad));',
'    output_json_item(''P196_DLG_PRECIO_UNITARIO'',     TO_CHAR(v_precio));',
'    output_json_item(''P196_DLG_PORC_DESCUENTO'',      TO_CHAR(v_porc));',
'    output_json_item(''P196_DLG_MONTO_DESCUENTO'',     TO_CHAR(v_mdesc));',
'    output_json_item(''P196_DLG_EXENTO'',              TO_CHAR(v_exento));',
'    output_json_item(''P196_DLG_GRAVADO'',             TO_CHAR(v_gravado));',
'    output_json_item(''P196_DLG_IVA'',                 TO_CHAR(v_iva_v));',
'    output_json_item(''P196_DLG_TOTAL'',               TO_CHAR(v_total));',
'    apex_json.close_array;',
'    apex_json.close_object;',
'EXCEPTION WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900000000000196920
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900000000000196921)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'guardar_detalle'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_seq NUMBER;',
'BEGIN',
'    IF :P196_DLG_PRO_ID_PRODUCTO IS NULL THEN RAISE_APPLICATION_ERROR(-20000,''Debe seleccionar un producto.''); END IF;',
'    IF NVL(TO_NUMBER(:P196_DLG_CANTIDAD,''999G999G999G999D00''),0) <= 0 THEN RAISE_APPLICATION_ERROR(-20000,''Cantidad debe ser mayor a cero.''); END IF;',
'    IF NVL(TO_NUMBER(:P196_DLG_PRECIO_UNITARIO,''999G999G999G999D00''),-1) < 0 THEN RAISE_APPLICATION_ERROR(-20000,''Precio unitario invalido.''); END IF;',
'    IF NVL(:P196_DLG_SEQ_ID,''X'') = ''X'' THEN',
'        APEX_COLLECTION.ADD_MEMBER(',
'            p_collection_name => ''COLL_DET_PRESUPUESTO'',',
'            p_c001 => NULL,',
'            p_c002 => NULL,',
'            p_c003 => :P196_DLG_PRO_ID_PRODUCTO,',
'            p_c004 => UPPER(:P196_DLG_DESCRIPCION),',
'            p_c005 => :P196_DLG_IVA_ID_IVA,',
'            p_c006 => :P196_DLG_UNI_ID_UNIDAD_MEDIDA,',
'            p_c007 => TO_CHAR(TO_NUMBER(:P196_DLG_PRECIO_UNITARIO,''999G999G999G999D00'')),',
'            p_c008 => TO_CHAR(TO_NUMBER(:P196_DLG_CANTIDAD,''999G999G999G999D00'')),',
'            p_c009 => TO_CHAR(NVL(TO_NUMBER(:P196_DLG_EXENTO,''999G999G999G999D00''),0)),',
'            p_c010 => TO_CHAR(NVL(TO_NUMBER(:P196_DLG_GRAVADO,''999G999G999G999D00''),0)),',
'            p_c011 => TO_CHAR(NVL(TO_NUMBER(:P196_DLG_IVA,''999G999G999G999D00''),0)),',
'            p_c012 => TO_CHAR(NVL(TO_NUMBER(:P196_DLG_MONTO_DESCUENTO,''999G999G999G999D00''),0)),',
'            p_c013 => TO_CHAR(NVL(TO_NUMBER(:P196_DLG_PORC_DESCUENTO,''990D00''),0)),',
'            p_c014 => TO_CHAR(NVL(TO_NUMBER(:P196_DLG_TOTAL,''999G999G999G999D00''),0)),',
'            p_c015 => NULL);',
'    ELSE',
'        v_seq := TO_NUMBER(:P196_DLG_SEQ_ID);',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE(p_collection_name=>''COLL_DET_PRESUPUESTO'', p_seq=>v_seq, p_attr_number=>3,  p_attr_value=>:P196_DLG_PRO_ID_PRODUCTO);',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE(p_collection_name=>''COLL_DET_PRESUPUESTO'', p_seq=>v_seq, p_attr_number=>4,  p_attr_value=>:P196_DLG_DESCRIPCION);',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE(p_collection_name=>''COLL_DET_PRESUPUESTO'', p_seq=>v_seq, p_attr_number=>5,  p_attr_value=>:P196_DLG_IVA_ID_IVA);',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE(p_collection_name=>''COLL_DET_PRESUPUESTO'', p_seq=>v_seq, p_attr_number=>6,  p_attr_value=>:P196_DLG_UNI_ID_UNIDAD_MEDIDA);',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE(p_collection_name=>''COLL_DET_PRESUPUESTO'', p_seq=>v_seq, p_attr_number=>7,  p_attr_value=>TO_CHAR(TO_NUMBER(:P196_DLG_PRECIO_UNITARIO,''999G999G999G999D00'')));',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE(p_collection_name=>''COLL_DET_PRESUPUESTO'', p_seq=>v_seq, p_attr_number=>8,  p_attr_value=>TO_CHAR(TO_NUMBER(:P196_DLG_CANTIDAD,''999G999G999G999D00'')));',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE(p_collection_name=>''COLL_DET_PRESUPUESTO'', p_seq=>v_seq, p_attr_number=>9,  p_attr_value=>TO_CHAR(NVL(TO_NUMBER(:P196_DLG_EXENTO,''999G999G999G999D00''),0)));',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE(p_collection_name=>''COLL_DET_PRESUPUESTO'', p_seq=>v_seq, p_attr_number=>10, p_attr_value=>TO_CHAR(NVL(TO_NUMBER(:P196_DLG_GRAVADO,''999G999G999G999D00''),0)));',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE(p_collection_name=>''COLL_DET_PRESUPUESTO'', p_seq=>v_seq, p_attr_number=>11, p_attr_value=>TO_CHAR(NVL(TO_NUMBER(:P196_DLG_IVA,''999G999G999G999D00''),0)));',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE(p_collection_name=>''COLL_DET_PRESUPUESTO'', p_seq=>v_seq, p_attr_number=>12, p_attr_value=>TO_CHAR(NVL(TO_NUMBER(:P196_DLG_MONTO_DESCUENTO,''999G999G999G999D00''),0)));',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE(p_collection_name=>''COLL_DET_PRESUPUESTO'', p_seq=>v_seq, p_attr_number=>13, p_attr_value=>TO_CHAR(NVL(TO_NUMBER(:P196_DLG_PORC_DESCUENTO,''990D00''),0)));',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE(p_collection_name=>''COLL_DET_PRESUPUESTO'', p_seq=>v_seq, p_attr_number=>14, p_attr_value=>TO_CHAR(NVL(TO_NUMBER(:P196_DLG_TOTAL,''999G999G999G999D00''),0)));',
'    END IF;',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.close_object;',
'EXCEPTION WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900000000000196921
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900000000000196922)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'eliminar_detalle'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE v_seq NUMBER := TO_NUMBER(apex_application.g_x01);',
'BEGIN',
'    APEX_COLLECTION.DELETE_MEMBER(p_collection_name=>''COLL_DET_PRESUPUESTO'', p_seq=>v_seq);',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.close_object;',
'EXCEPTION WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900000000000196922
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900000000000196923)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar_producto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_desc     producto.descripcion%TYPE;',
'  v_iva_id   producto.iva_id_iva%TYPE;',
'  v_iva_desc VARCHAR2(80);',
'  PROCEDURE output_json_item (',
'        p_item_name  IN VARCHAR2',
'      , p_item_value IN VARCHAR2)',
'  AS',
'  BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'  END output_json_item;',
'BEGIN',
'  SELECT p.descripcion, p.iva_id_iva',
'  INTO v_desc, v_iva_id',
'  FROM producto p',
'  WHERE p.id_producto = :P196_DLG_PRO_ID_PRODUCTO;',
'  BEGIN',
'    SELECT descripcion INTO v_iva_desc FROM iva WHERE id_iva = v_iva_id;',
'  EXCEPTION WHEN OTHERS THEN v_iva_desc := NULL;',
'  END;',
'  apex_json.open_object;',
'  apex_json.write(''success'', TRUE);',
'  apex_json.open_array(''items'');',
'  output_json_item(''P196_DLG_DESCRIPCION'', v_desc);',
'  output_json_item(''P196_DLG_IVA_ID_IVA'',  TO_CHAR(v_iva_id));',
'  output_json_item(''P196_DLG_IVA_DESC'',    v_iva_desc);',
'  output_json_item(''P196_DLG_PRECIO_UNITARIO'', NULL);',
'  apex_json.close_array;',
'  apex_json.close_object;',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900000000000196923
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900000000000196950)
,p_process_sequence=>45
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar_precio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_precio NUMBER;',
'  PROCEDURE output_json_item (',
'        p_item_name  IN VARCHAR2',
'      , p_item_value IN VARCHAR2)',
'  AS',
'  BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'  END output_json_item;',
'BEGIN',
'  IF :P196_DLG_PRO_ID_PRODUCTO IS NULL THEN',
'    raise_application_error(-20000, ''Debe seleccionar un producto.'');',
'  END IF;',
'  IF :P196_DLG_UNI_ID_UNIDAD_MEDIDA IS NULL THEN',
'    raise_application_error(-20000, ''Debe seleccionar unidad de medida.'');',
'  END IF;',
'  v_precio := f_devuelve_precio_venta(',
'      p_id_producto      => :P196_DLG_PRO_ID_PRODUCTO',
'    , p_id_unidad_medida => :P196_DLG_UNI_ID_UNIDAD_MEDIDA',
'    , p_id_moneda        => :P196_MON_ID_MONEDA',
'    , p_fecha            => TO_DATE(:P196_FECHA_PRESUPUESTO, ''DD-MM-YYYY'')',
'    , p_mensaje          => 1',
'  );',
'  apex_json.open_object;',
'  apex_json.write(''success'', TRUE);',
'  apex_json.open_array(''items'');',
'  output_json_item(''P196_DLG_PRECIO_UNITARIO'', TO_CHAR(v_precio));',
'  apex_json.close_array;',
'  apex_json.close_object;',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900000000000196950
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900000000000196924)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'calcular_iva'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  PROCEDURE output_json_item (',
'        p_item_name  IN VARCHAR2',
'      , p_item_value IN VARCHAR2)',
'  AS',
'  BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'  END output_json_item;',
'BEGIN',
'  :P196_DLG_MONTO_DESCUENTO := 0;',
'  IF :P196_DLG_IVA_ID_IVA IS NOT NULL THEN ',
'    p_dev_valores_factura(',
'        p_id_iva          => :P196_DLG_IVA_ID_IVA',
'      , p_id_moneda       => :P196_MON_ID_MONEDA',
'      , p_precio_unitario => TO_NUMBER(:P196_DLG_PRECIO_UNITARIO, ''999G999G999G999D00'')',
'      , p_cantidad        => TO_NUMBER(:P196_DLG_CANTIDAD,    ''999G999G999G999D00'')',
'      , p_exento          => :P196_DLG_EXENTO',
'      , p_gravado         => :P196_DLG_GRAVADO',
'      , p_iva             => :P196_DLG_IVA',
'      , p_total           => :P196_DLG_TOTAL',
'    );',
'  END IF;',
'  apex_json.open_object;',
'  apex_json.write(''success'', TRUE);',
'  apex_json.open_array(''items'');',
'  output_json_item(''P196_DLG_EXENTO'', :P196_DLG_EXENTO);',
'  output_json_item(''P196_DLG_GRAVADO'', :P196_DLG_GRAVADO);',
'  output_json_item(''P196_DLG_IVA'', :P196_DLG_IVA);',
'  output_json_item(''P196_DLG_TOTAL'', :P196_DLG_TOTAL);',
'  apex_json.close_array;',
'  apex_json.close_object;  ',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900000000000196924
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900000000000196925)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'refrescar_total'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE v_total NUMBER := 0;',
'BEGIN',
'    SELECT NVL(SUM(TO_NUMBER(c014)),0) INTO v_total',
'      FROM apex_collections WHERE collection_name = ''COLL_DET_PRESUPUESTO'';',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.write(''total'', TO_CHAR(v_total));',
'    apex_json.close_object;',
'EXCEPTION WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900000000000196925
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900000000000196926)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'anular_presupuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_PRESUPUESTO.P_ANULAR_PRESUPUESTO(:P196_ID_PRESUPUESTO);',
'    COMMIT;',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.close_object;',
'EXCEPTION WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900000000000196926
);
wwv_flow_imp.component_end;
end;
/
