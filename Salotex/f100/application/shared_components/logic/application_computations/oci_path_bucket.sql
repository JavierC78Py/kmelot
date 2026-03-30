prompt --application/shared_components/logic/application_computations/oci_path_bucket
begin
--   Manifest
--     APPLICATION COMPUTATION: OCI_PATH_BUCKET
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
 p_id=>wwv_flow_imp.id(84520227756814686)
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
