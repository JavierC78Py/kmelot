prompt --application/shared_components/security/authorizations/m_control_gasto
begin
--   Manifest
--     SECURITY SCHEME: m_CONTROL_GASTO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(193871774308144923)
,p_name=>'m_CONTROL_GASTO'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'RETURN dev_permiso_apx(p_vModulo => ''CONTROL_GASTO'');'
,p_error_message=>unistr('Privilegios insuficientes. El usuario no posee permisos suficientes para visualizar este men\00FA.')
,p_version_scn=>39386971870464
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
