prompt --application/shared_components/logic/application_items/app_wapi_key
begin
--   Manifest
--     APPLICATION ITEM: APP_WAPI_KEY
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(66861562375290885)
,p_name=>'APP_WAPI_KEY'
,p_protection_level=>'I'
,p_version_scn=>39395168437143
);
wwv_flow_imp.component_end;
end;
/
