prompt --application/shared_components/navigation/lists/desktop_navigation_bar
begin
--   Manifest
--     LIST: Desktop Navigation Bar
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(87093884585749696)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
,p_version_scn=>39392972636667
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(97654731653109432)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Install App'
,p_list_item_link_target=>'#action$a-pwa-install'
,p_list_item_icon=>'fa-cloud-download'
,p_list_text_02=>'a-pwaInstall'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(87222902987750824)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Acerca de'
,p_list_item_icon=>'fa-question-circle-o'
,p_list_text_02=>'icon-only'
,p_required_patch=>wwv_flow_imp.id(87096339046749857)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(87223384748750829)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>unistr('P\00E1gina de ayuda')
,p_list_item_link_target=>'f?p=&APP_ID.:10051:&SESSION.::&DEBUG.::P10051_PAGE_ID:&APP_PAGE_ID.:'
,p_list_item_icon=>'fa-question-circle-o'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(87222902987750824)
,p_list_text_02=>'icon-only'
,p_required_patch=>wwv_flow_imp.id(87096339046749857)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(87223857927750829)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(87222902987750824)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(87224190733750830)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>unistr('Acerca de la p\00E1gina')
,p_list_item_link_target=>'f?p=&APP_ID.:10050:&SESSION.::&DEBUG.:10050:::'
,p_list_item_icon=>'fa-info-circle-o'
,p_parent_list_item_id=>wwv_flow_imp.id(87222902987750824)
,p_required_patch=>wwv_flow_imp.id(87096339046749857)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(87224476812750830)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(87225013826750832)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(87224476812750830)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(87225433789750832)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Desconectarse'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_imp.id(87224476812750830)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
