prompt --application/shared_components/user_interface/theme_style
begin
--   Manifest
--     THEME STYLE: 107
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(205393706777600805)
,p_theme_id=>42
,p_name=>'Vita (black)'
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita.less'
,p_theme_roller_config=>'{"classes":[],"vars":{"@g_Accent-BG":"#000000","@g_Accent-OG":"#434343","@g_Region-Header-BG":"#4d4d4d","@g_Region-Header-FG":"#434343","@g_Region-BG":"#808080","@g_Region-FG":"#434343","@g_Body-BG":"#434343","@g_Body-Text":"#434343","@g_Header-BG":"'
||'#000000","@g_Header-FG":"#434343","@g_Actions-Col-BG":"#474747","@g_Actions-Col-Text":"#434343","@g_Body-Title-BG":"#4b4b4b","@g_Body-Title-FG":"#434343","@g_Form-Item-BG":"#434343","@g_Form-Item-FG":"#434343"},"customCSS":"","useCustomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#12427162141937927.css'
,p_theme_roller_read_only=>false
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(205398485241543629)
,p_theme_id=>42
,p_name=>'Vita (black1)'
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita.less'
,p_theme_roller_config=>'{"classes":[],"vars":{"@g_Accent-BG":"#000000","@g_Accent-OG":"#434343","@g_Body-BG":"#434343","@g_Body-Text":"#ffffff","@g_Form-Label":"#434343","@g_Form-Item-BG":"#878787","@g_Form-Item-FG":"#434343"},"customCSS":"","useCustomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#12431940605880751.css'
,p_theme_roller_read_only=>false
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(207983496322347837)
,p_theme_id=>42
,p_name=>'Redwood Light (OscuroX)'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/oracle-fonts/oraclesans-apex#MIN#.css?v=#APEX_VERSION#',
'#THEME_FILES#css/Redwood#MIN#.css?v=#APEX_VERSION#'))
,p_css_classes=>' rw-mode-body-header--dark rw-mode-body--dark rw-pillar--neutral rw-layout--edge-to-edge rw-mode-header--dark rw-mode-nav--dark'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Redwood-Theme.less'
,p_theme_roller_config=>'{"classes":["rw-mode-body-header--dark","rw-mode-body--dark","rw-pillar--neutral","rw-layout--fixed t-PageBody--scrollTitle","rw-layout--edge-to-edge","rw-mode-header--dark","rw-mode-nav--dark"],"vars":{},"customCSS":"#t_Footer {\n    display: none;\'
||'n}\n","useCustomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#15016951686684959.css'
,p_theme_roller_read_only=>false
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(229071553502431981)
,p_theme_id=>42
,p_name=>'Redwood Light (Oscuro)'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/oracle-fonts/oraclesans-apex#MIN#.css?v=#APEX_VERSION#',
'#THEME_FILES#css/Redwood#MIN#.css?v=#APEX_VERSION#'))
,p_css_classes=>' rw-mode-body-header--dark rw-mode-body--dark rw-pillar--neutral rw-layout--edge-to-edge rw-mode-header--dark rw-mode-nav--dark'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Redwood-Theme.less'
,p_theme_roller_config=>'{"classes":["rw-mode-body-header--dark","rw-mode-body--dark","rw-pillar--neutral","rw-layout--fixed t-PageBody--scrollTitle","rw-layout--edge-to-edge","rw-mode-header--dark","rw-mode-nav--dark"],"vars":{},"customCSS":"","useCustomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#44911337636887609.css'
,p_theme_roller_read_only=>false
);
wwv_flow_imp.component_end;
end;
/
