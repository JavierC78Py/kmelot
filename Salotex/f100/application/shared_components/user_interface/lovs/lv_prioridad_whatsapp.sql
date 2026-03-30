prompt --application/shared_components/user_interface/lovs/lv_prioridad_whatsapp
begin
--   Manifest
--     LV_PRIORIDAD_WHATSAPP
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(95204075784524564)
,p_lov_name=>'LV_PRIORIDAD_WHATSAPP'
,p_lov_query=>'.'||wwv_flow_imp.id(95204075784524564)||'.'
,p_location=>'STATIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(95204395406524570)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Alta'
,p_lov_return_value=>'A'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(95204725372524580)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Baja'
,p_lov_return_value=>'B'
);
wwv_flow_imp.component_end;
end;
/
