prompt --application/shared_components/user_interface/lovs/lv_pagina_modulo
begin
--   Manifest
--     LV_PAGINA_MODULO
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
 p_id=>wwv_flow_imp.id(86274088667361491)
,p_lov_name=>'LV_PAGINA_MODULO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct modulo d, modulo r',
'FROM pagina',
'order by 1 '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
