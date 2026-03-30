prompt --application/shared_components/logic/application_items/app_mi_id_entidad
begin
--   Manifest
--     APPLICATION ITEM: APP_MI_ID_ENTIDAD
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
 p_id=>wwv_flow_imp.id(112404369853062105)
,p_name=>'APP_MI_ID_ENTIDAD'
,p_protection_level=>'S'
,p_version_scn=>39279812716831
);
wwv_flow_imp.component_end;
end;
/
