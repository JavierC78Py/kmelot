prompt --application/pages/page_00107
begin
--   Manifest
--     PAGE: 00107
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
 p_id=>107
,p_name=>'Pedidos a TI'
,p_alias=>'PEDIDOS-A-TI'
,p_step_title=>'Pedidos a TI'
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function bloquearTabulador(event) {',
unistr('// Si se presiona la tecla de tabulador (c\00F3digo 9) o la tecla de espacio (c\00F3digo 32)'),
'if (event.keyCode === 9 || event.keyCode === 32) {',
'        // Cancelar el comportamiento predeterminado (bloquear el tabulador)',
'        event.preventDefault();',
'    }',
'}',
'function bloquearTabulador(event) {',
unistr('// Si se presiona la tecla de tabulador (c\00F3digo 9) o la tecla de espacio (c\00F3digo 32)'),
'if (event.keyCode === 9 || event.keyCode === 32) {',
'        // Cancelar el comportamiento predeterminado (bloquear el tabulador)',
'        event.preventDefault();',
'    }',
'}',
'function avisoEntregar() {',
'        Swal.fire({',
unistr('            title: ''\00BFConfirma la finalizaci\00F3n de su tarea en este proyecto.?'','),
'            icon: ''warning'',',
'            showCancelButton: true,',
'            concelButtonText: ''Cancelar'',',
'            confirmButtonText: ''Aceptar'',',
'            closeOnConfirm: true,',
'            allowOutsideClick: false,',
'            allowEscapeKey: false,',
'            allowEnterKey: false,',
'            stopKeydownPropagation: true,',
'            backdrop: true,',
'            focusConfirm: true,',
'            color: "#ffffff",',
'            background: "#FF0000",',
'         }).then((result) => {',
'            // Cuando se cierra el mensaje, volver a habilitar el tabulador',
'            window.removeEventListener(''keydown'', bloquearTabulador);',
'            if (result.isConfirmed) {',
'                entregar();',
'            }',
'         });',
'        // Escuchar el evento keydown para bloquear el tabulador',
'        window.addEventListener(''keydown'', bloquearTabulador);',
'}',
'function lev_bitacora(idDetPedido,pedidoEntregado,idEstadoDetalle){',
'    if (idEstadoDetalle === null || idEstadoDetalle == "") {',
'        Swal.fire({',
'            title: ''Debe declarar el estado/tarea antes de poder registrar la bitacora.'',',
'            icon: ''warning'',',
'            showCancelButton: false,',
'            concelButtonText: ''Cancelar'',',
'            confirmButtonText: ''Aceptar'',',
'            closeOnConfirm: true,',
'            allowOutsideClick: false,',
'            allowEscapeKey: false,',
'            allowEnterKey: false,',
'            stopKeydownPropagation: true,',
'            backdrop: true,',
'            focusConfirm: true,',
'            color: "#ffffff",',
'            background: "#FF0000",',
'         }).then((result) => {',
'            // Cuando se cierra el mensaje, volver a habilitar el tabulador',
'            window.removeEventListener(''keydown'', bloquearTabulador);',
'         });',
'        // Escuchar el evento keydown para bloquear el tabulador',
'        window.addEventListener(''keydown'', bloquearTabulador);',
'    } else {',
'        apex.item("P107_P_ID_DET_PEDIDO").setValue(idDetPedido);',
'        apex.item("P107_P_ENTREGA_DET_PED").setValue(pedidoEntregado);',
'        if (!apex.item("P107_P_ENTREGA_DET_PED").isEmpty()){',
'            apex.item("BTN_ENTREGAR").disable();',
'            apex.item("BTN_PARAR").disable();',
'            apex.item("BTN_INICIAR").disable();',
'            apex.item("P107_NOTA").disable();',
'        } else {',
'            apex.item("BTN_ENTREGAR").enable();',
'            apex.item("BTN_PARAR").enable();',
'            apex.item("BTN_INICIAR").enable();',
'            apex.item("P107_NOTA").enable();',
'        }',
'        apex.theme.openRegion("REG_BITACORA");',
'        apex.region("REG_BITACORA").refresh();',
'    }',
'}',
'function iniciar(){',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("iniciar", {',
'        pageItems: [',
'        "P107_P_ID_DET_PEDIDO",',
'        "P107_NOTA"',
'        ]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.region("REG_BITACORA").refresh();',
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
'    });',
'}',
'function parar(){',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("parar", {',
'        pageItems: [',
'        "P107_P_ID_DET_PEDIDO",',
'        "P107_NOTA"',
'        ]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.region("REG_BITACORA").refresh();',
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
'    });',
'}',
'function entregar(){',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("entregar", {',
'        pageItems: [',
'        "P107_P_ID_DET_PEDIDO",',
'        "P107_NOTA"',
'        ]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.region("REG_DET_PEDIDO_TI").refresh();',
'                apex.theme.closeRegion("REG_BITACORA");',
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
'    });',
'}',
'function edita_bitacora(idBitacora) {',
'    apex.item("P107_P_ID_BITACORA").setValue(idBitacora);',
'//    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("info_bitacora", {',
'        pageItems: [',
'        "P107_P_ID_BITACORA"',
'        ]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                if (!apex.item("P107_P_ENTREGA_DET_PED").isEmpty()){',
'                    apex.item("BTN_APLICAR_BITACORA").disable();                    ',
'                } else {',
'                    apex.item("BTN_APLICAR_BITACORA").enable();',
'                }',
'                apex.theme.openRegion("REG_EDITAR_BITACORA");',
'                apex.region("REG_EDITAR_BITACORA").refresh();',
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
'//        waitPopup.remove();',
'    });',
'}',
'function update_bitacora(){',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("actualizar_bitacora", {',
'        pageItems: [',
'        "P107_P_ID_BITACORA",',
'        "P107_B_INICIO",',
'        "P107_B_FIN",',
'        "P107_B_NOTA"',
'        ]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.theme.closeRegion("REG_EDITAR_BITACORA");',
'                apex.region("REG_BITACORA").refresh();',
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
'    });',
'}',
'function editarObs(){',
'    apex.theme.openRegion("REG_OBS_INTERNA");',
'}',
'function avisoEntregarPedido() {',
'        Swal.fire({',
unistr('            title: ''\00BFConfirma la finalizaci\00F3n del PEDIDO y entrega.?'','),
'            icon: ''warning'',',
'            showCancelButton: true,',
'            concelButtonText: ''Cancelar'',',
'            confirmButtonText: ''Aceptar'',',
'            closeOnConfirm: true,',
'            allowOutsideClick: false,',
'            allowEscapeKey: false,',
'            allowEnterKey: false,',
'            stopKeydownPropagation: true,',
'            backdrop: true,',
'            focusConfirm: true,',
'            color: "#ffffff",',
'            background: "#026609",',
'         }).then((result) => {',
'            // Cuando se cierra el mensaje, volver a habilitar el tabulador',
'            window.removeEventListener(''keydown'', bloquearTabulador);',
'            if (result.isConfirmed) {',
'                entregar_pedido();',
'            }',
'         });',
'        // Escuchar el evento keydown para bloquear el tabulador',
'        window.addEventListener(''keydown'', bloquearTabulador);',
'}',
'function entregar_pedido() {',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("entregar_pedido", {',
'        pageItems: [',
'        "P107_ID_PEDIDO"',
'        ]',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.region("REG_PEDIDO_TI").refresh();',
'                apex.region("REG_MASTER").refresh();',
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
'    });    ',
'}',
''))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'}',
'',
'#P107_ORDER_BY_CONTAINER {',
'    display: none;',
'}'))
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(111038211327625992)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(86947038457749062)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(111039538137625983)
,p_plug_name=>'Search'
,p_region_css_classes=>'search-region padding-md'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(111040391619625981)
,p_name=>'Master Records'
,p_region_name=>'REG_MASTER'
,p_template=>3371237801798025892
,p_display_sequence=>20
,p_region_css_classes=>'search-results'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'t-MediaList--showIcons:t-MediaList--showDesc:t-MediaList--showBadges:u-colors:t-MediaList--stack:t-MediaList--iconsRounded'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_PEDIDO,',
'       NULL LINK_CLASS,',
'       apex_page.get_url(p_items => ''P107_ID_PEDIDO,P107_P_ESTADO,P107_OBSERVACION'', p_values => "ID_PEDIDO"||'',''||"ESTADO"||'',''||"OBS_INTERNA") LINK,',
'       CASE ',
'         WHEN ESTADO = ''FINALIZADO'' then ''fa fa-check''',
'         WHEN ESTADO = ''ANULADO'' then ''fa fa-times''',
'       ELSE ',
'         CASE',
'           WHEN NIV_ID_NIVEL = 1 THEN ''fa fa-exclamation-triangle-o''',
'           WHEN NIV_ID_NIVEL = 2 THEN ''fa fa-exclamation-triangle''',
'           WHEN NIV_ID_NIVEL = 3 THEN ''fa fa-bomb''',
'           WHEN NIV_ID_NIVEL = 4 THEN ''fa fa-fire''',
'         END ',
'       END ICON_CLASS,',
'       NULL LINK_ATTR,',
'       CASE',
'         WHEN estado = ''FINALIZADO'' then ''u-color-20''',
'         WHEN estado = ''ANULADO'' then ''u-color-14''',
'       ELSE ',
'         CASE',
'           WHEN NIV_ID_NIVEL = 1 then ''u-color-16''',
'           WHEN NIV_ID_NIVEL = 2 then ''u-color-21''',
'           WHEN NIV_ID_NIVEL = 3 then ''u-color-23''',
'           WHEN NIV_ID_NIVEL = 4 then ''u-color-39''',
'         END ',
'       END icon_color_class,',
'       CASE WHEN coalesce(:P107_ID_PEDIDO,''0'') = "ID_PEDIDO" THEN',
'         ''is-active'' ',
'       ELSE ',
'         '' ''',
'       END LIST_CLASS,',
'       (',
'         SELECT n.descripcion',
'         FROM nivel_pedido_informatica n',
'         WHERE n.id_nivel = niv_id_nivel',
'       ) ||'' - ''|| substr(PEDIDO,1,40) || ( case when length("PEDIDO") > 40 then ''...'' end ) LIST_TITLE,',
'       (substr("ESTADO", 1, 50)||( case when length("ESTADO") > 50 then ''...'' else '''' end )) LIST_TEXT,',
'       id_pedido LIST_BADGE',
'from "PEDIDO_IT" x',
'where (:P107_SEARCH is null',
'        or upper(x."PEDIDO") like ''%''||upper(:P107_SEARCH)||''%''',
'        or upper(x."ESTADO") like ''%''||upper(:P107_SEARCH)||''%''',
'    )',
'and (Nvl(:APP_ES_COLABORADOR,''NO'') = ''SI'' OR x.ent_id_entidad = :APP_MI_ID_ENTIDAD)',
'order by "PEDIDO"',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P107_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>2093604263195414824
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'<div class="u-tC">No se encuentran datos.</div>'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111041078782625975)
,p_query_column_id=>1
,p_column_alias=>'ID_PEDIDO'
,p_column_display_sequence=>1
,p_column_heading=>'ID_PEDIDO'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111041489938625974)
,p_query_column_id=>2
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>2
,p_column_heading=>'LINK_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111041887033625974)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>3
,p_column_heading=>'LINK'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111042246213625973)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>4
,p_column_heading=>'ICON_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111042712658625973)
,p_query_column_id=>5
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>5
,p_column_heading=>'LINK_ATTR'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111043038476625973)
,p_query_column_id=>6
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>6
,p_column_heading=>'ICON_COLOR_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111043499672625973)
,p_query_column_id=>7
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>7
,p_column_heading=>'LIST_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111043883762625972)
,p_query_column_id=>8
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>8
,p_column_heading=>'LIST_TITLE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111044298419625972)
,p_query_column_id=>9
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>9
,p_column_heading=>'LIST_TEXT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111044713315625972)
,p_query_column_id=>10
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>10
,p_column_heading=>'LIST_BADGE'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(111045097723625813)
,p_name=>'Pedido TI'
,p_region_name=>'REG_PEDIDO_TI'
,p_template=>4072358936313175081
,p_display_sequence=>10
,p_region_css_classes=>'js-master-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--textContent:t-Region--scrollBody:t-Form--slimPadding'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'      CASE ESTADO ',
'        WHEN ''FINALIZADO'' THEN ''color: #026609!important;font-weight: bold!important;'' ',
'        WHEN ''ANULADO'' THEN ''color: #660202!important;font-weight: bold!important;'' ',
'      END style_estado',
'  from PEDIDO_IT',
' where "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_display_when_condition=>'P107_ID_PEDIDO'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2100515439059797523
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Registro no seleccionado.'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111045622165625812)
,p_query_column_id=>1
,p_column_alias=>'ID_PEDIDO'
,p_column_display_sequence=>1
,p_column_heading=>'Id pedido'
,p_column_html_expression=>'<b>#ID_PEDIDO#</b>'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "ID_PEDIDO" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111046081166625812)
,p_query_column_id=>2
,p_column_alias=>'FECHA_PEDIDO'
,p_column_display_sequence=>2
,p_column_heading=>'Fecha pedido'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "FECHA_PEDIDO" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111046493262625812)
,p_query_column_id=>3
,p_column_alias=>'ENT_ID_ENTIDAD'
,p_column_display_sequence=>3
,p_column_heading=>'Entidad'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "ENT_ID_ENTIDAD" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(90258037866810503)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111046840698625811)
,p_query_column_id=>4
,p_column_alias=>'ARE_ID_AREA'
,p_column_display_sequence=>4
,p_column_heading=>'Area'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "ARE_ID_AREA" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(112039354058851882)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111047299213625811)
,p_query_column_id=>5
,p_column_alias=>'NIV_ID_NIVEL'
,p_column_display_sequence=>5
,p_column_heading=>'Nivel'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "NIV_ID_NIVEL" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(112066671818537144)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111047657318625811)
,p_query_column_id=>6
,p_column_alias=>'USU_ID_USUARIO'
,p_column_display_sequence=>6
,p_column_heading=>'Usuario'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "USU_ID_USUARIO" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(83050876087485807)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111048101260625811)
,p_query_column_id=>7
,p_column_alias=>'PEDIDO'
,p_column_display_sequence=>7
,p_column_heading=>'Pedido'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "PEDIDO" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111048485231625810)
,p_query_column_id=>8
,p_column_alias=>'ESTADO'
,p_column_display_sequence=>8
,p_column_heading=>'Estado'
,p_column_html_expression=>'<span style="#STYLE_ESTADO#">#ESTADO#</span>'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "ESTADO" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111048824770625810)
,p_query_column_id=>9
,p_column_alias=>'ANULADO_POR'
,p_column_display_sequence=>9
,p_column_heading=>'Anulado por'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "ANULADO_POR" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111049247970625810)
,p_query_column_id=>10
,p_column_alias=>'ANULADO_EL'
,p_column_display_sequence=>10
,p_column_heading=>'Anulado el'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "ANULADO_EL" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111049680575625810)
,p_query_column_id=>11
,p_column_alias=>'ANULADO_OBS'
,p_column_display_sequence=>11
,p_column_heading=>'Anulado Obs.'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "ANULADO_OBS" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111050103704625810)
,p_query_column_id=>12
,p_column_alias=>'FECHA_INICIO'
,p_column_display_sequence=>12
,p_column_heading=>'Fecha inicio'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "FECHA_INICIO" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111050432514625809)
,p_query_column_id=>13
,p_column_alias=>'FECHA_FIN'
,p_column_display_sequence=>13
,p_column_heading=>'Fecha fin'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "FECHA_FIN" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111050844179625809)
,p_query_column_id=>14
,p_column_alias=>'DIAS_TAREA'
,p_column_display_sequence=>14
,p_column_heading=>unistr('D\00EDas tarea')
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "DIAS_TAREA" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111051255825625809)
,p_query_column_id=>15
,p_column_alias=>'DIAS_PRUEBA'
,p_column_display_sequence=>15
,p_column_heading=>unistr('D\00EDas prueba')
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "DIAS_PRUEBA" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111051700622625809)
,p_query_column_id=>16
,p_column_alias=>'OBS_INTERNA'
,p_column_display_sequence=>16
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "OBS_INTERNA" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112377267021363447)
,p_query_column_id=>17
,p_column_alias=>'FECHA_FINALIZADO'
,p_column_display_sequence=>26
,p_column_heading=>'Fecha finalizado'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "FECHA_FINALIZADO" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112377371544363448)
,p_query_column_id=>18
,p_column_alias=>'USU_ID_USUARIO_FIN'
,p_column_display_sequence=>36
,p_column_heading=>'Usuario finalizo'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PEDIDO_IT"',
'where "USU_ID_USUARIO_FIN" is not null',
'and "ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(83050876087485807)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112378565746363460)
,p_query_column_id=>19
,p_column_alias=>'STYLE_ESTADO'
,p_column_display_sequence=>46
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(111062330386625798)
,p_plug_name=>'Region Display Selector'
,p_region_css_classes=>'js-detail-rds'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P107_ID_PEDIDO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(111062801239625797)
,p_name=>'Detalle pedido TI'
,p_region_name=>'REG_DET_PEDIDO_TI'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'t-Report--stretch:#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       ID_DET_PEDIDO,',
'       PED_ID_PEDIDO,',
'       DET_ID_ESTADO_DET,',
'       USU_ID_USUARIO,',
'       FECHA_ASIGNADO,',
'       NOTA,',
'       FECHA_INICIO_PROPUESTO,',
'       FECHA_FIN_PROPUESTO,',
'       ENTREGADO,',
'       NULL BITACORA,',
'       CASE WHEN ENTREGADO IS NULL THEN NULL ELSE ''SI'' END FUE_ENTREGADO',
'  from DET_PEDIDO_IT',
' where "PED_ID_PEDIDO" = :P107_ID_PEDIDO'))
,p_display_when_condition=>'P107_ID_PEDIDO'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No se encuentran datos.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>5000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111063489883625713)
,p_query_column_id=>1
,p_column_alias=>'ROWID'
,p_column_display_sequence=>1
,p_column_heading=>'<span class="u-VisuallyHidden">Editar</span>'
,p_column_link=>'f?p=&APP_ID.:113:&APP_SESSION.::&DEBUG.:RP:P113_ROWID:#ROWID#'
,p_column_linktext=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P107_P_ESTADO IN (''ACTIVO'',''EN_PROCESO'')'
,p_display_when_condition2=>'PLSQL'
,p_report_column_width=>32
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111063858257625713)
,p_query_column_id=>2
,p_column_alias=>'ID_DET_PEDIDO'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111064289187625712)
,p_query_column_id=>3
,p_column_alias=>'PED_ID_PEDIDO'
,p_column_display_sequence=>3
,p_column_heading=>'Ped Id Pedido'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111064650527625712)
,p_query_column_id=>4
,p_column_alias=>'DET_ID_ESTADO_DET'
,p_column_display_sequence=>4
,p_column_heading=>'Estado/tarea'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(112171909675154522)
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111065112046625712)
,p_query_column_id=>5
,p_column_alias=>'USU_ID_USUARIO'
,p_column_display_sequence=>5
,p_column_heading=>'Usuario asignado'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(83050876087485807)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111065512207625712)
,p_query_column_id=>6
,p_column_alias=>'FECHA_ASIGNADO'
,p_column_display_sequence=>6
,p_column_heading=>'Fecha asignado'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111065849986625712)
,p_query_column_id=>7
,p_column_alias=>'NOTA'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111066268523625712)
,p_query_column_id=>8
,p_column_alias=>'FECHA_INICIO_PROPUESTO'
,p_column_display_sequence=>8
,p_column_heading=>'Inicio propuesto'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111066645994625711)
,p_query_column_id=>9
,p_column_alias=>'FECHA_FIN_PROPUESTO'
,p_column_display_sequence=>9
,p_column_heading=>'Fin propuesto'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(111067047571625711)
,p_query_column_id=>10
,p_column_alias=>'ENTREGADO'
,p_column_display_sequence=>10
,p_column_heading=>'Entregado'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_column_html_expression=>'<font color="green">#ENTREGADO#</font>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112199668441170548)
,p_query_column_id=>11
,p_column_alias=>'BITACORA'
,p_column_display_sequence=>20
,p_column_heading=>'Bitacora'
,p_column_link=>'javascript: lev_bitacora(''#ID_DET_PEDIDO#'',''#FUE_ENTREGADO#'',''#DET_ID_ESTADO_DET#'')'
,p_column_linktext=>'<span aria-hidden="true" class="t-Icon fa fa-alarm-clock"></span>'
,p_column_link_attr=>unistr('title="Bit\00E1cora de la tarea" class="t-Button t-Button--noLabel t-Button--icon t-Button--success t-Button--link"')
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112298025221133543)
,p_query_column_id=>12
,p_column_alias=>'FUE_ENTREGADO'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(111085031889625682)
,p_plug_name=>'No Record Selected'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>70
,p_location=>null
,p_plug_source=>'Registro no seleccionado'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P107_ID_PEDIDO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(112200500123170556)
,p_name=>unistr('Bit\00E1cora de tarea')
,p_region_name=>'REG_BITACORA'
,p_template=>2672673746673652531
,p_display_sequence=>80
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_BITACORA,',
'       DET_ID_DET_PEDIDO,',
'       FECHA_REGISTRO,',
'       INICIO,',
'       FINAL,',
'       NOTA',
'  from PEDIDO_IT_BITACORA',
' where DET_ID_DET_PEDIDO = :P107_P_ID_DET_PEDIDO',
' order by INICIO desc '))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P107_P_ID_DET_PEDIDO'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112200565158170557)
,p_query_column_id=>1
,p_column_alias=>'ID_BITACORA'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112200643960170558)
,p_query_column_id=>2
,p_column_alias=>'DET_ID_DET_PEDIDO'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112200815188170559)
,p_query_column_id=>3
,p_column_alias=>'FECHA_REGISTRO'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112200841315170560)
,p_query_column_id=>4
,p_column_alias=>'INICIO'
,p_column_display_sequence=>40
,p_column_heading=>'Inicio'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_column_link=>'javascript: edita_bitacora(#ID_BITACORA#)'
,p_column_linktext=>'#INICIO#'
,p_column_alignment=>'CENTER'
,p_report_column_width=>200
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112200969916170561)
,p_query_column_id=>5
,p_column_alias=>'FINAL'
,p_column_display_sequence=>50
,p_column_heading=>'Final/pausa'
,p_column_format=>'DD-MM-YYYY HH24:MI'
,p_column_alignment=>'CENTER'
,p_report_column_width=>200
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(112201082130170562)
,p_query_column_id=>6
,p_column_alias=>'NOTA'
,p_column_display_sequence=>60
,p_column_heading=>'Nota'
,p_report_column_width=>400
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(112201634243170568)
,p_plug_name=>'Editar bitacora'
,p_region_name=>'REG_EDITAR_BITACORA'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>100
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(112203708425170588)
,p_plug_name=>unistr('Observaci\00F3n interna')
,p_region_name=>'REG_OBS_INTERNA'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>110
,p_location=>null
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P107_P_ESTADO NOT IN (''ACTIVO'',''EN_PROCESO'')'
,p_plug_read_only_when2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(112249405974978241)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>90
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(112201425819170566)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(112200500123170556)
,p_button_name=>'BTN_INICIAR'
,p_button_static_id=>'BTN_INICIAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--tiny:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Iniciar'
,p_button_redirect_url=>'javascript:iniciar()'
,p_button_execute_validations=>'N'
,p_button_condition=>':P107_P_ESTADO IN (''ACTIVO'',''EN_PROCESO'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-play'
,p_button_cattributes=>'title=''Iniciar contador para la tarea'''
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_security_scheme=>wwv_flow_imp.id(113280573533979445)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(112201540889170567)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(112200500123170556)
,p_button_name=>'BTN_PARAR'
,p_button_static_id=>'BTN_PARAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--tiny:t-Button--danger:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Parar'
,p_button_redirect_url=>'javascript: parar();'
,p_button_execute_validations=>'N'
,p_button_condition=>':P107_P_ESTADO IN (''ACTIVO'',''EN_PROCESO'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-pause'
,p_button_cattributes=>'title=''Parar tiempo para la tarea'''
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
,p_security_scheme=>wwv_flow_imp.id(113280573533979445)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(112249918704978246)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(112200500123170556)
,p_button_name=>'BTN_ENTREGAR'
,p_button_static_id=>'BTN_ENTREGAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Entregar'
,p_button_redirect_url=>'javascript: avisoEntregar();'
,p_button_execute_validations=>'N'
,p_button_condition=>':P107_P_ESTADO IN (''ACTIVO'',''EN_PROCESO'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-box-arrow-out-north'
,p_button_cattributes=>'title=''Entregar la tarea, FINALIZADA'''
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
,p_security_scheme=>wwv_flow_imp.id(113280573533979445)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(112202166366170573)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(112201634243170568)
,p_button_name=>'B_Retornar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(112202117852170572)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(112201634243170568)
,p_button_name=>'B_Aplicar'
,p_button_static_id=>'BTN_APLICAR_BITACORA'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'javascript:update_bitacora()'
,p_button_execute_validations=>'N'
,p_security_scheme=>wwv_flow_imp.id(113280573533979445)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(112202771450170579)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(111062801239625797)
,p_button_name=>'POP_OBS_INTERNA'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Observaciones del departamento de TI'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'javascript: editarObs()'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-file-text-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(112380179541363476)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(111045097723625813)
,p_button_name=>'REGRESAR_A_99'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Regresar al reporte'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:99:&SESSION.::&DEBUG.:RP,::'
,p_button_condition=>'P107_P_ORIGEN'
,p_button_condition2=>'99'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(111085541715625681)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(111045097723625813)
,p_button_name=>'EDIT'
,p_button_static_id=>'edit_master_btn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Editar'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:112:&APP_SESSION.::&DEBUG.:RP,112:P112_ID_PEDIDO:&P107_ID_PEDIDO.'
,p_icon_css_classes=>'fa-pencil-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(112202622709170578)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(111062801239625797)
,p_button_name=>'POP_CERRAR_PEDIDO'
,p_button_static_id=>'BTN_CERRAR_PEDIDO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--success'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Cerrar pedido'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'javascript: avisoEntregarPedido()'
,p_button_execute_validations=>'N'
,p_button_condition=>'pkg_pedido_ti.f_det_abiertos(pi_id_pedido => :P107_ID_PEDIDO)'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(124983263730778141)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(111045097723625813)
,p_button_name=>'ADJUNTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Adjuntos'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:121:&SESSION.::&DEBUG.:RP,121:P121_P_ID_PEDIDO:&P107_ID_PEDIDO.'
,p_icon_css_classes=>'fa-pencil-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(111071198300625708)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(111062801239625797)
,p_button_name=>'POP_ADD_DET_PEDIDO_IT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Agregar detalle'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:113:&APP_SESSION.::&DEBUG.:RP,113:P113_PED_ID_PEDIDO:&P107_ID_PEDIDO.'
,p_button_condition=>':P107_P_ESTADO IN (''ACTIVO'',''EN_PROCESO'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(113280746586978434)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(111038900508625983)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(111038211327625992)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--noUI:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Restablecer'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:107:&APP_SESSION.:RESET:&DEBUG.:RP,107::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(112376840520363443)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(112203708425170588)
,p_button_name=>'BTN_APLICAR_OBS'
,p_button_static_id=>'BTN_APLICAR_OBS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_condition=>':P107_P_ESTADO IN (''ACTIVO'',''EN_PROCESO'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(113280573533979445)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(111039297050625983)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(111038211327625992)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear pedido'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:112:&APP_SESSION.::&DEBUG.:RP,112::'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(113280746586978434)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(112203417538170585)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(112200500123170556)
,p_button_name=>'BTN_REGRESA_BITACORA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Regresar'
,p_button_position=>'PREVIOUS'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(112203855485170590)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(112203708425170588)
,p_button_name=>'BTN_RETORNAR_OBS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'PREVIOUS'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(111040087421625981)
,p_name=>'P107_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(111039538137625983)
,p_prompt=>'Buscar'
,p_placeholder=>'Buscar...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:t-Form-fieldContainer--postTextBlock'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(111062112896625798)
,p_name=>'P107_ID_PEDIDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(111045097723625813)
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(112201383443170565)
,p_name=>'P107_NOTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(112200500123170556)
,p_prompt=>'Nota'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>200
,p_cHeight=>3
,p_display_when=>':P107_P_ESTADO IN (''ACTIVO'',''EN_PROCESO'')'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'Y',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(112201747674170569)
,p_name=>'P107_B_INICIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(112201634243170568)
,p_prompt=>'Inicio'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
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
  'show_time', 'Y',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(112201825347170570)
,p_name=>'P107_B_FIN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(112201634243170568)
,p_prompt=>'Final/pausa'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
  'show_time', 'Y',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(112202005302170571)
,p_name=>'P107_B_NOTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(112201634243170568)
,p_prompt=>'Nota'
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
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(112203094247170582)
,p_name=>'P107_P_ESTADO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(112249405974978241)
,p_prompt=>'P Estado'
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
 p_id=>wwv_flow_imp.id(112203191963170583)
,p_name=>'P107_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(111062801239625797)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'FECHA_INICIO_PROPUESTO'
,p_prompt=>'Order By'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:FECHA_INICIO_PROPUESTO;FECHA_INICIO_PROPUESTO'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(112203815022170589)
,p_name=>'P107_OBSERVACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(112203708425170588)
,p_prompt=>'Nota'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>800
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'Y',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(112249466713978242)
,p_name=>'P107_P_ID_BITACORA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(112249405974978241)
,p_prompt=>'P Id Bitacora'
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
 p_id=>wwv_flow_imp.id(112249548070978243)
,p_name=>'P107_P_ID_DET_PEDIDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(112249405974978241)
,p_prompt=>'P Id Det Pedido'
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
 p_id=>wwv_flow_imp.id(112297967613133542)
,p_name=>'P107_P_ENTREGA_DET_PED'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(112249405974978241)
,p_prompt=>'P Entrega Det Ped'
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
 p_id=>wwv_flow_imp.id(112380040241363475)
,p_name=>'P107_P_ORIGEN'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(112249405974978241)
,p_prompt=>'P Origen'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_item_comment=>'Cuando se llega desde otra pagina. Aqui se guarda el nro. pagina'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(111085893101625681)
,p_name=>'Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(111045097723625813)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111086462795625680)
,p_event_id=>wwv_flow_imp.id(111085893101625681)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(111045097723625813)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111086927281625680)
,p_event_id=>wwv_flow_imp.id(111085893101625681)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Pedido It row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(111062843281625797)
,p_name=>'Dialog Closed'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(111062801239625797)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111071896253625707)
,p_event_id=>wwv_flow_imp.id(111062843281625797)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(111062801239625797)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111072412275625706)
,p_event_id=>wwv_flow_imp.id(111062843281625797)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Tarea pedido TI row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(111085966177625681)
,p_name=>'Perform Search'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P107_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111087807917625679)
,p_event_id=>wwv_flow_imp.id(111085966177625681)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(111040391619625981)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111088249550625679)
,p_event_id=>wwv_flow_imp.id(111085966177625681)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(112202375661170575)
,p_name=>'Retornar de bitacora'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(112202166366170573)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(112202463834170576)
,p_event_id=>wwv_flow_imp.id(112202375661170575)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(112201634243170568)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(112203425605170586)
,p_name=>'Cerrar region bitacora de tarea'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(112203417538170585)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(112203519199170587)
,p_event_id=>wwv_flow_imp.id(112203425605170586)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(112200500123170556)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(112376633893363441)
,p_name=>'Regresar de obs'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(112203855485170590)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(112376818766363442)
,p_event_id=>wwv_flow_imp.id(112376633893363441)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(112203708425170588)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(112377079953363445)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar OBS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE PEDIDO_IT',
'SET OBS_INTERNA = :P107_OBSERVACION',
'WHERE ID_PEDIDO = :P107_ID_PEDIDO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(112376840520363443)
,p_internal_uid=>38644060889356705
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(112249650775978244)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'iniciar'
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
'    pkg_pedido_ti.p_iniciar_bitacora(',
'          pi_id_det_pedido =>  :P107_P_ID_DET_PEDIDO',
'        , pi_nota => :P107_NOTA',
'    );',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    --output_json_item(''P470_N_PORC_CUBIERTO'', :P470_N_PORC_CUBIERTO);',
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
,p_internal_uid=>38516631711971504
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(112249760312978245)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'parar'
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
'    pkg_pedido_ti.p_parar_bitacora(',
'          pi_id_det_pedido =>  :P107_P_ID_DET_PEDIDO',
'        , pi_nota => :P107_NOTA',
'    );',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    --output_json_item(''P470_N_PORC_CUBIERTO'', :P470_N_PORC_CUBIERTO);',
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
,p_internal_uid=>38516741248971505
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(112202315654170574)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'info_bitacora'
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
'    pkg_pedido_ti.p_info_bitacora(',
'            pi_id_bitacora => :P107_P_ID_BITACORA',
'          , po_inicio => :P107_B_INICIO',
'          , po_final => :P107_B_FIN',
'          , po_nota => :P107_B_NOTA);',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    output_json_item(''P107_B_INICIO'', :P107_B_INICIO);',
'    output_json_item(''P107_B_FIN'', :P107_B_FIN);',
'    output_json_item(''P107_B_NOTA'', :P107_B_NOTA);',
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
,p_internal_uid=>38469296590163834
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(112202571345170577)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'actualizar_bitacora'
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
'    pkg_pedido_ti.p_update_bitacora(',
'        pi_id_bitacora => :P107_P_ID_BITACORA',
'      , pi_inicio => :P107_B_INICIO',
'      , pi_final => :P107_B_FIN',
'      , pi_nota => :P107_B_NOTA',
'    );',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    --output_json_item(''P107_B_INICIO'', :P107_B_INICIO);',
'    --output_json_item(''P107_B_FIN'', :P107_B_FIN);',
'    --output_json_item(''P107_B_NOTA'', :P107_B_NOTA);',
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
,p_internal_uid=>38469552281163837
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(112297832431133541)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'entregar'
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
'    pkg_pedido_ti.p_entregar_det_pedido(',
'        pi_id_det_pedido => :P107_P_ID_DET_PEDIDO',
'      , pi_nota => :P107_NOTA',
'    );',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    --output_json_item(''P107_B_NOTA'', :P107_B_NOTA);',
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
,p_internal_uid=>38564813367126801
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(112377175587363446)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'entregar_pedido'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  PROCEDURE output_json_item (',
'      p_item_name  IN VARCHAR2',
'    , p_item_value IN VARCHAR2)',
'  AS',
'  BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'  END output_json_item;',
'BEGIN',
'',
'    pkg_pedido_ti.p_entregar_pedido(pi_id_pedido => :P107_ID_PEDIDO);',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.open_array(''items'');',
'    /*output_json_item(''P470_P_ITEM_DUPLICANDO'', :P470_P_ITEM_DUPLICANDO);*/',
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
,p_internal_uid=>38644156523356706
);
wwv_flow_imp.component_end;
end;
/
