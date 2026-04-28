prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
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
 p_id=>0
,p_name=>'Global Page - Desktop'
,p_step_title=>'Global Page - Desktop'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_page_component_map=>'14'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(240991792364674082)
,p_plug_name=>'Search'
,p_region_name=>'P0Seach'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_region_attributes=>'style="display:none;"'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>1
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(240992077561674085)
,p_name=>'P0_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(240991792364674082)
,p_display_as=>'PLUGIN_SI.ABAKUS.SEARCHNAVIGATIONMENU'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'S',
  'attribute_02', 'fa-search',
  'attribute_03', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{"MenuOpen":false,',
    ' "MenuClickOpenClose":true,',
    ' "SaveSS":true,',
    ' "ShortcutSaveSS":false,',
    ' "ShrtCaseSensitive":true,',
    ' "OnSearchShowChildren":true,',
    ' "UseFocus":true,',
    ' "Shortcuts" : []',
    '}')),
  'attribute_04', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/* ',
    '** STYLE Settings for search navigation menu and menu icons',
    '*/',
    '/* FIX If you use FONT awesome enable this .srch_nav span */',
    '/*',
    '.srch_nav span { ',
    '   top:2px;',
    '}',
    '*/',
    '/* FIX If you use FONT awesome disable  this .t-TreeNav */',
    '.t-TreeNav .a-TreeView-node--topLevel ul .a-TreeView-content .fa {',
    '   vertical-align: top;',
    '   width: 32px; /* This can be decrease to have smaller spacing */',
    '   height: 32px;',
    '   line-height: 32px;',
    '   text-align: center;',
    '   transition: width .2s ease;',
    '}',
    '/* Search resault setting */',
    '.a-TreeView-label strong {',
    '    font-weight:bold; ',
    '    color:black;',
    '    background-color:#ffef9a;',
    '}',
    '/* Input field style setting */',
    '.srch_nav input {',
    '    color:black;',
    '    background-color:#f1f6fa;',
    '    border-color:#ededed;',
    '}',
    '/* Input field on hover setting */',
    '.srch_nav input:focus {',
    '    border-color:#ff7052;',
    '}',
    '',
    '.t-AVPList--leftAligned .t-AVPList-label {',
    '    padding-left: 1.2rem;',
    '    width: 30%;',
    '    font-weight: bold;',
    '    text-align: left;',
    '    color: #0F2C6A;',
    '}',
    '/* --Logo sup. izquierdo',
    '.t-Header-logo-link img {',
    '    max-height: 70px;',
    '}',
    '*/',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(240992227183674086)
,p_name=>'Accordion-Like Navigation Menu'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(240992310132674087)
,p_event_id=>wwv_flow_imp.id(240992227183674086)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#t_Body_nav #t_TreeNav'').on(''click'', ''ul li.a-TreeView-node div.a-TreeView-content:not(:has(a))'', function(){',
'    $(this).prev(''span.a-TreeView-toggle'').click();',
'});',
'',
'//Ini Colapsa menu',
'window.colapsarMenu = (ocultar = true) =>{',
'    const btn = $(''#t_Button_navControl'');',
'',
'    if((btn.hasClass(''is-active'') && ocultar) || !btn.hasClass(''is-active'') && !ocultar)',
'        btn.click();',
'}',
'window.colapsarMenu(false);',
'',
'window.colapsarMenu();',
'//Fin'))
);
wwv_flow_imp.component_end;
end;
/
