prompt --application/create_application
begin
--   Manifest
--     FLOW: 107
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'KMELOT')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Kmelot')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'KMELOT')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'A7A259D5BCA94C9FC8D77C54D4F3E12B571F1FC6AFE4F8255918403499856618'
,p_bookmark_checksum_function=>'SH512'
,p_max_session_length_sec=>10800
,p_max_session_idle_sec=>3600
,p_compatibility_mode=>'21.2'
,p_accessible_read_only=>'N'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'es-py'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DD-MM-YYYY'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Application created from create application wizard 2021.05.22.'
,p_authentication_id=>wwv_flow_imp.id(206180212965405196)
,p_application_tab_set=>0
,p_logo_type=>'I'
,p_logo=>'#APP_FILES#icons/app-icon-192.png'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>unistr('Versi\00F3n 1.5')
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>unistr('Esta aplicaci\00F3n no est\00E1 disponible en este momento.')
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_vpd=>wwv_flow_string.join(wwv_flow_t_varchar2(
'execute immediate ''ALTER SESSION SET SYSDATE_AT_DBTIMEZONE=true'';',
''))
,p_runtime_api_usage=>'T'
,p_pass_ecid=>'N'
,p_security_scheme=>wwv_flow_imp.id(206331772544406006)
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'insum_error_handler_api.error_handler'
,p_tokenize_row_search=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Kmelot'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>79
,p_version_scn=>39416237107591
,p_print_server_type=>'NATIVE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'Y'
,p_pwa_manifest_description=>'Kmelot'
,p_pwa_manifest_display=>'fullscreen'
,p_pwa_manifest_orientation=>'any'
,p_pwa_apple_status_bar_style=>'black'
,p_pwa_is_push_enabled=>'N'
,p_copyright_banner=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Name: #APP_NAME#',
'Copyright (c) 2021, #YEAR#, Kmelot.'))
);
wwv_flow_imp.component_end;
end;
/
