prompt --application/pages/page_00162
begin
--   Manifest
--     PAGE: 00162
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
 p_id=>162
,p_name=>unistr('Ingreso a dep\00F3sito')
,p_alias=>unistr('INGRESO-A-DEP\00D3SITO')
,p_step_title=>unistr('Ingreso a dep\00F3sito')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(159385417180968377)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(243894783288217374)
,p_plug_name=>'Factura compra'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  id_ajuste,',
'        fecha_ajuste,',
'        suc_id_sucursal,',
'        mon_id_moneda,',
'        tipo_cambio,',
'        monto,',
'        observacion,',
'        estado,',
'        usuario_registro,',
'        fecha_registro',
'FROM cab_ajuste_inventario',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Factura compra'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(243894899337217374)
,p_name=>'Factura compra'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encuentran datos.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:RP,163:P163_ID_AJUSTE:#ID_AJUSTE#'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>124661373765561236
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(154707585232352180)
,p_db_column_name=>'ID_AJUSTE'
,p_display_order=>10
,p_column_identifier=>'T'
,p_column_label=>'Id ajuste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245886883980067100)
,p_db_column_name=>'SUC_ID_SUCURSAL'
,p_display_order=>20
,p_column_identifier=>'S'
,p_column_label=>'Sucursal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(209413202698658529)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(154707694737352181)
,p_db_column_name=>'FECHA_AJUSTE'
,p_display_order=>40
,p_column_identifier=>'U'
,p_column_label=>'Fecha ajuste'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245886734629067099)
,p_db_column_name=>'MON_ID_MONEDA'
,p_display_order=>50
,p_column_identifier=>'R'
,p_column_label=>'Moneda'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(203774852436037054)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(243899219719217383)
,p_db_column_name=>'TIPO_CAMBIO'
,p_display_order=>60
,p_column_identifier=>'K'
,p_column_label=>'Tipo cambio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(243899706151217383)
,p_db_column_name=>'MONTO'
,p_display_order=>70
,p_column_identifier=>'L'
,p_column_label=>'Monto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(154707804870352182)
,p_db_column_name=>'OBSERVACION'
,p_display_order=>80
,p_column_identifier=>'V'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(154707851221352183)
,p_db_column_name=>'ESTADO'
,p_display_order=>90
,p_column_identifier=>'W'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(243900421078217383)
,p_db_column_name=>'USUARIO_REGISTRO'
,p_display_order=>100
,p_column_identifier=>'N'
,p_column_label=>'Usuario registro'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(243900866542217384)
,p_db_column_name=>'FECHA_REGISTRO'
,p_display_order=>110
,p_column_identifier=>'O'
,p_column_label=>'Fecha registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(243905796383289696)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'114064'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_AJUSTE:FECHA_AJUSTE:ESTADO:SUC_ID_SUCURSAL:MON_ID_MONEDA:TIPO_CAMBIO:MONTO:OBSERVACION:FECHA_REGISTRO:USUARIO_REGISTRO:'
,p_sort_column_1=>'FECHA_FACTURA'
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
,p_break_on=>'MON_ID_MONEDA:0:0:0:0:0'
,p_break_enabled_on=>'MON_ID_MONEDA:0:0:0:0:0'
,p_sum_columns_on_break=>'SALDO:MONTO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(243903053036217388)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(206180564029405200)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(158772335021665696)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(243894783288217374)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear ingreso'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_security_scheme=>wwv_flow_imp.id(159385766677971605)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(158773713905665711)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(243894783288217374)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(158774212696665713)
,p_event_id=>wwv_flow_imp.id(158773713905665711)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(243894783288217374)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
