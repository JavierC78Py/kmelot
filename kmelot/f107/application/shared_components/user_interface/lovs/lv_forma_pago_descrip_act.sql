prompt --application/shared_components/user_interface/lovs/lv_forma_pago_descrip_act
begin
--   Manifest
--     LV_FORMA_PAGO_DESCRIP_ACT
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
 p_id=>wwv_flow_imp.id(208609360113335858)
,p_lov_name=>'LV_FORMA_PAGO_DESCRIP_ACT'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_forma_pago r',
'      ,descripcion d',
'from forma_pago',
'where estado = ''ACTIVO''      '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
