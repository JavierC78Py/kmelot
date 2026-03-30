prompt --application/shared_components/security/authorizations/m168_produccion_pro_btn_aplicar
begin
--   Manifest
--     SECURITY SCHEME: m168_PRODUCCION_PRO_BTN_APLICAR
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
 p_id=>wwv_flow_imp.id(51133591022939758)
,p_name=>'m168_PRODUCCION_PRO_BTN_APLICAR'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'RETURN dev_permiso_apx(p_nIdPrograma  => 168,',
'                       p_vPermisoDml  => ''U'');'))
,p_error_message=>unistr('Privilegios insuficientes. El usuario no posee permisos suficientes para visualizar este bot\00F3n.')
,p_version_scn=>41749611033017
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
