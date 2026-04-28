prompt --application/pages/page_00089
begin
--   Manifest
--     PAGE: 00089
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
 p_id=>89
,p_name=>'Grupo mensaje'
,p_alias=>'GRUPO-MENSAJE'
,p_step_title=>'Grupo mensaje'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function ver_detalle(p_id_grupo){',
'    var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("ver_detalle_mensaje", {',
'        x01: p_id_grupo',
'    },',
'    {',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                //ir a la pagina',
'               let url = $v("P89_P_URL");',
'                apex.navigation.redirect(url);',
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
'',
'function archivo(){',
unistr('    apex.message.confirm(''Usted descargar\00E1 el programa para realizar el envio de whatsapp, descomprimir este archivo en la unidad C. Quedar\00E1 la carpeta c:\005Cwhatsapp-js, dentro de est\00E1 carpeta esta el archivo whatsappjs2.exe. Ejecute el mismo y escanee')
||unistr(' el QR con la linea que realizara el envio. \00BFContinuar?'',function( okPressed ) {'),
'        if (okPressed) {',
'            let url = $v("P89_P_URL_ARCHIVO");',
'            apex.navigation.redirect(url);',
'        }',
'    });',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206142562948647591)
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
 p_id=>wwv_flow_imp.id(214426368147128810)
,p_plug_name=>'Grupo mensaje'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_GRUPO_COLA,',
'       MENSAJE,',
'       FECHA_ALTA,',
'       FECHA_ENVIAR,',
'       PRIORIDAD,',
'       USUARIO,',
'       CUENTA_ENVIAR,',
'       ESTADO,',
'       ''Detalle'' Numeros,',
'       case when ESTADO = ''ENVIAR'' then ''u-color-5'' end as class_estado',
'  from GRUPO_COLA_MENSAJE'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Grupo mensaje'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(214426536961128810)
,p_name=>'Grupo mensaje'
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
,p_detail_link=>'f?p=&APP_ID.:90:&APP_SESSION.::&DEBUG.:RP:P90_ID_GRUPO_COLA:\#ID_GRUPO_COLA#\'
,p_detail_link_text=>'<span role="img" aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>21459992325465932
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214426866808128813)
,p_db_column_name=>'ID_GRUPO_COLA'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id grupo cola'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214427322490128829)
,p_db_column_name=>'MENSAJE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Mensaje'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214427707410128829)
,p_db_column_name=>'FECHA_ALTA'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Fecha alta'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214428074223128830)
,p_db_column_name=>'FECHA_ENVIAR'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Fecha enviar'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214428481664128832)
,p_db_column_name=>'PRIORIDAD'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Prioridad'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(214437601356180702)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214428916333128832)
,p_db_column_name=>'USUARIO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214429262269128832)
,p_db_column_name=>'CUENTA_ENVIAR'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Cuenta enviar'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206141475832647580)
,p_db_column_name=>'ESTADO'
,p_display_order=>17
,p_column_identifier=>'H'
,p_column_label=>'Estado'
,p_column_html_expression=>'<div class="#CLASS_ESTADO#">#ESTADO#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206141895840647584)
,p_db_column_name=>'NUMEROS'
,p_display_order=>47
,p_column_identifier=>'K'
,p_column_label=>unistr('N\00FAmeros')
,p_column_link=>'javascript: ver_detalle(''#ID_GRUPO_COLA#'')'
,p_column_linktext=>'#NUMEROS#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206143513696647600)
,p_db_column_name=>'CLASS_ESTADO'
,p_display_order=>57
,p_column_identifier=>'L'
,p_column_label=>'Class Estado'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(214432012366129854)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'214655'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_GRUPO_COLA:MENSAJE:FECHA_ALTA:FECHA_ENVIAR:PRIORIDAD:USUARIO:CUENTA_ENVIAR:ESTADO:NUMEROS'
,p_sort_column_1=>'ID_GRUPO_COLA'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(214431237693128835)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(206180564029405200)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214429754223128833)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(214426368147128810)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:90:&APP_SESSION.::&DEBUG.:90::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(206143156546647597)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(214426368147128810)
,p_button_name=>'VerCola'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Ver cola mensaje'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.:92::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(206143990352647605)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(214426368147128810)
,p_button_name=>'Archivo'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Archivo'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'javascript: archivo()'
,p_button_cattributes=>unistr('title = ''Descargar programa de whatsapp web para el env\00EDo de mensajes''')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206142730333647592)
,p_name=>'P89_P_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(206142562948647591)
,p_prompt=>'P Url'
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
 p_id=>wwv_flow_imp.id(206143774624647603)
,p_name=>'P89_P_URL_ARCHIVO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(206142562948647591)
,p_prompt=>'P Url Archivo'
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
 p_id=>wwv_flow_imp.id(214430053530128833)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(214426368147128810)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214430601545128835)
,p_event_id=>wwv_flow_imp.id(214430053530128833)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(214426368147128810)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(206144078392647606)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>':P89_P_URL_ARCHIVO := apex_util.prepare_url(''f?p='' || :APP_ID || '':'' || :APP_PAGE_ID || '':'' || :APP_SESSION || '':application_process=get_oci_object:::OCI_OBJECT_NAME,OCI_BUCKET_NAME,OCI_PATH_BUCKET,OCI_DISPOSITION:'' || ''whatsapp-js.rar'' || '','' || :OC'
||'I_BUCKET_NAME || '','' || :OCI_PATH_BUCKET || '','' || ''apex_data_export.c_attachment'' ||'':'');'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>13177533756984728
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(206141962454647585)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ver_detalle_mensaje'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'DUMMY       number;',
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
'    BEGIN',
'        SELECT 1',
'        INTO DUMMY',
'        FROM cola_mensaje c',
'        WHERE c.gru_id_grupo_cola = apex_application.g_x01',
'        FETCH FIRST 1 ROW ONLY',
'        ;',
'        :P89_P_URL := apex_page.get_url(',
'                p_page   => 92,',
'                p_clear_cache => ''92'', ',
'                p_items  => ''P92_P_ID_GRUPO'',',
'                p_values => apex_application.g_x01',
'        );',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            :P89_P_URL := apex_page.get_url(',
'                    p_page   => 91,',
'                    p_clear_cache => ''91'', ',
'                    p_items  => ''P91_P_ID_GRUPO'',',
'                    p_values => apex_application.g_x01',
'            );',
'    END;',
'    ',
'  apex_json.open_object;',
'  apex_json.write(''success'', TRUE);',
'  apex_json.open_array(''items'');',
'  output_json_item(''P89_P_URL'', :P89_P_URL);',
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
,p_internal_uid=>13175417818984707
);
wwv_flow_imp.component_end;
end;
/
