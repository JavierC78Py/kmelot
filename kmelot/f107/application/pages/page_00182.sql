prompt --application/pages/page_00182
begin
--   Manifest
--     PAGE: 00182
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
 p_id=>182
,p_name=>'Dashboard orden de trabajo'
,p_alias=>'DASHBOARD-ORDEN-TRABAJO'
,p_step_title=>'Dashboard orden de trabajo'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner{',
'    padding-top: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(134270665689388614)
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(800182010)
,p_name=>'Resumen OTs'
,p_template=>4501440665235496320
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    (SELECT COUNT(*) FROM CAB_ORDEN_TRABAJO WHERE ESTADO = ''PRESUPUESTO'') AS PRESUPUESTOS,',
'    (SELECT COUNT(*) FROM CAB_ORDEN_TRABAJO WHERE ESTADO = ''APROBADO'') AS APROBADAS,',
'    (SELECT COUNT(*) FROM CAB_ORDEN_TRABAJO WHERE ESTADO = ''EN_PROCESO'') AS EN_PROCESO,',
'    (SELECT COUNT(*) FROM CAB_ORDEN_TRABAJO WHERE ESTADO = ''FINALIZADO'') AS FINALIZADAS,',
'    (SELECT COUNT(*) FROM CAB_ORDEN_TRABAJO WHERE ESTADO = ''FACTURADO'') AS FACTURADAS,',
'    (SELECT NVL(SUM(MONTO_TOTAL),0) FROM CAB_ORDEN_TRABAJO WHERE ESTADO IN (''PRESUPUESTO'',''APROBADO'',''EN_PROCESO'',''FINALIZADO'')) AS MONTO_PENDIENTE,',
'    (SELECT NVL(SUM(MONTO_TOTAL),0) FROM CAB_ORDEN_TRABAJO WHERE ESTADO = ''FACTURADO'') AS MONTO_FACTURADO',
'  FROM DUAL'))
,p_lazy_loading=>false
,p_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132787693549876036)
,p_query_column_id=>1
,p_column_alias=>'PRESUPUESTOS'
,p_column_display_sequence=>30
,p_column_heading=>'Presupuestos'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132787712499876037)
,p_query_column_id=>2
,p_column_alias=>'APROBADAS'
,p_column_display_sequence=>40
,p_column_heading=>'Aprobadas'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132787855334876038)
,p_query_column_id=>3
,p_column_alias=>'EN_PROCESO'
,p_column_display_sequence=>50
,p_column_heading=>'En proceso'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132787926725876039)
,p_query_column_id=>4
,p_column_alias=>'FINALIZADAS'
,p_column_display_sequence=>60
,p_column_heading=>'Finalizadas'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132788009400876040)
,p_query_column_id=>5
,p_column_alias=>'FACTURADAS'
,p_column_display_sequence=>70
,p_column_heading=>'Facturadas'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132787518191876035)
,p_query_column_id=>6
,p_column_alias=>'MONTO_PENDIENTE'
,p_column_display_sequence=>20
,p_column_heading=>'Monto pendiente'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132787493334876034)
,p_query_column_id=>7
,p_column_alias=>'MONTO_FACTURADO'
,p_column_display_sequence=>10
,p_column_heading=>'Monto facturado'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(800182020)
,p_name=>'OTs Proximas a Vencer'
,p_template=>4501440665235496320
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ot.NRO_OT, ot.ESTADO, ot.PRIORIDAD,',
'       ot.FECHA_ENTREGA_ESTIMADA, ot.DESCRIPCION_TRABAJO, ot.MONTO_TOTAL,',
'       e.NOMBRE AS CLIENTE',
'  FROM CAB_ORDEN_TRABAJO ot, ENTIDAD e',
' WHERE ot.ENT_ID_ENTIDAD = e.ID_ENTIDAD',
'   AND ot.ESTADO IN (''APROBADO'',''EN_PROCESO'')',
'   AND ot.FECHA_ENTREGA_ESTIMADA <= CURRENT_DATE + INTERVAL ''7'' DAY',
' ORDER BY ot.FECHA_ENTREGA_ESTIMADA'))
,p_lazy_loading=>false
,p_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132786699759876026)
,p_query_column_id=>1
,p_column_alias=>'NRO_OT'
,p_column_display_sequence=>10
,p_column_heading=>'Nro OT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132786714078876027)
,p_query_column_id=>2
,p_column_alias=>'ESTADO'
,p_column_display_sequence=>20
,p_column_heading=>'Estado'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132786882446876028)
,p_query_column_id=>3
,p_column_alias=>'PRIORIDAD'
,p_column_display_sequence=>30
,p_column_heading=>'Prioridad'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132786983760876029)
,p_query_column_id=>4
,p_column_alias=>'FECHA_ENTREGA_ESTIMADA'
,p_column_display_sequence=>40
,p_column_heading=>'Entrega estimada'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132787092712876030)
,p_query_column_id=>5
,p_column_alias=>'DESCRIPCION_TRABAJO'
,p_column_display_sequence=>50
,p_column_heading=>unistr('Descripci\00F3n trabajo')
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132787117638876031)
,p_query_column_id=>6
,p_column_alias=>'MONTO_TOTAL'
,p_column_display_sequence=>60
,p_column_heading=>'Monto total'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132787286912876032)
,p_query_column_id=>7
,p_column_alias=>'CLIENTE'
,p_column_display_sequence=>70
,p_column_heading=>'Cliente'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800182900)
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
wwv_flow_imp.component_end;
end;
/
