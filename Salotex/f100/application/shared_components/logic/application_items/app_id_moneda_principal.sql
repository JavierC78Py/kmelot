prompt --application/shared_components/logic/application_items/app_id_moneda_principal
begin
--   Manifest
--     APPLICATION ITEM: APP_ID_MONEDA_PRINCIPAL
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
 p_id=>wwv_flow_imp.id(87818919924958165)
,p_name=>'APP_ID_MONEDA_PRINCIPAL'
,p_protection_level=>'S'
,p_escape_on_http_output=>'N'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
