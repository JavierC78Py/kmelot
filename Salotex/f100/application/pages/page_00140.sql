prompt --application/pages/page_00140
begin
--   Manifest
--     PAGE: 00140
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
 p_id=>140
,p_name=>'Consultas - reservas'
,p_alias=>'CONSULTAS-RESERVAS'
,p_step_title=>'Consultas - reservas'
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function eliminar(regEliminar){',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("eliminar_srv", {',
'        x01:regEliminar',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.region("REG_SRV_REALIZADOS").refresh();',
'            } else {',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }',
'        }',
'    }).always( function() {',
'        waitPopup.remove();',
'    });    ',
'}',
'function agregar_srv(){',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("agregar_srv", {',
'        pageItems: [',
'         "P140_P_ID_RESERVA"',
'        ,"P140_D_ID_NOMENCLADOR"',
'        ,"P140_D_ID_VISACION"',
'        ,"P140_D_PORC_COBERTURA"',
'        ]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.region("REG_SRV_REALIZADOS").refresh();                ',
'            } else {',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }',
'        }',
'    }).always( function() {',
'        waitPopup.remove();',
'    });    ',
'}',
'function guardarCelular(){',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("guardar_celular", {',
'        pageItems: [',
'            "P140_P_ID_RESERVA_CONSULTA"',
'            ,"P140_P_NUEVO_CELULAR"',
'        ]',
'    },',
'    {       ',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.theme.closeRegion("REG_ACTUALIZA_CELULAR");',
'                apex.region("REG_DATOS_DE_RESERVA").refresh();',
'            } else {      ',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.message,',
'                        unsafe: false',
'                    }',
'                ]);',
'            }       ',
'        }',
'    }).always( function() {',
'        waitPopup.remove();',
'    });',
'}',
'function actualizaCelular(){',
'    apex.theme.openRegion("REG_ACTUALIZA_CELULAR");',
'}',
'function marcaSalida(id_reserva, marca_salida, id_prestador, id_paciente, id_empresa){',
'    if (marca_salida == ''NO'') {',
'        apex.item("P140_P_ID_RESERVA").setValue(id_reserva);',
'        apex.item("P140_P_ID_PRESTADOR").setValue(id_prestador);',
'        apex.item("P140_P_ID_EMPRESA").setValue(id_empresa);',
'        apex.item("P140_ID_NOMENCLADOR").setValue();',
'        apex.item("P140_ID_NOMENCLADOR").refresh();',
'        apex.region("REG_SRV_REALIZADOS").refresh();',
'        apex.theme.openRegion(''REG_MARCA_ATENDIDO'');',
'    }',
'}',
'function procesaSalida(){',
unistr('    apex.message.confirm(''\00BFMarcar la salida del paciente de la consulta?'', function( okPressed ) {'),
'        if ( okPressed ) {',
'            var waitPopup = apex.widget.waitPopup();',
'            apex.message.clearErrors(); ',
'            apex.server.process("marcar_salida", {',
'                pageItems: [',
'                     "P140_P_ID_RESERVA"',
'                    ,"P140_ID_NOMENCLADOR"',
'                    ,"P140_COD_AUTORIZACION"',
'                ]',
'            },',
'            {       ',
'                success: function( data ) {',
'                    if ( data.success === true ) {',
'                        for (var i=0; i < data.items.length; i++){',
'                            apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                        }',
'                        apex.region("REG_ESPERA").refresh();',
'                    } else {      ',
'                        apex.message.showErrors([',
'                            {',
'                                type: "error",',
'                                location: "page",',
'                                message: data.message,',
'                                unsafe: false',
'                            }',
'                        ]);',
'                    }       ',
'                }',
'            }).always( function() {',
'                waitPopup.remove();',
'            });            ',
'        }',
'    })    ',
'}',
'function guardaSalida(){',
'    if (apex.item("P140_COD_AUTORIZACION").isEmpty()){',
unistr('        apex.message.confirm(''\00BFDesea continua sin ingresar cod. autorizaci\00F3n?'', function( okPressed ) {'),
'            if (okPressed)',
'                procesaSalida()',
'            }',
'        );',
'    } else {',
'        procesaSalida()',
'    }',
'}',
'function marcaEntrada(id_reserva, marca_entrada){',
'    if (marca_entrada == ''NO'') {',
unistr('        apex.message.confirm(''\00BFMarcar la entrada del paciente a la consulta?'', function( okPressed ) {'),
'            if ( okPressed ) {',
'                var waitPopup = apex.widget.waitPopup();',
'                apex.message.clearErrors(); ',
'                apex.server.process("marcar_entrada", {',
'                    x01: id_reserva',
'                },',
'                {       ',
'                    success: function( data ) {',
'                        if ( data.success === true ) {',
'                            for (var i=0; i < data.items.length; i++){',
'                                apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                            }',
'                            apex.region("REG_ESPERA").refresh();',
'                        } else {      ',
'                            apex.message.showErrors([',
'                                {',
'                                    type: "error",',
'                                    location: "page",',
'                                    message: data.message,',
'                                    unsafe: false',
'                                }',
'                            ]);',
'                        }       ',
'                    }',
'                }).always( function() {',
'                    waitPopup.remove();',
'                });            ',
'            }',
'        })',
'    }    ',
'}',
''))
,p_css_file_urls=>'#WORKSPACE_IMAGES#template-floating-minimalista.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#REG_ESPERA_control_panel, #REG_FINALIZADOS_control_panel {',
'    display: none;',
'}',
'#t_Body_side {',
'    width: 300px;',
'}',
'.t-MediaList-itemWrap {',
'    padding-left: 0px;',
'    padding-right: 0px;',
'    grid-gap: 0;',
'}',
'.t-MediaList-item:nth-of-type(odd) {  ',
'    background-color: rgb(209, 241, 234) !important;',
'}',
'.t-BreadcrumbRegion {',
'    padding-bottom: 5px;',
'    padding-top: 5px;',
'}',
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}',
'#P140_AM_PM {   ',
'    margin-top: 0px !important;',
'}',
'#REG_DATOS_DE_RESERVA .t-AVPList-label {',
'    padding-top: 0px;',
'    padding-bottom: 0px;',
'    padding-right: 0px;',
'    border-bottom-width: 0px;',
'    font-weight: bold',
'}',
'#REG_DATOS_DE_RESERVA .t-AVPList-value {',
'    padding-top: 0px;',
'    padding-bottom: 0px;',
'    padding-right: 0px;',
'    border-bottom-width: 0px;',
'}',
'/* Scroll Results Only in Side Column */',
'.t-Body-side {',
'    display: flex;',
'    flex-direction: column;',
'    overflow: hidden;',
'}',
'.search-results {',
'    flex: 1;',
'    overflow: auto;',
'}',
'/* Format Search Region */',
'.search-region {',
'    border-bottom: 1px solid rgba(0,0,0,.1);',
'    flex-shrink: 0;',
'    padding: 8px!important;',
'}',
'',
'.t-MediaList-badge {',
'    background-color: transparent;',
'    padding: 0;',
'}',
'.t-MediaList-item a {',
'    padding-top: 0;',
'    padding-bottom : 0;',
'}',
'/*registros pares*/',
'',
'.apex_disabled {',
'    opacity: 100%!important;',
'}',
'',
'#REG_DATOS_SC {     background-color: rgb(127, 86, 127) !important; }'))
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202489890410789404)
,p_plug_name=>'Confirma asistencia'
,p_region_name=>'REG_CONF_ASISTENCIA'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>101
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202491471682789420)
,p_plug_name=>unistr('Marcar recepci\00F3n')
,p_region_name=>'REG_MARCAR_RECEPCION'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>111
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(280406745995414926)
,p_plug_name=>unistr('Informaci\00F3n en SC')
,p_region_name=>'REG_DATOS_SC'
,p_parent_plug_id=>wwv_flow_imp.id(202491471682789420)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202977327568475101)
,p_plug_name=>'Reservas'
,p_region_name=>'REG_CONSULTAS'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--fillLabels:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>31
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_display_condition_type=>'NEVER'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'NO')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202492618212789432)
,p_plug_name=>'Sala espera'
,p_region_name=>'REG_ESPERA'
,p_parent_plug_id=>wwv_flow_imp.id(202977327568475101)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT to_char(r.fecha_turno,''hh24:mi'') turno',
'      ,to_char(r.hora_recepcion,''hh24:mi'') recepcion',
'      ,CASE WHEN r.hora_entrada_consulta IS NULL THEN',
'            ''<span aria-hidden="true" title="Hora de entrada al consultorio" class="t-Icon fa fa-download-alt"></span>''',
'       ELSE',
'            to_char(r.hora_entrada_consulta,''hh24:mi'')',
'       END entrada',
'      ,CASE WHEN r.hora_salida_consulta IS NULL THEN',
'            ''<span aria-hidden="true" title="Hora de salida del consultorio" class="t-Icon fa fa-upload-alt"></span>''',
'       ELSE',
'            to_char(r.hora_entrada_consulta,''hh24:mi'')',
'       END salida',
'      ,r.numero_documento AS ci',
'      ,r.nombre_paciente AS paciente',
'      ,r.ent_id_entidad_prestador AS id_prestador',
'      ,r.id_reserva_consulta',
'      ,CASE WHEN r.hora_entrada_consulta IS NULL THEN ''NO'' ELSE ''SI'' END hora_entrada',
'      ,CASE WHEN r.hora_salida_consulta IS NULL THEN ''NO'' ELSE ''SI'' END hora_salida',
'      ,r.ent_id_entidad_prestador solo_id_prestador',
'      ,r.ent_id_entidad_paciente id_paciente',
'FROM reserva_consulta r',
'WHERE r.hora_recepcion IS NOT NULL',
'AND r.estado_turno IN (''RESERVADO'',''FIN_CONSULTA'')',
'AND r.hora_salida_consulta IS NULL',
'AND Trunc(r.hora_recepcion,''DD'') = Trunc(CURRENT_DATE,''DD'')',
'ORDER BY r.hora_recepcion ASC'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Sala espera'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(202492765050789433)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay pacientes en espera'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>128759745986782693
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202976039466475088)
,p_db_column_name=>'CI'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Nro. C.I.'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202976102155475089)
,p_db_column_name=>'PACIENTE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Paciente'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202976269030475090)
,p_db_column_name=>'ID_PRESTADOR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Prestador'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202976298944475091)
,p_db_column_name=>'TURNO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Turno'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202976447722475092)
,p_db_column_name=>'RECEPCION'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Recepci\00F3n')
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202976582280475093)
,p_db_column_name=>'ENTRADA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Entrada'
,p_column_link=>'javascript: marcaEntrada(''#ID_RESERVA_CONSULTA#'',''#HORA_ENTRADA#'')'
,p_column_linktext=>'#ENTRADA#'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202976623265475094)
,p_db_column_name=>'SALIDA'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Salida'
,p_column_link=>'javascript: marcaSalida(''#ID_RESERVA_CONSULTA#'',''#HORA_SALIDA#'',''#SOLO_ID_PRESTADOR#'',''#ID_PACIENTE#'',''#EMP_ID_EMPRESA#'')'
,p_column_linktext=>'#SALIDA#'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202976714400475095)
,p_db_column_name=>'ID_RESERVA_CONSULTA'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Id Reserva Consulta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202977026773475098)
,p_db_column_name=>'HORA_ENTRADA'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Hora Entrada'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202977174021475099)
,p_db_column_name=>'HORA_SALIDA'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>'Hora Salida'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(208932512291636385)
,p_db_column_name=>'SOLO_ID_PRESTADOR'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>'Solo Id Prestador'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(208932646343636386)
,p_db_column_name=>'ID_PACIENTE'
,p_display_order=>160
,p_column_identifier=>'Q'
,p_column_label=>'Id Paciente'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(202986428384481502)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'72410'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RECEPCION:TURNO:ENTRADA:SALIDA:CI:PACIENTE:ID_PRESTADOR'
,p_sort_column_1=>'RECEPCION'
,p_sort_direction_1=>'ASC'
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
,p_break_on=>'ID_PRESTADOR:0:0:0:0:0'
,p_break_enabled_on=>'ID_PRESTADOR:0:0:0:0:0'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202977459397475102)
,p_plug_name=>unistr('Atenciones del d\00EDa')
,p_region_name=>'REG_FINALIZADOS'
,p_parent_plug_id=>wwv_flow_imp.id(202977327568475101)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT to_char(r.fecha_turno,''hh24:mi'') turno',
'      ,to_char(r.hora_recepcion,''hh24:mi'') recepcion',
'      ,to_char(r.hora_entrada_consulta,''hh24:mi'') entrada',
'      ,to_char(r.hora_salida_consulta,''hh24:mi'') salida',
'      ,r.numero_documento',
'      ,r.nombre_paciente paciente',
'      ,r.ent_id_entidad_prestador',
'      ,r.id_reserva_consulta',
'FROM reserva_consulta r',
'WHERE r.hora_recepcion IS NOT NULL',
'AND r.estado_turno IN (''ATENDIDO'',''FIN_CONSULTA'')',
'AND r.hora_salida_consulta IS NOT NULL',
'AND Trunc(r.hora_recepcion,''DD'') = Trunc(CURRENT_DATE,''DD'')',
'ORDER BY r.hora_recepcion desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(202977516892475103)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay pacientes en espera'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>129244497828468363
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202977772178475105)
,p_db_column_name=>'PACIENTE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Paciente'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202977982909475107)
,p_db_column_name=>'TURNO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Turno'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202978088381475108)
,p_db_column_name=>'RECEPCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Recepci\00F3n')
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202978108892475109)
,p_db_column_name=>'ENTRADA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Entrada'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202978235343475110)
,p_db_column_name=>'SALIDA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Salida'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202978363753475111)
,p_db_column_name=>'ID_RESERVA_CONSULTA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Id Reserva Consulta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25990944656247148)
,p_db_column_name=>'NUMERO_DOCUMENTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Numero Documento'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25991038416247149)
,p_db_column_name=>'ENT_ID_ENTIDAD_PRESTADOR'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Ent Id Entidad Prestador'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(203028187517705750)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'72827'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'RECEPCION:TURNO:ENTRADA:SALIDA:PACIENTE'
,p_sort_column_1=>'RECEPCION'
,p_sort_direction_1=>'ASC'
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
,p_break_on=>'ID_PRESTADOR:0:0:0:0:0'
,p_break_enabled_on=>'ID_PRESTADOR:0:0:0:0:0'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202979607316475124)
,p_plug_name=>'Actualizar celular'
,p_region_name=>'REG_ACTUALIZA_CELULAR'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>131
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(322388613512307705)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>51
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(423859720813124088)
,p_plug_name=>'Cancelar'
,p_region_name=>'REG_CANCELAR'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>61
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(425638342960265028)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--compactTitle:t-BreadcrumbRegion--useBreadcrumbTitle:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(86947038457749062)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(425639772956265030)
,p_plug_name=>'Search'
,p_region_css_classes=>'search-region padding-md'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_query_type=>'SQL'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(425640512166265033)
,p_name=>'Master Records'
,p_region_name=>'REG_LISTA_RESERVA'
,p_template=>3371237801798025892
,p_display_sequence=>20
,p_region_css_classes=>'search-results'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'t-MediaList--showIcons:t-MediaList--showDesc:t-MediaList--showBadges:t-MediaList--stack'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT x.id_reserva_consulta,',
'    NULL link_class,',
'    apex_page.get_url(p_items => ''P140_ID_RESERVA_CONSULTA,P140_ESTADO_RESERVA,'', p_values => x.id_reserva_consulta||'',''||x.estado_turno) link,',
'    CASE WHEN x.hora_confirma IS NOT NULL THEN',
'        ''t-Icon fa fa-check-circle''',
'    ELSE',
'         NULL',
'    END icon_class,',
'',
'    CASE WHEN x.hora_confirma IS NOT NULL THEN',
'       ''title=Asistencia_confirmada''',
'    ELSE',
'        NULL',
'    END link_attr,',
'    ''t-Button t-Button--noLabel t-Button--icon t-Button--success t-Button--noUI'' icon_color_class,',
'    CASE WHEN Nvl(:P140_ID_RESERVA_CONSULTA,''0'') = x.id_reserva_consulta THEN',
'      ''is-active'' ',
'    ELSE',
'      '' ''',
'    END list_class,',
'    SubStr(To_Char(x.fecha_turno,''DD/MM/YYYY HH24:MI''),12,6) list_title,',
'    CASE ',
'        WHEN x.estado_turno = ''ATENDIDO''   THEN ',
'            ''<span style="color:#065201;font-weight:bold;">ATENDIDO</span>'' ',
'        WHEN x.estado_turno = ''RESERVADO''  THEN',
'            ''<span style="color:#B5AB0F;font-weight:bold;">RESERVADO</span>''',
'        WHEN x.estado_turno = ''DISPONIBLE'' THEN',
'            ''<span style="color:#00b30c;font-weight:bold;">DISPONIBLE</span>'' ',
'        WHEN x.estado_turno = ''CANCELADO''  THEN',
'            ''<span style="color:#FA3107;font-weight:bold;">CANCELADO</span>'' ',
'    END list_text,',
'    ''<span style="color:#0000FF;">''||x.nombre_paciente||''</span>'' list_badge,',
'    CASE',
'        WHEN :P140_ID_PRESTADOR IS NULL THEN ',
'            substr(p.nombre,1,30)||CASE WHEN Length(p.nombre)>30 THEN ''...'' END ',
'        ELSE',
'            NULL',
'    END nombre_prestador',
'FROM reserva_consulta x',
'    ,entidad p',
'WHERE (:P140_SEARCH IS NULL',
'        or upper(x.nombre_paciente) like ''%''||upper(:P140_SEARCH)||''%''',
'    )',
'AND (:P140_ID_PRESTADOR IS NULL OR x.ent_id_entidad_prestador = :P140_ID_PRESTADOR)',
'AND Trunc(x.fecha_turno,''DD'') = To_Date(:P140_FECHA,''dd/mm/yyyy'')',
'AND (:P140_AM_PM = ''TODOS'' OR :P140_AM_PM = To_Char(x.fecha_turno,''AM''))',
'AND p.id_entidad = x.ent_id_entidad_prestador',
'order by x.fecha_turno, p.nombre',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P140_SEARCH,P140_FECHA,P140_P_ID_PRESTADOR,P140_AM_PM'
,p_lazy_loading=>false
,p_query_row_template=>2093604263195414824
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'<div class="u-tC">Registros no encontrados</div>'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134789552105140811)
,p_query_column_id=>1
,p_column_alias=>'ID_RESERVA_CONSULTA'
,p_column_display_sequence=>1
,p_column_heading=>'ID_RESERVA_CONSULTA'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134789994104140812)
,p_query_column_id=>2
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>2
,p_column_heading=>'LINK_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134790368040140812)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>3
,p_column_heading=>'LINK'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134790782659140813)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>4
,p_column_heading=>'ICON_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134791144844140813)
,p_query_column_id=>5
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>5
,p_column_heading=>'LINK_ATTR'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134791548734140813)
,p_query_column_id=>6
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>6
,p_column_heading=>'ICON_COLOR_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134792002472140814)
,p_query_column_id=>7
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>7
,p_column_heading=>'LIST_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134792388031140814)
,p_query_column_id=>8
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>8
,p_column_heading=>'LIST_TITLE'
,p_column_html_expression=>'<span style="color:#000000;"> #LIST_TITLE# </span> <span style="font-size:9px"> #NOMBRE_PRESTADOR# </span> '
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134792797063140814)
,p_query_column_id=>9
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>9
,p_column_heading=>'LIST_TEXT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134793153303140815)
,p_query_column_id=>10
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>10
,p_column_heading=>'LIST_BADGE'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134793540016140815)
,p_query_column_id=>11
,p_column_alias=>'NOMBRE_PRESTADOR'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(425645288479265101)
,p_name=>'Datos'
,p_region_name=>'REG_DATOS_DE_RESERVA'
,p_template=>4072358936313175081
,p_display_sequence=>21
,p_region_css_classes=>'js-master-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_reserva_consulta',
'      , ent_id_entidad_prestador',
'      , suc_id_suc_entidad',
'      , esp_id_especialidad',
'      , fecha_turno',
'      , estado_turno',
'      , observacion',
'      , ent_id_entidad_paciente',
'      , tip_id_tipo_documento',
'      , numero_documento',
'      , nombre_paciente',
'      , celular_paciente',
'      , correo_paciente',
'      , motivo_consulta',
'      , dia_id_diagnostico',
'      , fecha_reserva',
'      , fecha_cancela',
'      , obs_cancelacion',
'      , hora_confirma',
'      , hora_recepcion',
'      , hora_entrada_consulta',
'      , hora_salida_consulta',
'      , fecha_insertado',
'  from reserva_consulta',
' where id_reserva_consulta = :P140_ID_RESERVA_CONSULTA'))
,p_display_when_condition=>'P140_ID_RESERVA_CONSULTA'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P140_ID_RESERVA_CONSULTA'
,p_lazy_loading=>false
,p_query_row_template=>2100515439059797523
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>unistr('Ning\00FAn registro seleccionado')
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134803538374140823)
,p_query_column_id=>1
,p_column_alias=>'ID_RESERVA_CONSULTA'
,p_column_display_sequence=>1
,p_column_heading=>'Id reserva'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select /*+ INDEX(r reserva_consulta_pk)*/ 1 ',
'from reserva_consulta r',
'where r.id_reserva_consulta = :P140_ID_RESERVA_CONSULTA',
'and r.id_reserva_consulta is not null',
'fetch first 1 row only',
''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25989668553247135)
,p_query_column_id=>2
,p_column_alias=>'ENT_ID_ENTIDAD_PRESTADOR'
,p_column_display_sequence=>601
,p_column_heading=>'Prestador'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(17452607221543045)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25989750020247136)
,p_query_column_id=>3
,p_column_alias=>'SUC_ID_SUC_ENTIDAD'
,p_column_display_sequence=>611
,p_column_heading=>'Sucursal - consultorio'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(90179677127002391)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134804017764140823)
,p_query_column_id=>4
,p_column_alias=>'ESP_ID_ESPECIALIDAD'
,p_column_display_sequence=>141
,p_column_heading=>'Especialidad'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_imp.id(132599214015901874)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134804754015140823)
,p_query_column_id=>5
,p_column_alias=>'FECHA_TURNO'
,p_column_display_sequence=>21
,p_column_heading=>'Fecha/hora turno'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_column_html_expression=>'<strong>#FECHA_TURNO#</strong>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134807172114140825)
,p_query_column_id=>6
,p_column_alias=>'ESTADO_TURNO'
,p_column_display_sequence=>131
,p_column_heading=>'Estado turno'
,p_column_html_expression=>'<strong>#ESTADO_TURNO#</strong>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25989856935247137)
,p_query_column_id=>7
,p_column_alias=>'OBSERVACION'
,p_column_display_sequence=>621
,p_column_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select /*+ INDEX(r reserva_consulta_pk)*/ 1 ',
'from reserva_consulta r',
'where r.id_reserva_consulta = :P140_ID_RESERVA_CONSULTA',
'and r.observacion is not null',
'fetch first 1 row only'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25989919323247138)
,p_query_column_id=>8
,p_column_alias=>'ENT_ID_ENTIDAD_PACIENTE'
,p_column_display_sequence=>631
,p_column_heading=>'Paciente (registrado)'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P140_P_ID_PACIENTE IS NOT NULL'
,p_display_when_condition2=>'PLSQL'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(17452607221543045)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25990009314247139)
,p_query_column_id=>9
,p_column_alias=>'TIP_ID_TIPO_DOCUMENTO'
,p_column_display_sequence=>641
,p_column_heading=>'Tipo documento'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P140_P_ID_PACIENTE IS NOT NULL'
,p_display_when_condition2=>'PLSQL'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(84167349864996003)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25990108005247140)
,p_query_column_id=>10
,p_column_alias=>'NUMERO_DOCUMENTO'
,p_column_display_sequence=>651
,p_column_heading=>'Numero documento'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P140_P_ID_PACIENTE IS NOT NULL'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134809555979140827)
,p_query_column_id=>11
,p_column_alias=>'NOMBRE_PACIENTE'
,p_column_display_sequence=>61
,p_column_heading=>'Nombre paciente'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P140_P_ID_PACIENTE IS NOT NULL'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134810756072140828)
,p_query_column_id=>12
,p_column_alias=>'CELULAR_PACIENTE'
,p_column_display_sequence=>111
,p_column_heading=>'Celular paciente'
,p_column_link=>'javascript: actualizaCelular()'
,p_column_linktext=>'#CELULAR_PACIENTE#'
,p_column_link_attr=>'title=''Actualizar celular del paciente, para enviar mensaje, solo debe ser UN NUMERO'''
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P140_NRO_CELULAR IS NOT NULL'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25990284338247141)
,p_query_column_id=>13
,p_column_alias=>'CORREO_PACIENTE'
,p_column_display_sequence=>661
,p_column_heading=>'Correo paciente'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P140_P_ID_PACIENTE IS NOT NULL'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134800365150140821)
,p_query_column_id=>14
,p_column_alias=>'MOTIVO_CONSULTA'
,p_column_display_sequence=>591
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25990329220247142)
,p_query_column_id=>15
,p_column_alias=>'DIA_ID_DIAGNOSTICO'
,p_column_display_sequence=>671
,p_column_heading=>unistr('Diagn\00F3stico')
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P140_P_ID_PACIENTE IS NOT NULL'
,p_display_when_condition2=>'PLSQL'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(27910834356733653)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134807984188140826)
,p_query_column_id=>16
,p_column_alias=>'FECHA_RESERVA'
,p_column_display_sequence=>191
,p_column_heading=>'Fecha reserva'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P140_P_ID_PACIENTE IS NOT NULL'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134807587570140825)
,p_query_column_id=>17
,p_column_alias=>'FECHA_CANCELA'
,p_column_display_sequence=>231
,p_column_heading=>unistr('Fecha cancelaci\00F3n')
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select /*+ INDEX(r reserva_consulta_pk)*/ 1 ',
'from reserva_consulta r',
'where r.id_reserva_consulta = :P140_ID_RESERVA_CONSULTA',
'and r.fecha_cancela is not null',
'fetch first 1 row only'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25990486034247143)
,p_query_column_id=>18
,p_column_alias=>'OBS_CANCELACION'
,p_column_display_sequence=>681
,p_column_heading=>unistr('Obs. cancelaci\00F3n')
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P140_P_ID_PACIENTE IS NOT NULL'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25990558682247144)
,p_query_column_id=>19
,p_column_alias=>'HORA_CONFIRMA'
,p_column_display_sequence=>691
,p_column_heading=>unistr('Confirmaci\00F3n')
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P140_P_ID_PACIENTE IS NOT NULL'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134816753466140832)
,p_query_column_id=>20
,p_column_alias=>'HORA_RECEPCION'
,p_column_display_sequence=>41
,p_column_heading=>unistr('Hora recepci\00F3n')
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P140_P_ID_PACIENTE IS NOT NULL'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25990631450247145)
,p_query_column_id=>21
,p_column_alias=>'HORA_ENTRADA_CONSULTA'
,p_column_display_sequence=>701
,p_column_heading=>'Entrada a consulta'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P140_P_ID_PACIENTE IS NOT NULL'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25990740866247146)
,p_query_column_id=>22
,p_column_alias=>'HORA_SALIDA_CONSULTA'
,p_column_display_sequence=>711
,p_column_heading=>'Salida de consulta'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P140_P_ID_PACIENTE IS NOT NULL'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25990855930247147)
,p_query_column_id=>23
,p_column_alias=>'FECHA_INSERTADO'
,p_column_display_sequence=>721
,p_column_heading=>'Fecha insertado'
,p_column_format=>'DD-MM-YYYY HH24:MI:SS'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P140_P_ID_PACIENTE IS NOT NULL'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(425756979577265227)
,p_plug_name=>'No Record Selected'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>41
,p_location=>null
,p_plug_source=>unistr('Ning\00FAn registro seleccionado...')
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P140_ID_RESERVA_CONSULTA'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134820760620140834)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(425645288479265101)
,p_button_name=>'RESERVAR'
,p_button_static_id=>'BTN_RESERVAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reservar'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:157:&SESSION.::&DEBUG.:RP,157:P157_ID_RESERVA_CONSULTA:&P140_ID_RESERVA_CONSULTA.'
,p_icon_css_classes=>'fa-plus'
,p_button_comment=>'to_date(:P140_FECHA_TURNO,''dd-mm-yyyy hh24:mi'') >= CURRENT_DATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134821127851140835)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(425645288479265101)
,p_button_name=>'CANCELAR'
,p_button_static_id=>'BTN_CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--danger:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Cancelar'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-remove'
,p_button_cattributes=>'title = ''Cancelar la reserva'''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134821571347140835)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(425645288479265101)
,p_button_name=>'WHATSAPP'
,p_button_static_id=>'BTN_WHATSAPP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Whatsapp'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-bullhorn'
,p_button_cattributes=>unistr('title = ''Env\00EDo de aviso por whatsapp al paciente''')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134822011582140835)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(425645288479265101)
,p_button_name=>'CONF_ASISTENCIA'
,p_button_static_id=>'BTN_CONF_ASISTENCIA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Asistencia'
,p_button_position=>'EDIT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check-circle-o'
,p_button_cattributes=>'title = ''Paciente confirma asistencia a la consulta.'''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134822350712140835)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(425645288479265101)
,p_button_name=>'MARCA_RECEPCION'
,p_button_static_id=>'BTN_RECEPCION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>unistr('Recepci\00F3n')
,p_button_position=>'EDIT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-map-marker-shine-o'
,p_button_cattributes=>unistr('title = ''Paciente marca asistencia en recepci\00F3n''')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134822803150140836)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(425645288479265101)
,p_button_name=>'HISTORIAL'
,p_button_static_id=>'BTN_HISTORIAL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Historial'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:64:P64_P_CI:&P140_P_CI.'
,p_icon_css_classes=>'fa-clipboard-list'
,p_button_cattributes=>'title = ''Historial de reservas del PACIENTE'''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134786405230140807)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(425638342960265028)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--noUI:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:140:&SESSION.:RESET:&DEBUG.:RP,140::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134786792686140807)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(425638342960265028)
,p_button_name=>'AGENDA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--noUI:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Ver agenda'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:85:&SESSION.:RESET:&DEBUG.:RP,85:P85_ID_PRESTADOR:&P140_ID_PRESTADOR.'
,p_icon_css_classes=>'fa-calendar-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134774102355140797)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(202979607316475124)
,p_button_name=>'ActualizarCelular'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Actualizar celular'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134779566963140801)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(423859720813124088)
,p_button_name=>'ConfirmaCancelar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancelar reserva'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134787162070140808)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(425638342960265028)
,p_button_name=>'NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--noUI:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Nueva reserva'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:61:&SESSION.:RESET:&DEBUG.:RP,61:P61_ID_PRESTADOR,P61_NUEVO:&P140_ID_PRESTADOR.,SI'
,p_button_condition=>':P140_ID_PRESTADOR IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-calendar-plus-o'
,p_button_cattributes=>'title=''Agregar nueva RESERVA entre PACIENTES'''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134751551832140777)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(202489890410789404)
,p_button_name=>'Guardar'
,p_button_static_id=>'BTN_GUARDA_CONFIRMACION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Guardar'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134753622338140779)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(202491471682789420)
,p_button_name=>'Guardar_recepcion'
,p_button_static_id=>'BTN_MARCA_RECEPCION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Guardar'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134774518044140798)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(202979607316475124)
,p_button_name=>'Retornar_celular'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--simple:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134780001531140802)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(423859720813124088)
,p_button_name=>'Retornar_cancelar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134751939104140777)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(202489890410789404)
,p_button_name=>'Retornar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--simple:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134754079512140779)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(202491471682789420)
,p_button_name=>'Retornar_recepcion'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--simple:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(134850842672140855)
,p_branch_name=>'Regresar'
,p_branch_action=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.::P140_ID_RESERVA_CONSULTA:&P140_ID_RESERVA_CONSULTA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25991101556247150)
,p_name=>'P140_CURRENT_DATE'
,p_item_sequence=>10
,p_prompt=>'Hora actual'
,p_format_mask=>'DD-MM-YYYY HH24:MI:SS'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28162800614297207)
,p_name=>'P140_P_ID_PACIENTE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(322388613512307705)
,p_prompt=>'P Id Paciente'
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
 p_id=>wwv_flow_imp.id(201779768711951529)
,p_name=>'P140_FECHA_TURNO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(322388613512307705)
,p_prompt=>'Fecha Turno'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
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
 p_id=>wwv_flow_imp.id(201779804111951530)
,p_name=>'P140_P_ID_PRESTADOR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(322388613512307705)
,p_prompt=>'P Id Prestador'
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
 p_id=>wwv_flow_imp.id(202495095423789426)
,p_name=>'P140_ID_PERS_CONF'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(202489890410789404)
,p_prompt=>'Persona que confirmo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_display_when=>'P140_ID_PERS_CONF'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'NONE',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202495183960789427)
,p_name=>'P140_CONFIRMA_ASISTENCIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(202489890410789404)
,p_prompt=>'Confirma asistencia'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'NO',
  'off_value', 'NO',
  'on_label', 'SI',
  'on_value', 'SI',
  'use_defaults', 'N')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202495280492789428)
,p_name=>'P140_HORA_CONFIRMADO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(202489890410789404)
,p_prompt=>'Hora confirmado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P140_HORA_CONFIRMADO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202498740875789443)
,p_name=>'P140_MARCAR_RECEPCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(202491471682789420)
,p_prompt=>unistr('Marcar recepci\00F3n')
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'NO',
  'off_value', 'NO',
  'on_label', 'SI',
  'on_value', 'SI',
  'use_defaults', 'N')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202499728438789453)
,p_name=>'P140_HORA_RECEPCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(202491471682789420)
,p_prompt=>unistr('Hora en recepci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_display_when=>'P140_HORA_RECEPCION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202517819494789442)
,p_name=>'P140_P_CI'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(322388613512307705)
,p_prompt=>'P CI'
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
 p_id=>wwv_flow_imp.id(202517953731789443)
,p_name=>'P140_P_NOMBRE_PACIENTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(322388613512307705)
,p_prompt=>'P Nombre Paciente'
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
 p_id=>wwv_flow_imp.id(203007317673475166)
,p_name=>'P140_P_NUEVO_CELULAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(202979607316475124)
,p_prompt=>unistr('N\00FAmero de celular')
,p_placeholder=>'595981123456'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_cMaxlength=>12
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_inline_help_text=>unistr('Ingresar solo un n\00FAmero de celular valido para el env\00EDo de mensajes')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(203008843683475174)
,p_name=>'P140_P_ID_RESERVA_CONSULTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(322388613512307705)
,p_prompt=>'P Id Reserva Consulta'
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
 p_id=>wwv_flow_imp.id(214358030402628566)
,p_name=>'P140_URL_ALTA_PACIENTE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(322388613512307705)
,p_prompt=>'Url Alta Paciente'
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
 p_id=>wwv_flow_imp.id(223404500995036251)
,p_name=>'P140_EMP_ID_EMPRESA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(202491471682789420)
,p_prompt=>'PREPAGA por el cual asiste'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'POPUP',
  'subtype', 'N',
  'text_case', '0',
  'trim_spaces', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(245930229576174535)
,p_name=>'P140_OBS_CANCELACION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(423859720813124088)
,p_prompt=>unistr('Observaci\00F3n cancelaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>200
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'Y',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(265361723004694840)
,p_name=>'P140_RESERVAR'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(322388613512307705)
,p_prompt=>'Url Alta Paciente'
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
 p_id=>wwv_flow_imp.id(270583164224475258)
,p_name=>'P140_P_ID_EMPRESA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(322388613512307705)
,p_prompt=>'P Id Empresa'
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
 p_id=>wwv_flow_imp.id(280415365849414950)
,p_name=>'P140_SC_NOMBRES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(280406745995414926)
,p_prompt=>'Nombres'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(280415459470414951)
,p_name=>'P140_SC_APELLIDOS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(280406745995414926)
,p_prompt=>'Apellidos'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(280415604603414952)
,p_name=>'P140_SC_TIPO_CONTRATO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(280406745995414926)
,p_prompt=>'Tipo contrato'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(280415743712414953)
,p_name=>'P140_SC_PLAN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(280406745995414926)
,p_prompt=>'Plan'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(280415848727414954)
,p_name=>'P140_SC_ODONTOLOGIA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(280406745995414926)
,p_prompt=>'Odontologia '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(280435626831414973)
,p_name=>'P140_P_RECEPCIONADO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(322388613512307705)
,p_prompt=>'P Recepcionado'
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
 p_id=>wwv_flow_imp.id(322416631164307743)
,p_name=>'P140_ESTADO_RESERVA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(322388613512307705)
,p_prompt=>'Estado Reserva'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(322427787854307741)
,p_name=>'P140_FECHA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(425639772956265030)
,p_item_default=>'to_char(current_date,''dd/mm/yyyy'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Fecha'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:margin-top-none'
,p_encrypt_session_state_yn=>'N'
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
 p_id=>wwv_flow_imp.id(322428068251307744)
,p_name=>'P140_ID_PRESTADOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(425639772956265030)
,p_prompt=>'Prestador'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ENTIDAD_PRESTADOR_ACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nombre as d',
'      ,id_entidad as r',
'from entidad',
'where es_prestador = ''SI''',
'and estado = ''ACTIVO'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Todos'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Prestador')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(322428153942307745)
,p_name=>'P140_AM_PM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(425639772956265030)
,p_item_default=>'To_Char(CURRENT_DATE,''AM'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:TODOS;TODOS,AM;AM,PM;PM'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '3',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(423890006953124149)
,p_name=>'P140_NRO_CELULAR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(322388613512307705)
,p_prompt=>'Nro Celular'
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
 p_id=>wwv_flow_imp.id(423892969351124134)
,p_name=>'P140_ID_TIPO_CANCELACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(423859720813124088)
,p_prompt=>unistr('Tipo cancelaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'POPUP',
  'subtype', 'N',
  'text_case', '0',
  'trim_spaces', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(425680866388265083)
,p_name=>'P140_SEARCH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(425639772956265030)
,p_prompt=>'Buscar'
,p_placeholder=>'Buscar...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--postTextBlock'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(425780050477265246)
,p_name=>'P140_ID_RESERVA_CONSULTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(322388613512307705)
,p_prompt=>'P140_ID_RESERVA_CONSULTA'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134829488474140843)
,p_name=>'Inicio'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134829921240140844)
,p_event_id=>wwv_flow_imp.id(134829488474140843)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.item("P140_RESERVAR").getValue() == ''SI'') {',
'    apex.item("BTN_RESERVAR").show();',
'} else {',
'    apex.item("BTN_RESERVAR").hide();',
'}',
'if (apex.item("P140_ESTADO_RESERVA").getValue() == ''CANCELADO''){',
'    apex.item("BTN_CANCELAR").hide();',
'    apex.item("BTN_WHATSAPP").hide();',
'    apex.item("BTN_CONF_ASISTENCIA").hide();',
'    apex.item("BTN_RECEPCION").hide();',
'}',
'if (apex.item("P140_ESTADO_RESERVA").getValue() == ''ATENDIDO''){',
'    apex.item("BTN_CANCELAR").hide();',
'    apex.item("BTN_WHATSAPP").hide();',
'    apex.item("BTN_RESERVAR").hide();',
'    apex.item("BTN_CONF_ASISTENCIA").hide();',
'}',
'if (apex.item("P140_ESTADO_RESERVA").getValue() == ''DISPONIBLE''){',
'    apex.item("BTN_CANCELAR").hide();',
'    apex.item("BTN_WHATSAPP").hide();',
'    apex.item("BTN_CONF_ASISTENCIA").hide();',
'    apex.item("BTN_RECEPCION").hide();    ',
'}',
'if (apex.item("P140_ESTADO_RESERVA").getValue() == ''RESERVADO''){',
'    apex.item("BTN_RESERVAR").hide();',
'}',
'if (apex.item("P140_NRO_CELULAR").isEmpty()) {',
'    apex.item("BTN_WHATSAPP").hide();',
'}',
'',
'setTimeout(function() {',
'    $(''#APEX_SUCCESS_MESSAGE'').fadeOut(''fast'');',
'}, 2000);',
'window.colapsarMenu();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134831758049140845)
,p_name=>'Perform Search'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134832285228140846)
,p_event_id=>wwv_flow_imp.id(134831758049140845)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(425640512166265033)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134832760669140846)
,p_event_id=>wwv_flow_imp.id(134831758049140845)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134833149789140846)
,p_name=>'SetFecha'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_FECHA,P140_AM_PM,P140_ID_PRESTADOR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134833641555140846)
,p_event_id=>wwv_flow_imp.id(134833149789140846)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'FILTRAR'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134834022656140847)
,p_name=>'Cancelar'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134821127851140835)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134834579319140847)
,p_event_id=>wwv_flow_imp.id(134834022656140847)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(423859720813124088)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134835017487140847)
,p_name=>'Retornar_cancela'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134780001531140802)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134835483917140847)
,p_event_id=>wwv_flow_imp.id(134835017487140847)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134835910638140848)
,p_name=>'ConfirmaCancelar'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134779566963140801)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134836339825140848)
,p_event_id=>wwv_flow_imp.id(134835910638140848)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm(''\00BFEsta seguro en cancelar la reserva?'', function( okPressed ) {'),
'    if ( okPressed ) {',
'        apex.submit({',
'            request:"CANCELAR"',
'        })',
'    }',
'})'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134836798224140848)
,p_name=>'VerWHA'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134821571347140835)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134837230933140848)
,p_event_id=>wwv_flow_imp.id(134836798224140848)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.region("REG_MENSAJES").refresh();',
'apex.region("REG_CREAR_MSG").refresh();',
'apex.theme.openRegion( "REG_MENSAJES" );',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134840842026140850)
,p_name=>'ConfAsistencia'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134822011582140835)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134841362405140850)
,p_event_id=>wwv_flow_imp.id(134840842026140850)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.item("P140_CONFIRMA_ASISTENCIA").getValue() == ''SI''){',
'    $("#P140_CONFIRMA_ASISTENCIA").attr(''disabled'', true);    ',
'    $("#P140_ID_PERS_CONF").attr(''disabled'', true);    ',
'    $("#P140_HORA_CONFIRMADO").attr(''disabled'', true);',
'    apex.item("BTN_GUARDA_CONFIRMACION").disable();',
'}',
'apex.theme.openRegion( "REG_CONF_ASISTENCIA" );'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134841775350140850)
,p_name=>'MarcaRecepcion'
,p_event_sequence=>250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134822350712140835)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134842266036140851)
,p_event_id=>wwv_flow_imp.id(134841775350140850)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'busca_asigna_pac();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134842696437140851)
,p_name=>'Regresar'
,p_event_sequence=>260
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134751939104140777)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134843134798140851)
,p_event_id=>wwv_flow_imp.id(134842696437140851)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(202489890410789404)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134843569518140851)
,p_name=>'Confirma'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134751551832140777)
,p_condition_element=>'P140_CONFIRMA_ASISTENCIA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SI'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134844088403140851)
,p_event_id=>wwv_flow_imp.id(134843569518140851)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm(''\00BFEsta seguro en CONFIRMAR la reserva?'', function( okPressed ) {'),
'    if ( okPressed ) {',
'        apex.submit({',
'            request:"CONFIRMAR"',
'        })',
'    }',
'})'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134844509829140852)
,p_name=>'Confirma_recepcion'
,p_event_sequence=>280
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134753622338140779)
,p_condition_element=>'P140_MARCAR_RECEPCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SI'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134844977023140852)
,p_event_id=>wwv_flow_imp.id(134844509829140852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm(''\00BFEsta seguro en MARCAR la ASISTENCIA del paciente?'', function( okPressed ) {'),
'    if ( okPressed ) {',
'        apex.submit({',
'            request:"RECEPCION"',
'        })',
'    }',
'})'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134845345615140852)
,p_name=>'Regresa_recepcion'
,p_event_sequence=>290
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134754079512140779)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134845909412140852)
,p_event_id=>wwv_flow_imp.id(134845345615140852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(202491471682789420)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134848036112140853)
,p_name=>'RetornaCeluar'
,p_event_sequence=>320
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134774518044140798)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134848564213140853)
,p_event_id=>wwv_flow_imp.id(134848036112140853)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(202979607316475124)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134849011364140854)
,p_name=>'ActualizaCelular'
,p_event_sequence=>330
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134774102355140797)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134849443063140854)
,p_event_id=>wwv_flow_imp.id(134849011364140854)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!apex.item("P140_P_NUEVO_CELULAR").isEmpty()) {',
'    guardarCelular();',
'}'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134829032497140843)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancelar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*pkg_reserva_consulta.p_cancelar_reserva(',
'    pi_id_reserva => :P140_ID_RESERVA_CONSULTA',
'  , pi_id_tipo_cancelacion => :P140_ID_TIPO_CANCELACION',
'  , pi_obs_cancelacion => :P140_OBS_CANCELACION',
');',
'',
':P140_OBS_CANCELACION := NULL;*/',
'null;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#SQLERRM_TEXT#',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CANCELAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Reserva cancelada'
,p_internal_uid=>61096013433134103
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134825421048140840)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ConfirmaAsistencia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--pkg_reserva_consulta.p_confirma_reserva(p_id_reserva => :P140_ID_RESERVA_CONSULTA);',
'null;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#SQLERRM_TEXT#',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CONFIRMAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Asistencia confirmada...'
,p_internal_uid=>61092401984134100
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134825916732140840)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'MarcaRecepcion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*pkg_reserva_consulta.p_marca_recepcion(',
'        p_id_reserva => :P140_ID_RESERVA_CONSULTA ',
'       ,p_id_seguro => :P140_EMP_ID_EMPRESA',
'       ,P_NOMBRES_SC => :P140_SC_NOMBRES',
'       ,P_APELLIDOS_SC => :P140_SC_APELLIDOS',
'       ,P_TIPO_CONTRATO_SC => :P140_SC_TIPO_CONTRATO',
'       ,P_PLAN_SC => :P140_SC_PLAN',
'       ,P_ODONTOLOGIA_SC => :P140_SC_ODONTOLOGIA',
'        );*/',
'        null;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#SQLERRM_TEXT#',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RECEPCION'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Asistencia marcada...'
,p_internal_uid=>61092897668134100
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134828638244140842)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P140_CURRENT_DATE := TO_CHAR(CURRENT_DATE,''DD-MM-YYYY HH24:MI:SS'');',
'BEGIN',
'    IF :P140_ID_RESERVA_CONSULTA IS NOT NULL THEN',
'        :P140_P_ID_RESERVA_CONSULTA := :P140_ID_RESERVA_CONSULTA;',
'        pkg_reserva_consulta.p_obtener_datos_reserva(',
'            pi_id_reserva => :P140_P_ID_RESERVA_CONSULTA',
'          , po_estado_turno => :P140_ESTADO_RESERVA',
'          , po_celular => :P140_NRO_CELULAR',
'          , po_fecha_turno => :P140_FECHA_TURNO',
'          , po_id_prestador => :P140_P_ID_PRESTADOR',
'          , po_ci => :P140_P_CI',
'          , po_nombre_paciente => :P140_P_NOMBRE_PACIENTE',
'          , po_hora_confirma => :P140_HORA_CONFIRMADO',
'          , po_hora_recepcion => :P140_HORA_RECEPCION',
'          , po_id_pac => :P140_P_ID_PACIENTE',
'          , po_id_prepaga => :P140_P_ID_EMPRESA',
'        );',
'        :P140_P_NUEVO_CELULAR := :P140_NRO_CELULAR;',
'        IF to_date(:P140_FECHA_TURNO,''dd-mm-yyyy hh24:mi'') < CURRENT_DATE THEN',
'            :P140_RESERVAR := ''NO'';',
'        ELSE',
'            IF :P140_ESTADO_RESERVA IN (''DISPONIBLE'',''CANCELADO'') THEN',
'                :P140_RESERVAR := ''SI'';',
'            END IF;',
'        END IF;',
'    ELSE',
'        :P140_ESTADO_RESERVA := NULL;',
'        :P140_NRO_CELULAR := NULL;',
'        :P140_FECHA_TURNO := NULL;',
'        :P140_P_ID_PRESTADOR := NULL;',
'        :P140_P_CI := NULL;',
'        :P140_P_NOMBRE_PACIENTE := NULL;',
'        :P140_CONFIRMA_ASISTENCIA := NULL;',
'        :P140_ID_PERS_CONF := NULL;',
'        :P140_HORA_CONFIRMADO := NULL;',
'        :P140_MARCAR_RECEPCION := NULL;',
'        :P140_HORA_RECEPCION := NULL;',
'        :P140_P_ID_PACIENTE := NULL;',
'        :P140_P_NUEVO_CELULAR := NULL;',
'        :P140_P_ID_EMPRESA := NULL;',
'        :P140_RESERVAR := ''SI'';',
'    END IF;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_internal_uid=>61095619180134102
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134825025752140839)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'anular_mensaje'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'',
'BEGIN',
'    pkg_reserva_consulta.p_anula_msg(',
'        p_id_msg => apex_application.g_x01',
'    );',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    --output_json_item(''P470_N_MND_ID_MONEDA'', :P470_N_MND_ID_MONEDA);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        ROLLBACK;',
'        apex_json.open_object;',
'        apex_json.write(''success'', FALSE);',
'        apex_json.write(''message'', utl_call_stack.error_msg(1));',
'        apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#SQLERRM_TEXT#',
''))
,p_process_success_message=>'Mensaje anulado correctamente...'
,p_internal_uid=>61092006688134099
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134826231743140840)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'marcar_entrada'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'',
'BEGIN',
'    pkg_reserva_consulta.p_marca_entrada(p_id_reserva => apex_application.g_x01 );',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    --output_json_item(''P470_N_MND_ID_MONEDA'', :P470_N_MND_ID_MONEDA);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        ROLLBACK;',
'        apex_json.open_object;',
'        apex_json.write(''success'', FALSE);',
'        apex_json.write(''message'', utl_call_stack.error_msg(1));',
'        apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#SQLERRM_TEXT#',
''))
,p_process_success_message=>'Ingreso a consultorio marcado...'
,p_internal_uid=>61093212679134100
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134826680496140840)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'marcar_salida'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'',
'BEGIN',
'    pkg_reserva_consulta.p_marca_salida(',
'        p_id_reserva => :P140_P_ID_RESERVA',
'       ,p_id_nomenclador => :P140_ID_NOMENCLADOR',
'       ,p_cod_autorizacion => :P140_COD_AUTORIZACION',
'    );',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    --output_json_item(''P470_N_MND_ID_MONEDA'', :P470_N_MND_ID_MONEDA);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        ROLLBACK;',
'        apex_json.open_object;',
'        apex_json.write(''success'', FALSE);',
'        apex_json.write(''message'', utl_call_stack.error_msg(1));',
'        apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#SQLERRM_TEXT#',
''))
,p_process_success_message=>'Salida a consultorio marcado...'
,p_internal_uid=>61093661432134100
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134827079562140841)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'guardar_celular'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'',
'BEGIN',
'    pkg_reserva_consulta.p_guarda_celular(',
'        p_id_reserva => :P140_P_ID_RESERVA_CONSULTA',
'       ,p_nro_celular => :P140_P_NUEVO_CELULAR',
'    );',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    --output_json_item(''P470_N_MND_ID_MONEDA'', :P470_N_MND_ID_MONEDA);',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        ROLLBACK;',
'        apex_json.open_object;',
'        apex_json.write(''success'', FALSE);',
'        apex_json.write(''message'', utl_call_stack.error_msg(1));',
'        apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#SQLERRM_TEXT#',
''))
,p_process_success_message=>'Salida a consultorio marcado...'
,p_internal_uid=>61094060498134101
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134828310451140842)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'eliminar_srv'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_id_servicio   number;',
'PROCEDURE output_json_item (',
'    p_item_name  IN VARCHAR2',
'  , p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'BEGIN    ',
'    SELECT r.ser_id_servicio',
'    INTO v_id_servicio',
'    FROM reserva_servicios r',
'    WHERE r.id_reserva_srvs =  apex_application.g_x01;',
'    IF v_id_servicio IS NOT NULL THEN',
unistr('        raise_application_error(-20000,''Servicio ya fue procesado por administraci\00F3n. No puede ser eliminado.'');'),
'    END IF;',
'    DELETE reserva_servicios ',
'    WHERE id_reserva_srvs = apex_application.g_x01;',
'',
'    COMMIT;',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    /*output_json_item('''', :);*/',
'    apex_json.close_array;',
'    apex_json.close_object;  ',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>61095291387134102
);
wwv_flow_imp.component_end;
end;
/
