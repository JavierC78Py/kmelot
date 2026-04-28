prompt --application/shared_components/user_interface/lovs/lv_producto_cod_barra_id_all
begin
--   Manifest
--     LV_PRODUCTO_COD_BARRA_ID_ALL
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
 p_id=>wwv_flow_imp.id(206795132631733313)
,p_lov_name=>'LV_PRODUCTO_COD_BARRA_ID_ALL'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT P.CODIGO_BARRA_FABRICA||'' * ''||P.ID_PRODUCTO||'' - ''||P.DESCRIPCION D',
'      ,P.ID_PRODUCTO R',
'FROM PRODUCTO P',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41742897019735
);
wwv_flow_imp.component_end;
end;
/
