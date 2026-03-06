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
--     PAGE: 169
--   Manifest End
--   Version:         24.2.13
--   Instance ID:     8131532866458080
--

begin
null;
end;
/
prompt --application/pages/delete_00169
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>169);
end;
/
prompt --application/pages/page_00169
begin
wwv_flow_imp_page.create_page(
 p_id=>169
,p_name=>unistr('Receta producci\00F3n')
,p_alias=>unistr('RECETA-PRODUCCI\00D3N')
,p_step_title=>unistr('Receta producci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49554813714295533)
,p_plug_name=>unistr('Receta producci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'CAB_RECETA_PRODUCCION'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>unistr('Receta producci\00F3n')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(49554989273295533)
,p_name=>unistr('Receta producci\00F3n')
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
,p_detail_link=>'f?p=&APP_ID.:170:&APP_SESSION.::&DEBUG.:RP:P170_ID_RECETA:\#ID_RECETA#\'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>49554989273295533
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49555631032295535)
,p_db_column_name=>'ID_RECETA'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id Receta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49556007444295535)
,p_db_column_name=>'PRO_ID_PRODUCTO_FIN'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Producto final'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(87525104521547661)
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49556437749295535)
,p_db_column_name=>'DESCRIPCION_RECETA'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>unistr('Descripci\00F3n receta')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49556864810295536)
,p_db_column_name=>'CANTIDAD_BASE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Cantidad base'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49557266747295536)
,p_db_column_name=>'UNI_ID_UNIDAD_MEDIDA'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Unidad medida'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(90414763095478669)
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49557644126295536)
,p_db_column_name=>'ESTADO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(89273472179480473)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49558037379295536)
,p_db_column_name=>'USUARIO_REGISTRO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Usuario registro'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(49558403638295536)
,p_db_column_name=>'FECHA_REGISTRO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Fecha registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(49571286307296282)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'495713'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_RECETA:PRO_ID_PRODUCTO_FIN:DESCRIPCION_RECETA:CANTIDAD_BASE:UNI_ID_UNIDAD_MEDIDA:ESTADO:USUARIO_REGISTRO:FECHA_REGISTRO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49559345448295536)
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
 p_id=>wwv_flow_imp.id(49558964958295536)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(49554813714295533)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:170:&APP_SESSION.::&DEBUG.:170::'
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
