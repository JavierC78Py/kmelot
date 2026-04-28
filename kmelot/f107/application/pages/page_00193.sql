prompt --application/pages/page_00193
begin
--   Manifest
--     PAGE: 00193
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
 p_id=>193
,p_name=>'Nota de Credito Venta'
,p_alias=>'NC-VENTA-FORM'
,p_step_title=>'Nota de Credito Venta'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#mascara_fecha#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function urlVerPDF(){',
'    apex.navigation.openInNewWindow(',
'        apex.server.url( {',
'            p_request: "application_process=ver_pdf_nc",',
'            x01: apex.item("P193_ID_NCREDITO_VENTA").getValue()',
'        })',
'    );',
'}',
'function eliminarColDet(seq_id) {',
'    apex.server.process(''eliminar_col_det'', { x01: seq_id }, {',
'        success: function() { ',
'            apex.region(''REG_COL_NEW_DET_NC'').refresh(); ',
'        }',
'    });',
'}',
'function buscarNroNC() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("buscar_nro_nc", {',
'        pageItems: ["P193_TIM_ID_TIMBRADO"',
'        ,"P193_SUC_ID_SUCURSAL"',
'        ,"P193_TIP_ID_TIPO_COMPROBANTE"',
'        ,"P193_SUC_ID_SUCURSAL"',
'        ,"P193_FECHA_NCREDITO"',
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
'function abrirLineaNCNew(){',
'    [''P193_NEW_DET_ID_DET_FACTURA_VENTA'',''P193_NEW_DISPONIBLE'',''P193_NEW_PRO_ID_PRODUCTO'',',
'     ''P193_NEW_DESCRIPCION'',''P193_NEW_IVA_ID_IVA'',''P193_NEW_UNI_ID_UNIDAD_MEDIDA'',',
'     ''P193_NEW_CANTIDAD'',''P193_NEW_PRECIO_UNITARIO'',''P193_NEW_PORC_DESCUENTO'',',
'     ''P193_NEW_MONTO_DESCUENTO'',''P193_NEW_EXENTO'',''P193_NEW_GRAVADO'',''P193_NEW_IVA'',',
'     ''P193_NEW_TOTAL''].forEach(function(it){ apex.item(it).setValue(''''); });',
'    apex.theme.openRegion("REG_DET_NC_NEW");',
'    setTimeout(function(){ ',
'        apex.item(''P193_NEW_DET_ID_DET_FACTURA_VENTA'').setFocus(); }',
'    , 200);',
'}',
'function cambioLineaNCNew(){',
'    var detFacId = apex.item(''P193_NEW_DET_ID_DET_FACTURA_VENTA'').getValue();',
'    if(!detFacId) return;',
'    apex.server.process(''cargar_det_factura_193'', { x01: detFacId }, {',
'        success: function(data){',
'            if(data.success){',
'                data.items.forEach(function(item){ apex.item(item.id).setValue(item.value); });',
'                calcularTotalesNCNew();',
'            }',
'        }',
'    });',
'}',
'function calcularTotalesNCNew(){',
'    var cant     = parseFloat((apex.item(''P193_NEW_CANTIDAD'').getValue() || ''0'').replace(/\./g, '''').replace('','', ''.'')) || 0;',
'    var precio   = parseFloat((apex.item(''P193_NEW_PRECIO_UNITARIO'').getValue() || ''0'').replace(/\./g, '''').replace('','', ''.'')) || 0;',
'    var porcDesc = parseFloat((apex.item(''P193_NEW_PORC_DESCUENTO'').getValue() || ''0'').replace(/\./g, '''').replace('','', ''.'')) || 0;',
'    var subtotal = cant * precio;',
'    var descuento = subtotal * porcDesc / 100;',
'    var neto = subtotal - descuento;',
'    apex.server.process(''calcular_montos_193'', {',
'        x01: apex.item(''P193_NEW_IVA_ID_IVA'').getValue(),',
'        x02: neto',
'    }, {',
'        success: function(data){',
'            if(data.success){',
'                data.items.forEach(function(item){ apex.item(item.id).setValue(item.value); });',
'            }',
'        }',
'    });',
'}',
'function guardarLineaNCNew(){',
'    apex.message.clearErrors();',
'    var requeridos = [',
'        {id:''P193_NEW_DET_ID_DET_FACTURA_VENTA'', label:''Linea de factura''},',
'        {id:''P193_NEW_DESCRIPCION'',              label:''Descripcion''},',
'        {id:''P193_NEW_IVA_ID_IVA'',               label:''IVA''},',
'        {id:''P193_NEW_CANTIDAD'',                 label:''Cantidad''},',
'        {id:''P193_NEW_PRECIO_UNITARIO'',          label:''Precio unitario''}',
'    ];',
'    var faltan = [];',
'    requeridos.forEach(function(r){',
'        var v = apex.item(r.id).getValue();',
'        if(!v) faltan.push({type:''error'', location:[''inline'',''page''], pageItem:r.id, message: r.label + '' es obligatorio'', unsafe:false});',
'    });',
'    if(faltan.length){ apex.message.showErrors(faltan); return; }',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.server.process(''agregar_linea_nc'', {',
'        pageItems: [''P193_NEW_DET_ID_DET_FACTURA_VENTA'',',
'                    ''P193_NEW_PRO_ID_PRODUCTO'',',
'                    ''P193_NEW_DESCRIPCION'',',
'                    ''P193_NEW_IVA_ID_IVA'',',
'                    ''P193_NEW_UNI_ID_UNIDAD_MEDIDA'',',
'                    ''P193_NEW_CANTIDAD'',',
'                    ''P193_NEW_PRECIO_UNITARIO'',',
'                    ''P193_NEW_PORC_DESCUENTO'']',
'    }, {',
'        success: function(data){',
'            if(data.success){',
'                for (var i = 0; i < data.items.length; i++) {',
'                    apex.item(data.items[i].id).setValue(data.items[i].value);',
'                }',
'                apex.theme.closeRegion("REG_DET_NC_NEW");',
'                apex.region("REG_COL_NEW_DET_NC").refresh()',
'            } else {',
'                apex.message.showErrors([{type:''error'', location:''page'', message: data.message, unsafe:false}]);',
'            }',
'        }',
'    }).always(function(){ waitPopup.remove(); });',
'}',
''))
,p_javascript_code_onload=>'mascaraFechaRegex("#P193_FECHA_NCREDITO");'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}',
'.apex_disabled {',
'    opacity: 65%!important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(159049052521448528)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900193001)
,p_plug_name=>'Nota de Credito &P193_NRO_NCREDITO.'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NCA.ID_NCREDITO_VENTA,',
'       NCA.FAC_ID_FACTURA_VENTA,',
'       NCA.FECHA_NCREDITO,',
'       NCA.ENT_ID_ENTIDAD,',
'       NCA.TIP_ID_TIPO_COMPROBANTE,',
'       NCA.TIM_ID_TIMBRADO,',
'       NCA.NRO_NCREDITO,',
'       NCA.MON_ID_MONEDA,',
'       NCA.TIPO_CAMBIO,',
'       NCA.MONTO,',
'       NCA.MOT_ID_MOTIVO,',
'       NCA.ESTADO,',
'       NCA.SUC_ID_SUCURSAL,',
'       NCA.RAZON_SOCIAL,',
'       NCA.TIP_ID_TIPO_DOCUMENTO,',
'       NCA.NUMERO_DOCUMENTO,',
'       NCA.USUARIO_REGISTRO,',
'       NCA.FECHA_REGISTRO',
'  FROM CAB_NCREDITO_VENTA NCA'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900193100)
,p_plug_name=>'Lineas de la Nota de Credito'
,p_region_name=>'REG_DET_NC'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT D.ID_DET_NCREDITO_VENTA,',
'       D.DET_ID_DET_FACTURA_VENTA,',
'       D.DESCRIPCION,',
'       D.CANTIDAD,',
'       D.PRECIO_UNITARIO,',
'       IV.DESCRIPCION AS IVA_DESC,',
'       D.EXENTO,',
'       D.GRAVADO,',
'       D.IVA,',
'       D.TOTAL',
'  FROM DET_NCREDITO_VENTA D,',
'       IVA IV',
' WHERE D.NCA_ID_NCREDITO_VENTA = :P193_ID_NCREDITO_VENTA',
'   AND IV.ID_IVA(+) = D.IVA_ID_IVA',
' ORDER BY D.ID_DET_NCREDITO_VENTA'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P193_ID_NCREDITO_VENTA'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P193_ID_NCREDITO_VENTA'
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
,p_plug_header=>'Lineas de la Nota de Credito'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(900193110)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:194:&SESSION.::&DEBUG.:194:P194_ID_DET_NCREDITO_VENTA,P194_NCA_ID_NCREDITO_VENTA,P194_FAC_ID_FACTURA_VENTA:#ID_DET_NCREDITO_VENTA#,&P193_ID_NCREDITO_VENTA.,&P193_FAC_ID_FACTURA_VENTA.'
,p_detail_link_text=>'<span class="t-Icon fa fa-pencil" aria-hidden="true"></span>'
,p_owner=>'KMELOT'
,p_internal_uid=>900193110
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900193111)
,p_db_column_name=>'ID_DET_NCREDITO_VENTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900193112)
,p_db_column_name=>'DET_ID_DET_FACTURA_VENTA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'ID Det Factura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900193113)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Descripcion'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900193114)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900193115)
,p_db_column_name=>'PRECIO_UNITARIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Precio Unit.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900193116)
,p_db_column_name=>'IVA_DESC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'IVA'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900193117)
,p_db_column_name=>'EXENTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Exento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900193118)
,p_db_column_name=>'GRAVADO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Gravado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900193119)
,p_db_column_name=>'IVA'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'IVA Gs.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900193120)
,p_db_column_name=>'TOTAL'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(900193130)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'9001931'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DESCRIPCION:CANTIDAD:PRECIO_UNITARIO:IVA_DESC:EXENTO:GRAVADO:IVA:TOTAL:'
,p_sum_columns_on_break=>'EXENTO:GRAVADO:IVA:TOTAL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900193150)
,p_plug_name=>'Lineas a incluir en la Nota de Credito'
,p_region_name=>'REG_COL_NEW_DET_NC'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>15
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''<a href="javascript:void(0)" onclick="eliminarColDet(''||AC.seq_id||'')" class="t-Button t-Button--danger t-Button--small" title="Eliminar">X</a>'' AS eliminar,',
'       (SELECT I.DESCRIPCION FROM IVA I WHERE I.ID_IVA = TO_NUMBER(AC.c005)) AS iva,',
'       AC.c002  AS descripcion,',
'       TO_NUMBER(AC.c003) AS cantidad,',
'       TO_NUMBER(AC.c004) AS precio_unit,',
'       TO_NUMBER(AC.c008) AS exento,',
'       TO_NUMBER(AC.c009) AS gravado,',
'       TO_NUMBER(AC.c010) AS iva_gs,',
'       TO_NUMBER(AC.c011) AS total',
'  FROM APEX_COLLECTIONS AC',
' WHERE AC.COLLECTION_NAME = ''NC_DETALLES_TEMP''',
' ORDER BY AC.seq_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P193_ID_NCREDITO_VENTA'
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
,p_plug_header=>'Lineas a incluir en la Nota de Credito'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(159688998971895905)
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
,p_internal_uid=>159688998971895905
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(159689087783895906)
,p_db_column_name=>'ELIMINAR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Eliminar'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(159689192564895907)
,p_db_column_name=>'IVA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Iva'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(159689284988895908)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(159691134216895927)
,p_db_column_name=>'IVA_GS'
,p_display_order=>100
,p_column_identifier=>'V'
,p_column_label=>'I.V.A.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(159691205052895928)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>110
,p_column_identifier=>'W'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(159691372959895929)
,p_db_column_name=>'PRECIO_UNIT'
,p_display_order=>120
,p_column_identifier=>'X'
,p_column_label=>'Precio Unit'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(159691464219895930)
,p_db_column_name=>'EXENTO'
,p_display_order=>130
,p_column_identifier=>'Y'
,p_column_label=>'Exento'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(159691594629895931)
,p_db_column_name=>'GRAVADO'
,p_display_order=>140
,p_column_identifier=>'Z'
,p_column_label=>'Gravado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(159691656559895932)
,p_db_column_name=>'TOTAL'
,p_display_order=>150
,p_column_identifier=>'AA'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(159767925758651271)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1597680'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ELIMINAR:IVA:DESCRIPCION:CANTIDAD:PRECIO_UNIT:EXENTO:GRAVADO:IVA_GS:TOTAL:'
,p_sum_columns_on_break=>'IVA_GS:EXENTO:GRAVADO:TOTAL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900193200)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900193700)
,p_plug_name=>unistr('Agregar L\00EDnea a Nota de Cr\00E9dito')
,p_region_name=>'REG_DET_NC_NEW'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900193304)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(900193001)
,p_button_name=>'VER_PDF'
,p_button_static_id=>'btn_ver_pdf_nc'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Ver PDF'
,p_button_position=>'CHANGE'
,p_button_condition=>':P193_ID_NCREDITO_VENTA IS NOT NULL'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900193301)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900193001)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:192:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900193720)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900193700)
,p_button_name=>'CERRAR_LINEA_NEW'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cerrar'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900193360)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900193001)
,p_button_name=>'BTN_AGREGAR_DET_TEMP'
,p_button_static_id=>'BTN_AGREGAR_DETALLE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Agregar linea'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P193_ID_NCREDITO_VENTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(159050059517445974)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900193721)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(900193700)
,p_button_name=>'GUARDAR_LINEA_NEW'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_security_scheme=>wwv_flow_imp.id(159050059517445974)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900193302)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(900193001)
,p_button_name=>'CREAR_NC'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'CREATE'
,p_button_condition=>':P193_ID_NCREDITO_VENTA IS NULL'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(159049648728446849)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900193303)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(900193001)
,p_button_name=>'ANULAR_NC'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Anular'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>unistr('\00BFConfirma anular esta nota de cr\00E9dito? Esta operaci\00F3n revertir\00E1 el saldo en la factura.')
,p_confirm_style=>'danger'
,p_button_condition=>':P193_ID_NCREDITO_VENTA IS NOT NULL AND :P193_ESTADO = ''ACTIVO'''
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(159049648728446849)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900193350)
,p_button_sequence=>5
,p_button_plug_id=>wwv_flow_imp.id(900193100)
,p_button_name=>'BTN_AGREGAR_LINEA'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar linea'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:194:&SESSION.::&DEBUG.:194:P194_ID_DET_NCREDITO_VENTA,P194_NCA_ID_NCREDITO_VENTA,P194_FAC_ID_FACTURA_VENTA:,&P193_ID_NCREDITO_VENTA.,&P193_FAC_ID_FACTURA_VENTA.'
,p_button_condition=>'P193_ID_NCREDITO_VENTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(159050059517445974)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(900193401)
,p_branch_name=>'Go To Page 193 after create'
,p_branch_action=>'f?p=&APP_ID.:193:&SESSION.::&DEBUG.::P193_ID_NCREDITO_VENTA:&P193_ID_NCREDITO_VENTA.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'CREAR_NC'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(900193402)
,p_branch_name=>'Go To Page 192 after anular'
,p_branch_action=>'f?p=&APP_ID.:192:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'ANULAR_NC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193501)
,p_name=>'P193_ID_NCREDITO_VENTA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_source=>'ID_NCREDITO_VENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193502)
,p_name=>'P193_FAC_ID_FACTURA_VENTA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_prompt=>'Factura'
,p_source=>'FAC_ID_FACTURA_VENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT Translate(To_Char(c.nro_factura, ''000G000G0000000''), '',.'', ''--'')|| '' - '' || c.razon_social || '' (Saldo: '' || Trim(To_Char(c.saldo, ''999G999G999G999G990'')) || '')'' AS display,',
'       c.id_factura_venta AS RETURN',
'FROM cab_factura_venta c',
'WHERE c.saldo > 0 ',
'AND c.estado = ''ACTIVO''',
'ORDER BY C.fecha_factura DESC, c.nro_factura DESC',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione factura -'
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193503)
,p_name=>'P193_SALDO_DISPONIBLE'
,p_item_sequence=>22
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_prompt=>'Saldo Disponible'
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
 p_id=>wwv_flow_imp.id(900193504)
,p_name=>'P193_NRO_NCREDITO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>72
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_prompt=>unistr('Nro. nota de cr\00E9dito')
,p_format_mask=>'999G999G9999999'
,p_source=>'NRO_NCREDITO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>17
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193505)
,p_name=>'P193_FECHA_NCREDITO'
,p_source_data_type=>'DATE'
,p_item_sequence=>42
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_prompt=>'Fecha'
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'FECHA_NCREDITO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(900193506)
,p_name=>'P193_TIP_ID_TIPO_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>52
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_prompt=>'Tipo comprobante'
,p_source=>'TIP_ID_TIPO_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DESCRIPCION AS display, ID_TIPO_COMPROBANTE AS return',
'  FROM TIPO_COMPROBANTE',
' WHERE ESTADO = ''ACTIVO''',
' AND DEVOLUCION = ''SI''',
' ORDER BY DESCRIPCION',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione -'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193507)
,p_name=>'P193_TIM_ID_TIMBRADO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>62
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_prompt=>'Timbrado'
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
'AND t.suc_id_sucursal         = :P193_SUC_ID_SUCURSAL',
'AND t.tip_id_tipo_comprobante = :P193_TIP_ID_TIPO_COMPROBANTE',
'AND t.nro_final               > t.nro_utilizado ',
'AND to_date(:P193_FECHA_NCREDITO,''DD-MM-YYYY'') BETWEEN trunc(t.fecha_inicio,''DD'') AND trunc(t.fecha_vencimiento,''DD'')',
'AND tc.id_tipo_comprobante   = t.tip_id_tipo_comprobante',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione -'
,p_lov_cascade_parent_items=>'P193_TIP_ID_TIPO_COMPROBANTE,P193_SUC_ID_SUCURSAL,P193_FECHA_NCREDITO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193508)
,p_name=>'P193_MOT_ID_MOTIVO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>82
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_prompt=>'Motivo'
,p_source=>'MOT_ID_MOTIVO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DESCRIPCION AS display, ID_MOTIVO AS return',
'  FROM MOTIVO_NCREDITO',
' WHERE ESTADO = ''ACTIVO''',
' ORDER BY DESCRIPCION'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione -'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193509)
,p_name=>'P193_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>102
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_item_default=>'1'
,p_prompt=>'Moneda'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione -'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193510)
,p_name=>'P193_TIPO_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>112
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_item_default=>'1'
,p_prompt=>'Tipo Cambio'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'TIPO_CAMBIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193511)
,p_name=>'P193_MONTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>122
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_prompt=>'Monto Total NC'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'MONTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(900193512)
,p_name=>'P193_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>32
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
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
 p_id=>wwv_flow_imp.id(900193513)
,p_name=>'P193_RAZON_SOCIAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>142
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_source=>'RAZON_SOCIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193514)
,p_name=>'P193_USUARIO_REGISTRO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>152
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_source=>'USUARIO_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193515)
,p_name=>'P193_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>162
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_source=>'ENT_ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193516)
,p_name=>'P193_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>92
,p_item_plug_id=>wwv_flow_imp.id(900193001)
,p_item_source_plug_id=>wwv_flow_imp.id(900193001)
,p_item_default=>'APP_ID_SUCURSAL'
,p_item_default_type=>'ITEM'
,p_prompt=>'Sucursal'
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SUCURSAL'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione -'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193701)
,p_name=>'P193_NEW_DET_ID_DET_FACTURA_VENTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(900193700)
,p_prompt=>unistr('L\00EDnea de factura')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUBSTR(D.DESCRIPCION, 1, 60) ||',
'       '' (Disponible: '' || TRIM(TO_CHAR(PKG_NCREDITO_VENTA.F_DISPONIBLE_DET_FAC(D.ID_DET_FACTURA_VENTA), ''999G999G999G999G990D00'')) || '')'' AS display,',
'       D.ID_DET_FACTURA_VENTA AS return',
'  FROM DET_FACTURA_VENTA D',
' WHERE D.FAC_ID_FACTURA_VENTA = :P193_FAC_ID_FACTURA_VENTA',
' ORDER BY D.ID_DET_FACTURA_VENTA'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>unistr('- Seleccione l\00EDnea -')
,p_lov_cascade_parent_items=>'P193_FAC_ID_FACTURA_VENTA'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>9
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193702)
,p_name=>'P193_NEW_DISPONIBLE'
,p_item_sequence=>22
,p_item_plug_id=>wwv_flow_imp.id(900193700)
,p_prompt=>'Disponible'
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(900193703)
,p_name=>'P193_NEW_PRO_ID_PRODUCTO'
,p_item_sequence=>25
,p_item_plug_id=>wwv_flow_imp.id(900193700)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193704)
,p_name=>'P193_NEW_DESCRIPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(900193700)
,p_prompt=>unistr('Descripci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>2000
,p_cHeight=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193705)
,p_name=>'P193_NEW_IVA_ID_IVA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(900193700)
,p_prompt=>'I.V.A.'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DESCRIPCION AS display, ID_IVA AS return',
'  FROM IVA',
' ORDER BY DESCRIPCION'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione -'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193706)
,p_name=>'P193_NEW_UNI_ID_UNIDAD_MEDIDA'
,p_item_sequence=>42
,p_item_plug_id=>wwv_flow_imp.id(900193700)
,p_prompt=>'Unidad'
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
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193707)
,p_name=>'P193_NEW_CANTIDAD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(900193700)
,p_prompt=>'Cantidad'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193708)
,p_name=>'P193_NEW_PRECIO_UNITARIO'
,p_item_sequence=>52
,p_item_plug_id=>wwv_flow_imp.id(900193700)
,p_prompt=>'Precio unitario'
,p_format_mask=>'999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193709)
,p_name=>'P193_NEW_PORC_DESCUENTO'
,p_item_sequence=>54
,p_item_plug_id=>wwv_flow_imp.id(900193700)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193710)
,p_name=>'P193_NEW_MONTO_DESCUENTO'
,p_item_sequence=>56
,p_item_plug_id=>wwv_flow_imp.id(900193700)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193711)
,p_name=>'P193_NEW_EXENTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(900193700)
,p_prompt=>'Exento'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
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
 p_id=>wwv_flow_imp.id(900193712)
,p_name=>'P193_NEW_GRAVADO'
,p_item_sequence=>62
,p_item_plug_id=>wwv_flow_imp.id(900193700)
,p_prompt=>'Gravado'
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(900193713)
,p_name=>'P193_NEW_IVA'
,p_item_sequence=>64
,p_item_plug_id=>wwv_flow_imp.id(900193700)
,p_prompt=>'IVA'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900193714)
,p_name=>'P193_NEW_TOTAL'
,p_item_sequence=>66
,p_item_plug_id=>wwv_flow_imp.id(900193700)
,p_prompt=>'Total'
,p_format_mask=>'999G999G999G999G990D00'
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
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(900193710)
,p_validation_name=>'Det requerido'
,p_validation_sequence=>20
,p_validation=>'RETURN APEX_COLLECTION.COLLECTION_MEMBER_COUNT(''NC_DETALLES_TEMP'') > 0;'
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Debe agregar al menos una l\00EDnea de detalle para crear la Nota de Cr\00E9dito.')
,p_validation_condition=>'CREAR_NC'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_imp.id(900193150)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900193620)
,p_name=>'Buscar timbrado'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P193_TIM_ID_TIMBRADO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900193621)
,p_event_id=>wwv_flow_imp.id(900193620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buscarNroNC();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900193630)
,p_name=>'Ir a fecha'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P193_FAC_ID_FACTURA_VENTA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900193631)
,p_event_id=>wwv_flow_imp.id(900193630)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P193_FECHA_NCREDITO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900193640)
,p_name=>'Ir a'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900193641)
,p_event_id=>wwv_flow_imp.id(900193640)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P193_FAC_ID_FACTURA_VENTA'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900193600)
,p_name=>'DA_REFRESH_IR_DIALOG_CLOSED'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(900193100)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900193601)
,p_event_id=>wwv_flow_imp.id(900193600)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(900193100)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900193610)
,p_name=>'DA_VER_PDF_NC'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(900193304)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900193611)
,p_event_id=>wwv_flow_imp.id(900193610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'urlVerPDF();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900193730)
,p_name=>'Abrir dialog nueva linea'
,p_event_sequence=>300
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(900193360)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900193731)
,p_event_id=>wwv_flow_imp.id(900193730)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'abrirLineaNCNew();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900193740)
,p_name=>'Cambio linea factura'
,p_event_sequence=>310
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P193_NEW_DET_ID_DET_FACTURA_VENTA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900193741)
,p_event_id=>wwv_flow_imp.id(900193740)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'cambioLineaNCNew();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900193750)
,p_name=>'Calcular totales nueva linea'
,p_event_sequence=>320
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#P193_NEW_CANTIDAD,#P193_NEW_PRECIO_UNITARIO,#P193_NEW_IVA_ID_IVA,#P193_NEW_PORC_DESCUENTO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900193751)
,p_event_id=>wwv_flow_imp.id(900193750)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calcularTotalesNCNew();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900193760)
,p_name=>'Guardar linea NC'
,p_event_sequence=>330
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(900193721)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900193761)
,p_event_id=>wwv_flow_imp.id(900193760)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'guardarLineaNCNew();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900193770)
,p_name=>'Cerrar dialog nueva linea'
,p_event_sequence=>340
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(900193720)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900193771)
,p_event_id=>wwv_flow_imp.id(900193770)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.theme.closeRegion("REG_DET_NC_NEW");'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900193810)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Crear Nota de Credito'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_id NUMBER;',
'BEGIN',
'  PKG_NCREDITO_VENTA.P_GUARDAR_NCREDITO(',
'    p_fac_id_factura_venta    => :P193_FAC_ID_FACTURA_VENTA,',
'    p_fecha_ncredito          => TO_DATE(:P193_FECHA_NCREDITO, ''DD-MM-YYYY''),',
'    p_tip_id_tipo_comprobante => :P193_TIP_ID_TIPO_COMPROBANTE,',
'    p_tim_id_timbrado         => :P193_TIM_ID_TIMBRADO,',
'    p_nro_ncredito            => TO_NUMBER(:P193_NRO_NCREDITO,''999G999G9999999''),',
'    p_mot_id_motivo           => :P193_MOT_ID_MOTIVO,',
'    p_suc_id_sucursal         => :P193_SUC_ID_SUCURSAL,',
'    p_mon_id_moneda           => :P193_MON_ID_MONEDA,',
'    p_tipo_cambio             => :P193_TIPO_CAMBIO,',
'    p_id_ncredito_out         => v_id',
'  );',
'  :P193_ID_NCREDITO_VENTA := v_id;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREAR_NC'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Nota de credito creada correctamente.'
,p_internal_uid=>900193810
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900193820)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Anular Nota de Credito'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  PKG_NCREDITO_VENTA.P_ANULAR_NCREDITO(:P193_ID_NCREDITO_VENTA);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ANULAR_NC'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Nota de credito anulada. Saldo de factura restaurado.'
,p_internal_uid=>900193820
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900193801)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(900193001)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form CAB_NCREDITO_VENTA'
,p_internal_uid=>900193801
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900193802)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicializar valores por defecto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  IF :P193_ID_NCREDITO_VENTA IS NULL THEN',
'    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''NC_DETALLES_TEMP'');',
'    :P193_FECHA_NCREDITO := TO_CHAR(SYSDATE, ''DD-MM-YYYY'');',
'    :P193_ESTADO := ''ACTIVO'';',
'    :P193_TIPO_CAMBIO := 1;',
'    :P193_MON_ID_MONEDA := 1;',
'    :P193_SALDO_DISPONIBLE := NULL;',
'    :P193_MON_ID_MONEDA := NULL;',
'    :P193_TIPO_CAMBIO := NULL;',
'    :P193_MONTO := NULL;',
'  END IF;',
'  IF :P193_FAC_ID_FACTURA_VENTA IS NOT NULL THEN',
'    BEGIN',
'      SELECT TO_CHAR(F.SALDO, ''999G999G990D00''),',
'             F.MON_ID_MONEDA,',
'             F.TIPO_CAMBIO',
'      INTO :P193_SALDO_DISPONIBLE,',
'           :P193_MON_ID_MONEDA,',
'           :P193_TIPO_CAMBIO',
'      FROM CAB_FACTURA_VENTA F',
'      WHERE F.ID_FACTURA_VENTA = :P193_FAC_ID_FACTURA_VENTA;',
'    EXCEPTION WHEN NO_DATA_FOUND THEN NULL;',
'    END;',
'  END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900193802
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900193780)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar_det_factura_193'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_det_fac_id  NUMBER := TO_NUMBER(APEX_APPLICATION.G_X01);',
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
'  v_disponible := PKG_NCREDITO_VENTA.F_DISPONIBLE_DET_FAC(v_det_fac_id);',
'',
'  APEX_JSON.OPEN_OBJECT;',
'  APEX_JSON.WRITE(''success'', TRUE);',
'  APEX_JSON.OPEN_ARRAY(''items'');',
'  out_item(''P193_NEW_PRO_ID_PRODUCTO'', TO_CHAR(v_pro_id));',
'  out_item(''P193_NEW_DESCRIPCION'', v_desc);',
'  out_item(''P193_NEW_IVA_ID_IVA'', TO_CHAR(v_iva_id));',
'  out_item(''P193_NEW_UNI_ID_UNIDAD_MEDIDA'', TO_CHAR(v_uni_id));',
'  out_item(''P193_NEW_PRECIO_UNITARIO'', TO_CHAR(v_precio));',
'  out_item(''P193_NEW_CANTIDAD'', TO_CHAR(v_cant));',
'  out_item(''P193_NEW_DISPONIBLE'', TO_CHAR(v_disponible, ''999G999G990D00''));',
'  APEX_JSON.CLOSE_ARRAY;',
'  APEX_JSON.CLOSE_OBJECT;',
'EXCEPTION WHEN OTHERS THEN',
'  APEX_JSON.OPEN_OBJECT;',
'  APEX_JSON.WRITE(''success'', FALSE);',
'  APEX_JSON.WRITE(''message'', UTL_CALL_STACK.ERROR_MSG(1));',
'  APEX_JSON.CLOSE_OBJECT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900193780
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900193781)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'calcular_montos_193'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_iva_id      NUMBER := TO_NUMBER(APEX_APPLICATION.G_X01);',
'  v_neto        NUMBER := TO_NUMBER(REPLACE(APEX_APPLICATION.G_X02, '','', ''''));',
'  v_porc_iva    NUMBER := 0;',
'  v_porc_grav   NUMBER := 0;',
'  v_exento      NUMBER := 0;',
'  v_gravado     NUMBER := 0;',
'  v_iva_monto   NUMBER := 0;',
'  v_total       NUMBER := 0;',
'  PROCEDURE out_item(p_id IN VARCHAR2, p_val IN VARCHAR2) AS',
'  BEGIN',
'    APEX_JSON.OPEN_OBJECT;',
'    APEX_JSON.WRITE(''id'', p_id);',
'    APEX_JSON.WRITE(''value'', p_val, TRUE);',
'    APEX_JSON.CLOSE_OBJECT;',
'  END;',
'BEGIN',
'  IF v_iva_id IS NOT NULL THEN',
'    SELECT NVL(PORC_IMPUESTO,0), NVL(PORC_GRAVADO,0)',
'    INTO v_porc_iva, v_porc_grav',
'    FROM IVA WHERE ID_IVA = v_iva_id;',
'  END IF;',
'  v_total   := NVL(v_neto, 0);',
'  v_gravado := ROUND(v_total * v_porc_grav / 100);',
'  v_exento  := v_total - v_gravado;',
'  v_iva_monto := CASE WHEN v_porc_iva > 0',
'                 THEN ROUND(v_gravado * v_porc_iva / (100 + v_porc_iva))',
'                 ELSE 0 END;',
'  APEX_JSON.OPEN_OBJECT;',
'  APEX_JSON.WRITE(''success'', TRUE);',
'  APEX_JSON.OPEN_ARRAY(''items'');',
'  out_item(''P193_NEW_EXENTO'',  TO_CHAR(v_exento));',
'  out_item(''P193_NEW_GRAVADO'', TO_CHAR(v_gravado));',
'  out_item(''P193_NEW_IVA'',     TO_CHAR(v_iva_monto));',
'  out_item(''P193_NEW_TOTAL'',   TO_CHAR(v_total));',
'  APEX_JSON.CLOSE_ARRAY;',
'  APEX_JSON.CLOSE_OBJECT;',
'EXCEPTION WHEN OTHERS THEN',
'  APEX_JSON.OPEN_OBJECT;',
'  APEX_JSON.WRITE(''success'', FALSE);',
'  APEX_JSON.WRITE(''message'', UTL_CALL_STACK.ERROR_MSG(1));',
'  APEX_JSON.CLOSE_OBJECT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900193781
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900193782)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'agregar_linea_nc'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_cant      NUMBER := TO_NUMBER(:P193_NEW_CANTIDAD, ''999g999'');',
'  v_precio    NUMBER := TO_NUMBER(:P193_NEW_PRECIO_UNITARIO, ''999g999g999g999d99'');',
'  v_porcDesc  NUMBER := NVL(TO_NUMBER(:P193_NEW_PORC_DESCUENTO,''999g999g999g999d99''), 0);',
'  v_subtotal  NUMBER;',
'  v_descuento NUMBER;',
'  v_neto      NUMBER;',
'  v_porc_iva  NUMBER := 0;',
'  v_porc_grav NUMBER := 0;',
'  v_exento    NUMBER := 0;',
'  v_gravado   NUMBER := 0;',
'  v_iva       NUMBER := 0;',
'  v_total     NUMBER := 0;',
'  v_mdesc     NUMBER := 0;',
'PROCEDURE output_json_item (',
'          p_item_name  IN VARCHAR2',
'        , p_item_value IN VARCHAR2)',
'    AS',
'    BEGIN',
'        apex_json.open_object;',
'        apex_json.write(''id''    , p_item_name);',
'        apex_json.write(''value'' , p_item_value, TRUE);',
'        apex_json.close_object;',
'    END output_json_item;',
'BEGIN',
'  v_subtotal  := v_cant * v_precio;',
'  v_descuento := ROUND(v_subtotal * v_porcDesc / 100);',
'  v_neto      := v_subtotal - v_descuento;',
'  IF :P193_NEW_IVA_ID_IVA IS NOT NULL THEN',
'    SELECT NVL(PORC_IMPUESTO,0), NVL(PORC_GRAVADO,0)',
'    INTO v_porc_iva, v_porc_grav',
'    FROM IVA WHERE ID_IVA = :P193_NEW_IVA_ID_IVA;',
'  END IF;',
'  v_total   := NVL(v_neto,0);',
'  v_gravado := ROUND(v_total * v_porc_grav / 100);',
'  v_exento  := v_total - v_gravado;',
'  v_iva     := CASE WHEN v_porc_iva > 0',
'               THEN ROUND(v_gravado * v_porc_iva / (100 + v_porc_iva))',
'               ELSE 0 END;',
'  v_mdesc   := v_descuento;',
'  IF NOT APEX_COLLECTION.COLLECTION_EXISTS(''NC_DETALLES_TEMP'') THEN',
'    APEX_COLLECTION.CREATE_COLLECTION(''NC_DETALLES_TEMP'');',
'  END IF;',
'  APEX_COLLECTION.ADD_MEMBER(',
'    p_collection_name => ''NC_DETALLES_TEMP'',',
'    p_c001 => :P193_NEW_DET_ID_DET_FACTURA_VENTA,',
'    p_c002 => :P193_NEW_DESCRIPCION,',
'    p_c003 => TO_CHAR(v_cant),',
'    p_c004 => TO_CHAR(v_precio),',
'    p_c005 => :P193_NEW_IVA_ID_IVA,',
'    p_c006 => :P193_NEW_UNI_ID_UNIDAD_MEDIDA,',
'    p_c007 => TO_CHAR(v_porcDesc),',
'    p_c008 => TO_CHAR(v_exento),',
'    p_c009 => TO_CHAR(v_gravado),',
'    p_c010 => TO_CHAR(v_iva),',
'    p_c011 => TO_CHAR(v_total),',
'    p_c012 => :P193_NEW_PRO_ID_PRODUCTO,',
'    p_c013 => TO_CHAR(v_mdesc)',
'  );',
'  ',
'  SELECT SUM(TO_NUMBER(C011))',
'  INTO :P193_MONTO',
'  FROM APEX_COLLECTIONS',
'  WHERE COLLECTION_NAME = ''NC_DETALLES_TEMP'';',
'',
'  APEX_JSON.OPEN_OBJECT;',
'  APEX_JSON.WRITE(''success'', TRUE);',
'  apex_json.open_array(''items'');',
'  output_json_item(''P193_MONTO'', :P193_MONTO);',
'  apex_json.close_array;',
'  APEX_JSON.CLOSE_OBJECT;',
'',
'EXCEPTION WHEN OTHERS THEN',
'  APEX_JSON.OPEN_OBJECT;',
'  APEX_JSON.WRITE(''success'', FALSE);',
'  APEX_JSON.WRITE(''message'', UTL_CALL_STACK.ERROR_MSG(1));',
'  APEX_JSON.CLOSE_OBJECT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900193782
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900193901)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ver_pdf_nc'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  vl_vNomReporte VARCHAR2(255);',
'  vl_empresa     PARAMETROS.NOMBRE%TYPE;',
'BEGIN',
'  SELECT NOMBRE INTO vl_empresa FROM PARAMETROS;',
'  vl_vNomReporte := ''NOTA_CREDITO_VENTA'';',
'  PKG_JASPERREPORTS_SERVER.DESCARGA_REPORTE(',
'    p_vNomReporte => vl_vNomReporte,',
'    p_aNomParams  => APEX_UTIL.STRING_TO_TABLE(''P_ID_NCREDITO_VENTA:P_USUARIO:P_EMPRESA''),',
'    p_aValParams  => APEX_UTIL.STRING_TO_TABLE(APEX_APPLICATION.G_X01||'':''||:APP_USER||'':''||vl_empresa)',
'  );',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900193901
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900193910)
,p_process_sequence=>100
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'eliminar_col_det'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''NC_DETALLES_TEMP'',',
'        p_seq             => TO_NUMBER(APEX_APPLICATION.G_X01)',
'    );',
'    APEX_JSON.OPEN_OBJECT;',
'    APEX_JSON.WRITE(''success'', TRUE);',
'    APEX_JSON.CLOSE_OBJECT;',
'    EXCEPTION ',
'    WHEN OTHERS THEN',
'        APEX_JSON.OPEN_OBJECT;',
'        APEX_JSON.WRITE(''success'', FALSE);',
'        APEX_JSON.WRITE(''message'', UTL_CALL_STACK.ERROR_MSG(1));',
'        APEX_JSON.CLOSE_OBJECT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900193910
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(150130240303328339)
,p_process_sequence=>100
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'buscar_nro_nc'
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
'        pi_tim_id_timbrado => :P193_TIM_ID_TIMBRADO',
'      , pi_suc_id_sucursal => :P193_SUC_ID_SUCURSAL',
'      , pi_tip_id_tipo_comprobante => :P193_TIP_ID_TIPO_COMPROBANTE',
'      , pi_usuario => :APP_USER',
'      , pi_fecha_factura => :P193_FECHA_NCREDITO',
'      , po_nro_factura => :P193_NRO_NCREDITO);',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P193_NRO_NCREDITO'', :P193_NRO_NCREDITO);',
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
,p_internal_uid=>150130240303328339
);
wwv_flow_imp.component_end;
end;
/
