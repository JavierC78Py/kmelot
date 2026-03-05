--------------------------------------------------------------------------------
-- Name: Kmelot
-- Copyright (c) 2021, 2026, Kmelot.
--------------------------------------------------------------------------------
prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
end;
/
 
prompt APPLICATION 100 - Kmelot
--
-- Application Export:
--   Application:     100
--   Name:            Kmelot
--   Exported By:     JAVIER
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 58
--   Manifest End
--   Version:         24.2.13
--   Instance ID:     8131532866458080
--

begin
null;
end;
/
prompt --application/pages/delete_00058
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>58);
end;
/
prompt --application/pages/page_00058
begin
wwv_flow_imp_page.create_page(
 p_id=>58
,p_name=>'Factura compra'
,p_alias=>'FACTURA-COMPRA'
,p_step_title=>'Factura compra'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(85128386368551721)
,p_plug_name=>'Factura compra'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_FACTURA_COMPRA,',
'       FECHA_FACTURA,',
'       FECHA_VENCIMIENTO,',
'       ENT_ID_ENTIDAD,',
'       TIP_ID_TIPO_COMPROBANTE,',
'       CONDICION_COMPRA,',
'       TIMBRADO,',
'       VTO_TIMBRADO,',
'       NRO_FACTURA,',
'       MON_ID_MONEDA,',
'       TIPO_CAMBIO,',
'       MONTO,',
'       SALDO,',
'       USUARIO_REGISTRO,',
'       FECHA_REGISTRO,',
'       SUC_ID_SUCURSAL',
'  from CAB_FACTURA_COMPRA'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Factura compra'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(85128502417551721)
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
,p_detail_link=>'f?p=&APP_ID.:59:&APP_SESSION.::&DEBUG.:RP:P59_ID_FACTURA_COMPRA:\#ID_FACTURA_COMPRA#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>11395483353544981
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85128901718551724)
,p_db_column_name=>'ID_FACTURA_COMPRA'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'Id Factura Compra'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85129283175551728)
,p_db_column_name=>'FECHA_FACTURA'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Fecha Factura'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85129632663551728)
,p_db_column_name=>'FECHA_VENCIMIENTO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85130836998551729)
,p_db_column_name=>'CONDICION_COMPRA'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>unistr('Condici\00F3n Compra')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85131224676551729)
,p_db_column_name=>'TIMBRADO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Timbrado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85131651040551729)
,p_db_column_name=>'VTO_TIMBRADO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Vto. Timbrado'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85132032197551729)
,p_db_column_name=>'NRO_FACTURA'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Nro. Factura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G9999999'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85132822799551730)
,p_db_column_name=>'TIPO_CAMBIO'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Tipo Cambio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85133309231551730)
,p_db_column_name=>'MONTO'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Monto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85133649137551730)
,p_db_column_name=>'SALDO'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Saldo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85134024158551730)
,p_db_column_name=>'USUARIO_REGISTRO'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Usuario Registro'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(85134469622551731)
,p_db_column_name=>'FECHA_REGISTRO'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Fecha Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(87120145430401444)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>25
,p_column_identifier=>'P'
,p_column_label=>'Entidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(85165398924502583)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(87120258385401445)
,p_db_column_name=>'TIP_ID_TIPO_COMPROBANTE'
,p_display_order=>35
,p_column_identifier=>'Q'
,p_column_label=>'Tipo comprobante'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(85114591955551686)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(87120337709401446)
,p_db_column_name=>'MON_ID_MONEDA'
,p_display_order=>45
,p_column_identifier=>'R'
,p_column_label=>'Moneda'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(84541326864380916)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(87120487060401447)
,p_db_column_name=>'SUC_ID_SUCURSAL'
,p_display_order=>55
,p_column_identifier=>'S'
,p_column_label=>'Sucursal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(90179677127002391)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(85139399463624043)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'114064'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MON_ID_MONEDA:FECHA_FACTURA:ENT_ID_ENTIDAD:FECHA_VENCIMIENTO:CONDICION_COMPRA:TIP_ID_TIPO_COMPROBANTE:TIMBRADO:VTO_TIMBRADO:NRO_FACTURA:MONTO:SALDO:'
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
 p_id=>wwv_flow_imp.id(85136656116551735)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(85134923079551731)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(85128386368551721)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear factura'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:59:&APP_SESSION.::&DEBUG.:59::'
,p_security_scheme=>wwv_flow_imp.id(85154963767297285)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(85135309416551731)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(85128386368551721)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(85135728580551733)
,p_event_id=>wwv_flow_imp.id(85135309416551731)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(85128386368551721)
,p_attribute_01=>'N'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
