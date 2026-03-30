prompt --application/pages/page_10050
begin
--   Manifest
--     PAGE: 10050
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
 p_id=>10050
,p_name=>'About'
,p_alias=>'HELP'
,p_page_mode=>'MODAL'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(87099773265749901)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P10050_CONTACTO {',
'    width: 200px;',
'}'))
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_patch=>wwv_flow_imp.id(87096339046749857)
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_help_text=>'All application help text can be accessed from this page. The links in the "Documentation" region give a much more in-depth explanation of the application''s features and functionality.'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87221449326750821)
,p_plug_name=>'Acerca del sistema'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--padded:t-ContentBlock--h1:t-ContentBlock--lightBG'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>20
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Sistema desarrollado por <strong>Javier Caballero</strong> en Oracle cloud</p>',
'<p>+595981429971</p>',
'<p>javierc@kmelot.online</p>',
unistr('<p>Asunci\00F3n - Paraguay, 2022</p>'),
''))
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87719313710063043)
,p_plug_name=>'Logos'
,p_parent_plug_id=>wwv_flow_imp.id(87221449326750821)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--hiddenOverflow'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(87719135835063042)
,p_name=>'P10050_ORACLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(87719313710063043)
,p_source=>'#APP_FILES#logo_oracle_negro.jpg'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'URL')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(87719336053063044)
,p_name=>'P10050_APEX'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(87719313710063043)
,p_source=>'#APP_FILES#logo_apex_negro.jpg'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'URL')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(87719491746063045)
,p_name=>'P10050_CONTACTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(87719313710063043)
,p_source=>'#APP_FILES#Kmelot_QR_Code.png'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:margin-top-none'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'URL')).to_clob
);
wwv_flow_imp.component_end;
end;
/
