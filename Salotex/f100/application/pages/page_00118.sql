prompt --application/pages/page_00118
begin
--   Manifest
--     PAGE: 00118
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
 p_id=>118
,p_name=>'Bitacora de solicitudes'
,p_alias=>'BITACORA-DE-SOLICITUDES'
,p_step_title=>'Bitacora de solicitudes'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(112452738471225745)
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
 p_id=>wwv_flow_imp.id(112453420482225744)
,p_plug_name=>'Bitacora de solicitudes'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.id_pedido,',
'       p.fecha_pedido,',
'       p.ent_id_entidad,',
'       p.are_id_area,',
'       p.niv_id_nivel,',
'       p.usu_id_usuario,',
'       p.pedido,',
'       p.estado,',
'       p.anulado_por,',
'       p.anulado_el,',
'       p.anulado_obs,',
'       p.fecha_inicio,',
'       p.fecha_fin,',
'       p.dias_tarea,',
'       p.dias_prueba,',
'       p.obs_interna,',
'       p.fecha_finalizado,',
'       p.usu_id_usuario_fin,',
'       d.id_det_pedido,',
'       d.ped_id_pedido,',
'       d.det_id_estado_det,',
'       d.usu_id_usuario usu_id_usuario_asignado,',
'       d.fecha_asignado,',
'       d.nota,',
'       d.fecha_inicio_propuesto,',
'       d.fecha_fin_propuesto,',
'       d.entregado,',
'       (',
'          SELECT Min(b.inicio)',
'          FROM pedido_it_bitacora b',
'          WHERE b.det_id_det_pedido = d.id_det_pedido',
'       ) inicio_bitacora,',
'       (',
'          SELECT Max(b.final)',
'          FROM pedido_it_bitacora b',
'          WHERE b.det_id_det_pedido = d.id_det_pedido',
'       ) fin_bitacora',
'  FROM pedido_it p',
'      ,det_pedido_it d',
' WHERE d.ped_id_pedido(+) = p.id_pedido',
' AND (:P118_ENTIDAD IS NULL OR p.ent_id_entidad = :P118_ENTIDAD)',
' AND (:P118_INICIO IS NULL OR trunc(p.fecha_pedido,''DD'') BETWEEN To_Date(:P118_INICIO,''dd-mm-yyyy'') AND To_Date(:P118_FIN,''dd-mm-yyyy''))',
' AND (:P118_USUARIO_ASIGNADO IS NULL OR d.usu_id_usuario = :P118_USUARIO_ASIGNADO)',
' AND (:P118_ENTIDAD IS NOT NULL OR :P118_INICIO IS NOT NULL OR :P118_USUARIO_ASIGNADO IS NOT NULL) ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P118_ENTIDAD,P118_INICIO,P118_FIN,P118_USUARIO_ASIGNADO'
,p_prn_page_header=>'Bitacora de solicitudes'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(112453568441225744)
,p_name=>'Bitacora de solicitudes'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>38720549377219004
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112453836559225645)
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
 p_id=>wwv_flow_imp.id(112454311973225645)
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
 p_id=>wwv_flow_imp.id(112456236225225643)
,p_db_column_name=>'PEDIDO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Pedido'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112456693218225643)
,p_db_column_name=>'ESTADO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112457093397225643)
,p_db_column_name=>'ANULADO_POR'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Anulado Por'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112457424576225643)
,p_db_column_name=>'ANULADO_EL'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Anulado El'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112457898147225643)
,p_db_column_name=>'ANULADO_OBS'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Anulado Obs'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112458241496225642)
,p_db_column_name=>'FECHA_INICIO'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Inicio'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112458655923225642)
,p_db_column_name=>'FECHA_FIN'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Fin'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112459045421225642)
,p_db_column_name=>'DIAS_TAREA'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Dias Tarea'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112459440931225642)
,p_db_column_name=>'DIAS_PRUEBA'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Dias Prueba'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112459822699225641)
,p_db_column_name=>'OBS_INTERNA'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Obs Interna'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112460246897225641)
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
 p_id=>wwv_flow_imp.id(112380778740363482)
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
 p_id=>wwv_flow_imp.id(112380913169363483)
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
 p_id=>wwv_flow_imp.id(112380924657363484)
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
 p_id=>wwv_flow_imp.id(112381065233363485)
,p_db_column_name=>'USU_ID_USUARIO'
,p_display_order=>57
,p_column_identifier=>'V'
,p_column_label=>'Usuario solicita'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(83050876087485807)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112381188324363486)
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
 p_id=>wwv_flow_imp.id(112381229986363487)
,p_db_column_name=>'ID_DET_PEDIDO'
,p_display_order=>77
,p_column_identifier=>'X'
,p_column_label=>'Id Det Pedido'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112381395010363488)
,p_db_column_name=>'PED_ID_PEDIDO'
,p_display_order=>87
,p_column_identifier=>'Y'
,p_column_label=>'Ped Id Pedido'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112381479045363489)
,p_db_column_name=>'DET_ID_ESTADO_DET'
,p_display_order=>97
,p_column_identifier=>'Z'
,p_column_label=>'Estado detalle'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(112171909675154522)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(112381604612363490)
,p_db_column_name=>'USU_ID_USUARIO_ASIGNADO'
,p_display_order=>107
,p_column_identifier=>'AA'
,p_column_label=>'Usuario asignado'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(83050876087485807)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(113224625608948641)
,p_db_column_name=>'FECHA_ASIGNADO'
,p_display_order=>117
,p_column_identifier=>'AB'
,p_column_label=>'Fecha asignado'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(113224731760948642)
,p_db_column_name=>'NOTA'
,p_display_order=>127
,p_column_identifier=>'AC'
,p_column_label=>'Nota'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(113224902172948643)
,p_db_column_name=>'FECHA_INICIO_PROPUESTO'
,p_display_order=>137
,p_column_identifier=>'AD'
,p_column_label=>'Inicio propuesto'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(113224971434948644)
,p_db_column_name=>'FECHA_FIN_PROPUESTO'
,p_display_order=>147
,p_column_identifier=>'AE'
,p_column_label=>'Fin propuesto'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(113225020822948645)
,p_db_column_name=>'ENTREGADO'
,p_display_order=>157
,p_column_identifier=>'AF'
,p_column_label=>'Entregado'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(113225198328948646)
,p_db_column_name=>'INICIO_BITACORA'
,p_display_order=>167
,p_column_identifier=>'AG'
,p_column_label=>unistr('Inicio bit\00E1cora')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(113225305682948647)
,p_db_column_name=>'FIN_BITACORA'
,p_display_order=>177
,p_column_identifier=>'AH'
,p_column_label=>unistr('Fin bit\00E1cora')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(112462743915154269)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'387298'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_PEDIDO:FECHA_PEDIDO:ESTADO:ENT_ID_ENTIDAD:ARE_ID_AREA:NIV_ID_NIVEL:OBS_INTERNA:USU_ID_USUARIO_ASIGNADO:DET_ID_ESTADO_DET:FECHA_INICIO_PROPUESTO:FECHA_FIN_PROPUESTO:FECHA_ASIGNADO:INICIO_BITACORA:FIN_BITACORA:NOTA:ENTREGADO:USU_ID_USUARIO_FIN:FECHA'
||'_FINALIZADO:'
,p_break_on=>'ID_PEDIDO:FECHA_PEDIDO:ESTADO:ENT_ID_ENTIDAD:ARE_ID_AREA:0'
,p_break_enabled_on=>'ID_PEDIDO:FECHA_PEDIDO:ESTADO:ENT_ID_ENTIDAD:ARE_ID_AREA:0'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(113225807429948652)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(112453420482225744)
,p_button_name=>'Filtrar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--gapTop'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Filtrar'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(113225347951948648)
,p_name=>'P118_ENTIDAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(112453420482225744)
,p_prompt=>'Entidad'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ENTIDAD_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nombre as d',
'      ,id_entidad as r',
'from entidad',
'where estado = ''ACTIVO'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--TODOS'
,p_cSize=>30
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(113225470209948649)
,p_name=>'P118_INICIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(112453420482225744)
,p_prompt=>'Inicio'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(113225616807948650)
,p_name=>'P118_FIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(112453420482225744)
,p_prompt=>'Fin'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(113225659825948651)
,p_name=>'P118_USUARIO_ASIGNADO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(112453420482225744)
,p_prompt=>'Usuario asignado '
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_USUARIO R, USUARIO D',
'FROM usuarios',
'WHERE ESTADO = ''ACTIVO'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--TODOS'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(113225882758948653)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P118_INICIO IS NULL THEN',
'    :P118_FIN := to_char(sysdate,''dd-mm-yyyy'');',
'    :P118_INICIO := to_char(trunc(sysdate,''MM''),''dd-mm-yyyy'');',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>39492863694941913
);
wwv_flow_imp.component_end;
end;
/
