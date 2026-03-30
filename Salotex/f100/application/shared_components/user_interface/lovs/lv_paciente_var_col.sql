prompt --application/shared_components/user_interface/lovs/lv_paciente_var_col
begin
--   Manifest
--     LV_PACIENTE_VAR_COL
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
 p_id=>wwv_flow_imp.id(28147368197155364)
,p_lov_name=>'LV_PACIENTE_VAR_COL'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select numero_documento||'' - ''||nombre as d',
'      ,id_entidad as r',
'      ,tip_id_tipo_documento',
'      ,numero_documento',
'      ,nombre',
'      ,nro_celular',
'      ,correo',
'from entidad',
'where es_paciente = ''SI'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41738849168128
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(28147648018155365)
,p_query_column_name=>'R'
,p_heading=>'Id paciente'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(28149875334176755)
,p_query_column_name=>'NOMBRE'
,p_heading=>'Nombre'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(28148048452155365)
,p_query_column_name=>'D'
,p_heading=>'Nombre'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(28150279450176755)
,p_query_column_name=>'NUMERO_DOCUMENTO'
,p_heading=>'Numero documento'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(28148449822155365)
,p_query_column_name=>'TIP_ID_TIPO_DOCUMENTO'
,p_heading=>'Tipo de documento'
,p_display_sequence=>30
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(28150670848176755)
,p_query_column_name=>'NRO_CELULAR'
,p_heading=>'Nro celular'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(28151095813176756)
,p_query_column_name=>'CORREO'
,p_heading=>'Correo'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
