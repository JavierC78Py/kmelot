prompt --application/pages/page_00145
begin
--   Manifest
--     PAGE: 00145
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
 p_id=>145
,p_name=>'Licitaciones'
,p_alias=>'LICITACIONES'
,p_step_title=>'Licitaciones'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#mascara_fecha#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function verPDF(){',
'    apex.navigation.openInNewWindow(',
'    apex.server.url( {',
'        p_request: "application_process=VerPDF"',
'        })',
'    );',
'}',
'function cambiaInteres(idLici) {',
'    apex.item("P145_P_ID_LICITACION").setValue(idLici);',
'    apex.theme.openRegion("REG_DEFINIR_INTERES");',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'mascaraFechaRegex("#P145_INSERTADOS_DESDE");',
'mascaraFechaRegex("#P145_INSERTADOS_HASTA");'))
,p_css_file_urls=>'#WORKSPACE_IMAGES#template-floating-minimalista.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'.fa-check,.fa-remove,fa-pie-chart-100{',
'	display: none;',
'}*/',
'.fa-check.check-SI{',
'	display: block !important;',
'	color: green;',
'}',
'.fa-remove.check-NO{',
'	display: block !important;',
'	color: red;',
'}',
'.fa-pie-chart-100{',
'	display: block !important;',
'	color: yellow;',
'}',
'',
'#REG_LICITACIONES th[headers="FECHA_INSERT"],',
'#REG_LICITACIONES td[headers="FECHA_INSERT"],',
'#REG_LICITACIONES th[headers="FECHA_ENTREGA_OFERTA"],',
'#REG_LICITACIONES td[headers="FECHA_ENTREGA_OFERTA"],',
'#REG_LICITACIONES th[headers="FECHA_PUBLICACION_CONVOCATORIA"],',
'#REG_LICITACIONES td[headers="FECHA_PUBLICACION_CONVOCATORIA"],',
'#REG_LICITACIONES th[headers="FECHA_CONTRATACION"],',
'#REG_LICITACIONES td[headers="FECHA_CONTRATACION"],',
'#REG_LICITACIONES th[headers="FECHA_FIN_ADJUDICACION"],',
'#REG_LICITACIONES td[headers="FECHA_FIN_ADJUDICACION"]',
'{',
'  width: 140px !important;',
'  max-width: 140px !important;',
'  white-space: nowrap;',
'  overflow: hidden;',
'  text-overflow: ellipsis;',
'}',
'/*Barra desplazamiento superior*/',
'.t-fht-thead{',
'  overflow: auto !important;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(17504168320439176)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17355794169376942)
,p_plug_name=>'Licitaciones'
,p_region_name=>'REG_LICITACIONES'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_LICITACION,',
'       FECHA_INSERT,',
'       USUARIO_INSERT,',
'       CONVOCATORIA_SLUG,',
'       NRO_LICITACION,',
'       NOMBRE_LICITACION,',
'       TIPO_PROCEDIMIENTO,',
'       CATEGORIA,',
'       CONVOCANTE,',
'       ENT_ID_ENTIDAD_CONVOCANTE,',
'       ETA_ID_ETAPA,',
'       FECHA_ENTREGA_OFERTA,',
'       TIPO_LICITACION,',
'       FECHA_ESTIMADA,',
'       FECHA_PUBLICACION_CONVOCATORIA,',
'       ENT_ID_ENTIDAD_VENDEDOR,',
'       FECHA_VISITA_TECNICA,',
'       OBSERVACION,',
'       TIPO_DE_GARANTIA,',
'       FECHA_CONTRATACION,',
'       FECHA_FIN_ADJUDICACION,',
'       CODIGO_CONTRATACION,',
'       MON_ID_MONEDA,',
'       TIPO_CAMBIO,',
'       MONTO_ADJUDICADO,',
'       EMISION_DEL_CC,',
'       CASE ETA_ID_ETAPA ',
'            WHEN ''CONV'' THEN ''color: #239B56!important;font-weight: bold!important;'' ',
'            WHEN ''ADJU'' THEN ''color: #04e014!important;font-weight: bold!important;'' 	',
'            WHEN ''1'' THEN ''color: #B03A2E!important;font-weight: bold!important;'' END style_etapa,',
'       CASE ES_DE_INTERES ',
'            WHEN 0 THEN ',
'            ''<span aria-hidden="true" class="fa fa-remove" style="color: red;" onclick="cambiaInteres(''||ID_LICITACION||'')" title="<NO> es de interes"></span>'' ',
'            WHEN 1 THEN ',
'            ''<span aria-hidden="true" class="fa fa-check" style="color: green;" onclick="cambiaInteres(''||ID_LICITACION||'')" title="<SI> es de interes"></span>'' ',
'            ELSE',
'            ''<span aria-hidden="true" class="fa fa-pie-chart-100" style="color: yelow;" onclick="cambiaInteres(''||ID_LICITACION||'')" title="Interes sin definir"></span>'' ',
'            END link_de_interes,',
'       MONTO_ESTIMADO,',
'       (',
'        SELECT /*+ INDEX(cf CAB_FACTURA_VENTA_IDX2)*/ Sum(cf.monto) AS facturdo',
'        FROM cab_factura_venta cf',
'        WHERE cf.lic_id_licitacion = L.ID_LICITACION',
'        AND cf.estado = ''ACTIVO''',
'        AND cf.id_factura_venta != cf.nro_factura ) AS FACTURADO,',
'       ( ',
'        SELECT /*+ INDEX(cf CAB_FACTURA_VENTA_IDX2)*/Sum(cf.saldo) AS saldo_factura',
'        FROM cab_factura_venta cf',
'        WHERE cf.lic_id_licitacion = L.ID_LICITACION',
'        AND cf.estado = ''ACTIVO''',
'        AND cf.id_factura_venta != cf.nro_factura ) AS SALDO_FACTURA',
'',
'',
'  from LICITACION L',
'  where ((:P145_P_NRO_LICITACION is not null and L.NRO_LICITACION = :P145_P_NRO_LICITACION)',
'  or (:P145_P_NRO_LICITACION is null',
'    and ((:P145_INTERES = ''SI'' and L.ES_DE_INTERES = 1 and l.ETA_ID_ETAPA = ''CONV'' and L.FECHA_ENTREGA_OFERTA >= trunc(current_date))',
'    or :P145_INTERES = ''NO'')',
'  and (:P145_INSERTADOS_HOY = ''NO'' or trunc(L.FECHA_INSERT) = trunc(CURRENT_DATE))',
'  and (:P145_INSERTADOS_DESDE IS NULL or (trunc(L.FECHA_INSERT) >= :P145_INSERTADOS_DESDE))',
'  and (:P145_INSERTADOS_HASTA IS NULL or (trunc(L.FECHA_INSERT) <= :P145_INSERTADOS_HASTA))',
'  ))  ',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P145_INSERTADOS_HOY,P145_INSERTADOS_DESDE,P145_INSERTADOS_HASTA,P145_P_NRO_LICITACION,P145_INTERES'
,p_prn_page_header=>'Licitaciones'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(17355814767376942)
,p_name=>'Licitaciones'
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
,p_detail_link=>'f?p=&APP_ID.:146:&APP_SESSION.::&DEBUG.:RP:P146_ID_LICITACION:\#ID_LICITACION#\'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>17355814767376942
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17356533330376948)
,p_db_column_name=>'ID_LICITACION'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id Licitacion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17356928619376949)
,p_db_column_name=>'FECHA_INSERT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Fecha insertado'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_static_id=>'FECHA_INSERT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17357304043376949)
,p_db_column_name=>'USUARIO_INSERT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Usuario inserto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17357700001376949)
,p_db_column_name=>'CONVOCATORIA_SLUG'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Convocatoria Slug'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17358178192376950)
,p_db_column_name=>'NRO_LICITACION'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>unistr('Nro. Licitaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17358588452376950)
,p_db_column_name=>'NOMBRE_LICITACION'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>unistr('Nombre licitaci\00F3n')
,p_column_type=>'STRING'
,p_static_id=>'NOMBRE_LICITACION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17358951627376950)
,p_db_column_name=>'TIPO_PROCEDIMIENTO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Tipo procedimiento'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17359351363376950)
,p_db_column_name=>'CATEGORIA'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Categoria'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17359785831376950)
,p_db_column_name=>'CONVOCANTE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Convocante'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17360544384376951)
,p_db_column_name=>'ETA_ID_ETAPA'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Etapa'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span style="#STYLE_ETAPA#">#ETA_ID_ETAPA#</span>',
''))
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17360933070376951)
,p_db_column_name=>'FECHA_ENTREGA_OFERTA'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Fecha entrega oferta'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_static_id=>'FECHA_ENTREGA_OFERTA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17361335256376951)
,p_db_column_name=>'TIPO_LICITACION'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>unistr('Tipo licitaci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17361711518376951)
,p_db_column_name=>'FECHA_ESTIMADA'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Fecha estimada'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17362125398376952)
,p_db_column_name=>'FECHA_PUBLICACION_CONVOCATORIA'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>unistr('Fecha publicaci\00F3n convocatoria ')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_static_id=>'FECHA_PUBLICACION_CONVOCATORIA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17362970862376952)
,p_db_column_name=>'FECHA_VISITA_TECNICA'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>unistr('Fecha visita t\00E9cnica ')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17363324013376952)
,p_db_column_name=>'OBSERVACION'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17363729630376953)
,p_db_column_name=>'TIPO_DE_GARANTIA'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>unistr('Tipo de garant\00EDa')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17364179161376953)
,p_db_column_name=>'FECHA_CONTRATACION'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>unistr('Fecha contrataci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_static_id=>'FECHA_CONTRATACION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17364589599376953)
,p_db_column_name=>'FECHA_FIN_ADJUDICACION'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>unistr('Fecha fin adjudicaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_static_id=>'FECHA_FIN_ADJUDICACION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17364921951376953)
,p_db_column_name=>'CODIGO_CONTRATACION'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>unistr('Codigo contrataci\00F3n (CC)')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17365720542376954)
,p_db_column_name=>'TIPO_CAMBIO'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Tipo Cambio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17366150932376954)
,p_db_column_name=>'MONTO_ADJUDICADO'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Monto adjudicado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17408026473706203)
,p_db_column_name=>'ENT_ID_ENTIDAD_CONVOCANTE'
,p_display_order=>36
,p_column_identifier=>'AA'
,p_column_label=>'Id convocante'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17408198723706204)
,p_db_column_name=>'ENT_ID_ENTIDAD_VENDEDOR'
,p_display_order=>46
,p_column_identifier=>'AB'
,p_column_label=>'Ent Id Entidad Vendedor'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17408279408706205)
,p_db_column_name=>'MON_ID_MONEDA'
,p_display_order=>56
,p_column_identifier=>'AC'
,p_column_label=>'Mon Id Moneda'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17408374023706206)
,p_db_column_name=>'STYLE_ETAPA'
,p_display_order=>66
,p_column_identifier=>'AD'
,p_column_label=>'Style Etapa'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17409091664706213)
,p_db_column_name=>'LINK_DE_INTERES'
,p_display_order=>76
,p_column_identifier=>'AG'
,p_column_label=>unistr('\00BFEs de interes?')
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15932962159247306)
,p_db_column_name=>'MONTO_ESTIMADO'
,p_display_order=>86
,p_column_identifier=>'AH'
,p_column_label=>'Monto estimado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20336834984072406)
,p_db_column_name=>'EMISION_DEL_CC'
,p_display_order=>96
,p_column_identifier=>'AI'
,p_column_label=>'Emision Del Cc'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35473841983696040)
,p_db_column_name=>'FACTURADO'
,p_display_order=>106
,p_column_identifier=>'AJ'
,p_column_label=>'Facturado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(35473952051696041)
,p_db_column_name=>'SALDO_FACTURA'
,p_display_order=>116
,p_column_identifier=>'AK'
,p_column_label=>'Saldo factura'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(17369370391388048)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'173694'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NRO_LICITACION:CODIGO_CONTRATACION:LINK_DE_INTERES:NOMBRE_LICITACION:CATEGORIA:CONVOCANTE:ETA_ID_ETAPA:MONTO_ESTIMADO:MONTO_ADJUDICADO:FACTURADO:SALDO_FACTURA:FECHA_ENTREGA_OFERTA:TIPO_LICITACION:FECHA_ESTIMADA:FECHA_PUBLICACION_CONVOCATORIA:FECHA_VI'
||'SITA_TECNICA:TIPO_DE_GARANTIA:FECHA_CONTRATACION:FECHA_FIN_ADJUDICACION:'
,p_sort_column_1=>'NRO_LICITACION'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17368383242376956)
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
 p_id=>wwv_flow_imp.id(17409111865706214)
,p_plug_name=>unistr('Cambiar nivel de inter\00E9s')
,p_region_name=>'REG_DEFINIR_INTERES'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17410110709706224)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>30
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15933314110247310)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(17355794169376942)
,p_button_name=>'Filtrar'
,p_button_static_id=>'BTN_FILTRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--gapTop'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Filtrar'
,p_button_execute_validations=>'N'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17409395446706216)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(17409111865706214)
,p_button_name=>'BTN_INT_RETORNAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17409821736706221)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(17409111865706214)
,p_button_name=>'BTN_INT_APLICAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15933563491247312)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(17355794169376942)
,p_button_name=>'PDF_DEFINIR_INTERES'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Definir interes'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'javascript:verPDF()'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17407902804706202)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(17355794169376942)
,p_button_name=>'IMPORTAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Importar'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:144:&SESSION.::&DEBUG.:144::'
,p_icon_css_classes=>'fa-file-csv-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17367018063376954)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(17355794169376942)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:146:&APP_SESSION.::&DEBUG.:146::'
,p_security_scheme=>wwv_flow_imp.id(17503746568436951)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15933103412247308)
,p_name=>'P145_INSERTADOS_DESDE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(17355794169376942)
,p_prompt=>'Insertados desde'
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
 p_id=>wwv_flow_imp.id(15933295084247309)
,p_name=>'P145_INSERTADOS_HASTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(17355794169376942)
,p_prompt=>'Insertados hasta'
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
 p_id=>wwv_flow_imp.id(15933409508247311)
,p_name=>'P145_INTERES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(17355794169376942)
,p_prompt=>'Solo con interes'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'NO',
  'off_value', 'NO',
  'on_label', 'SI',
  'on_value', 'SI',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17408481692706207)
,p_name=>'P145_INSERTADOS_HOY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17355794169376942)
,p_prompt=>'Insertados hoy'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'NO',
  'off_value', 'NO',
  'on_label', 'SI',
  'on_value', 'SI',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17409289317706215)
,p_name=>'P145_DEFINIR_INTERES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17409111865706214)
,p_prompt=>'Nivel :'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC2:Con inter\00E9s;1,Sin interes;0')
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Sin definir'
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '3',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17410200906706225)
,p_name=>'P145_P_ID_LICITACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17410110709706224)
,p_prompt=>'P Id Licitacion'
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
 p_id=>wwv_flow_imp.id(20336789154072405)
,p_name=>'P145_P_NRO_LICITACION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(17355794169376942)
,p_prompt=>unistr('Nro. Licitaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17367359082376955)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(17355794169376942)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17367811727376956)
,p_event_id=>wwv_flow_imp.id(17367359082376955)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(17355794169376942)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17408549438706208)
,p_name=>'Refrescar'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P145_INSERTADOS_HOY,P145_INTERES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17408633428706209)
,p_event_id=>wwv_flow_imp.id(17408549438706208)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17409415921706217)
,p_name=>'Retorna'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(17409395446706216)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17409535555706218)
,p_event_id=>wwv_flow_imp.id(17409415921706217)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(17409111865706214)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(17412649014706249)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P145_INSERTADOS_HOY IS NULL THEN',
'    :P145_INSERTADOS_HOY := ''NO'';',
'END IF;',
'IF :P145_INTERES IS NULL THEN',
'    :P145_INTERES := ''NO'';',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>17412649014706249
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20336388766072401)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar fecha'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P145_INSERTADOS_HASTA < :P145_INSERTADOS_DESDE THEN',
'    RAISE_APPLICATION_ERROR(-20000,''Favor verificar fecha desde y hasta, valores no apropiados.'');',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>20336388766072401
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(17410330623706226)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualiza interes'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE licitacion l',
'    SET l.es_de_interes = :P145_DEFINIR_INTERES',
'    WHERE l.id_licitacion = :P145_P_ID_LICITACION;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(17409821736706221)
,p_internal_uid=>17410330623706226
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15933675926247313)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'VerPDF'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'vl_vNomReporte VARCHAR2(255);',
'v_nombre_empresa    parametros.razon_social%type;',
'v_usuario           usuarios.usuario%type;',
'BEGIN',
'    select p.razon_social',
'    into v_nombre_empresa',
'    from parametros p',
'    where p.id_parametro = 1;',
'    v_usuario := :APP_USER;',
'    vl_vNomReporte := ''LICITACION_CON_INTERES'';',
'    pkg_jasperreports_server.descarga_reporte(p_vNomReporte  => vl_vNomReporte,',
'                                              p_aNomParams   => apex_util.string_to_table(''P_NOMBRE_EMPRESA:P_USUARIO''),',
'                                              p_aValParams   => apex_util.string_to_table( v_nombre_empresa||'':''||v_usuario ));',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>15933675926247313
);
wwv_flow_imp.component_end;
end;
/
