prompt --application/shared_components/navigation/lists/nueva_instancia
begin
--   Manifest
--     LIST: Nueva instancia
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(207256882530834283)
,p_name=>'Nueva instancia'
,p_list_status=>'PUBLIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(207258332651834266)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Nombrar instancia'
,p_list_item_link_target=>'f?p=&APP_ID.:100:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(207262570860834252)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Registrar dispositivo'
,p_list_item_link_target=>'f?p=&APP_ID.:101:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
