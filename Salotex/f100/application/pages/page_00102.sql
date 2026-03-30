prompt --application/pages/page_00102
begin
--   Manifest
--     PAGE: 00102
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
 p_id=>102
,p_name=>unistr('Flujo de Conversaci\00F3n')
,p_alias=>unistr('FLUJO-DE-CONVERSACI\00D3N')
,p_step_title=>unistr('Flujo de Conversaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'.t-Body-mainContent {',
'background-image:url(#WORKSPACE_FILES#chatbot_title.svg);',
'background-repeat: no-repeat;',
'background-size : 60% auto;',
'background-position: 25%;',
'}',
'*/'))
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'20'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(555915063439787890)
,p_plug_name=>'Flujos'
,p_region_name=>'REG_FLUJOS'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  case a.status when ''0'' then ''Flujo en estado [INACTIVO]'' else ''Flujo en estado [ACTIVO]'' end status ,',
'        case when a.parent_flow is null then 1 else 2 end as lvl,',
'        a.flow_name||CASE WHEN a.parent_flow IS NULL THEN '' [ Suc. ''||s.descripcion||'' ]'' ELSE NULL END as title,',
'        case when a.parent_flow is null then ''fa fa-commenting-o'' else ''fa fa-comments-o'' end as icon,',
'        a.id as value,',
'        a.flow_name as tooltip,',
'        null  as link,',
'        a.parent_flow as parent',
'   from bot_flows a',
'       ,sucursal_entidad s',
'  where s.id_suc_entidad(+) = a.suc_id_sucursal',
'  order by a.flow_name',
''))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_JSTREE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'activate_node_link_with', 'D',
  'default_icon_css_class', 'icon-tree-folder',
  'icon_css_class_column', 'ICON',
  'icon_type_css_class', 'a-Icon',
  'node_id_column', 'VALUE',
  'node_label_column', 'TITLE',
  'node_value_column', 'VALUE',
  'parent_key_column', 'PARENT',
  'start_tree_with', 'NULL',
  'tooltip_column', 'STATUS',
  'tree_hierarchy', 'SQL',
  'tree_link', 'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:103:P103_ID:&VALUE.',
  'tree_tooltip', 'DB')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(555915165421787891)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(86947038457749062)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(99108980356106258)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(555915165421787891)
,p_button_name=>'CREATE_FLOW'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Nuevo Flujo'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:103::'
,p_icon_css_classes=>'fa-sitemap'
,p_security_scheme=>wwv_flow_imp.id(109438926384887602)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88035973674116068)
,p_name=>'Inicio'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88036027505116069)
,p_event_id=>wwv_flow_imp.id(88035973674116068)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    $( "#REG_FLUJOS_tree" ).treeView( "expandAll" );',
'}, 600);'))
);
wwv_flow_imp.component_end;
end;
/
