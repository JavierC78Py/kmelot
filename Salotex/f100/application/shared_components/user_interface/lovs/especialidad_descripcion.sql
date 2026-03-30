prompt --application/shared_components/user_interface/lovs/especialidad_descripcion
begin
--   Manifest
--     ESPECIALIDAD.DESCRIPCION
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
 p_id=>wwv_flow_imp.id(27977705685867875)
,p_lov_name=>'ESPECIALIDAD.DESCRIPCION'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'ESPECIALIDAD'
,p_return_column_name=>'ID_ESPECIALIDAD'
,p_display_column_name=>'DESCRIPCION'
,p_default_sort_column_name=>'DESCRIPCION'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41738764203871
);
wwv_flow_imp.component_end;
end;
/
