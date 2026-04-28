prompt --application/shared_components/logic/application_computations/oci_path_bucket
begin
--   Manifest
--     APPLICATION COMPUTATION: OCI_PATH_BUCKET
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
 p_id=>wwv_flow_imp.id(203753753328470824)
,p_computation_sequence=>15
,p_computation_item=>'OCI_PATH_BUCKET'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.oci_path_bucket',
'FROM PARAMETROS P',
'WHERE P.ID_PARAMETRO=1 ',
''))
,p_computation_error_message=>unistr('Error en la b\00FAsqueda de PARAMETROS.')
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
