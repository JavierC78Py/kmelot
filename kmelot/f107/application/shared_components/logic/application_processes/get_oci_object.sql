prompt --application/shared_components/logic/application_processes/get_oci_object
begin
--   Manifest
--     APPLICATION PROCESS: get_oci_object
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(201597856891353371)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'get_oci_object'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_oci_bucket.p_descargar_archivo_bucket (',
'    p_vObjectName         => :OCI_OBJECT_NAME',
'  , p_vBucketName         => :OCI_BUCKET_NAME',
'  , p_vBucketPath         => :OCI_PATH_BUCKET',
'  , p_vContentDisposition => :OCI_DISPOSITION);'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
