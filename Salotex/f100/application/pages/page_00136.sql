prompt --application/pages/page_00136
begin
--   Manifest
--     PAGE: 00136
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
 p_id=>136
,p_name=>'Parametro reserva'
,p_alias=>'PARAMETRO-RESERVA'
,p_step_title=>'Parametro reserva'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function initCheckboxSelection() {',
'    // Selector para el checkbox maestro y los checkboxes individuales',
'    const $checkAll = $(''#checkAll'');',
'    const $checkboxes = $(''.ir-checkbox-selector'');',
'',
'    // Limpiar eventos previos para evitar duplicados',
'    $checkAll.off(''change'');',
'    $checkboxes.off(''change'');',
'',
'    // Evento para el checkbox maestro (marcar/desmarcar todos)',
'    $checkAll.on(''change'', function() {',
'        const isChecked = $(this).prop(''checked'');',
'        ',
'        // Marcar/desmarcar todos los checkboxes',
'        $checkboxes.prop(''checked'', isChecked);',
'        ',
'        // Actualizar estado visual de las filas',
'        $checkboxes.closest(''tr'').toggleClass(''is-selected'', isChecked);',
'    });',
'',
'    // Evento para checkboxes individuales',
'    $checkboxes.on(''change'', function() {',
'        // Contar checkboxes seleccionados',
'        const totalCheckboxes = $checkboxes.length;',
'        const checkedCheckboxes = $checkboxes.filter('':checked'').length;',
'',
'        // Actualizar estado visual de la fila actual',
'        $(this).closest(''tr'').toggleClass(''is-selected'', $(this).prop(''checked''));',
'',
unistr('        // L\00F3gica para actualizar el checkbox maestro'),
'        if (checkedCheckboxes === 0) {',
'            // Ninguno marcado',
'            $checkAll.prop({',
'                checked: false,',
'                indeterminate: false',
'            });',
'        } else if (checkedCheckboxes === totalCheckboxes) {',
'            // Todos marcados',
'            $checkAll.prop({',
'                checked: true,',
'                indeterminate: false',
'            });',
'        } else {',
'            // Algunos marcados',
'            $checkAll.prop({',
'                checked: false,',
'                indeterminate: true',
'            });',
'        }',
'    });',
'',
'    // Agregar un manejador adicional para asegurar la funcionalidad completa',
'    $checkAll.on(''click'', function() {',
'        const isChecked = $(this).prop(''checked'');',
'        $checkboxes.prop(''checked'', isChecked);',
'        $checkboxes.closest(''tr'').toggleClass(''is-selected'', isChecked);',
'        ',
unistr('        // Forzar la actualizaci\00F3n del estado'),
'        $checkAll.trigger(''change'');',
'    });',
'}',
'',
'function mascaraFechaRegex(campo) {',
'    $(campo).on(''input'', function(e) {',
'        let value = e.target.value.replace(/\D/g, '''');',
'        value = value.replace(/^(\d{2})(\d)/g, "$1-$2");',
'        value = value.replace(/^(\d{2})\-(\d{2})(\d)/g, "$1-$2-$3");',
'        $(this).val(value);',
'    });',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#checkAll'').click(function () { ',
'   $(''input:checkbox'').prop(''checked'', this.checked); ',
'});',
'mascaraFechaRegex("#P136_FECHA_DESDE");',
'mascaraFechaRegex("#P136_FECHA_HASTA");'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(134470738413800019)
,p_plug_name=>'Parametro reserva'
,p_region_name=>'mi_grid'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH ',
'dias AS (',
'    SELECT 1 AS num, ''Lunes'' AS dia FROM dual UNION ALL',
'    SELECT 2, ''Martes'' FROM dual UNION ALL',
unistr('    SELECT 3, ''Mi\00E9rcoles'' FROM dual UNION ALL'),
'    SELECT 4, ''Jueves'' FROM dual UNION ALL',
'    SELECT 5, ''Viernes'' FROM dual UNION ALL',
unistr('    SELECT 6, ''S\00E1bado'' FROM dual UNION ALL'),
'    SELECT 7, ''Domingo'' FROM dual',
')',
'SELECT ',
'    APEX_ITEM.checkbox2 (p_idx          => r.id_parametro_reserva,',
'                         p_value        => r.id_parametro_reserva,',
'                         p_attributes   => ''" class="ir-edit-input ir-checkbox-selector select-row custom-checkbox"'',',
'                         p_item_id      => ''C-'' || r.id_parametro_reserva || ''-20'')',
'    AS seleccion,',
'    r.id_parametro_reserva,',
'    r.ent_id_entidad,',
'    r.det_id_det_especialidad,',
'    r.nro_dia,',
'    (',
'        SELECT LISTAGG(',
'            ( SELECT dia ',
'              FROM dias ',
'              WHERE num = t.column_value',
'            ),'':'') WITHIN GROUP (ORDER BY t.column_value)',
'        FROM TABLE(apex_string.split_numbers(p_str => r.nro_dia, p_sep => '':'')) t',
'    ) AS dias_semana,',
'    numero_a_hora(r.hora_desde) AS hora_desde,',
'    numero_a_hora(r.hora_hasta) AS hora_hasta,',
'    r.estado,',
'    r.frecuencia_atencion||'' min.'' AS frecuencia_atencion,',
'    CASE r.estado WHEN ''ACTIVO'' THEN ''color: #239B56!important;font-weight: bold!important;'' WHEN ''INACTIVO'' THEN ''color: #B03A2E!important;font-weight: bold!important;'' END style_estado,',
'    r.suc_id_suc_entidad',
'FROM reserva_parametros r'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Parametro reserva'
,p_plug_header=>unistr('<b>Par\00E1metros para generaci\00F3n de reservas.</b>')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(134470839781800019)
,p_name=>'Parametro reserva'
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
,p_detail_link=>'f?p=&APP_ID.:137:&APP_SESSION.::&DEBUG.:RP:P137_ID_PARAMETRO_RESERVA:\#ID_PARAMETRO_RESERVA#\'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>60737820717793279
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(134471598496800020)
,p_db_column_name=>'ID_PARAMETRO_RESERVA'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id parametro'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(134473936417800021)
,p_db_column_name=>'ESTADO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_html_expression=>'<span style="#STYLE_ESTADO#">#ESTADO#</span>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132633360800385777)
,p_db_column_name=>'ENT_ID_ENTIDAD'
,p_display_order=>19
,p_column_identifier=>'J'
,p_column_label=>'Prestador'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(132620124778091696)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132633452074385778)
,p_db_column_name=>'DET_ID_DET_ESPECIALIDAD'
,p_display_order=>29
,p_column_identifier=>'K'
,p_column_label=>'Especialidad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(132599214015901874)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132633538041385779)
,p_db_column_name=>'NRO_DIA'
,p_display_order=>39
,p_column_identifier=>'L'
,p_column_label=>'Nro Dia'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132633641381385780)
,p_db_column_name=>'DIAS_SEMANA'
,p_display_order=>49
,p_column_identifier=>'M'
,p_column_label=>unistr('D\00EDas de la semana')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132633737120385781)
,p_db_column_name=>'HORA_DESDE'
,p_display_order=>59
,p_column_identifier=>'N'
,p_column_label=>'Hora desde'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132633912542385782)
,p_db_column_name=>'HORA_HASTA'
,p_display_order=>69
,p_column_identifier=>'O'
,p_column_label=>'Hora hasta'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132634158202385785)
,p_db_column_name=>'FRECUENCIA_ATENCION'
,p_display_order=>79
,p_column_identifier=>'R'
,p_column_label=>'Frecuencia'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132634229944385786)
,p_db_column_name=>'STYLE_ESTADO'
,p_display_order=>89
,p_column_identifier=>'S'
,p_column_label=>'Style Estado'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(132634479096385788)
,p_db_column_name=>'SUC_ID_SUC_ENTIDAD'
,p_display_order=>99
,p_column_identifier=>'T'
,p_column_label=>'Consultorio'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span style="font-size: xx-small;">#SUC_ID_SUC_ENTIDAD#</span>',
''))
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(134564062086284179)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(134583755252309147)
,p_db_column_name=>'SELECCION'
,p_display_order=>109
,p_column_identifier=>'X'
,p_column_label=>'<input type="checkbox" id="checkAll" class="custom-checkbox" >'
,p_alternative_label=>unistr('Selecci\00F3n')
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
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(134477304473802125)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'607443'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_PARAMETRO_RESERVA:SELECCION:ESTADO:ENT_ID_ENTIDAD:SUC_ID_SUC_ENTIDAD:DET_ID_DET_ESPECIALIDAD:DIAS_SEMANA:HORA_DESDE:HORA_HASTA:FRECUENCIA_ATENCION:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(134476521032800023)
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
 p_id=>wwv_flow_imp.id(134583195406309141)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(134470738413800019)
,p_button_name=>'GENERAR'
,p_button_static_id=>'BTN_GENERAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--gapTop'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar reservas'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_security_scheme=>wwv_flow_imp.id(134727324663018832)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(134475271963800022)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(134470738413800019)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear parametro'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:137:&APP_SESSION.::&DEBUG.:137::'
,p_security_scheme=>wwv_flow_imp.id(134548603786476258)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132634584734385789)
,p_name=>'P136_FECHA_DESDE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(134470738413800019)
,p_prompt=>'Fecha desde'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>10
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132634640399385790)
,p_name=>'P136_FECHA_HASTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(134470738413800019)
,p_prompt=>'Fecha hasta'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>10
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134475520463800022)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(134470738413800019)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134476056933800022)
,p_event_id=>wwv_flow_imp.id(134475520463800022)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(134470738413800019)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(134583837754309148)
,p_name=>'Genera'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(134583195406309141)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(134583980789309149)
,p_event_id=>wwv_flow_imp.id(134583837754309148)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('// Funci\00F3n para obtener estados de los checkboxes'),
'function getAllCheckboxStates() {',
'    var checkStates = [];    ',
unistr('    // Selecciona todos los checkboxes de la regi\00F3n'),
'    $(''.select-row.custom-checkbox'').each(function() {',
unistr('        // A\00F1adir console.log para depuraci\00F3n'),
'        console.log(''Checkbox encontrado:'', {',
'            id: $(this).val(),',
'            checked: $(this).is('':checked'')',
'        });        ',
'        checkStates.push({',
'            id: $(this).val(),',
'            checked: $(this).is('':checked'') ? ''1'' : ''0''',
'        });',
'    });    ',
'    // Generar el JSON final con la clave "a"',
'    var finalJson = {',
'        a: checkStates',
'    };',
'    console.log(''Array final de estados:'', finalJson);',
'',
'    return finalJson;',
'}',
'',
'',
'function generar() {',
'    var checkStates = getAllCheckboxStates();',
'    console.log(''Datos a enviar:'', JSON.stringify(checkStates));',
'    apex.message.clearErrors();',
'    if (checkStates.a && checkStates.a.length > 0) {',
'        apex.server.process(',
'            ''genera_reservas'',',
'            {',
'                x01: JSON.stringify(checkStates),',
'                pageItems: [',
'                "P136_FECHA_DESDE",',
'                "P136_FECHA_HASTA"]',
'            },',
'            {',
'                success: function(data) {',
'                    console.log(''Respuesta del servidor:'', data);',
'                    ',
'                    if (data.success === true) {',
'                        if (data.items && data.items.length > 0) {',
'                            for (var i = 0; i < data.items.length; i++) {',
'                                apex.item(data.items[i].id).setValue(data.items[i].value);',
'                            }',
'                        }',
'                        ',
unistr('                        apex.message.showPageSuccess(''Generaci\00F3n finalizada, ''+data.procesados+'' registro(s) procesado(s).'');'),
'                        apex.region(''mi_grid'').refresh();',
'                    } else {',
'                        apex.message.showErrors([{',
'                            type: "error",',
'                            location: "page",',
'                            message: data.message || ''Error al generar las reservas'',',
'                            unsafe: false',
'                        }]);',
'                    }',
'                },',
'                error: function(jqXHR, textStatus, errorThrown) {',
'                    console.error(''Error en la llamada AJAX:'', {',
'                        status: textStatus,',
'                        error: errorThrown,',
'                        response: jqXHR.responseText',
'                    });',
'                    ',
'                    apex.message.showErrors([{',
'                        type: "error",',
'                        location: "page",',
unistr('                        message: ''Error en la comunicaci\00F3n con el servidor: '' + errorThrown,'),
'                        unsafe: false',
'                    }]);',
'                }',
'            }',
'        );',
'    } else {',
'        apex.message.alert(''No se encontraron registros para procesar'');',
'    }',
'}    ',
'',
'Swal.fire({',
unistr('    title: "\00BFEsta seguro en GENERAR LAS RESERVAS?",'),
'    showDenyButton: true,',
'    showCancelButton: false,',
'    confirmButtonText: "Generar",',
'    denyButtonText: ''Regresar''',
'}).then((result) => {',
'    if (result.isConfirmed) {',
'      generar();',
'    } else if (result.isDenied) {',
unistr('      Swal.fire("Generaci\00F3n no realizada", "", "info");'),
'    }',
'});',
''))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134583228108309142)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P136_FECHA_DESDE IS NULL THEN',
'    :P136_FECHA_DESDE := Trunc(SYSDATE,''MM'');',
'    :P136_FECHA_HASTA := (Add_Months(Trunc(SYSDATE,''MM''),1)-1);',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>60850209044302402
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(134583423082309144)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'genera_reservas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    PROCEDURE output_json_item (',
'        p_item_name  IN VARCHAR2,',
'        p_item_value IN VARCHAR2)',
'    AS',
'    BEGIN',
'        apex_json.open_object;',
'        apex_json.write(''seq_id'', p_item_name);',
'        apex_json.write(''value'', p_item_value, TRUE);',
'        apex_json.close_object;',
'    END output_json_item;',
'',
'BEGIN',
'    DECLARE',
'        l_json_string VARCHAR2(32767);',
'        l_count       NUMBER;',
'        l_id          VARCHAR2(100);',
'        l_state       VARCHAR2(1);',
'        l_marcado     NUMBER;',
'    BEGIN',
'        -- Captura el JSON recibido',
'        l_json_string := apex_application.g_x01;',
'        -- Parsear el JSON',
'        apex_json.parse(l_json_string);',
'        -- Obtener la cantidad de registros en el JSON',
'        l_count := apex_json.get_count(p_path => ''a'');',
'        IF nvl(l_count,0) = 0 THEN',
'            RAISE_APPLICATION_ERROR(-20000,''No existen registros a procesar.'');',
'        END IF;',
'        -- Procesar cada registro del JSON',
'        FOR i IN 1..l_count LOOP',
'            BEGIN',
'                -- Obtener los valores de cada campo',
'                l_id := apex_json.get_varchar2(p_path => ''a[%d].id'', p0 => i);',
'                l_state := apex_json.get_varchar2(p_path => ''a[%d].checked'', p0 => i);',
unistr('                -- Depuraci\00F3n: muestra el registro procesado'),
'                --raise_application_error(-20000, ''Registro '' || i || '': ID='' || l_id || '', State='' || l_state);',
'                IF l_state = ''1'' THEN',
'                    l_marcado := nvl(l_marcado,0) + 1;',
'                    pkg_consultorio.p_genera_reg_reserva(',
'                        pi_fecha_desde => :P136_FECHA_DESDE',
'                      , pi_fecha_hasta => :P136_FECHA_HASTA',
'                      , pi_id_parametro => l_id',
'                    );',
'                END if;',
'            END;',
'        END LOOP;',
unistr('        -- Confirmar transacci\00F3n si todo fue correcto'),
'        IF nvl(l_marcado,0) = 0 THEN',
'            RAISE_APPLICATION_ERROR(-20000,''No se seleccionaron registros a procesar.'');',
'        END IF;',
'        COMMIT;',
unistr('        -- Respuesta de \00E9xito'),
'        apex_json.open_object;',
'        apex_json.write(''success'', TRUE);',
'        apex_json.write(''procesados'', l_marcado);',
'        apex_json.open_array(''items'');',
'        apex_json.close_array;',
'        apex_json.close_object;',
'    EXCEPTION',
'        WHEN OTHERS THEN',
'            -- Generar respuesta de error en formato JSON',
'            apex_json.open_object;',
'            apex_json.write(''success'', FALSE);',
'            apex_json.write(''message'', utl_call_stack.error_msg(1));            ',
'            apex_json.close_object;',
'    END;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_process_success_message=>'Registro para reserva de consultas insertados...'
,p_internal_uid=>60850404018302404
);
wwv_flow_imp.component_end;
end;
/
