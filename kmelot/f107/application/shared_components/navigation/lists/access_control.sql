prompt --application/shared_components/navigation/lists/access_control
begin
--   Manifest
--     LIST: Access Control
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
 p_id=>wwv_flow_imp.id(206464712765406988)
,p_name=>'Access Control'
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_imp.id(206329190396405994)
,p_version_scn=>1
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(206465124677406990)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Usuarios'
,p_list_item_link_target=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:RP,46:::'
,p_list_item_icon=>'fa-users'
,p_list_text_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Cuentas para el control de acceso al sistema',
''))
,p_security_scheme=>wwv_flow_imp.id(205900431715115100)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(205612497839020557)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Roles por usuarios'
,p_list_item_link_target=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:RP,53:::'
,p_list_item_icon=>'fa-lock-check'
,p_list_text_01=>'Roles / privilegios por usuario'
,p_security_scheme=>wwv_flow_imp.id(205903553973172521)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(205529497785207027)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Roles por p\00E1gina')
,p_list_item_link_target=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.:51:::'
,p_list_item_icon=>'fa-clipboard-list'
,p_list_text_01=>unistr('Detalle de roles y accesos por p\00E1gina')
,p_security_scheme=>wwv_flow_imp.id(205915625089254396)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(205186512936062064)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Paginas del sistema'
,p_list_item_link_target=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:50:::'
,p_list_item_icon=>'fa-badges'
,p_list_text_01=>unistr('Listado de m\00F3dulos para el control de acceso de usuarios')
,p_security_scheme=>wwv_flow_imp.id(205918113369282391)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(206465529169406991)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Roles'
,p_list_item_link_target=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:49:::'
,p_list_item_icon=>'fa-key'
,p_list_text_01=>'Grupos de permisos para el control de accesos de usuarios'
,p_security_scheme=>wwv_flow_imp.id(205920360314335397)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
