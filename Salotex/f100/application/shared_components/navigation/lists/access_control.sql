prompt --application/shared_components/navigation/lists/access_control
begin
--   Manifest
--     LIST: Access Control
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
 p_id=>wwv_flow_imp.id(87231187193750850)
,p_name=>'Access Control'
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_imp.id(87095664824749856)
,p_version_scn=>1
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(87231599105750852)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Usuarios'
,p_list_item_link_target=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:RP,46:::'
,p_list_item_icon=>'fa-users'
,p_list_text_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Cuentas para el control de acceso al sistema',
''))
,p_security_scheme=>wwv_flow_imp.id(86666906143458962)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(86378972267364419)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Roles por usuarios'
,p_list_item_link_target=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:RP,53:::'
,p_list_item_icon=>'fa-lock-check'
,p_list_text_01=>'Roles / privilegios por usuario'
,p_security_scheme=>wwv_flow_imp.id(86670028401516383)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(86295972213550889)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Roles por p\00E1gina')
,p_list_item_link_target=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.:51:::'
,p_list_item_icon=>'fa-clipboard-list'
,p_list_text_01=>unistr('Detalle de roles y accesos por p\00E1gina')
,p_security_scheme=>wwv_flow_imp.id(86682099517598258)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(85952987364405926)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Paginas del sistema'
,p_list_item_link_target=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:50:::'
,p_list_item_icon=>'fa-badges'
,p_list_text_01=>unistr('Listado de m\00F3dulos para el control de acceso de usuarios')
,p_security_scheme=>wwv_flow_imp.id(86684587797626253)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(87232003597750853)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Roles'
,p_list_item_link_target=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:49:::'
,p_list_item_icon=>'fa-key'
,p_list_text_01=>'Grupos de permisos para el control de accesos de usuarios'
,p_security_scheme=>wwv_flow_imp.id(86686834742679259)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
