prompt --application/shared_components/user_interface/lovs/lv_banco_act
begin
--   Manifest
--     LV_BANCO_ACT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(208615140940974152)
,p_lov_name=>'LV_BANCO_ACT'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_banco r',
'      ,descripcion d',
'from banco',
'where estado = ''ACTIVO''',
'order by descripcion      '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
