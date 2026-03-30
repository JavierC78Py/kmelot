prompt --application/shared_components/user_interface/lovs/lv_producto_cod_barra_id_uni_medi_act
begin
--   Manifest
--     LV_PRODUCTO_COD_BARRA_ID_UNI_MEDI_ACT
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
 p_id=>wwv_flow_imp.id(87163620961829042)
,p_lov_name=>'LV_PRODUCTO_COD_BARRA_ID_UNI_MEDI_ACT'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(P.PRODUCTO_CODIGO,P.CODIGO_BARRA_FABRICA)||'' * ''||P.ID_PRODUCTO||'' - ''||P.DESCRIPCION||'' (''||U.ABREVIATURA||'')'' D',
'      ,P.ID_PRODUCTO R',
'      ,U.ID_UNIDAD_MEDIDA',
'      ,P.ID_PRODUCTO||''.''||U.ID_UNIDAD_MEDIDA AS ID_REGISTRO',
'FROM PRODUCTO P, DET_UNI_MEDI_PROD D, UNIDAD_MEDIDA U',
'WHERE P.ESTADO = ''ACTIVO''',
'AND P.TIPO = ''ART''',
'AND D.PRO_ID_PRODUCTO = P.ID_PRODUCTO',
'AND U.ID_UNIDAD_MEDIDA = D.UNI_ID_UNIDAD_MEDIDA',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'ID_REGISTRO'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41742937286320
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(34799752131429464)
,p_query_column_name=>'R'
,p_heading=>'Id producto'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(34810786493874292)
,p_query_column_name=>'ID_REGISTRO'
,p_display_sequence=>10
,p_data_type=>'ROWID'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(34800539103429465)
,p_query_column_name=>'D'
,p_heading=>unistr('Descripci\00F3n')
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(34800195868429465)
,p_query_column_name=>'ID_UNIDAD_MEDIDA'
,p_heading=>'Unidad medida'
,p_display_sequence=>30
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
