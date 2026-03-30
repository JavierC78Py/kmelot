prompt --application/shared_components/logic/application_computations/app_id_informatica
begin
--   Manifest
--     APPLICATION COMPUTATION: APP_ID_INFORMATICA
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(65511463467742076)
,p_computation_sequence=>16
,p_computation_item=>'APP_ID_INFORMATICA'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'99'
,p_version_scn=>39396961363191
);
wwv_flow_imp.component_end;
end;
/
