prompt --application/pages/page_00152
begin
--   Manifest
--     PAGE: 00152
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
 p_id=>152
,p_name=>unistr('Art\00EDculos licitaci\00F3n')
,p_alias=>unistr('ART\00CDCULOS-LICITACI\00D3N')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Art\00EDculos licitaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    if (!apex.item("P152_P_ID_LICITACION").isEmpty()){',
'        $("#P152_P_ID_LICITACION_VIEW").attr("tabindex", "-1");',
'        $("#P152_P_ID_LICITACION_VIEW").prop("disabled", true);',
'    }',
'},300)'))
,p_css_file_urls=>'#WORKSPACE_IMAGES#template-floating-minimalista.min.css'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15934085797247317)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15934802803247325)
,p_plug_name=>'Eliminar productos'
,p_region_template_options=>'#DEFAULT#:js-dialog-size480x320'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>30
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23988806003465561)
,p_plug_name=>unistr('Art\00EDculos licitaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_DET_LICITACION,',
'       FECHA_INSERT,',
'       LIC_ID_LICITACION,',
'       ETA_ID_ETAPA,',
'       ID,',
'       NUMERO,',
'       PRODUCTO_CODIGO,',
'       PRODUCTO_NOMBRE_CATALOGO,',
'       PRODUCTO_NOMBRE_CONVOCANTE,',
'       PRECIO_UNITARIO,',
'       CANTIDAD_MINIMA,',
'       CANTIDAD,',
'       MONTO_MINIMO,',
'       MONTO,',
'       MONEDA,',
'       A_UNIDAD_MEDIDA,',
'       UNIDAD_MEDIDA,',
'       A_PRESENTACION,',
'       PRESENTACION,',
'       ZONA,',
'       A_CONTRATO_ABIERTO,',
'       CONTRATO_ABIERTO,',
'       ABASTECIMIENTO_SIMULTANEO,',
'       SUB_ITEM,',
'       PLANTILLA,',
'       ESTADO_IMPUGNACION,',
'       LOTE',
'  from LICITACION_DET_PRODUCTO',
'  where :P152_P_ID_LICITACION_VIEW is null or LIC_ID_LICITACION = :P152_P_ID_LICITACION_VIEW'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P152_P_ID_LICITACION_VIEW'
,p_prn_page_header=>unistr('Art\00EDculos licitaci\00F3n')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(23988987530465561)
,p_name=>unistr('Art\00EDculos licitaci\00F3n')
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
,p_detail_link=>'f?p=&APP_ID.:153:&APP_SESSION.::&DEBUG.:RP:P153_ID_DET_LICITACION:\#ID_DET_LICITACION#\'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>23988987530465561
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23989675248465564)
,p_db_column_name=>'ID_DET_LICITACION'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id Det Licitacion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23990051048465564)
,p_db_column_name=>'FECHA_INSERT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Fecha insertado'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23990814253465565)
,p_db_column_name=>'ETA_ID_ETAPA'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Etapa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23991217968465565)
,p_db_column_name=>'ID'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Id'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23991667233465565)
,p_db_column_name=>'NUMERO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00FAmero')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23992056269465565)
,p_db_column_name=>'PRODUCTO_CODIGO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>unistr('Producto c\00F3digo')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23992410453465565)
,p_db_column_name=>'PRODUCTO_NOMBRE_CATALOGO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Producto nombre catalogo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23992859214465566)
,p_db_column_name=>'PRODUCTO_NOMBRE_CONVOCANTE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Producto nombre nonvocante'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23993252675465566)
,p_db_column_name=>'PRECIO_UNITARIO'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Precio unitario'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23993626927465566)
,p_db_column_name=>'CANTIDAD_MINIMA'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Cantidad minima'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23994046449465566)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23994481887465566)
,p_db_column_name=>'MONTO_MINIMO'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Monto minimo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23994816193465567)
,p_db_column_name=>'MONTO'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Monto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23995226005465567)
,p_db_column_name=>'MONEDA'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Moneda'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23996001282465567)
,p_db_column_name=>'UNIDAD_MEDIDA'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Unidad Medida'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23996855498465567)
,p_db_column_name=>'PRESENTACION'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>unistr('Presentaci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23997210207465568)
,p_db_column_name=>'ZONA'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Zona'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23998080377465568)
,p_db_column_name=>'CONTRATO_ABIERTO'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Contrato abierto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23998439184465568)
,p_db_column_name=>'ABASTECIMIENTO_SIMULTANEO'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Abastecimiento simultaneo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23998898788465568)
,p_db_column_name=>'SUB_ITEM'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Sub item'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23999271665465569)
,p_db_column_name=>'PLANTILLA'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Plantilla'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23999651624465569)
,p_db_column_name=>'ESTADO_IMPUGNACION'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>unistr('Estado impugnaci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20338457397072422)
,p_db_column_name=>'LIC_ID_LICITACION'
,p_display_order=>36
,p_column_identifier=>'AA'
,p_column_label=>unistr('Id licitaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33798055408669529)
,p_db_column_name=>'LOTE'
,p_display_order=>46
,p_column_identifier=>'AB'
,p_column_label=>'Lote'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35471205011696014)
,p_db_column_name=>'A_UNIDAD_MEDIDA'
,p_display_order=>56
,p_column_identifier=>'AC'
,p_column_label=>'A Unidad Medida'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35471398558696015)
,p_db_column_name=>'A_PRESENTACION'
,p_display_order=>66
,p_column_identifier=>'AD'
,p_column_label=>'A Presentacion'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35471446903696016)
,p_db_column_name=>'A_CONTRATO_ABIERTO'
,p_display_order=>76
,p_column_identifier=>'AE'
,p_column_label=>'A Contrato Abierto'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(24002450396479281)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'240025'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'LIC_ID_LICITACION:ETA_ID_ETAPA:LOTE:NUMERO:PRODUCTO_CODIGO:PRODUCTO_NOMBRE_CATALOGO:PRODUCTO_NOMBRE_CONVOCANTE:PRECIO_UNITARIO:CANTIDAD:MONTO:MONEDA'
,p_sort_column_1=>'LOTE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'NUMERO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'LIC_ID_LICITACION:ETA_ID_ETAPA'
,p_break_enabled_on=>'LIC_ID_LICITACION:ETA_ID_ETAPA'
,p_sum_columns_on_break=>'MONTO'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(33935234327519296)
,p_report_id=>wwv_flow_imp.id(24002450396479281)
,p_group_by_columns=>'LIC_ID_LICITACION:ETA_ID_ETAPA'
,p_function_01=>'SUM'
,p_function_column_01=>'MONTO'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Monto etapa'
,p_function_format_mask_01=>'999G999G999G999G999G999G990'
,p_function_sum_01=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15935289690247329)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(15934802803247325)
,p_button_name=>'BTN_RETORNA_ELIMINAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15935559823247332)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(15934802803247325)
,p_button_name=>'BTN_ELIMINAR_ETAPA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_security_scheme=>wwv_flow_imp.id(24003304608483376)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28163178522297210)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(23988806003465561)
,p_button_name=>'BTN_FACTURAR'
,p_button_static_id=>'BTN_FACTURAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>unistr('Facturar art\00EDculos')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'FROM licitacion_det_producto l',
'WHERE l.lic_id_licitacion = :P152_P_ID_LICITACION',
'AND l.eta_id_etapa IN (''ADJU'',''FINI'')',
'FETCH FIRST 1 ROW ONLY'))
,p_button_condition_type=>'EXISTS'
,p_security_scheme=>wwv_flow_imp.id(89028911658486423)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15934561643247322)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(23988806003465561)
,p_button_name=>'BTN_ELIMINAR'
,p_button_static_id=>'BTN_ELIMINAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar registros'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'FROM licitacion_det_producto l',
'WHERE l.lic_id_licitacion = :P152_P_ID_LICITACION',
'FETCH FIRST 1 ROW ONLY'))
,p_button_condition_type=>'EXISTS'
,p_security_scheme=>wwv_flow_imp.id(24003304608483376)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15934311114247320)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(23988806003465561)
,p_button_name=>'BTN_IMPORTAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Importar'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:151:&SESSION.::&DEBUG.:151:P151_P_ETAPA,P151_P_ID_LICITACION:&P152_P_ETAPA.,&P152_P_ID_LICITACION.'
,p_button_condition=>'P152_P_ID_LICITACION_VIEW'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-file-csv-o'
,p_security_scheme=>wwv_flow_imp.id(24003578637485965)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24000106722465569)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(23988806003465561)
,p_button_name=>'CREATE'
,p_button_static_id=>'BTN_CREAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:153:&SESSION.::&DEBUG.:153:P153_ETA_ID_ETAPA,P153_LIC_ID_LICITACION:&P152_P_ETAPA.,&P152_P_ID_LICITACION.'
,p_button_condition=>'P152_P_ID_LICITACION_VIEW'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(24003578637485965)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15934215973247319)
,p_name=>'P152_P_ID_LICITACION_VIEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(23988806003465561)
,p_prompt=>unistr('Licitaci\00F3n')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT l.nro_licitacion||'' CC: ''||l.codigo_contratacion||'' - ''||l.convocante AS d',
'    ,l.id_licitacion AS r',
'FROM licitacion l',
'WHERE :P152_P_ID_LICITACION IS NULL OR l.id_licitacion = :P152_P_ID_LICITACION',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Todos'
,p_lov_cascade_parent_items=>'P152_P_ID_LICITACION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
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
  'title', 'Licitaciones',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15934963826247326)
,p_name=>'P152_ETAPA_ELIMINAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(15934802803247325)
,p_prompt=>'Etapa Eliminar'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT l.eta_id_etapa AS d, l.eta_id_etapa AS r',
'FROM licitacion_det_producto l',
'WHERE l.lic_id_licitacion = :P152_P_ID_LICITACION'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Todos'
,p_lov_cascade_parent_items=>'P152_P_ID_LICITACION_VIEW'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20338923820072427)
,p_name=>'P152_P_ETAPA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(15934085797247317)
,p_prompt=>'P Etapa'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20339226503072430)
,p_name=>'P152_P_ID_LICITACION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(15934085797247317)
,p_prompt=>unistr('Licitaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33798203108669531)
,p_name=>'P152_ETAPA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(23988806003465561)
,p_prompt=>'Etapa'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24000441070465569)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(23988806003465561)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24000962681465570)
,p_event_id=>wwv_flow_imp.id(24000441070465569)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(23988806003465561)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15935055436247327)
,p_name=>'Ver etapa'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(15934561643247322)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15935182767247328)
,p_event_id=>wwv_flow_imp.id(15935055436247327)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(15934802803247325)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15935301185247330)
,p_name=>'Regresa'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(15935289690247329)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15935493862247331)
,p_event_id=>wwv_flow_imp.id(15935301185247330)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(15934802803247325)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15935690073247333)
,p_name=>'Eliminar etapa'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(15935559823247332)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15936130685247338)
,p_event_id=>wwv_flow_imp.id(15935690073247333)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('Confirma la eliminaci\00F3n?')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15935757344247334)
,p_event_id=>wwv_flow_imp.id(15935690073247333)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.submit( { request: "ELIMINAR_ETAPA", showWait: true} );'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20339329687072431)
,p_name=>'Filtrar'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_P_ID_LICITACION_VIEW'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20339481108072432)
,p_event_id=>wwv_flow_imp.id(20339329687072431)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28163220559297211)
,p_name=>'Ia a 159'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(28163178522297210)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28163385349297212)
,p_event_id=>wwv_flow_imp.id(28163220559297211)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.FOS.REDIRECT'
,p_attribute_01=>'static'
,p_attribute_02=>'f?p=&APP_ID.:159:&SESSION.::&DEBUG.:159:P159_P_ID_LICITACION:&P152_P_ID_LICITACION.'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15935800681247335)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar etapa'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE licitacion_det_producto',
'WHERE lic_id_licitacion = :P152_P_ID_LICITACION',
'AND (:P152_ETAPA_ELIMINAR IS NULL OR eta_id_etapa = :P152_ETAPA_ELIMINAR);'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ELIMINAR_ETAPA'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>15935800681247335
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20339518342072433)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P152_ETAPA := :P152_P_ETAPA;',
'IF :P152_P_ID_LICITACION IS NOT NULL THEN',
'    :P152_P_ID_LICITACION_VIEW := :P152_P_ID_LICITACION;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>20339518342072433
);
wwv_flow_imp.component_end;
end;
/
