prompt --application/shared_components/user_interface/lovs/lv_localidad_departamento
begin
--   Manifest
--     LV_LOCALIDAD_DEPARTAMENTO
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
 p_id=>wwv_flow_imp.id(218032705012291030)
,p_lov_name=>'LV_LOCALIDAD_DEPARTAMENTO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct',
'       l.departamento d',
'      ,l.cod_departamento r',
'from localidad l',
'order by departamento',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
