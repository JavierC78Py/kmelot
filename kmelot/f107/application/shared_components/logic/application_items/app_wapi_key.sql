prompt --application/shared_components/logic/application_items/app_wapi_key
begin
--   Manifest
--     APPLICATION ITEM: APP_WAPI_KEY
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
 p_id=>wwv_flow_imp.id(186095087946947023)
,p_name=>'APP_WAPI_KEY'
,p_protection_level=>'I'
,p_version_scn=>39395168437143
);
wwv_flow_imp.component_end;
end;
/
