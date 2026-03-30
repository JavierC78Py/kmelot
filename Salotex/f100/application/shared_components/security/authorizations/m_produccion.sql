prompt --application/shared_components/security/authorizations/m_produccion
begin
--   Manifest
--     SECURITY SCHEME: m_PRODUCCION
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
 p_id=>wwv_flow_imp.id(51134122703944840)
,p_name=>'m_PRODUCCION'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'RETURN dev_permiso_apx(p_vModulo => ''PRODUCCION'');'
,p_error_message=>unistr('Privilegios insuficientes. El usuario no posee permisos suficientes para visualizar este men\00FA.')
,p_version_scn=>41749610980998
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
