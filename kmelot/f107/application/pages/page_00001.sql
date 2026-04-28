prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Principal'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function ir_a_poliza() {',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(201101951433382708)
,p_plug_name=>'Imagen'
,p_region_name=>'IMG'
,p_region_template_options=>'#DEFAULT#:t-ImageRegion--noFilter:t-ImageRegion--auto:t-ImageRegion--cover:t-ImageRegion--square'
,p_plug_template=>1675400448429897403
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>7
,p_plug_display_column=>3
,p_location=>null
,p_region_image=>'&P1_URL_IMG.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206340847725406178)
,p_plug_name=>'&APP_NOMBRE_EMPRESA.'
,p_icon_css_classes=>'fa-feed'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2674017834225413037
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_plug_query_num_rows=>15
,p_plug_header=>'&P1_NOMBRE_SUCURSAL.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(184575703250231087)
,p_name=>'P1_NOMBRE_SUCURSAL'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(201102107616382709)
,p_name=>'P1_URL_IMG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(201101951433382708)
,p_prompt=>'Url Img'
,p_source=>'apex_util.prepare_url(''f?p='' || :APP_ID || '':'' || :APP_PAGE_ID || '':'' || :APP_SESSION || '':application_process=get_oci_object:::OCI_OBJECT_NAME,OCI_BUCKET_NAME,OCI_PATH_BUCKET,OCI_DISPOSITION:'' || ''kmelot.png'' || '','' || :OCI_BUCKET_NAME || '','' || :OC'
||'I_PATH_BUCKET || '','' || ''apex_data_export.c_inline'' || '':'')'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
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
 p_id=>wwv_flow_imp.id(139569997459728540)
,p_name=>'Notificar poliza'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_security_scheme=>wwv_flow_imp.id(138967316692971076)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(139570062730728541)
,p_event_id=>wwv_flow_imp.id(139569997459728540)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_APEX.NOTIFICATION'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    "refresh": 0,',
'    "mainIcon": "fa-bell",',
'    "mainIconColor": "white",',
'    "mainIconBackgroundColor": "rgba(70,70,70,0.9)",',
'    "mainIconBlinking": false,',
'    "counterBackgroundColor": "rgb(232, 55, 55 )",',
'    "counterFontColor": "white",',
'    "linkTargetBlank": false,',
'    "showAlways": false,',
'    "browserNotifications": {',
'        "enabled": true,',
'        "cutBodyTextAfter": 100,',
'        "link": false',
'    },',
'    "accept": {',
'        "color": "#44e55c",',
'        "icon": "fa-check"',
'    },',
'    "decline": {',
'        "color": "#b73a21",',
'        "icon": "fa-close"',
'    },',
'    "hideOnRefresh": true',
'}'))
,p_attribute_02=>'notification-menu'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT /* sets the icon of the list item */',
'    ''fa-exclamation-triangle'' AS NOTE_ICON, ',
'    /* sets the color of the list icon */',
'    ''rgb(192,0,15)'' AS NOTE_ICON_COLOR, ',
'    /* sets the title of the list item (html possible) */',
unistr('    ''Proximo vencimiento de p\00F3liza'' AS NOTE_HEADER,'),
'    /* sets the text of the list item (html possible */',
unistr('    ''La p\00F3liza <b>''||p.nro_poliza||''</b> de la licitaci\00F3n <b>''||l.nro_licitacion||''</b> tiene fecha de vencimiento el <b>''||to_char(p.fecha_fin,''dd-mm-yyyy'')||''</b>. <b style="color:rgba(192,0,15);">Favor verificar. </b>'' AS NOTE_TEXT, '),
'    /* set the link when click on list item */',
'    ''javascript:alert("Click on Notification Entry");void(0);'' AS NOTE_LINK, ',
'    /* sets the color of the left box shadow */',
'    ''rgb(192,0,15)'' AS NOTE_COLOR,',
'    /* Link or js that is executed when press accept link (if left or null not accept is shown */ ',
'    ''javascript:ir_a_poliza()'' AS NOTE_ACCEPT,',
'    /* Link or js that is executed when press decline link (if left or null not decline is shown */ ',
'    NULL AS NOTE_DECLINE,',
'    /* When enable Browser Notifications in ConfigJSON then you can select which notifications should not be fire browser not. */',
'    0 AS NO_BROWSER_NOTIFICATION',
'FROM licitacion_poliza p',
'    ,licitacion l',
'WHERE (p.fecha_fin - INTERVAL ''10'' DAY) < current_date',
'AND p.estado = ''ACTIVO''',
'AND l.id_licitacion = p.lic_id_licitacion',
''))
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_07=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "ALLOWED_ATTR": [',
'    "accesskey",',
'    "align",',
'    "alt",',
'    "always",',
'    "autocomplete",',
'    "autoplay",',
'    "border",',
'    "cellpadding",',
'    "cellspacing",',
'    "charset",',
'    "class",',
'    "dir",',
'    "height",',
'    "href",',
'    "id",',
'    "lang",',
'    "name",',
'    "rel",',
'    "required",',
'    "src",',
'    "style",',
'    "summary",',
'    "tabindex",',
'    "target",',
'    "title",',
'    "type",',
'    "value",',
'    "width"',
'  ],',
'  "ALLOWED_TAGS": [',
'    "a",',
'    "address",',
'    "b",',
'    "blockquote",',
'    "br",',
'    "caption",',
'    "code",',
'    "dd",',
'    "div",',
'    "dl",',
'    "dt",',
'    "em",',
'    "figcaption",',
'    "figure",',
'    "h1",',
'    "h2",',
'    "h3",',
'    "h4",',
'    "h5",',
'    "h6",',
'    "hr",',
'    "i",',
'    "img",',
'    "label",',
'    "li",',
'    "nl",',
'    "ol",',
'    "p",',
'    "pre",',
'    "s",',
'    "span",',
'    "strike",',
'    "strong",',
'    "sub",',
'    "sup",',
'    "table",',
'    "tbody",',
'    "td",',
'    "th",',
'    "thead",',
'    "tr",',
'    "u",',
'    "ul"',
'  ]',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(132788762539876047)
,p_name=>'Click tablero orden trabajo'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(206340847725406178)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_security_scheme=>wwv_flow_imp.id(134270665689388614)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(132788882857876048)
,p_event_id=>wwv_flow_imp.id(132788762539876047)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.FOS.REDIRECT'
,p_attribute_01=>'static'
,p_attribute_02=>'f?p=&APP_ID.:182:&SESSION.::&DEBUG.:182::'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(184575843397231088)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1_NOMBRE_SUCURSAL IS NULL THEN',
'    BEGIN',
'        SELECT descripcion',
'        INTO :P1_NOMBRE_SUCURSAL',
'        FROM sucursal_entidad',
'        WHERE id_suc_entidad = :APP_ID_SUCURSAL;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            RAISE_APPLICATION_ERROR(-20000,''Declare correctamente SUCURSAL del usuario.'');',
'    END;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>23742790464058311
);
wwv_flow_imp.component_end;
end;
/
