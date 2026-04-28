prompt --application/shared_components/user_interface/shortcuts/confirm_msg
begin
--   Manifest
--     SHORTCUT: CONFIRM_MSG
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(206278803556641704)
,p_shortcut_name=>'CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_version_scn=>1
,p_shortcut=>unistr('\00BFDesea realizar esta acci\00F3n?')
);
wwv_flow_imp.component_end;
end;
/
