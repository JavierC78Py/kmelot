prompt --application/pages/page_10000
begin
--   Manifest
--     PAGE: 10000
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
 p_id=>10000
,p_name=>unistr('Administraci\00F3n')
,p_alias=>'ADMIN'
,p_step_title=>unistr('Administraci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(87099773265749901)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_deep_linking=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The administration page allows application owners (Administrators) to configure the application and maintain common data used across the application.',
'By selecting one of the available settings, administrators can potentially change how the application is displayed and/or features available to the end users.</p>',
'<p>Access to this page should be limited to Administrators only.</p>'))
,p_page_component_map=>'10'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87226528909750839)
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
 p_id=>wwv_flow_imp.id(87232371877750856)
,p_plug_name=>'Column 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>15
,p_plug_grid_column_span=>6
,p_location=>null
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87233522659750862)
,p_plug_name=>'Reportes de Actividad'
,p_parent_plug_id=>wwv_flow_imp.id(87232371877750856)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_list_id=>wwv_flow_imp.id(87228570053750845)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2067994871570597190
,p_plug_query_num_rows=>15
,p_required_patch=>wwv_flow_imp.id(87095731109749856)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87233898021750863)
,p_plug_name=>'Column 2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_location=>null
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87234321709750865)
,p_plug_name=>'Control de Acceso'
,p_parent_plug_id=>wwv_flow_imp.id(87233898021750863)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_query_num_rows=>15
,p_required_patch=>wwv_flow_imp.id(87095664824749856)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87235159562750870)
,p_plug_name=>'ACL Information'
,p_parent_plug_id=>wwv_flow_imp.id(87234321709750865)
,p_region_css_classes=>'margin-sm'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--noIcon:t-Alert--warning:t-Alert--accessibleHeading'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2040683448887306517
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_acl_scope   varchar2(45);',
'begin',
'    l_acl_scope   := apex_app_setting.get_value( p_name => ''ACCESS_CONTROL_SCOPE'' );',
'',
'    if l_acl_scope = ''ALL_USERS'' then',
'        sys.htp.p( apex_lang.message(''APEX.FEATURE.ACL.INFO.ALL_USERS'') );',
'    elsif l_acl_scope = ''ACL_ONLY'' then',
'        sys.htp.p( apex_lang.message(''APEX.FEATURE.ACL.INFO.ACL_ONLY'') );',
'    else',
'        sys.htp.p( apex_lang.message(''APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'', l_acl_scope) );',
'    end if;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_num_rows=>15
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87239979774750914)
,p_plug_name=>'Access Control Actions'
,p_parent_plug_id=>wwv_flow_imp.id(87234321709750865)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_list_id=>wwv_flow_imp.id(87231187193750850)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2067994871570597190
,p_plug_query_num_rows=>15
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(87234693892750867)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(87234321709750865)
,p_button_name=>'ADD_USER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Agregar'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:RP,47::'
,p_icon_css_classes=>'fa-user-plus'
,p_security_scheme=>wwv_flow_imp.id(86667306477461974)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87239116467750912)
,p_name=>'Refresh on Dialog Close'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(87234693892750867)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp.component_end;
end;
/
