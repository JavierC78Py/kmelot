prompt --application/shared_components/security/authorizations/m166_licitacion_rep
begin
--   Manifest
--     SECURITY SCHEME: m166_LICITACION_REP
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(43184849465503410)
,p_name=>'m166_LICITACION_REP'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'RETURN dev_permiso_apx(p_nIdPrograma => 166);'
,p_error_message=>unistr('Privilegios insuficientes. El usuario no posee permisos suficientes para visualizar esta p\00E1gina.')
,p_version_scn=>41745077811799
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
