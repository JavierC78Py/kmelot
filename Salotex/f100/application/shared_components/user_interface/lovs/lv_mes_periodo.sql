prompt --application/shared_components/user_interface/lovs/lv_mes_periodo
begin
--   Manifest
--     LV_MES_PERIODO
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
 p_id=>wwv_flow_imp.id(132497673545485020)
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
