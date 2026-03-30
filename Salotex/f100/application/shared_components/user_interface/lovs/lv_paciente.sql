prompt --application/shared_components/user_interface/lovs/lv_paciente
begin
--   Manifest
--     LV_PACIENTE
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
 p_id=>wwv_flow_imp.id(28131091400888607)
,p_lov_name=>'LV_PACIENTE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select numero_documento||'' - ''||nombre as d',
'      ,id_entidad as r',
'      ,tip_id_tipo_documento',
'from entidad',
'where es_paciente = ''SI'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41738845432368
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(28131985132911503)
,p_query_column_name=>'R'
,p_heading=>'Id paciente'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(28132397696911504)
,p_query_column_name=>'D'
,p_heading=>'Nro de documento y nombre'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(28132724027911504)
,p_query_column_name=>'TIP_ID_TIPO_DOCUMENTO'
,p_heading=>'Tipo de documento'
,p_display_sequence=>30
,p_data_type=>'NUMBER'
);
wwv_flow_imp.component_end;
end;
/
