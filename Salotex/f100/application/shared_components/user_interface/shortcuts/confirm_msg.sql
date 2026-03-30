prompt --application/shared_components/user_interface/shortcuts/confirm_msg
begin
--   Manifest
--     SHORTCUT: CONFIRM_MSG
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(87045277984985566)
,p_shortcut_name=>'CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_version_scn=>1
,p_shortcut=>unistr('\00BFDesea realizar esta acci\00F3n?')
);
wwv_flow_imp.component_end;
end;
/
