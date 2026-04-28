prompt --application/shared_components/user_interface/lovs/lv_mes_periodo
begin
--   Manifest
--     LV_MES_PERIODO
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
 p_id=>wwv_flow_imp.id(251731199117141158)
,p_lov_name=>'LV_MES_PERIODO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -2), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -2), ''MM-YYYY'') AS return_value',
'FROM dual',
'UNION ALL',
'SELECT TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -1), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -1), ''MM-YYYY'') AS return_value',
'FROM dual',
'UNION ALL',
'SELECT TO_CHAR(TRUNC(SYSDATE, ''MM''), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(TRUNC(SYSDATE, ''MM''), ''MM-YYYY'') AS return_value',
'FROM dual',
'UNION ALL',
'SELECT TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), 1), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), 1), ''MM-YYYY'') AS return_value',
'FROM dual',
'UNION ALL',
'SELECT TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), 2), ''MM-YYYY'') AS display_value,',
'       TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, ''MM''), 2), ''MM-YYYY'') AS return_value',
'FROM dual',
'ORDER BY 1 DESC;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>39384213029724
);
wwv_flow_imp.component_end;
end;
/
