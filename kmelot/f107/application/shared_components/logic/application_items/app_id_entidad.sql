prompt --application/shared_components/logic/application_items/app_id_entidad
begin
--   Manifest
--     APPLICATION ITEM: APP_ID_ENTIDAD
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
 p_id=>wwv_flow_imp.id(151967045726818927)
,p_name=>'APP_ID_ENTIDAD'
,p_protection_level=>'I'
,p_version_scn=>41741524159909
);
wwv_flow_imp.component_end;
end;
/
