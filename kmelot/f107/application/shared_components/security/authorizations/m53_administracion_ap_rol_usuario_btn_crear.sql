prompt --application/shared_components/security/authorizations/m53_administracion_ap_rol_usuario_btn_crear
begin
--   Manifest
--     SECURITY SCHEME: m53_ADMINISTRACION_AP_ROL_USUARIO_BTN_CREAR
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
 p_id=>wwv_flow_imp.id(205904036388178833)
,p_name=>'m53_ADMINISTRACION_AP_ROL_USUARIO_BTN_CREAR'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'RETURN dev_permiso_apx(p_nIdPrograma  => 53,',
'                       p_vPermisoDml  => ''I'');'))
,p_error_message=>unistr('Privilegios insuficientes. El usuario no posee permisos suficientes para visualizar este bot\00F3n.')
,p_version_scn=>1
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
