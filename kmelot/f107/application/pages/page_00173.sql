prompt --application/pages/page_00173
begin
--   Manifest
--     PAGE: 00173
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
 p_id=>173
,p_name=>unistr('Detalle de orden de producci\00F3n')
,p_alias=>unistr('DETALLE-DE-ORDEN-DE-PRODUCCI\00D3N')
,p_step_title=>unistr('Detalle de orden de producci\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#mascara_fecha_hora#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buscar_producto_final() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors();',
'    apex.server.process("producto_final", {',
'        pageItems: ["P173_REC_ID_RECETA"]',
'    },{',
'        success: function (data) {',
'            if (data.success === true) {',
'                for (var i = 0; i < data.items.length; i++) {',
'                    apex.item(data.items[i].id).setValue(data.items[i].value);',
'                }',
'            } else {',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: "page",',
'                    message: data.message,',
'                    unsafe: false',
'                }]);',
'            }',
'        }',
'    }).always(function () {',
'        waitPopup.remove();',
'    });',
'}',
'',
'function urlVerPDF(){',
'    apex.navigation.openInNewWindow(',
'        apex.server.url( {',
'            p_request: "application_process=ver_pdf",',
'            x01: apex.item("P173_ID_ORDEN_PROD").getValue()',
'        })',
'    );',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'mascaraFechaHoraRegex("#P173_FECHA_INICIO_EST");',
'mascaraFechaHoraRegex("#P173_FECHA_FIN_REAL");',
'mascaraFechaHoraRegex("#P173_FECHA_ORDEN");',
'',
'if (apex.item("P173_ID_ORDEN_PROD").isEmpty()) {',
'    setTimeout(function(){',
'        apex.item("P173_FECHA_ORDEN").setFocus();',
'    },250);',
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}',
'.t-Region-body {',
'    padding-bottom: 0px;',
'}',
'.apex_disabled {',
'    opacity: 65%!important;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(157141760771806441)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168809557115983170)
,p_plug_name=>unistr('Pesta\00F1as')
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>8
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'SESSION')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800173300)
,p_plug_name=>'Entregas'
,p_region_name=>'REG_ENTREGAS'
,p_parent_plug_id=>wwv_flow_imp.id(168809557115983170)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>35
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT c.ID_ENTREGA_INSUMO,',
'       c.NRO_REMISION,',
'       c.FECHA_ENTREGA,',
'       c.OBSERVACION,',
'       c.USUARIO_REGISTRO,',
'       (SELECT COUNT(*) FROM DET_ENTREGA_INSUMO d',
'        WHERE d.ENT_ID_ENTREGA_INSUMO = c.ID_ENTREGA_INSUMO) AS CANT_ITEMS',
'FROM CAB_ENTREGA_INSUMO c',
'WHERE c.ORD_ID_ORDEN_PROD = :P173_ID_ORDEN_PROD',
'ORDER BY c.FECHA_ENTREGA DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P173_ID_ORDEN_PROD'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P173_ID_ORDEN_PROD'
,p_prn_content_disposition=>'ATTACHMENT'
,p_plug_header=>'Entregas de insumos al productor'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(800173301)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:186:&SESSION.::&DEBUG.:RP,186:P186_ID_ENTREGA_INSUMO,P186_ORD_ID_ORDEN_PROD:#ID_ENTREGA_INSUMO#,&P173_ID_ORDEN_PROD.'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'KMELOT'
,p_internal_uid=>800173301
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800173310)
,p_db_column_name=>'ID_ENTREGA_INSUMO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800173311)
,p_db_column_name=>'NRO_REMISION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Nro. Remisi\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800173312)
,p_db_column_name=>'FECHA_ENTREGA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha entrega'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800173313)
,p_db_column_name=>'OBSERVACION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800173314)
,p_db_column_name=>'USUARIO_REGISTRO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800173315)
,p_db_column_name=>'CANT_ITEMS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Cant. Items'
,p_column_type=>'NUMBER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(800173320)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'RPT_ENTREGAS'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NRO_REMISION:FECHA_ENTREGA:OBSERVACION:USUARIO_REGISTRO:CANT_ITEMS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900173400)
,p_plug_name=>'Recepciones'
,p_region_name=>'REG_RECEPCIONES'
,p_parent_plug_id=>wwv_flow_imp.id(168809557115983170)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>36
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT r.ID_RECEPCION_PROD,',
'       r.NRO_RECEPCION,',
'       r.FECHA_RECEPCION,',
'       r.HORA_RECEPCION,',
'       d.CANTIDAD,',
'       d.PRECIO_UNITARIO,',
'       r.ESTADO,',
'       r.FACTURADO,',
'       pt.TAMANHO,',
'       (d.CANTIDAD * d.PRECIO_UNITARIO) AS costo',
'FROM cab_recepcion_producto r',
'    ,det_recepcion_producto d',
'    ,orden_produccion_tamanho ot',
'    ,receta_produccion_tamanho rp',
'    ,producto_tamanho pt',
'WHERE r.ORD_ID_ORDEN_PROD = :P173_ID_ORDEN_PROD',
'AND r.ESTADO = ''ACTIVO''',
'AND d.REC_ID_RECEPCION_PROD(+) = r.ID_RECEPCION_PROD',
'AND ot.id_ord_prod_tam = d.opt_id_ord_prod_tam',
'AND rp.id_tamanho_receta = ot.tam_id_tamanho_receta',
'AND pt.id_tamanho(+) = rp.tam_id_tamanho',
'ORDER BY r.FECHA_RECEPCION DESC',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P173_ID_ORDEN_PROD'
,p_prn_output=>'N'
,p_plug_header=>'Recepciones de producto terminado'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(900173401)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:188:&SESSION.::&DEBUG.:RP,188:P188_ID_RECEPCION_PROD,P188_ORD_ID_ORDEN_PROD,P188_P_ORIGEN:#ID_RECEPCION_PROD#,&P173_ID_ORDEN_PROD.,173'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'KMELOT'
,p_internal_uid=>900173401
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900173410)
,p_db_column_name=>'ID_RECEPCION_PROD'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900173411)
,p_db_column_name=>'NRO_RECEPCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nro Recepcion'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900173412)
,p_db_column_name=>'FECHA_RECEPCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900173413)
,p_db_column_name=>'HORA_RECEPCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Hora'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900173414)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900173415)
,p_db_column_name=>'PRECIO_UNITARIO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Precio Unit.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900173417)
,p_db_column_name=>'ESTADO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900173418)
,p_db_column_name=>'FACTURADO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Facturado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(150127646829328313)
,p_db_column_name=>'TAMANHO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Tama\00F1o')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(150127722171328314)
,p_db_column_name=>'COSTO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Costo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(900173430)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'REC_OP_RPT'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NRO_RECEPCION:FECHA_RECEPCION:HORA_RECEPCION:TAMANHO:CANTIDAD:PRECIO_UNITARIO:ESTADO:FACTURADO:COSTO:'
,p_sort_column_1=>'FECHA_RECEPCION'
,p_sort_direction_1=>'DESC'
,p_sum_columns_on_break=>'CANTIDAD:COSTO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(119233526371829338)
,p_plug_name=>unistr('Tama\00F1os a producir')
,p_region_name=>'REG_TAMANHOS'
,p_parent_plug_id=>wwv_flow_imp.id(168809557115983170)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT opt.ID_ORD_PROD_TAM,',
'       opt.ORD_ID_ORDEN_PROD,',
'       opt.TAM_ID_TAMANHO_RECETA,',
'       opt.CANTIDAD',
'  FROM ORDEN_PRODUCCION_TAMANHO opt',
' WHERE opt.ORD_ID_ORDEN_PROD = :P173_ID_ORDEN_PROD'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P173_ID_ORDEN_PROD'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P173_ID_ORDEN_PROD'
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
,p_plug_header=>unistr('Tama\00F1os a producir')
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(119233526371829340)
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
 p_id=>wwv_flow_imp.id(119233526371829341)
,p_name=>'ID_ORD_PROD_TAM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORD_PROD_TAM'
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
 p_id=>wwv_flow_imp.id(119233526371829342)
,p_name=>'ORD_ID_ORDEN_PROD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORD_ID_ORDEN_PROD'
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
,p_default_expression=>'P173_ID_ORDEN_PROD'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(119233526371829343)
,p_name=>'TAM_ID_TAMANHO_RECETA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAM_ID_TAMANHO_RECETA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Tama\00F1o')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT pt.tamanho AS d',
'      ,rpt.id_tamanho_receta AS r',
'FROM receta_produccion_tamanho rpt',
'    ,producto_tamanho pt',
'WHERE rpt.rec_id_receta = :P173_REC_ID_RECETA',
'AND pt.id_tamanho = rpt.tam_id_tamanho',
'AND pt.estado = ''ACTIVO'''))
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(119233526371829345)
,p_name=>'CANTIDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(119233526371829346)
,p_internal_uid=>800173208
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_add_authorization_scheme=>wwv_flow_imp.id(157142358551804586)
,p_update_authorization_scheme=>wwv_flow_imp.id(157142029546805403)
,p_delete_authorization_scheme=>wwv_flow_imp.id(157142765293803734)
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_no_data_found_message=>unistr('Sin tama\00F1os cargados. Presione "Cargar insumos" para pre-cargar los tama\00F1os de la receta.')
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_imp.id(119233526371829347)
,p_interactive_grid_id=>wwv_flow_imp.id(119233526371829346)
,p_static_id=>'RPT_TAMANHOS'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(119233526371829368)
,p_report_id=>wwv_flow_imp.id(119233526371829347)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(119233526371829358)
,p_view_id=>wwv_flow_imp.id(119233526371829368)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(119233526371829340)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(119233526371829359)
,p_view_id=>wwv_flow_imp.id(119233526371829368)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(119233526371829341)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(119233526371829360)
,p_view_id=>wwv_flow_imp.id(119233526371829368)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(119233526371829342)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(119233526371829361)
,p_view_id=>wwv_flow_imp.id(119233526371829368)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(119233526371829343)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(119233526371829362)
,p_view_id=>wwv_flow_imp.id(119233526371829368)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(119233526371829345)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168712009180239768)
,p_plug_name=>'Detalle de costo operativo'
,p_region_name=>'REG_DETALLE_COSTO_OP'
,p_parent_plug_id=>wwv_flow_imp.id(168809557115983170)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_DET_ORDEN_OPE,',
'       ORP_ID_ORDEN_PROD,',
'       DESCRIPCION,',
'       TIPO_COSTO,',
'       COSTO_REAL_TOTAL,',
'       ES_MANO_OBRA_PROD',
'  from DET_ORDEN_PRODUCCION_OPE',
' where ORP_ID_ORDEN_PROD = :P173_ID_ORDEN_PROD'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P173_ID_ORDEN_PROD'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P173_ID_ORDEN_PROD'
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
,p_plug_header=>'Detalle de costo operativo'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(125071696336857708)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(125071755795857709)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168712217220239770)
,p_name=>'ID_DET_ORDEN_OPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DET_ORDEN_OPE'
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
 p_id=>wwv_flow_imp.id(168712322294239771)
,p_name=>'ORP_ID_ORDEN_PROD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORP_ID_ORDEN_PROD'
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
 p_id=>wwv_flow_imp.id(168712394440239772)
,p_name=>'DESCRIPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPCION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
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
 p_id=>wwv_flow_imp.id(168712495368239773)
,p_name=>'TIPO_COSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_COSTO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo costo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(168820302182073516)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(168712571521239774)
,p_name=>'COSTO_REAL_TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COSTO_REAL_TOTAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Costo real total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(168712571521239775)
,p_name=>'ES_MANO_OBRA_PROD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ES_MANO_OBRA_PROD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Mano Obra Prod.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:SI;S,NO;N'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(168712065157239769)
,p_internal_uid=>49478539585583631
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
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(171390584310156382)
,p_interactive_grid_id=>wwv_flow_imp.id(168712065157239769)
,p_static_id=>'521571'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(171390816928156383)
,p_report_id=>wwv_flow_imp.id(171390584310156382)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(154069999999)
,p_view_id=>wwv_flow_imp.id(171390816928156383)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(168712571521239775)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(125295241404630098)
,p_view_id=>wwv_flow_imp.id(171390816928156383)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(125071696336857708)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(171391259708156387)
,p_view_id=>wwv_flow_imp.id(171390816928156383)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(168712217220239770)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(171392155630156390)
,p_view_id=>wwv_flow_imp.id(171390816928156383)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(168712322294239771)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(171393086534156391)
,p_view_id=>wwv_flow_imp.id(171390816928156383)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(168712394440239772)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(171393933392156392)
,p_view_id=>wwv_flow_imp.id(171390816928156383)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(168712495368239773)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(171394827879156394)
,p_view_id=>wwv_flow_imp.id(171390816928156383)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(168712571521239774)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(170382774003772779)
,p_plug_name=>unistr('Orden de producci\00F3n &P173_NRO_ORDEN.')
,p_parent_plug_id=>wwv_flow_imp.id(168809557115983170)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_ORDEN_PROD,',
'       NRO_ORDEN,',
'       FECHA_ORDEN,',
'       FECHA_INICIO_EST,',
'       FECHA_FIN_REAL,',
'       SUC_ID_SUCURSAL,',
'       DEP_ID_DEPOSITO_ORIG,',
'       DEP_ID_DEPOSITO_DEST,',
'       REC_ID_RECETA,',
'       PRO_ID_PRODUCTO_FIN,',
'       CANTIDAD_A_PRODUCIR,',
'       COSTO_TOTAL_ESTIMADO,',
'       COSTO_TOTAL_REAL,',
'       ESTADO,',
'       OBSERVACION,',
'       USUARIO_REGISTRO,',
'       FECHA_REGISTRO,',
'       LIC_ID_LICITACION,',
'       DET_ID_DET_LICITACION,',
'       ENT_ID_ENTIDAD_PRODUCTOR,',
'       SEXO,',
'       TIP_ID_TIPO_LOGO',
'  from CAB_ORDEN_PRODUCCION'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168710127972239750)
,p_plug_name=>'Ocultar'
,p_title=>'Obs. y datos'
,p_parent_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:t-Region--hideShowIconsMath:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168709231474239741)
,p_plug_name=>'Sub region A'
,p_parent_plug_id=>wwv_flow_imp.id(168710127972239750)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168709332094239742)
,p_plug_name=>'Sub region B'
,p_parent_plug_id=>wwv_flow_imp.id(168710127972239750)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(170411354091773072)
,p_plug_name=>unistr('Insumos para producci\00F3n')
,p_region_name=>'REG_DETALLE_OP'
,p_parent_plug_id=>wwv_flow_imp.id(168809557115983170)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_DET_ORDEN_MAT,',
'       ORD_ID_ORDEN_PROD,',
'       PRO_ID_PRODUCTO_MAT,',
'       UNI_ID_UNIDAD_MEDIDA,',
'       CANTIDAD_ESTIMADA,',
'       CANTIDAD_REAL_CONSUMIDA,',
'       COSTO_UNITARIO,',
'       COSTO_TOTAL',
'  from DET_ORDEN_PRODUCCION_MAT',
' where ORD_ID_ORDEN_PROD = :P173_ID_ORDEN_PROD'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P173_ID_ORDEN_PROD'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P173_ID_ORDEN_PROD'
,p_prn_page_header=>unistr('Insumos para producci\00F3n')
,p_plug_header=>unistr('Insumos para producci\00F3n')
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(170412600036773075)
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
 p_id=>wwv_flow_imp.id(170413082054773076)
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
 p_id=>wwv_flow_imp.id(170414078568773077)
,p_name=>'ID_DET_ORDEN_MAT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DET_ORDEN_MAT'
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
 p_id=>wwv_flow_imp.id(170415123244773078)
,p_name=>'ORD_ID_ORDEN_PROD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORD_ID_ORDEN_PROD'
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
,p_default_expression=>'P173_ID_ORDEN_PROD'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(170416082253773078)
,p_name=>'PRO_ID_PRODUCTO_MAT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRO_ID_PRODUCTO_MAT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Materia prima'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Materia prima',
  'width', '1000')).to_clob
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(158983750476131911)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(170417038994773079)
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
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(154039054082395389)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(170418070229773079)
,p_name=>'CANTIDAD_ESTIMADA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD_ESTIMADA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad estimada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(170419062297773079)
,p_name=>'CANTIDAD_REAL_CONSUMIDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD_REAL_CONSUMIDA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Can. real consumida'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(170420030942773080)
,p_name=>'COSTO_UNITARIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COSTO_UNITARIO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Costo unitario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(170421072934773080)
,p_name=>'COSTO_TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COSTO_TOTAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Costo total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(170411761905773073)
,p_internal_uid=>51178236334116935
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
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(170412171252773074)
,p_interactive_grid_id=>wwv_flow_imp.id(170411761905773073)
,p_static_id=>'511787'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(170412355693773074)
,p_report_id=>wwv_flow_imp.id(170412171252773074)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(170413511256773076)
,p_view_id=>wwv_flow_imp.id(170412355693773074)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(170413082054773076)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(170414515314773077)
,p_view_id=>wwv_flow_imp.id(170412355693773074)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(170414078568773077)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(170415503357773078)
,p_view_id=>wwv_flow_imp.id(170412355693773074)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(170415123244773078)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(170416427139773078)
,p_view_id=>wwv_flow_imp.id(170412355693773074)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(170416082253773078)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(170417495413773079)
,p_view_id=>wwv_flow_imp.id(170412355693773074)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(170417038994773079)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(170418484490773079)
,p_view_id=>wwv_flow_imp.id(170412355693773074)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(170418070229773079)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(170419501923773079)
,p_view_id=>wwv_flow_imp.id(170412355693773074)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(170419062297773079)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(170420503574773080)
,p_view_id=>wwv_flow_imp.id(170412355693773074)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(170420030942773080)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(170421467734773080)
,p_view_id=>wwv_flow_imp.id(170412355693773074)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(170421072934773080)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(170410654192772806)
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
 p_id=>wwv_flow_imp.id(170398176044772797)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'CHANGE'
,p_button_condition=>'P173_ID_ORDEN_PROD'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(157142029546805403)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(170397148313772796)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:169:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800173500)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_button_name=>'VER_PDF'
,p_button_static_id=>'btn_ver_pdf'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ver PDF'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'javascript: urlVerPDF();'
,p_button_condition=>':P173_ID_ORDEN_PROD IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(170398598830772797)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'CREATE'
,p_button_condition=>'P173_ID_ORDEN_PROD'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(157142358551804586)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168711447421239763)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_button_name=>'CALCULAR_COSTOS'
,p_button_static_id=>'CALCULAR_COSTOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Calcular costos'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P173_ID_ORDEN_PROD IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(157142029546805403)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168709473642239743)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_button_name=>'BTN_CARGAR_INSUMOS'
,p_button_static_id=>'BTN_CARGAR_INSUMOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cargar insumos'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P173_ID_ORDEN_PROD IS NOT NULL',
'AND :P173_ESTADO = ''PENDIENTE'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(157142029546805403)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168710829774239757)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_button_name=>'BTN_FINALIZAR'
,p_button_static_id=>'BTN_FINALIZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>unistr('Finalizar producci\00F3n')
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P173_ID_ORDEN_PROD IS NOT NULL',
'AND :P173_ESTADO = ''EN_PROCESO'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(157142029546805403)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168710265615239751)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_button_name=>'BTN_INICIAR_PROD'
,p_button_static_id=>'BTN_INICIAR_PROD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>unistr('Iniciar producci\00F3n')
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P173_ID_ORDEN_PROD IS NOT NULL',
'AND :P173_ESTADO = ''PENDIENTE'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(157142029546805403)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(170397738508772797)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P173_ID_ORDEN_PROD'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(157142765293803734)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800173330)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(800173300)
,p_button_name=>'BTN_NUEVA_ENTREGA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva entrega'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:186:&SESSION.::&DEBUG.:RP,186:P186_ORD_ID_ORDEN_PROD:&P173_ID_ORDEN_PROD.'
,p_button_condition=>':P173_ESTADO IN (''PENDIENTE'',''EN_PROCESO'')'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(157142358551804586)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900173440)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900173400)
,p_button_name=>'BTN_NUEVA_RECEPCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva recepci\00F3n')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:188:&SESSION.::&DEBUG.:RP,188:P188_ORD_ID_ORDEN_PROD,P188_P_ORIGEN:&P173_ID_ORDEN_PROD.,173'
,p_button_condition=>':P173_ESTADO IN (''PENDIENTE'',''EN_PROCESO'')'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(147194306620473957)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(170399763145772798)
,p_branch_name=>'Go To Page 173'
,p_branch_action=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.::P173_ID_ORDEN_PROD:&P173_ID_ORDEN_PROD.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'CREATE,CARGAR,SAVE, INICIO_PROD,COSTEO'
,p_branch_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(170400448625772799)
,p_branch_name=>'Go To Page 169'
,p_branch_action=>'f?p=&APP_ID.:169:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'FINALIZAR,DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(125070900532857701)
,p_name=>'P173_SEXO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Sexo'
,p_source=>'SEXO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SEXO_PRODUCTO'
,p_lov=>'.'||wwv_flow_imp.id(173166185700427161)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(125071028582857702)
,p_name=>'P173_TIP_ID_TIPO_LOGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Tipo logo'
,p_source=>'TIP_ID_TIPO_LOGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TIPO_LOGO_PRODUCTO'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(150129965833328336)
,p_name=>'P173_V_CANTIDAD_PRODUCIDA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Cantidad producida'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(168711386731239762)
,p_name=>'P173_METODO_COSTEO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(168709332094239742)
,p_prompt=>'Metodo de costeo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_METODO_COSTEO'
,p_lov=>'.'||wwv_flow_imp.id(171383460071886632)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(168809642334983171)
,p_name=>'P173_LIC_ID_LICITACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>unistr('Licitaci\00F3n')
,p_source=>'LIC_ID_LICITACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT l.nro_licitacion||'' CC: ''||l.codigo_contratacion||'' ''||l.convocante AS d',
'      ,l.id_licitacion AS r',
'FROM licitacion l',
'WHERE EXISTS (',
'  SELECT  1',
'  FROM licitacion_det_producto ld',
'  WHERE ld.lic_id_licitacion = l.id_licitacion',
'  AND ld.eta_id_etapa = ''ADJU''',
'  FETCH FIRST 1 ROW ONLY',
')'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Licitaciones adjudicadas',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(168809748984983172)
,p_name=>'P173_DET_ID_DET_LICITACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>unistr('Articulo de la licitaci\00F3n')
,p_source=>'DET_ID_DET_LICITACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  ''Lote: ''||lote||'', numero: ''||numero||'', Producto: ''||producto_nombre_catalogo||'' >> ''||producto_nombre_convocante||'', ''||',
'unidad_medida||''(''||a_unidad_medida||''), cantidad:''||Trim(To_Char(cantidad,''999g999g999d99'')) AS D ',
',id_det_licitacion AS R',
'FROM licitacion_det_producto l',
'WHERE l.lic_id_licitacion = :P173_LIC_ID_LICITACION',
'AND l.eta_id_etapa = ''ADJU''',
'ORDER BY lote, numero ASC'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccionar'
,p_lov_cascade_parent_items=>'P173_LIC_ID_LICITACION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', unistr('Art\00EDculos de la licitaci\00F3n'),
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(168809910403983173)
,p_name=>'P173_ENT_ID_ENTIDAD_PRODUCTOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Entidad (productor)'
,p_source=>'ENT_ID_ENTIDAD_PRODUCTOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.id_entidad||'' - ''||e.nombre||'' ''||e.numero_documento AS d',
'      ,e.id_entidad AS r',
'FROM entidad e',
'WHERE EXISTS (',
'  SELECT 1',
'  FROM det_cabecera_produccion d',
'  WHERE d.rec_id_receta = :P173_REC_ID_RECETA',
'  AND d.ent_id_entidad_prestador = e.id_entidad',
')',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_lov_cascade_parent_items=>'P173_REC_ID_RECETA'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Lista de productores con receta definida.',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(170383133782772779)
,p_name=>'P173_ID_ORDEN_PROD'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_source=>'ID_ORDEN_PROD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(170384341160772784)
,p_name=>'P173_NRO_ORDEN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Nro. orden'
,p_source=>'NRO_ORDEN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_colspan=>2
,p_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_imp.id(170384764372772785)
,p_name=>'P173_FECHA_ORDEN'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Fecha orden'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_ORDEN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>':P173_ESTADO != ''PENDIENTE'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
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
  'show_time', 'Y',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(170385157559772786)
,p_name=>'P173_FECHA_INICIO_EST'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Inicio establecido'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_INICIO_EST'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when_type=>'ALWAYS'
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
  'show_time', 'Y',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(170385576902772786)
,p_name=>'P173_FECHA_FIN_REAL'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Fin real'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_FIN_REAL'
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
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'Y',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(170385966448772786)
,p_name=>'P173_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Sucursal'
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SUCURSAL_ENTIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.id_suc_entidad AS r',
'      ,s.descripcion AS d',
'FROM sucursal_entidad s',
'WHERE s.ent_id_entidad = :APP_ID_ENTIDAD',
'AND s.estado = ''ACTIVO''',
''))
,p_cHeight=>1
,p_read_only_when=>':P173_ESTADO != ''PENDIENTE'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(170386353099772787)
,p_name=>'P173_DEP_ID_DEPOSITO_ORIG'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Deposito origen'
,p_source=>'DEP_ID_DEPOSITO_ORIG'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_DEPOSITO'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>':P173_ESTADO != ''PENDIENTE'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(170386798107772787)
,p_name=>'P173_DEP_ID_DEPOSITO_DEST'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Deposito destino'
,p_source=>'DEP_ID_DEPOSITO_DEST'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_DEPOSITO'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>':P173_ESTADO != ''PENDIENTE'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(170387175979772788)
,p_name=>'P173_REC_ID_RECETA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Receta'
,p_source=>'REC_ID_RECETA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_RECETA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT c.id_receta AS r',
'      ,c.descripcion_receta AS d',
'FROM cab_receta_produccion c'))
,p_cSize=>30
,p_read_only_when=>':P173_ESTADO != ''PENDIENTE'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Recetas',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(170387843548772790)
,p_name=>'P173_PRO_ID_PRODUCTO_FIN'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Producto final'
,p_source=>'PRO_ID_PRODUCTO_FIN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PRODUCTO_DESCRI_ART_SRV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.id_producto AS r',
'      ,p.descripcion AS d',
'FROM producto p'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(170388281836772790)
,p_name=>'P173_CANTIDAD_A_PRODUCIR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Cantidad a producir'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'CANTIDAD_A_PRODUCIR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(170388669143772790)
,p_name=>'P173_COSTO_TOTAL_ESTIMADO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Costo total estimado'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'COSTO_TOTAL_ESTIMADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(170389065464772790)
,p_name=>'P173_COSTO_TOTAL_REAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Costo total real'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'COSTO_TOTAL_REAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(170389460034772791)
,p_name=>'P173_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(168709332094239742)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_imp.id(170389889876772791)
,p_name=>'P173_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(168709231474239741)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
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
 p_id=>wwv_flow_imp.id(170390289197772791)
,p_name=>'P173_USUARIO_REGISTRO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(168709332094239742)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Usuario registro'
,p_source=>'USUARIO_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_imp.id(170390652780772791)
,p_name=>'P173_FECHA_REGISTRO'
,p_source_data_type=>'DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(168709332094239742)
,p_item_source_plug_id=>wwv_flow_imp.id(170382774003772779)
,p_prompt=>'Fecha registro'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_imp.id(170396850201772796)
,p_name=>'P173_ID_ORDEN_PROD_COUNT'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(168709332094239742)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'class="fielddata"'
,p_begin_on_new_line=>'N'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168808464399983159)
,p_name=>'Buscar producto final'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P173_REC_ID_RECETA'
,p_condition_element=>'P173_REC_ID_RECETA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168709847601239747)
,p_event_id=>wwv_flow_imp.id(168808464399983159)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buscar_producto_final()'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168709615103239744)
,p_name=>'Cargar'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168709473642239743)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(125071526594857707)
,p_event_id=>wwv_flow_imp.id(168709615103239744)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Desea continuar con la carga de insumos en base a la receta?'
,p_attribute_03=>'danger'
,p_attribute_04=>'fa-warning'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168710074835239749)
,p_event_id=>wwv_flow_imp.id(168709615103239744)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CARGAR'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168710352153239752)
,p_name=>'Inicio'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168710265615239751)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168710620992239754)
,p_event_id=>wwv_flow_imp.id(168710352153239752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('Marcar inicio de la producci\00F3n?')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168710487367239753)
,p_event_id=>wwv_flow_imp.id(168710352153239752)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'INICIO_PROD'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168711009377239758)
,p_name=>'Finalizar'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168710829774239757)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168711033186239759)
,p_event_id=>wwv_flow_imp.id(168711009377239758)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('Confirma la finalizaci\00F3n de la producci\00F3n?')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168711150020239760)
,p_event_id=>wwv_flow_imp.id(168711009377239758)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'FINALIZAR'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168711624936239764)
,p_name=>'Costeo'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168711447421239763)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168711693056239765)
,p_event_id=>wwv_flow_imp.id(168711624936239764)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Desea continuar con el costeo?'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168711815367239766)
,p_event_id=>wwv_flow_imp.id(168711624936239764)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'COSTEO'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168810010961983174)
,p_name=>'Inicio foco'
,p_event_sequence=>60
,p_condition_element=>'P173_NRO_ORDEN'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168810075147983175)
,p_event_id=>wwv_flow_imp.id(168810010961983174)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P173_FECHA_ORDEN'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(125071298709857704)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New-update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Validaciones al crear/guardar orden',
'IF :P173_ENT_ID_ENTIDAD_PRODUCTOR IS NULL THEN',
unistr('    Raise_Application_Error(-20999,''Favor declarar quien realizara la producci\00F3n.'');'),
'END IF;',
'IF NVL(:P173_CANTIDAD_A_PRODUCIR,0) = 0 THEN',
'    Raise_Application_Error(-20999,''Favor declarar cantidad a producir.'');',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>125071298709857704
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(170401421063772800)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(170382774003772779)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Form on CAB_ORDEN_PRODUCCION'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>51167895492116662
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(170422043683773082)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(170411354091773072)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Insumos para producci\00F3n - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_exec_cond_for_each_row=>'Y'
,p_internal_uid=>51188518112116944
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(119233526371829348)
,p_process_sequence=>35
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(119233526371829338)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Tama\00F1os a producir - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_exec_cond_for_each_row=>'Y'
,p_internal_uid=>800173210
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168709971632239748)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_produccion.cargar_insumos_orden(p_id_orden_prod => :P173_ID_ORDEN_PROD );',
'',
unistr('-- Cargar tama\00F1os de la receta en la orden'),
'INSERT INTO orden_produccion_tamanho (ord_id_orden_prod, tam_id_tamanho_receta, cantidad)',
'SELECT :P173_ID_ORDEN_PROD, rpt.id_tamanho_receta, 0',
'FROM receta_produccion_tamanho rpt',
'WHERE rpt.rec_id_receta = :P173_REC_ID_RECETA',
'AND NOT EXISTS (',
'    SELECT 1 FROM orden_produccion_tamanho opt',
'    WHERE opt.ord_id_orden_prod = :P173_ID_ORDEN_PROD',
'    AND opt.tam_id_tamanho_receta = rpt.id_tamanho_receta',
');',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CARGAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>49476446060583610
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168710799073239756)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Iniciar produccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE cab_orden_produccion c',
'    SET c.fecha_inicio_est = CURRENT_DATE',
'       ,c.estado = ''EN_PROCESO'' ',
'    WHERE c.id_orden_prod = :P173_ID_ORDEN_PROD;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'INICIO_PROD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>49477273501583618
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168711247908239761)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Finalizar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  salotex.pkg_produccion.finalizar_orden(',
'    p_id_orden_prod => :P173_ID_ORDEN_PROD',
'  );',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'FINALIZAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>unistr('\00A1Orden finalizada! Inventario actualizado.')
,p_internal_uid=>49477722336583623
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168711829195239767)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Costeo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_produccion.calcular_costos_orden(',
'       p_id_orden_prod => :P173_ID_ORDEN_PROD,',
'       p_metodo_costeo => :P173_METODO_COSTEO',
'     );'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'COSTEO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>unistr('Costos calculados correctamente con m\00E9todo: &P173_METODO_COSTEO.')
,p_internal_uid=>49478303623583629
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(125071865694857710)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(168712009180239768)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Detalle de costo operativo - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>125071865694857710
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134310542875216016)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valida final'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_cantidad number;',
'BEGIN',
'    SELECT SUM(opt.CANTIDAD)',
'    INTO v_cantidad',
'    FROM ORDEN_PRODUCCION_TAMANHO opt',
'    WHERE opt.ORD_ID_ORDEN_PROD = :P173_ID_ORDEN_PROD;',
'    IF v_cantidad > TO_NUMBER(:P173_CANTIDAD_A_PRODUCIR) THEN',
unistr('        raise_application_error(-20000,''La cantidad a producir es MENOR que la disfrucuci\00F3n por medidas.'');'),
'    END IF;',
' END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_internal_uid=>134310542875216016
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(170400937893772799)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(170382774003772779)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Form on CAB_ORDEN_PRODUCCION'
,p_attribute_03=>'P173_ID_ORDEN_PROD_COUNT'
,p_internal_uid=>51167412322116661
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168808238486983157)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P173_ID_ORDEN_PROD IS NULL THEN',
'    :P173_FECHA_ORDEN := TO_CHAR(CURRENT_DATE,''DD-MM-YYYY HH24:MI'');',
'    :P173_ESTADO := ''PENDIENTE'';',
'    :P173_USUARIO_REGISTRO := :APP_USER;',
'    :P173_FECHA_REGISTRO := TO_CHAR(CURRENT_DATE,''DD-MM-YYYY HH24:MI'');',
'    :P173_METODO_COSTEO := ''PROMEDIO'';',
'ELSE',
'    BEGIN',
'        SELECT Sum(d.CANTIDAD)',
'        INTO :P173_V_CANTIDAD_PRODUCIDA',
'        FROM cab_recepcion_producto r',
'            ,det_recepcion_producto d',
'            ,orden_produccion_tamanho ot',
'            ,receta_produccion_tamanho rp',
'            ,producto_tamanho pt',
'        WHERE r.ORD_ID_ORDEN_PROD = 62 --:P173_ID_ORDEN_PROD',
'        AND r.ESTADO = ''ACTIVO''',
'        AND d.REC_ID_RECEPCION_PROD(+) = r.ID_RECEPCION_PROD',
'        AND ot.id_ord_prod_tam = d.opt_id_ord_prod_tam',
'        AND rp.id_tamanho_receta = ot.tam_id_tamanho_receta',
'        AND pt.id_tamanho(+) = rp.tam_id_tamanho;',
'    END;    ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>49574712915327019
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168808418288983158)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'producto_final'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_nombre_producto   producto.descripcion%TYPE;',
'    v_id_producto       producto.id_producto%TYPE;',
'    PROCEDURE output_json_item (',
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
'    BEGIN',
'        SELECT p.id_producto',
'              ,p.sexo',
'              ,p.tip_id_tipo_logo',
'        INTO :P173_PRO_ID_PRODUCTO_FIN',
'            ,:P173_SEXO',
'            ,:P173_TIP_ID_TIPO_LOGO',
'        FROM cab_receta_produccion c',
'            ,producto p',
'        WHERE c.id_receta = :P173_REC_ID_RECETA',
'        AND p.id_producto = c.pro_id_producto_fin;  ',
'    END;',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P173_PRO_ID_PRODUCTO_FIN'', :P173_PRO_ID_PRODUCTO_FIN);',
'    output_json_item(''P173_SEXO'', :P173_SEXO);',
'    output_json_item(''P173_TIP_ID_TIPO_LOGO'', :P173_TIP_ID_TIPO_LOGO);',
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
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_internal_uid=>49574892717327020
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800173510)
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
'  vl_vNomReporte := ''ORDEN_PRODUCCION'';',
'',
'  pkg_jasperreports_server.descarga_reporte(p_vNomReporte  => vl_vNomReporte',
'                                           ,p_aNomParams   => apex_util.string_to_table(''P_ID_ORDEN_PROD:P_USUARIO:P_EMPRESA'')',
'                                           ,p_aValParams   => apex_util.string_to_table(apex_application.g_x01||'':''||:APP_USER||'':''||vl_empresa)',
'                                            );',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>800173510
);
wwv_flow_imp.component_end;
end;
/
