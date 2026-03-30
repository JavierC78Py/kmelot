prompt --application/shared_components/security/app_access_control/contributor
begin
--   Manifest
--     ACL ROLE: Contributor
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(87097887481749868)
,p_static_id=>'CONTRIBUTOR'
,p_name=>'Contributor'
,p_description=>'Role assigned to application contributors.'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
