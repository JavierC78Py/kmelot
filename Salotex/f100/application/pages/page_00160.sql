prompt --application/pages/page_00160
begin
--   Manifest
--     PAGE: 00160
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
 p_id=>160
,p_name=>'Factura venta con saldo'
,p_alias=>'FACTURA-VENTA-CON-SALDO'
,p_step_title=>'Factura venta con saldo'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35483197592958034)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35455998280462455)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(86947038457749062)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35456616569462459)
,p_plug_name=>'Factura venta con saldo'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT /*+ INDEX(dc DET_CUENTA_VENTA_IDX1) INDEX(c CAB_FACTURA_VENTA_IDX1)*/',
'       dc.id_detalle_cuenta',
'      ,dc.item',
'      ,dc.fac_id_factura_venta',
'      ,dc.fecha_vencimiento',
'      ,dc.importe',
'      ,dc.saldo',
'      ,c.fecha_factura',
'      ,c.ent_id_entidad',
'      ,c.tip_id_tipo_comprobante',
'      ,c.condicion_venta',
'      ,c.nro_factura',
'      ,c.mon_id_moneda',
'      ,c.monto AS monto_factura',
'      ,c.saldo AS saldo_factura',
'      ,c.lic_id_licitacion',
'      ,CASE WHEN c.fecha_vencimiento >= Trunc(current_date) THEN ''SI'' ELSE ''NO'' END vencido',
'      ,substr(c.condicion_venta,1,2) condicion_vta_parametro',
'      ,c.ent_id_entidad id_entidad_parametro',
'FROM det_cuenta_venta dc',
'    ,cab_factura_venta c',
'WHERE dc.id_detalle_cuenta IS NOT NULL',
'AND dc.saldo > 0',
'AND c.id_factura_venta = dc.fac_id_factura_venta',
'AND c.estado = ''ACTIVO''',
'AND (:P160_P_ID_ENTIDAD IS NULL OR c.ent_id_entidad = :P160_P_ID_ENTIDAD)',
'AND (:P160_P_ID_LICITACION IS NULL OR  c.lic_id_licitacion = :P160_P_ID_LICITACION)',
'AND c.id_factura_venta != c.nro_factura',
'ORDER BY dc.fecha_vencimiento ASC',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P160_P_ID_LICITACION'
,p_prn_page_header=>'Factura venta con saldo'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(35456769032462459)
,p_name=>'Factura venta con saldo'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encuentran datos.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>35456769032462459
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35457488847462463)
,p_db_column_name=>'ID_DETALLE_CUENTA'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id detalle cuenta'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35457882904462464)
,p_db_column_name=>'ITEM'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Item'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35458255973462464)
,p_db_column_name=>'FAC_ID_FACTURA_VENTA'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Id factura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35458649459462464)
,p_db_column_name=>'FECHA_VENCIMIENTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Fecha vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35459018939462465)
,p_db_column_name=>'IMPORTE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Importe'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35459476437462465)
,p_db_column_name=>'SALDO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Saldo'
,p_column_link=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:84:P84_TIPO_FACS,P84_ENT_ID_ENTIDAD:#CONDICION_VTA_PARAMETRO#,#ID_ENTIDAD_PARAMETRO#'
,p_column_linktext=>'#SALDO#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_security_scheme=>wwv_flow_imp.id(89923600056527918)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35459859939462465)
,p_db_column_name=>'FECHA_FACTURA'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Fecha factura'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35460241838462465)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Entidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(17452607221543045)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35460662301462465)
,p_db_column_name=>'TIP_ID_TIPO_COMPROBANTE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Tipo comprobante'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(88402205979681264)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35461065283462466)
,p_db_column_name=>'CONDICION_VENTA'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>unistr('Condici\00F3n venta')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35461477112462466)
,p_db_column_name=>'NRO_FACTURA'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Nro factura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999g999g9999999'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35461817579462466)
,p_db_column_name=>'MON_ID_MONEDA'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Moneda'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(23578609406965304)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35462256414462466)
,p_db_column_name=>'MONTO_FACTURA'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Monto factura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35462676659462467)
,p_db_column_name=>'SALDO_FACTURA'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Saldo factura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35463099110462467)
,p_db_column_name=>'LIC_ID_LICITACION'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>unistr('Licitaci\00F3n')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(18133351729542421)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35470175286696003)
,p_db_column_name=>'VENCIDO'
,p_display_order=>25
,p_column_identifier=>'P'
,p_column_label=>'Vencido'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35470319959696005)
,p_db_column_name=>'CONDICION_VTA_PARAMETRO'
,p_display_order=>35
,p_column_identifier=>'Q'
,p_column_label=>'Condicion Vta Parametro'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35470485959696006)
,p_db_column_name=>'ID_ENTIDAD_PARAMETRO'
,p_display_order=>45
,p_column_identifier=>'R'
,p_column_label=>'Id Entidad Parametro'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(35463484733463253)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'354635'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NRO_FACTURA:ITEM:CONDICION_VENTA:FECHA_FACTURA:FECHA_VENCIMIENTO:IMPORTE:SALDO:ENT_ID_ENTIDAD:LIC_ID_LICITACION:'
,p_sort_column_1=>'FECHA_VENCIMIENTO'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_sum_columns_on_break=>'SALDO'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(35479188950860541)
,p_report_id=>wwv_flow_imp.id(35463484733463253)
,p_name=>'Vencido'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'VENCIDO'
,p_operator=>'='
,p_expr=>'SI'
,p_condition_sql=>' (case when ("VENCIDO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''SI''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#ffd6d2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35470098716696002)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(35456616569462459)
,p_button_name=>'BTN_FILTRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Filtrar'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35469935228696001)
,p_name=>'P160_P_ID_LICITACION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35456616569462459)
,p_prompt=>unistr('Licitaci\00F3n')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_LICITACION_SIN_ENTI_ALL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT l.id_licitacion AS r',
'      ,l.nro_licitacion||'' CC: ''||l.codigo_contratacion AS d',
'FROM licitacion l'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Todos'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Licitaciones')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35470277465696004)
,p_name=>'P160_P_ID_ENTIDAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35456616569462459)
,p_prompt=>'Entidad'
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
,p_lov_null_text=>'-- Todos'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Entidad')).to_clob
);
wwv_flow_imp.component_end;
end;
/
