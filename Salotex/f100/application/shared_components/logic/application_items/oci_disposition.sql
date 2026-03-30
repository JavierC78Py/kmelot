prompt --application/shared_components/logic/application_items/oci_disposition
begin
--   Manifest
--     APPLICATION ITEM: OCI_DISPOSITION
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
 p_id=>wwv_flow_imp.id(95381218009759532)
,p_name=>'OCI_DISPOSITION'
,p_protection_level=>'N'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
