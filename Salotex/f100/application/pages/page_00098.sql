prompt --application/pages/page_00098
begin
--   Manifest
--     PAGE: 00098
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
 p_id=>98
,p_name=>'Instancias  WhatsApp'
,p_alias=>'INSTANCIAS-WHATSAPP'
,p_step_title=>'Instancias  WhatsApp'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function guardarpropiedad() {',
'   var waitPopup = apex.widget.waitPopup();',
'    apex.message.clearErrors(); ',
'    apex.server.process("propiedad_bot", {',
'        pageItems: [',
'            "P98_ES_BOT"',
'           ,"P98_P_ID" ',
'',
'        ]',
'    },',
'    {       ',
'        success: function( data ) {',
'            if ( data.success === true ) {',
'                for (var i=0; i < data.items.length; i++){',
'                    apex.item( data.items[i].id ).setValue( data.items[i].value );',
'                }',
'                apex.theme.closeRegion(''REG_BOT'');',
'                apex.region(''REG_REPORTE'').refresh();',
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
'    });                ',
'}',
'function definirBot(id,es_bot){',
'    apex.item("P98_P_ID").setValue(id);',
'    if (es_bot == ''SI''){',
'        apex.item("P98_ES_BOT").setValue(''1'');',
'    } else {',
'        apex.item("P98_ES_BOT").setValue(''0'');',
'    }',
'    apex.theme.openRegion("REG_BOT");',
'}',
'function logOut(key) {',
'  apex.server.process(',
'    "logOut",',
'    { x01: key },',
'    {',
'      success: function (pData) {',
'        apex.region(''REG_REPORTE'').refresh();',
'        if (pData.success) {',
'          apex.message.showPageSuccess(pData.message);',
'        }else {',
'          apex.message.showErrors({',
'            type: "error",',
'            location: "page",',
'            message: pData.message,',
'            unsafe: false',
'          });',
'        }',
'        setTimeout(function () {',
'          apex.message.hidePageSuccess();',
'          apex.message.clearErrors();',
'        }, 3000);',
'      },',
'    }',
'  );',
'}',
'',
'function scanQr(key, name, id, number){',
'        apex.server.process(',
'          "getUrl",',
'          {',
'            x01: 100,',
'            x02: ''P100_KEY,P100_NAME,P100_ID_DEVICE,P100_NUMBER'',',
'            x03: key +'',''+ name +'',''+ id +'',''+ number',
'          },',
'          {',
'            success: function (pData) {',
'              apex.navigation.redirect(pData.url);',
'            },',
'          }',
'        );',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-mainContent {',
'background-image:url(#WORKSPACE_FILES#no-chat-found.svg);',
'background-repeat: no-repeat;',
'background-size : 60% auto;',
'background-position: 25%;',
'}',
'',
'#REG_REPORTE_worksheet_region {',
'    background-color: rgba(255, 255, 255, 0.5);',
'    backdrop-filter: blur(10px); ',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(88015527816198362)
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
 p_id=>wwv_flow_imp.id(88016263285198345)
,p_plug_name=>'Instancias  WhatsApp'
,p_region_name=>'REG_REPORTE'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:margin-top-none'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    X.ID,',
'    X.USER_NAME,',
'    X.NAME,',
'    X.CREATED,',
'    X.MODIFIED,',
'    X.KEY,',
'    X.QR_B64,',
'    X.PUSH_NAME,',
'    X.PHONE_NUMBER,',
'    X.INSTANCE_STATUS,',
'    Decode(X.INSTANCE_STATUS,1, (decode(X.ES_BOT,1,''SI'',''NO'')) ,NULL) ES_BOT,',
'    CASE X.INSTANCE_STATUS',
'        WHEN 1 THEN',
'            ''Connected''',
'        WHEN 0 THEN',
'            ''Non Connected''',
'        WHEN 2 THEN',
'            ''Not Exists''',
'    END  STATUS,',
'    CASE X.INSTANCE_STATUS',
'        WHEN 1 THEN',
'            ''success''',
'        WHEN 0 THEN',
'            ''warning''',
'        WHEN 2 THEN',
'            ''danger''',
'    END  AS BADGE_STATE,',
'    NULL BADGE_ICON,',
'    CASE X.INSTANCE_STATUS',
'        WHEN 1 THEN',
'            ''<a class="t-Button t-Button--hot js-ignoreChange" onclick=''''logOut("'' ||',
'         x.key || ''");''''><i class="fa fa-trash"/></a>''',
'        WHEN 0 THEN',
'            ''<a class="t-Button t-Button--hot js-ignoreChange" onclick=''''scanQr("'' ||',
'         x.key ||''", "''|| x.name ||''", "''|| x.id ||''", "''|| x.phone_number  ||''");''''><i class="fa fa-qrcode"/></a>''',
'    END acciones,',
'    X.SUC_ID_SUCURSAL',
'FROM',
'    (',
'select ID,',
'       USER_NAME,',
'       NAME,',
'       CREATED,',
'       MODIFIED,',
'       KEY,',
'       QR_B64,',
'       PUSH_NAME,',
'       PHONE_NUMBER,',
'       PKG_WAPI.CHECK_INSTANCE(KEY) INSTANCE_STATUS,',
'       ES_BOT,',
'       SUC_ID_SUCURSAL',
'  from DEVICES',
') X',
'ORDER BY',
'    X.ID ASC'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Instancias  WhatsApp'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(88016358479198345)
,p_name=>'Instancias  WhatsApp'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encuentran datos.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAVIER'
,p_internal_uid=>14283339415191605
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88016725292198338)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88017194527198334)
,p_db_column_name=>'USER_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Nombre de usuario'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88017603423198333)
,p_db_column_name=>'NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Nombre de instancia'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88017933481198333)
,p_db_column_name=>'CREATED'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>unistr('Fecha de creaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88018379214198333)
,p_db_column_name=>'MODIFIED'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Modified'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88018813504198332)
,p_db_column_name=>'KEY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Key'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88019169679198332)
,p_db_column_name=>'QR_B64'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Qr B64'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88019565870198332)
,p_db_column_name=>'PUSH_NAME'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Nombre registrado'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88019981649198331)
,p_db_column_name=>'PHONE_NUMBER'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>unistr('Nro. tel\00E9fono')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88020388266198331)
,p_db_column_name=>'INSTANCE_STATUS'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Instancia status'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88020792148198330)
,p_db_column_name=>'STATUS'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Estado'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'TMPL_THEME_42$BADGE'
,p_column_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'ICON', '#BADGE_ICON#',
  'LABEL', 'Estado',
  'LABEL_DISPLAY', 'N',
  'STATE', 'BADGE_STATE',
  'VALUE', 'STATUS')).to_clob
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88021207586198330)
,p_db_column_name=>'BADGE_STATE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Badge state'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88021543401198330)
,p_db_column_name=>'BADGE_ICON'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Badge Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(88021995524198329)
,p_db_column_name=>'ACCIONES'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Acciones'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(101417953104766350)
,p_db_column_name=>'ES_BOT'
,p_display_order=>34
,p_column_identifier=>'Q'
,p_column_label=>'Es Bot?'
,p_column_link=>'javascript: definirBot(''#ID#'',''#ES_BOT#'')'
,p_column_linktext=>'#ES_BOT#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(65341235628574940)
,p_db_column_name=>'SUC_ID_SUCURSAL'
,p_display_order=>44
,p_column_identifier=>'R'
,p_column_label=>'Sucursal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(90179677127002391)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(88022403719196287)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'142894'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SUC_ID_SUCURSAL:USER_NAME:NAME:CREATED:PUSH_NAME:PHONE_NUMBER:STATUS:ACCIONES:ES_BOT:'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(66785567886964773)
,p_report_id=>wwv_flow_imp.id(88022403719196287)
,p_name=>'ESTADO'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'STATUS'
,p_operator=>'='
,p_expr=>'Connected'
,p_condition_sql=>' (case when ("STATUS" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Connected''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#d0f1cc'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(101418019765766351)
,p_plug_name=>'Definir bot y usuario'
,p_region_name=>'REG_BOT'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size480x320'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(101418928918766360)
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
 p_id=>wwv_flow_imp.id(88033308551116041)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(88015527816198362)
,p_button_name=>'Crear'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Crear nueva instancia'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:100::'
,p_icon_css_classes=>'fa-qrcode'
,p_security_scheme=>wwv_flow_imp.id(109433213304001603)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(101418820153766359)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(101418019765766351)
,p_button_name=>'Aplicar'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'javascript: guardarpropiedad()'
,p_security_scheme=>wwv_flow_imp.id(109432978337002798)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(101418533992766356)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(101418019765766351)
,p_button_name=>'Regresar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Regresar'
,p_button_position=>'PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(101418395129766354)
,p_name=>'P98_ES_BOT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(101418019765766351)
,p_prompt=>'Opera  Bot sobre la linea'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>9
,p_grid_label_column_span=>6
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', '0',
  'off_value', '0',
  'on_label', '1',
  'on_value', '1',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(101419111930766361)
,p_name=>'P98_P_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(101418928918766360)
,p_prompt=>'P Id'
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
 p_id=>wwv_flow_imp.id(109449171813737741)
,p_name=>'P98_KEY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(101418928918766360)
,p_prompt=>'Key'
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
 p_id=>wwv_flow_imp.id(109449307072737742)
,p_name=>'P98_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(101418928918766360)
,p_prompt=>'Name'
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
 p_id=>wwv_flow_imp.id(101418686281766357)
,p_name=>'Regresa'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(101418533992766356)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(101418761051766358)
,p_event_id=>wwv_flow_imp.id(101418686281766357)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(101418019765766351)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(113530559005267845)
,p_name=>'Al regresar'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(88033308551116041)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(113530624752267846)
,p_event_id=>wwv_flow_imp.id(113530559005267845)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(88016263285198345)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(65341625658574943)
,p_name=>'Refresh'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(88016263285198345)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(65341706392574944)
,p_event_id=>wwv_flow_imp.id(65341625658574943)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(88016263285198345)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(88034947519116058)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'logOut'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    p_key varchar2(255) := apex_application.g_x01;',
'    v_mensaje varchar2(2000);',
'begin',
'    v_mensaje := pkg_wapi.logout_instance(p_key);',
'',
'    if v_mensaje = ''logout successfull'' then',
'        apex_json.open_object;',
'        apex_json.write(''success'', true);',
'        apex_json.write(''message'', v_mensaje);',
'        apex_json.close_object;',
'    else',
'        apex_json.open_object;',
'        apex_json.write(''success'', false);',
'        apex_json.write(''message'', v_mensaje);',
'        apex_json.close_object;',
'    end if;',
'exception',
'    when others then',
'        rollback;',
'            apex_json.open_object;',
'            apex_json.write(''success'', false);',
'            apex_json.write(''message'', '''' || sqlerrm || chr(10) || ''Trace: '' || dbms_utility.format_error_backtrace);',
'            apex_json.close_object;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>14301928455109318
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(88035093577116059)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'getUrl'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_url    varchar2(2000);',
'    l_page   varchar2(10):= apex_application.g_x01;',
'    l_items  varchar2(4000):= apex_application.g_x02;',
'    l_values varchar2(4000):= apex_application.g_x03;',
'    l_region varchar2(2000):= apex_application.g_x04;',
'BEGIN',
'    l_url := APEX_PAGE.GET_URL(p_page   => l_page,',
'                             p_items  => l_items,',
'                             p_values => l_values);',
'    apex_json.open_object;',
'    apex_json.write(''url'', l_url);',
'    apex_json.close_all;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>14302074513109319
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(101419129446766362)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'propiedad_bot'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'PROCEDURE output_json_item (',
'    p_item_name  IN VARCHAR2',
', p_item_value IN VARCHAR2)',
'AS',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''id''    , p_item_name);',
'    apex_json.write(''value'' , p_item_value, TRUE);',
'    apex_json.close_object;',
'END output_json_item;',
'',
'BEGIN',
'    update devices',
'    set es_bot = :P98_ES_BOT',
'    where id = :P98_P_ID;',
'',
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
,p_internal_uid=>27686110382759622
);
wwv_flow_imp.component_end;
end;
/
