prompt --application/shared_components/user_interface/lovs/lv_tipo_documento_abreviatura
begin
--   Manifest
--     LV_TIPO_DOCUMENTO_ABREVIATURA
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
 p_id=>wwv_flow_imp.id(203400875436652141)
,p_lov_name=>'LV_TIPO_DOCUMENTO_ABREVIATURA'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'TIPO_DOCUMENTO'
,p_return_column_name=>'ID_TIPO_DOCUMENTO'
,p_display_column_name=>'ABREVIATURA'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ABREVIATURA'
,p_default_sort_direction=>'ASC'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
