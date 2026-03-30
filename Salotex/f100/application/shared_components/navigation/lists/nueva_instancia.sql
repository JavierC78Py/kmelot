prompt --application/shared_components/navigation/lists/nueva_instancia
begin
--   Manifest
--     LIST: Nueva instancia
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
 p_id=>wwv_flow_imp.id(88023356959178145)
,p_name=>'Nueva instancia'
,p_list_status=>'PUBLIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(88024807080178128)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Nombrar instancia'
,p_list_item_link_target=>'f?p=&APP_ID.:100:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(88029045289178114)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Registrar dispositivo'
,p_list_item_link_target=>'f?p=&APP_ID.:101:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
