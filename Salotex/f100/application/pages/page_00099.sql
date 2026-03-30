prompt --application/pages/page_00099
begin
--   Manifest
--     PAGE: 00099
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
 p_id=>99
,p_name=>'Pedidos a TI'
,p_alias=>'PEDIDOS-A-TI1'
,p_step_title=>'Pedidos a TI'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var cleave = new Cleave(''.input-desde'', {',
'    date: true,',
'    delimiter: ''-'',',
'    datePattern: [''d'', ''m'', ''Y'']',
'});',
'var cleave = new Cleave(''.input-hasta'', {',
'    date: true,',
'    delimiter: ''-'',',
'    datePattern: [''d'', ''m'', ''Y'']',
'});'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(112410682244845544)
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
 p_id=>wwv_flow_imp.id(112411398252845540)
,p_plug_name=>'Pedidos a TI'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_PEDIDO,',
'       FECHA_PEDIDO,',
'       ENT_ID_ENTIDAD,',
'       ARE_ID_AREA,',
'       NIV_ID_NIVEL,',
'       USU_ID_USUARIO,',
'       PEDIDO,',
'       ESTADO,',
'       ANULADO_POR,',
'       ANULADO_EL,',
'       ANULADO_OBS,',
'       FECHA_INICIO,',
'       FECHA_FIN,',
'       DIAS_TAREA,',
'       DIAS_PRUEBA,',
'       OBS_INTERNA,',
'       FECHA_FINALIZADO,',
'       USU_ID_USUARIO_FIN,',
'       NULL IR_PEDIDO',
'  from PEDIDO_IT',
' where ((:APP_ES_COLABORADOR = ''SI'' and :P99_ENTIDAD IS NULL) or ENT_ID_ENTIDAD = :P99_ENTIDAD)',
'   and trunc(FECHA_PEDIDO) between to_date(:P99_DESDE,''dd-mm-yyyy'') and to_date(:P99_HASTA,''dd-mm-yyyy'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P99_ENTIDAD,P99_DESDE,P99_HASTA'
,p_prn_page_header=>'Pedidos a TI'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(112411508044845540)
,p_name=>'Pedidos a TI'
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
,p_internal_uid=>38678488980838800
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112412035064845430)
,p_db_column_name=>'ID_PEDIDO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id pedido'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112412497198845429)
,p_db_column_name=>'FECHA_PEDIDO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Fecha pedido'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112414441201845427)
,p_db_column_name=>'PEDIDO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Pedido'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112414911636845427)
,p_db_column_name=>'ESTADO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112415276371845427)
,p_db_column_name=>'ANULADO_POR'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Anulado por'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(83050876087485807)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112415655840845427)
,p_db_column_name=>'ANULADO_EL'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Anulado el'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112416066969845426)
,p_db_column_name=>'ANULADO_OBS'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Obs. anulado'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112416451858845426)
,p_db_column_name=>'FECHA_INICIO'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Fecha inicio'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112416831945845426)
,p_db_column_name=>'FECHA_FIN'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Fecha fin'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112417273245845426)
,p_db_column_name=>'DIAS_TAREA'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>unistr('D\00EDas tarea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112417673803845425)
,p_db_column_name=>'DIAS_PRUEBA'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>unistr('D\00EDas prueba')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112418113057845425)
,p_db_column_name=>'OBS_INTERNA'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Obs. interna'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112418429822845425)
,p_db_column_name=>'FECHA_FINALIZADO'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Fecha finalizado'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112378628065363461)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>27
,p_column_identifier=>'S'
,p_column_label=>'Entidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(90258037866810503)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112378744374363462)
,p_db_column_name=>'ARE_ID_AREA'
,p_display_order=>37
,p_column_identifier=>'T'
,p_column_label=>'Area'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(112039354058851882)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112378898757363463)
,p_db_column_name=>'NIV_ID_NIVEL'
,p_display_order=>47
,p_column_identifier=>'U'
,p_column_label=>'Nivel'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(112066671818537144)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112378982114363464)
,p_db_column_name=>'USU_ID_USUARIO'
,p_display_order=>57
,p_column_identifier=>'V'
,p_column_label=>'Usuario solicitante'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(83050876087485807)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112379037863363465)
,p_db_column_name=>'USU_ID_USUARIO_FIN'
,p_display_order=>67
,p_column_identifier=>'W'
,p_column_label=>'Usuario finalizo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(83050876087485807)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112379924992363474)
,p_db_column_name=>'IR_PEDIDO'
,p_display_order=>77
,p_column_identifier=>'X'
,p_column_label=>'Ir a solicitud'
,p_column_link=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:107:P107_ID_PEDIDO,P107_P_ORIGEN:#ID_PEDIDO#,99'
,p_column_linktext=>'<span aria-hidden="true" class="t-Icon fa fa-info-circle-o"></span>'
,p_column_link_attr=>'title="Ir a la solicitud" class="t-Button t-Button--noLabel t-Button--icon t-Button--warning"'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(112419314981845009)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'386863'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_PEDIDO:ARE_ID_AREA:NIV_ID_NIVEL:FECHA_PEDIDO:ESTADO:ENT_ID_ENTIDAD:USU_ID_USUARIO:PEDIDO:FECHA_INICIO:FECHA_FIN:DIAS_TAREA:DIAS_PRUEBA:OBS_INTERNA:USU_ID_USUARIO_FIN:FECHA_FINALIZADO:ANULADO_POR:ANULADO_EL:ANULADO_OBS:'
,p_sort_column_1=>'ID_PEDIDO'
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
,p_break_on=>'ARE_ID_AREA:0:0:0:0:0'
,p_break_enabled_on=>'ARE_ID_AREA:0:0:0:0:0'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(112448826838324247)
,p_report_id=>wwv_flow_imp.id(112419314981845009)
,p_name=>'FINALIZADO'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTADO'
,p_operator=>'='
,p_expr=>'FINALIZADO'
,p_condition_sql=>' (case when ("ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''FINALIZADO''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#d0f1cc'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(112448483582324248)
,p_report_id=>wwv_flow_imp.id(112419314981845009)
,p_name=>'ANULADO'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTADO'
,p_operator=>'='
,p_expr=>'ANULADO'
,p_condition_sql=>' (case when ("ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''ANULADO''  '
,p_enabled=>'Y'
,p_highlight_sequence=>20
,p_row_bg_color=>'#ffd6d2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(112379637217363471)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(112411398252845540)
,p_button_name=>'Filtrar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--gapTop'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Filtrar'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(112379216583363466)
,p_name=>'P99_ENTIDAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(112411398252845540)
,p_prompt=>'Entidad'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.nombre AS d',
'      ,e.id_entidad AS r',
'FROM entidad e',
'WHERE e.es_cliente = ''SI''',
'AND e.estado = ''ACTIVO''',
'AND (e.id_entidad = :APP_MI_ID_ENTIDAD OR :APP_ES_COLABORADOR = ''SI'')'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'TODOS'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(112379517174363469)
,p_name=>'P99_DESDE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(112411398252845540)
,p_prompt=>'Desde'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_tag_css_classes=>'input-desde'
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(112379533429363470)
,p_name=>'P99_HASTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(112411398252845540)
,p_prompt=>'Hasta'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_tag_css_classes=>'input-hasta'
,p_begin_on_new_line=>'N'
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(112379856202363473)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P99_DESDE IS NULL THEN',
'    :P99_HASTA := to_char(sysdate,''dd-mm-yyyy'');',
'    :P99_DESDE := to_char(trunc(sysdate,''MM''),''dd-mm-yyyy'');',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>38646837138356733
);
wwv_flow_imp.component_end;
end;
/
