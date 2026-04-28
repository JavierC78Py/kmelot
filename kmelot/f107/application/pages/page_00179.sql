prompt --application/pages/page_00179
begin
--   Manifest
--     PAGE: 00179
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
 p_id=>179
,p_name=>'Detalle Orden de Trabajo'
,p_alias=>'DETALLE-OT'
,p_step_title=>'Detalle Orden de Trabajo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#mascara_fecha#MIN#.js',
'#APP_FILES#mascara_fecha_hora#MIN#.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function urlVerPDF(){',
'    apex.navigation.openInNewWindow(',
'        apex.server.url( {',
'            p_request: "application_process=ver_pdf",',
'            x01: apex.item("P179_ID_ORDEN_TRABAJO").getValue()',
'        })',
'    );',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'mascaraFechaHoraRegex("#P179_FECHA_ENTRADA");',
'mascaraFechaHoraRegex("#P179_FECHA_ENTREGA_ESTIMADA");'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner{',
'    padding-top: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(132641974324456297)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(800179050)
,p_name=>'Historial'
,p_template=>4501440665235496320
,p_display_sequence=>41
,p_region_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT JN_OPERATION,',
'       JN_DATETIME,',
'       JN_USER,',
'       ESTADO,',
'       NRO_OT,',
'       MONTO_TOTAL',
'  FROM CAB_ORDEN_TRABAJO_JN',
' WHERE ID_ORDEN_TRABAJO = :P179_ID_ORDEN_TRABAJO',
' ORDER BY JN_DATETIME DESC'))
,p_display_condition_type=>'NEVER'
,p_lazy_loading=>false
,p_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132519546420931701)
,p_query_column_id=>1
,p_column_alias=>'JN_OPERATION'
,p_column_display_sequence=>10
,p_column_heading=>'Jn Operation'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132519634354931702)
,p_query_column_id=>2
,p_column_alias=>'JN_DATETIME'
,p_column_display_sequence=>20
,p_column_heading=>'Jn Datetime'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132519767520931703)
,p_query_column_id=>3
,p_column_alias=>'JN_USER'
,p_column_display_sequence=>30
,p_column_heading=>'Jn User'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132519878221931704)
,p_query_column_id=>4
,p_column_alias=>'ESTADO'
,p_column_display_sequence=>40
,p_column_heading=>'Estado'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132519994092931705)
,p_query_column_id=>5
,p_column_alias=>'NRO_OT'
,p_column_display_sequence=>50
,p_column_heading=>'Nro Ot'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(132520040976931706)
,p_query_column_id=>6
,p_column_alias=>'MONTO_TOTAL'
,p_column_display_sequence=>60
,p_column_heading=>'Monto Total'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(132543125605877832)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(132788198065876041)
,p_plug_name=>unistr('Pesta\00F1as')
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>11
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800179010)
,p_plug_name=>'Orden de Trabajo'
,p_parent_plug_id=>wwv_flow_imp.id(132788198065876041)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>21
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_ORDEN_TRABAJO,',
'       NRO_OT,',
'       ENT_ID_ENTIDAD,',
'       DESCRIPCION_TRABAJO,',
'       FECHA_ENTRADA,',
'       FECHA_ENTREGA_ESTIMADA,',
'       FECHA_ENTREGA_REAL,',
'       PRIORIDAD,',
'       MON_ID_MONEDA,',
'       TIPO_CAMBIO,',
'       MONTO_TOTAL,',
'       OBSERVACIONES,',
'       REFERENCIA_PLANO,',
'       MEDIDAS_PIEZA,',
'       CANTIDAD_PIEZAS,',
'       MATERIAL_CLIENTE,',
'       ESTADO,',
'       FECHA_APROBACION,',
'       FECHA_INICIO_TRABAJO,',
'       FECHA_FINALIZACION,',
'       MOTIVO_RECHAZO,',
'       MOTIVO_CANCELACION,',
'       SUC_ID_SUCURSAL,',
'       USUARIO_REGISTRO,',
'       FECHA_REGISTRO',
'  from CAB_ORDEN_TRABAJO'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800179020)
,p_plug_name=>'Buttons'
,p_parent_plug_id=>wwv_flow_imp.id(800179010)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800179030)
,p_plug_name=>'Servicios'
,p_region_name=>'REG_SERVICIOS'
,p_parent_plug_id=>wwv_flow_imp.id(132788198065876041)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.ID_DET_OT_SERVICIO,',
'       s.OT_ID_ORDEN_TRABAJO,',
'       (SELECT p.DESCRIPCION FROM PRODUCTO p WHERE p.ID_PRODUCTO = s.PRO_ID_PRODUCTO) SERVICIO,',
'       s.DESCRIPCION,',
'       (SELECT i.DESCRIPCION FROM IVA i WHERE i.ID_IVA = s.IVA_ID_IVA) IVA_DESC,',
'       (SELECT u.DESCRIPCION FROM UNIDAD_MEDIDA u WHERE u.ID_UNIDAD_MEDIDA = s.UNI_ID_UNIDAD_MEDIDA) UNIDAD,',
'       s.CANTIDAD,',
'       s.PRECIO_UNITARIO,',
'       s.PORC_DESCUENTO,',
'       s.TOTAL,',
'       (SELECT m.DESCRIPCION FROM MAQUINA_TORNERIA m WHERE m.ID_MAQUINA = s.MAQ_ID_MAQUINA) MAQUINA,',
'       s.HORAS_ESTIMADAS,',
'       s.HORAS_REALES',
'  FROM DET_OT_SERVICIO s',
' WHERE s.OT_ID_ORDEN_TRABAJO = :P179_ID_ORDEN_TRABAJO'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_plug_header=>'Servicios'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(800179700)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encuentran servicios'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:184:&SESSION.::&DEBUG.:184:P184_ID_DET_OT_SERVICIO:#ID_DET_OT_SERVICIO#'
,p_detail_link_text=>'<span class="fa fa-edit" aria-hidden="true"></span>'
,p_owner=>'KMELOT'
,p_internal_uid=>800179700
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179720)
,p_db_column_name=>'ID_DET_OT_SERVICIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179721)
,p_db_column_name=>'OT_ID_ORDEN_TRABAJO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'OT'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179722)
,p_db_column_name=>'SERVICIO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Servicio'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179723)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179724)
,p_db_column_name=>'IVA_DESC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'I.V.A.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179725)
,p_db_column_name=>'UNIDAD'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Un.medida'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179726)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179727)
,p_db_column_name=>'PRECIO_UNITARIO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'P. Unit.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179728)
,p_db_column_name=>'PORC_DESCUENTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Desc %'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179729)
,p_db_column_name=>'TOTAL'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179730)
,p_db_column_name=>'MAQUINA'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Maquina'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179731)
,p_db_column_name=>'HORAS_ESTIMADAS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Hs Est.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179732)
,p_db_column_name=>'HORAS_REALES'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Hs Real.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(800179710)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'SVC_RPT'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERVICIO:DESCRIPCION:IVA_DESC:UNIDAD:CANTIDAD:PRECIO_UNITARIO:PORC_DESCUENTO:TOTAL:MAQUINA:HORAS_ESTIMADAS:HORAS_REALES'
,p_sum_columns_on_break=>'TOTAL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800179040)
,p_plug_name=>'Materiales'
,p_region_name=>'REG_MATERIALES'
,p_parent_plug_id=>wwv_flow_imp.id(132788198065876041)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT m.ID_DET_OT_MATERIAL,',
'       m.OT_ID_ORDEN_TRABAJO,',
'       (SELECT p.DESCRIPCION FROM PRODUCTO p WHERE p.ID_PRODUCTO = m.PRO_ID_PRODUCTO) MATERIAL,',
'       m.DESCRIPCION,',
'       (SELECT u.DESCRIPCION FROM UNIDAD_MEDIDA u WHERE u.ID_UNIDAD_MEDIDA = m.UNI_ID_UNIDAD_MEDIDA) UNIDAD,',
'       m.CANTIDAD,',
'       (SELECT d.DESCRIPCION FROM DEPOSITO d WHERE d.ID_DEPOSITO = m.DEP_ID_DEPOSITO) DEPOSITO,',
'       m.OBSERVACIONES',
'  FROM DET_OT_MATERIAL m',
' WHERE m.OT_ID_ORDEN_TRABAJO = :P179_ID_ORDEN_TRABAJO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_header=>'Materiales'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(800179900)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encuentran materiales'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:185:&SESSION.::&DEBUG.:185:P185_ID_DET_OT_MATERIAL,P185_OT_ID_ORDEN_TRABAJO:#ID_DET_OT_MATERIAL#,#OT_ID_ORDEN_TRABAJO#'
,p_detail_link_text=>'<span class="fa fa-edit" aria-hidden="true"></span>'
,p_owner=>'KMELOT'
,p_internal_uid=>800179900
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179910)
,p_db_column_name=>'ID_DET_OT_MATERIAL'
,p_display_order=>10
,p_column_identifier=>'MA'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179911)
,p_db_column_name=>'OT_ID_ORDEN_TRABAJO'
,p_display_order=>20
,p_column_identifier=>'MB'
,p_column_label=>'OT'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179912)
,p_db_column_name=>'MATERIAL'
,p_display_order=>30
,p_column_identifier=>'MC'
,p_column_label=>'Material'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179913)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>40
,p_column_identifier=>'MD'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179914)
,p_db_column_name=>'UNIDAD'
,p_display_order=>50
,p_column_identifier=>'ME'
,p_column_label=>'Unidad'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179915)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>60
,p_column_identifier=>'MF'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179916)
,p_db_column_name=>'DEPOSITO'
,p_display_order=>70
,p_column_identifier=>'MG'
,p_column_label=>unistr('Dep\00F3sito')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800179917)
,p_db_column_name=>'OBSERVACIONES'
,p_display_order=>80
,p_column_identifier=>'MH'
,p_column_label=>'Observaciones'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(800179920)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'OT_MAT_RPT'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MATERIAL:DESCRIPCION:UNIDAD:CANTIDAD:DEPOSITO:OBSERVACIONES'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800179201)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(800179020)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:178:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800179212)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(800179020)
,p_button_name=>'VER_PDF'
,p_button_static_id=>'btn_ver_pdf'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ver presupuesto'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'javascript: urlVerPDF();'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P179_ID_ORDEN_TRABAJO IS NOT NULL',
'AND TO_NUMBER(:P179_MONTO_TOTAL,''999G999G999G999'') > 0'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800179202)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(800179020)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P179_ID_ORDEN_TRABAJO IS NOT NULL ',
'AND :P179_ESTADO NOT IN (''RECHAZADO'',''FACTURADO'')'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(132642559882454090)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800179203)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(800179020)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P179_ID_ORDEN_TRABAJO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(132642995094453132)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800179204)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(800179020)
,p_button_name=>'APROBAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aprobar'
,p_button_position=>'NEXT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P179_ID_ORDEN_TRABAJO IS NOT NULL',
'AND :P179_ESTADO = ''PRESUPUESTO''',
'AND TO_NUMBER(:P179_MONTO_TOTAL,''999G999G999G999'') > 0'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(132642559882454090)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800179205)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(800179020)
,p_button_name=>'RECHAZAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Rechazar'
,p_button_position=>'NEXT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P179_ID_ORDEN_TRABAJO IS NOT NULL',
'AND :P179_ESTADO = ''PRESUPUESTO'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(132642559882454090)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800179206)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(800179020)
,p_button_name=>'INICIAR_TRABAJO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Iniciar Trabajo'
,p_button_position=>'NEXT'
,p_button_condition=>'P179_ESTADO'
,p_button_condition2=>'APROBADO'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_security_scheme=>wwv_flow_imp.id(132642559882454090)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800179207)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(800179020)
,p_button_name=>'FINALIZAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Finalizar'
,p_button_position=>'NEXT'
,p_button_condition=>'P179_ESTADO'
,p_button_condition2=>'EN_PROCESO'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_security_scheme=>wwv_flow_imp.id(132642559882454090)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800179209)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(800179020)
,p_button_name=>'FACTURAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Facturar'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:183:&SESSION.::&DEBUG.:183:P183_IDS_OT:&P179_ID_ORDEN_TRABAJO.'
,p_button_condition=>'P179_ESTADO'
,p_button_condition2=>'FINALIZADO'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_security_scheme=>wwv_flow_imp.id(132642559882454090)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800179215)
,p_button_sequence=>85
,p_button_plug_id=>wwv_flow_imp.id(800179020)
,p_button_name=>'VER_FACTURA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ver Factura'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.:68:P68_ID_FACTURA_VENTA:&P179_FAC_ID_FACTURA_VENTA.'
,p_button_condition=>'P179_ESTADO'
,p_button_condition2=>'FACTURADO'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-text-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800179208)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(800179020)
,p_button_name=>'CANCELAR_OT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancelar OT'
,p_button_position=>'NEXT'
,p_button_condition=>'P179_ESTADO'
,p_button_condition2=>'EN_PROCESO'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_security_scheme=>wwv_flow_imp.id(132642559882454090)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800179210)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(800179030)
,p_button_name=>'AGREGAR_SERVICIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar Servicio'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:184:&SESSION.::&DEBUG.:184:P184_OT_ID_ORDEN_TRABAJO,P184_P_ID_MONEDA:&P179_ID_ORDEN_TRABAJO.,P179_MON_ID_MONEDA'
,p_button_condition=>'P179_ID_ORDEN_TRABAJO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(800179211)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(800179040)
,p_button_name=>'AGREGAR_MATERIAL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar Material'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:185:&SESSION.::&DEBUG.:185:P185_OT_ID_ORDEN_TRABAJO:&P179_ID_ORDEN_TRABAJO.'
,p_button_condition=>'P179_ID_ORDEN_TRABAJO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(132543491652877835)
,p_branch_name=>'178'
,p_branch_action=>'f?p=&APP_ID.:178:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'CREATE,RECHAZAR,CANCELAR_OT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179101)
,p_name=>'P179_ID_ORDEN_TRABAJO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_source=>'ID_ORDEN_TRABAJO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179102)
,p_name=>'P179_NRO_OT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>'Nro OT'
,p_source=>'NRO_OT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179103)
,p_name=>'P179_ENT_ID_ENTIDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>'Cliente'
,p_source=>'ENT_ID_ENTIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ENTIDAD_CLIENTE_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.abreviatura||'' ''||e.numero_documento||'', ''||e.nombre d',
'       ,e.id_entidad r',
'FROM entidad e, tipo_documento t',
'WHERE e.es_cliente = ''SI''',
'AND e.estado = ''ACTIVO''',
'AND t.id_tipo_documento = e.tip_id_tipo_documento'))
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(800179104)
,p_name=>'P179_DESCRIPCION_TRABAJO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>unistr('Descripci\00F3n del trabajo')
,p_source=>'DESCRIPCION_TRABAJO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>4000
,p_cHeight=>2
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
 p_id=>wwv_flow_imp.id(800179105)
,p_name=>'P179_FECHA_ENTRADA'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>'Fecha entrada'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_ENTRADA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'Y',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179106)
,p_name=>'P179_FECHA_ENTREGA_ESTIMADA'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>'Fecha entrega estimada'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_ENTREGA_ESTIMADA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'Y',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179107)
,p_name=>'P179_PRIORIDAD'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>'Prioridad'
,p_source=>'PRIORIDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Alta;ALTA,Media;MEDIA,Baja;BAJA'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179108)
,p_name=>'P179_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179109)
,p_name=>'P179_MEDIDAS_PIEZA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>'Medidas de la pieza'
,p_source=>'MEDIDAS_PIEZA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>1000
,p_cHeight=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179110)
,p_name=>'P179_CANTIDAD_PIEZAS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>'Cantidad de piezas'
,p_source=>'CANTIDAD_PIEZAS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179111)
,p_name=>'P179_MATERIAL_CLIENTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>'Material del cliente'
,p_source=>'MATERIAL_CLIENTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'S',
  'off_value', 'N',
  'on_label', 'S',
  'on_value', 'S',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179112)
,p_name=>'P179_REFERENCIA_PLANO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>'Referencia plano (en caso de contar con plano)'
,p_source=>'REFERENCIA_PLANO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>500
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179113)
,p_name=>'P179_OBSERVACIONES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>'Observaciones'
,p_source=>'OBSERVACIONES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>4000
,p_cHeight=>2
,p_field_template=>1609121967514267634
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179114)
,p_name=>'P179_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>'Moneda'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA_ABREVIADO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_moneda as r',
',abreviatura as d',
'from moneda'))
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179115)
,p_name=>'P179_MONTO_TOTAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>'Monto total'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'MONTO_TOTAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179116)
,p_name=>'P179_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800179150)
,p_name=>'P179_FAC_ID_FACTURA_VENTA'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132543755693877838)
,p_name=>'P179_FECHA_ENTREGA_REAL'
,p_source_data_type=>'DATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_source=>'FECHA_ENTREGA_REAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132543821020877839)
,p_name=>'P179_TIPO_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_source=>'TIPO_CAMBIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132543934721877840)
,p_name=>'P179_FECHA_APROBACION'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>unistr('Fecha aprobaci\00F3n')
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_APROBACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P179_FECHA_APROBACION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132544080909877841)
,p_name=>'P179_FECHA_INICIO_TRABAJO'
,p_source_data_type=>'DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_source=>'FECHA_INICIO_TRABAJO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132544157582877842)
,p_name=>'P179_FECHA_FINALIZACION'
,p_source_data_type=>'DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>unistr('Fecha finalizaci\00F3n')
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_FINALIZACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_display_when=>'P179_FECHA_FINALIZACION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132544227760877843)
,p_name=>'P179_MOTIVO_RECHAZO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>'Motivo de rechazo'
,p_source=>'MOTIVO_RECHAZO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P179_ID_ORDEN_TRABAJO IS NOT NULL',
'AND :P179_ESTADO IN (''PRESUPUESTO'',''RECHAZADO'')'))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
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
 p_id=>wwv_flow_imp.id(132544344959877844)
,p_name=>'P179_MOTIVO_CANCELACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_prompt=>unistr('Motivo cancelaci\00F3n')
,p_source=>'MOTIVO_CANCELACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P179_ID_ORDEN_TRABAJO IS NOT NULL',
'AND :P179_ESTADO IN (''EN_PROCESO'',''CANCELADO'')'))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
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
 p_id=>wwv_flow_imp.id(132544445299877845)
,p_name=>'P179_USUARIO_REGISTRO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_source=>'USUARIO_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132544583812877846)
,p_name=>'P179_FECHA_REGISTRO'
,p_source_data_type=>'DATE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(800179010)
,p_item_source_plug_id=>wwv_flow_imp.id(800179010)
,p_source=>'FECHA_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134309145426216002)
,p_name=>'Refrescar'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(800179010)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134309244998216003)
,p_event_id=>wwv_flow_imp.id(134309145426216002)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(800179010)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(155498353069448608)
,p_name=>'Refrescar facturado'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(800179209)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(155498491033448609)
,p_event_id=>wwv_flow_imp.id(155498353069448608)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'REFRESCAR'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(132543580644877836)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF TO_DATE(:P179_FECHA_ENTREGA_ESTIMADA,''DD-MM-YYYY HH24:MI'') < TO_DATE(:P179_FECHA_ENTRADA,''DD-MM-YYYY HH24:MI'') THEN',
'    raise_application_error(-20000,''Favor veriricar fecha de entrada y de entrega estimada, no corresponden.'');',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>132543580644877836
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800179302)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(800179010)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form OT'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(800179202)
,p_process_success_message=>'Orden de trabajo guardada.'
,p_internal_uid=>800179302
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800179310)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(800179010)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process Create OT'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(800179203)
,p_process_success_message=>'Presupuesto creado.'
,p_internal_uid=>800179310
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800179303)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aprobar OT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'    PKG_ORDEN_TRABAJO.P_CAMBIAR_ESTADO(:P179_ID_ORDEN_TRABAJO, ''APROBADO''); ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(800179204)
,p_internal_uid=>800179303
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800179304)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Rechazar OT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'    IF :P179_MOTIVO_RECHAZO IS NULL THEN',
'        raise_application_error(-20000,''Favor ingresar motivo del rechazo del presupuesto.'');',
'    END IF;',
'    PKG_ORDEN_TRABAJO.P_CAMBIAR_ESTADO(:P179_ID_ORDEN_TRABAJO, ''RECHAZADO'', :P179_MOTIVO_RECHAZO); ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(800179205)
,p_internal_uid=>800179304
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800179305)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Iniciar Trabajo'
,p_process_sql_clob=>'BEGIN PKG_ORDEN_TRABAJO.P_CAMBIAR_ESTADO(:P179_ID_ORDEN_TRABAJO, ''EN_PROCESO''); END;'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(800179206)
,p_internal_uid=>800179305
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800179306)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Finalizar OT'
,p_process_sql_clob=>'BEGIN PKG_ORDEN_TRABAJO.P_CAMBIAR_ESTADO(:P179_ID_ORDEN_TRABAJO, ''FINALIZADO''); END;'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(800179207)
,p_internal_uid=>800179306
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800179307)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancelar OT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P179_MOTIVO_CANCELACION IS NULL THEN',
unistr('        raise_application_error(-20000,''Favor ingresar motivo de la cancelaci\00F3n de la OT.'');'),
'    END IF;',
'',
'    PKG_ORDEN_TRABAJO.P_CAMBIAR_ESTADO(:P179_ID_ORDEN_TRABAJO, ''CANCELADO'', :P179_MOTIVO_CANCELACION);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(800179208)
,p_internal_uid=>800179307
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800179301)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(800179010)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form OT'
,p_internal_uid=>800179301
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(132543228902877833)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P179_ID_ORDEN_TRABAJO IS NULL THEN',
'    :P179_FECHA_ENTRADA := TO_CHAR(CURRENT_DATE,''DD-MM-YYYY HH24:MI'');',
'    :P179_PRIORIDAD := ''BAJA'';',
'    :P179_ESTADO := ''PRESUPUESTO'';',
'    :P179_CANTIDAD_PIEZAS := 1;',
'    :P179_SUC_ID_SUCURSAL := :APP_ID_SUCURSAL;',
'    :P179_MON_ID_MONEDA := :APP_ID_MONEDA_PRINCIPAL;',
'    :P179_TIPO_CAMBIO := 1;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>132543228902877833
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800179325)
,p_process_sequence=>25
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar ID Factura'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P179_ID_ORDEN_TRABAJO IS NOT NULL THEN',
'        SELECT MIN(FAC_ID_FACTURA_VENTA)',
'          INTO :P179_FAC_ID_FACTURA_VENTA',
'          FROM OT_FACTURA_VENTA',
'         WHERE OT_ID_ORDEN_TRABAJO = :P179_ID_ORDEN_TRABAJO;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>800179325
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(800179320)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ver_pdf'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  vl_vNomReporte VARCHAR2(255);',
'BEGIN',
'  vl_vNomReporte := ''PRESUPUESTO_OT'';',
'',
'  pkg_jasperreports_server.descarga_reporte(p_vNomReporte  => vl_vNomReporte',
'                                           ,p_aNomParams   => apex_util.string_to_table(''P_ID_ORDEN_TRABAJO'')',
'                                           ,p_aValParams   => apex_util.string_to_table(apex_application.g_x01)',
'                                            );',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>800179320
);
wwv_flow_imp.component_end;
end;
/
