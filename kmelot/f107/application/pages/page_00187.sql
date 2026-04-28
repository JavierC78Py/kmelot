prompt --application/pages/page_00187
begin
--   Manifest
--     PAGE: 00187
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
 p_id=>187
,p_name=>'Recepciones de Producto Terminado'
,p_alias=>'RECEPCION-PROD-LIST'
,p_step_title=>'Recepciones de Producto Terminado'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>'.t-Body-contentInner{ padding-top: 0px; }'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900187001)
,p_plug_name=>'Recepciones de Producto Terminado'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT r.ID_RECEPCION_PROD,',
'       r.NRO_RECEPCION,',
'       r.FECHA_RECEPCION,',
'       r.HORA_RECEPCION,',
'       op.NRO_ORDEN,',
'       p.DESCRIPCION AS PRODUCTO,',
'       e.NOMBRE AS PRODUCTOR,',
'       (SELECT NVL(SUM(d.CANTIDAD),0)',
'          FROM DET_RECEPCION_PRODUCTO d',
'         WHERE d.REC_ID_RECEPCION_PROD = r.ID_RECEPCION_PROD) AS CANTIDAD,',
'       (SELECT NVL(SUM(d.CANTIDAD * d.PRECIO_UNITARIO),0)',
'          FROM DET_RECEPCION_PRODUCTO d',
'         WHERE d.REC_ID_RECEPCION_PROD = r.ID_RECEPCION_PROD) AS TOTAL,',
'       r.ESTADO,',
'       r.FACTURADO,',
'       dep.DESCRIPCION AS DEPOSITO',
'  FROM CAB_RECEPCION_PRODUCTO r,',
'       CAB_ORDEN_PRODUCCION op,',
'       PRODUCTO p,',
'       ENTIDAD e,',
'       DEPOSITO dep',
' WHERE r.ORD_ID_ORDEN_PROD = op.ID_ORDEN_PROD',
'   AND p.ID_PRODUCTO = op.PRO_ID_PRODUCTO_FIN',
'   AND e.ID_ENTIDAD = op.ENT_ID_ENTIDAD_PRODUCTOR',
'   AND dep.ID_DEPOSITO = r.DEP_ID_DEPOSITO',
'   AND (:P187_P_ID_ENTIDAD IS NULL OR op.ENT_ID_ENTIDAD_PRODUCTOR = :P187_P_ID_ENTIDAD)',
' ORDER BY r.FECHA_RECEPCION DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P187_P_ID_ENTIDAD'
,p_prn_output=>'N'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(900187002)
,p_name=>'Recepciones'
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encuentran recepciones.'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:188:&SESSION.::&DEBUG.:RP,188:P188_ID_RECEPCION_PROD:#ID_RECEPCION_PROD#'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'KMELOT'
,p_internal_uid=>900187002
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900187010)
,p_db_column_name=>'ID_RECEPCION_PROD'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900187011)
,p_db_column_name=>'NRO_RECEPCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nro Recepcion'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900187012)
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
 p_id=>wwv_flow_imp.id(900187013)
,p_db_column_name=>'HORA_RECEPCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Hora'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900187014)
,p_db_column_name=>'NRO_ORDEN'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Nro Orden Prod.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900187015)
,p_db_column_name=>'PRODUCTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Producto'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900187016)
,p_db_column_name=>'PRODUCTOR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Productor'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900187017)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900187019)
,p_db_column_name=>'TOTAL'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900187020)
,p_db_column_name=>'ESTADO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900187021)
,p_db_column_name=>'FACTURADO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Facturado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(900187022)
,p_db_column_name=>'DEPOSITO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Deposito'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(900187030)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'REC_PROD_RPT'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NRO_RECEPCION:FECHA_RECEPCION:HORA_RECEPCION:NRO_ORDEN:PRODUCTO:PRODUCTOR:CANTIDAD:TOTAL:ESTADO:FACTURADO:DEPOSITO:'
,p_sort_column_1=>'FECHA_RECEPCION'
,p_sort_direction_1=>'DESC'
,p_sum_columns_on_break=>'TOTAL'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(159033177437506156)
,p_report_id=>wwv_flow_imp.id(900187030)
,p_name=>'Facturado'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'FACTURADO'
,p_operator=>'='
,p_expr=>'SI'
,p_condition_sql=>' (case when ("FACTURADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''SI''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#d0f1cc'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900187900)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900187040)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900187001)
,p_button_name=>'BTN_CREATE'
,p_button_static_id=>'BTN_CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva recepci\00F3n')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:188:&SESSION.::&DEBUG.:RP,188::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900187041)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(900187001)
,p_button_name=>'BTN_FACTURAR'
,p_button_static_id=>'BTN_FACTURAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Facturar recepciones'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:189:&SESSION.::&DEBUG.:RP,189:P189_ENT_ID_ENTIDAD:&P187_P_ID_ENTIDAD.'
,p_button_condition=>'P187_P_ID_ENTIDAD'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(155497637615448601)
,p_name=>'P187_P_ID_ENTIDAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(900187001)
,p_prompt=>'Entidad'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ENTIDAD_DOC_NOMBRE_PROV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT numero_documento||'' ''||nombre as d, id_entidad as r',
'from entidad',
'where es_proveedor = ''SI''',
'order by nombre'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Todos'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>1609121967514267634
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
  'title', 'Entidad (productor)',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(155497740021448602)
,p_name=>'Set valor'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P187_P_ID_ENTIDAD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(155497837659448603)
,p_event_id=>wwv_flow_imp.id(155497740021448602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp.component_end;
end;
/
