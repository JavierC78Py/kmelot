prompt --application/shared_components/logic/application_computations/app_id_informatica
begin
--   Manifest
--     APPLICATION COMPUTATION: APP_ID_INFORMATICA
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(184744989039398214)
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
