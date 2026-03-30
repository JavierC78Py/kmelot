prompt --application/pages/page_00092
begin
--   Manifest
--     PAGE: 00092
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
 p_id=>92
,p_name=>'Cola mensaje'
,p_alias=>'COLA-MENSAJE'
,p_page_mode=>'MODAL'
,p_step_title=>'Cola mensaje'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function borrar(p_id_grupo) {',
unistr('    apex.message.confirm(''Se eliminaran los mensajes pendientes de envio, \00BFdesea proceder? '', function( okPressed ) {'),
'        if ( okPressed ) {',
'            var waitPopup = apex.widget.waitPopup();',
'            apex.message.clearErrors(); ',
'            apex.server.process("eliminar_detalle", {',
'                x01: p_id_grupo',
'            },',
'            {',
'                success: function( data ) {',
'                    if ( data.success === true ) {',
'                        for (var i=0; i < data.items.length; i++){',
'                            apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                        }',
'                        apex.navigation.dialog.close(true);',
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
'            });',
'        }',
'    });',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86908565546991448)
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
 p_id=>wwv_flow_imp.id(95286630118056639)
,p_plug_name=>'Cola mensaje'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_COLA_MENSAJE,',
'       GRU_ID_GRUPO_COLA,',
'       DESTINATARIO,',
'       MENSAJE,',
'       FECHA_ALTA,',
'       FECHA_ENVIAR,',
'       FECHA_ENVIADO,',
'       PRIORIDAD,',
'       USUARIO,',
'       CUENTA_ENVIAR,',
'       CUENTA_ENVIO',
'  from COLA_MENSAJE',
' where (:P92_P_ID_GRUPO IS NULL OR GRU_ID_GRUPO_COLA = :P92_P_ID_GRUPO)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P92_P_ID_GRUPO'
,p_prn_page_header=>'Cola mensaje'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(95286794912056639)
,p_name=>'Cola mensaje'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:93:&APP_SESSION.::&DEBUG.:RP:P93_ID_COLA_MENSAJE:\#ID_COLA_MENSAJE#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>21553775848049899
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(95287148223056642)
,p_db_column_name=>'ID_COLA_MENSAJE'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id cola mensaje'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(95288004968056642)
,p_db_column_name=>'DESTINATARIO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Destinatario'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(95288398152056642)
,p_db_column_name=>'MENSAJE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Mensaje'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(95288745239056643)
,p_db_column_name=>'FECHA_ALTA'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Fecha alta'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(95289182915056643)
,p_db_column_name=>'FECHA_ENVIAR'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Fecha enviar'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(95289539814056643)
,p_db_column_name=>'FECHA_ENVIADO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Fecha enviado'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(95290015951056643)
,p_db_column_name=>'PRIORIDAD'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Prioridad'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(95204075784524564)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(95290353425056643)
,p_db_column_name=>'USUARIO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(95290727858056644)
,p_db_column_name=>'CUENTA_ENVIAR'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Cuenta enviar'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(95291152119056644)
,p_db_column_name=>'CUENTA_ENVIO'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Cuenta envio'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(86908733857991450)
,p_db_column_name=>'GRU_ID_GRUPO_COLA'
,p_display_order=>21
,p_column_identifier=>'L'
,p_column_label=>'Id Grupo Cola'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(95293777212067668)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'215608'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'GRU_ID_GRUPO_COLA:ID_COLA_MENSAJE:DESTINATARIO:MENSAJE:FECHA_ALTA:FECHA_ENVIAR:FECHA_ENVIADO:PRIORIDAD:USUARIO:CUENTA_ENVIAR:CUENTA_ENVIO:'
,p_sort_column_1=>'ID_COLA_MENSAJE'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(95291653120056644)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(95286630118056639)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:93:&SESSION.::&DEBUG.:93:P93_GRU_ID_GRUPO_COLA:&P92_P_ID_GRUPO.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(86909725053991460)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(95286630118056639)
,p_button_name=>'BORRAR'
,p_button_static_id=>'BTN_BORRAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Borrar detalle'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'javascript: borrar(''&P92_P_ID_GRUPO.'')'
,p_button_condition=>'P92_P_ID_GRUPO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86908632097991449)
,p_name=>'P92_P_ID_GRUPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(86908565546991448)
,p_prompt=>'P Id Grupo'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(95291919411056644)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(95286630118056639)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95292448941056646)
,p_event_id=>wwv_flow_imp.id(95291919411056644)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(95286630118056639)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(86909824786991461)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'eliminar_detalle'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'PROCEDURE output_json_item (',
'  p_item_name  IN VARCHAR2',
', p_item_value IN VARCHAR2)',
'AS',
'    BEGIN',
'        apex_json.open_object;',
'        apex_json.write(''id''    , p_item_name);',
'        apex_json.write(''value'' , p_item_value, TRUE);',
'        apex_json.close_object;',
'    END output_json_item;',
'BEGIN',
'    DELETE cola_mensaje c',
'    WHERE c.gru_id_grupo_cola = apex_application.g_x01',
'    AND c.fecha_enviado IS NULL',
'    ;',
'    ',
'  apex_json.open_object;',
'  apex_json.write(''success'', TRUE);',
'  apex_json.open_array(''items'');',
'  apex_json.close_array;',
'  apex_json.close_object;  ',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
'    apex_json.open_object;',
'    apex_json.write(''success'', FALSE);',
'    apex_json.write(''message'', utl_call_stack.error_msg(1));',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_process_success_message=>'Registros eliminados'
,p_internal_uid=>13176805722984721
);
wwv_flow_imp.component_end;
end;
/
