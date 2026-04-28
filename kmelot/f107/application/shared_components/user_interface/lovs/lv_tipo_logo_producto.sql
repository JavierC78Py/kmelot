prompt --application/shared_components/user_interface/lovs/lv_tipo_logo_producto
begin
--   Manifest
--     LV_TIPO_LOGO_PRODUCTO
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
 p_id=>wwv_flow_imp.id(173167437004433058)
,p_lov_name=>'LV_TIPO_LOGO_PRODUCTO'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'TIPO_LOGO'
,p_return_column_name=>'ID_TIPO_LOGO'
,p_display_column_name=>'DESCRIPCION'
,p_default_sort_column_name=>'DESCRIPCION'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41751122365679
);
wwv_flow_imp.component_end;
end;
/
