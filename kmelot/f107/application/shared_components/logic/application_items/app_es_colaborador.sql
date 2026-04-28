prompt --application/shared_components/logic/application_items/app_es_colaborador
begin
--   Manifest
--     APPLICATION ITEM: APP_ES_COLABORADOR
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(231374461135216941)
,p_name=>'APP_ES_COLABORADOR'
,p_protection_level=>'N'
,p_escape_on_http_output=>'N'
,p_version_scn=>39279353147541
);
wwv_flow_imp.component_end;
end;
/
