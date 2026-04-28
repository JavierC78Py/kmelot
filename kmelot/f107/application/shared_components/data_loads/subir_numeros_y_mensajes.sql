prompt --application/shared_components/data_loads/subir_numeros_y_mensajes
begin
--   Manifest
--     DATA LOAD: subir numeros y mensajes
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(214501019088561456)
,p_name=>'subir numeros y mensajes'
,p_format=>'XLSX'
,p_encoding=>'utf-8'
,p_default_xlsx_sheet_name=>'sheet1.xml'
,p_has_header_row=>true
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(214501282450561483)
,p_data_profile_id=>wwv_flow_imp.id(214501019088561456)
,p_name=>'C001'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>32767
,p_selector_type=>'NAME'
,p_selector=>'NUMERO'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(214501563552561483)
,p_data_profile_id=>wwv_flow_imp.id(214501019088561456)
,p_name=>'C002'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>32767
,p_selector_type=>'NAME'
,p_selector=>'MENSAJE'
);
wwv_flow_imp_shared.create_load_table(
 p_id=>wwv_flow_imp.id(214501755864561483)
,p_name=>'subir numeros y mensajes'
,p_static_id=>'subir_numeros_y_mensajes'
,p_target_type=>'COLLECTION'
,p_collection_name=>'COLL_NUMEROS'
,p_data_profile_id=>wwv_flow_imp.id(214501019088561456)
,p_loading_method=>'APPEND'
,p_commit_interval=>200
,p_error_handling=>'ABORT'
,p_skip_validation=>'N'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
