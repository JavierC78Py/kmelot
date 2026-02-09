prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_default_workspace_id=>14331749518156511
);
end;
/
prompt  WORKSPACE 14331749518156511
--
-- Workspace, User Group, User, and Team Development Export:
--   Date and Time:   12:22 Tuesday January 13, 2026
--   Exported By:     ADMIN
--   Export Type:     Workspace Export
--   Version:         24.2.11
--   Instance ID:     8131532866458080
--
-- Import:
--   Using Instance Administration / Manage Workspaces
--   or
--   Using SQL*Plus as the Oracle user APEX_240200
 
begin
    wwv_flow_imp.set_security_group_id(p_security_group_id=>14331749518156511);
end;
/
----------------
-- W O R K S P A C E
-- Creating a workspace will not create database schemas or objects.
-- This API creates only the meta data for this APEX workspace
prompt  Creating workspace SALOTEX...
begin
wwv_flow_fnd_user_api.create_company (
  p_id => 14332062573156526
 ,p_provisioning_company_id => 14331749518156511
 ,p_short_name => 'SALOTEX'
 ,p_display_name => 'SALOTEX'
 ,p_first_schema_provisioned => 'SALOTEX'
 ,p_company_schemas => 'SALOTEX'
 ,p_account_status => 'ASSIGNED'
 ,p_allow_plsql_editing => 'Y'
 ,p_allow_app_building_yn => 'Y'
 ,p_allow_packaged_app_ins_yn => 'Y'
 ,p_allow_sql_workshop_yn => 'Y'
 ,p_allow_team_development_yn => 'Y'
 ,p_allow_to_be_purged_yn => 'Y'
 ,p_allow_restful_services_yn => 'Y'
 ,p_source_identifier => 'SALOTEX'
 ,p_webservice_logging_yn => 'Y'
 ,p_path_prefix => 'SALOTEX'
 ,p_files_version => 13
 ,p_is_extension_yn => 'N'
 ,p_env_banner_yn => 'N'
 ,p_env_banner_pos => 'LEFT'
);
end;
/
----------------
-- G R O U P S
--
prompt  Creating Groups...
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1512254971069937,
  p_GROUP_NAME => 'OAuth2 Client Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to register OAuth2 Client Applications');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1512179453069937,
  p_GROUP_NAME => 'RESTful Services',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use RESTful Services with this workspace');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1512072854069937,
  p_GROUP_NAME => 'SQL Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use SQL Developer with this workspace');
end;
/
prompt  Creating group grants...
----------------
-- U S E R S
-- User repository for use with APEX cookie-based authentication.
--
prompt  Creating Users...
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '14331929143156511',
  p_user_name                    => 'JAVIER',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => '',
  p_web_password                 => 'BD45BB561C2EB78C34B4900A3F4953F96F5B0CA293C9F4ECA29D2081E5D1A7AAEABC48B82D238D4E87CD53D682D2A1778AA9D242F004AC1D59285F616CE081C5',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'SALOTEX',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202510082308','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
---------------------------
-- D G  B L U E P R I N T S
-- Creating Data Generator Blueprints...
----------------
--Click Count Logs
--
----------------
--mail
--
----------------
--mail log
--
----------------
--app models
--
----------------
--password history
--
begin
  wwv_imp_workspace.create_password_history (
    p_id => 14332280265156558,
    p_user_id => 14331929143156511,
    p_password => 'BD45BB561C2EB78C34B4900A3F4953F96F5B0CA293C9F4ECA29D2081E5D1A7AAEABC48B82D238D4E87CD53D682D2A1778AA9D242F004AC1D59285F616CE081C5');
end;
/
----------------
--preferences
--
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14550345720292410,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14550515639292858,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P312_W26482817283914173',
    p_attribute_value => '26483725907914179____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14679012761636957,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P1620_W312277037396040233',
    p_attribute_value => '312279461465115193____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14679510855681453,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P46_W82340461945760767',
    p_attribute_value => '82347370007762853____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14679727013682945,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P28_W90373484959297773',
    p_attribute_value => '90382182205298772____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14679941570683900,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P34_W84708786904304280',
    p_attribute_value => '84714483805309657____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14680145707685286,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P14_W90238974463657263',
    p_attribute_value => '90248648902669787____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14680424920692658,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P4100_W3727618522871356',
    p_attribute_value => '3728530690872449____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14680657906696695,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P4207_W47814307723191364',
    p_attribute_value => '47815210532192150____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15532248113916993,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P40_W48117227188266087',
    p_attribute_value => '48118623144274016____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15534162168212760,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_85111016970865435_CURRENT_REPORT',
    p_attribute_value => '85111826948865440:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15535014500213720,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P51_W86329277781670947',
    p_attribute_value => '86355382196673533____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15535295390214754,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P53_W86375606334358460',
    p_attribute_value => '86379412764373211____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15943470497609087,
    p_user_id => 'JAVIER',
    p_preference_name => 'F4000_203906404237009921_SPLITTER_STATE',
    p_attribute_value => '434:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15944501302732264,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P1800_W15698721914328105',
    p_attribute_value => '15700317824328377____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15944939231744923,
    p_user_id => 'JAVIER',
    p_preference_name => 'APEX_IG_3304651691587419_CURRENT_REPORT',
    p_attribute_value => '3903492105430583:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15965304331753933,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP100_P144_R15956859993752634_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15965610266820776,
    p_user_id => 'JAVIER',
    p_preference_name => 'APEX_IG_225857161514926537_CURRENT_REPORT',
    p_attribute_value => '229170045038968477:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17369841910388057,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P145_W17355814767376942',
    p_attribute_value => '17369370391388048____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17383233777485522,
    p_user_id => 'JAVIER',
    p_preference_name => 'APEX_IG_9499495849275742_CURRENT_REPORT',
    p_attribute_value => '23204494782337413:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17384284429511784,
    p_user_id => 'JAVIER',
    p_preference_name => 'CODE_LANGUAGE',
    p_attribute_value => 'PLSQL',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17503105556432320,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P4070_W47949429235486335',
    p_attribute_value => '47951124794493113____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19536250470170481,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_84629315106511240_CURRENT_REPORT',
    p_attribute_value => '84630213939511243:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20342132890265154,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P4400_W27796519609844319',
    p_attribute_value => '27798220762844327____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20342664510271215,
    p_user_id => 'JAVIER',
    p_preference_name => 'APEX_IG_2675372452330944_CURRENT_REPORT',
    p_attribute_value => '1642513948221388:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20342721883271222,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP4000_P4410_R4004965443629330_SORT',
    p_attribute_value => 'sort_4_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20342848297271224,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP4000_P4410_R1622849868577319_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20342930008271231,
    p_user_id => 'JAVIER',
    p_preference_name => 'APEX_IG_263527442738503017_CURRENT_REPORT',
    p_attribute_value => '3519668491004502:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20343076864271277,
    p_user_id => 'JAVIER',
    p_preference_name => 'APEX_IG_1651611827240822_CURRENT_REPORT',
    p_attribute_value => '1665669478337827:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20343108787271280,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP4000_P4410_R29873113508481210_SORT',
    p_attribute_value => 'sort_3_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21133034612248955,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P28_W90373484959297773',
    p_attribute_value => '90382182205298772____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21133297556258509,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P12_W90212816298438747',
    p_attribute_value => '90219918271439916____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21133427972265450,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P145_W17355814767376942',
    p_attribute_value => '17369370391388048____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21133933988371701,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P149_W18144279919542443',
    p_attribute_value => '18150809943546254____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21134042090388293,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_86057640326151184_CURRENT_REPORT',
    p_attribute_value => '86058546240151187:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21134820407394019,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P51_W86329277781670947',
    p_attribute_value => '86355382196673533____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21137245437541765,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_134687077188828109_CURRENT_REPORT',
    p_attribute_value => '134687972166828112:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21137497413545741,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P127_W149340299829798202',
    p_attribute_value => '149349974268810726____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21139456326795890,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P72_W88722034930827579',
    p_attribute_value => '88727162480828404____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21140372623988778,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P134_W148199069466785640',
    p_attribute_value => '148204245376786798____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21931902943611787,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P65_W86913482206044907',
    p_attribute_value => '86917805647045645____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21932248995611901,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P63_W86872860910648321',
    p_attribute_value => '86880353515650953____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 23138111673837537,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P58_W85128502417551721',
    p_attribute_value => '85139399463624043____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 23138421496837778,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_85170270520016243_CURRENT_REPORT',
    p_attribute_value => '85188911010970056:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 23138511523837793,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_122647327501593444_CURRENT_REPORT',
    p_attribute_value => '122648288274593446:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 23138884838839479,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_105789896980630536_CURRENT_REPORT',
    p_attribute_value => '105790857753630538:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 23139028923843294,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P10_W90194052416145601',
    p_attribute_value => '90198237872146688____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 23582913147036038,
    p_user_id => 'JAVIER',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_W',
    p_attribute_value => '865',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24002992765479281,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P152_W23988987530465561',
    p_attribute_value => '24002450396479281____REPORT',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24540933432670389,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P26_W90351017901232680',
    p_attribute_value => '90356533251236365____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24939413324288987,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P18_W90284232166008907',
    p_attribute_value => '90290047550009834____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25750564460401289,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P154_W25744194864395005',
    p_attribute_value => '25750065795401282____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25774725959425890,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P154_W25765285084418869',
    p_attribute_value => '25774174339425889____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15967714295893480,
    p_user_id => 'JAVIER',
    p_preference_name => 'PERSISTENT_ITEM_P34_ROWS',
    p_attribute_value => '',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15967826956893488,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP4000_P34_R77549119545304597_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18151359035546262,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P149_W18144279919542443',
    p_attribute_value => '18150809943546254____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 23139251603845732,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P8_W89304923513645052',
    p_attribute_value => '89308789187645925____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 23958959634414407,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP100_P151_R23948329749359030_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24536426152546779,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P2_W89250662643338606',
    p_attribute_value => '89254045741340627____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25996404553421233,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P60_W83159900511217248',
    p_attribute_value => '83164069057227447____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25998221089450513,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P119_W123529395024234780',
    p_attribute_value => '123534664698213004____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27596044332538838,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P67_W87008799339966397',
    p_attribute_value => '87018834978966666____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27791782593684073,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P152_W23988987530465561',
    p_attribute_value => '24002450396479281____REPORT',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27792522432506869,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_PDF_ACCESSIBLE',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27814404051494652,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_27783016575052755_CURRENT_REPORT',
    p_attribute_value => '27783993173052758:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27820969248676694,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P123_W132551657862697151',
    p_attribute_value => '132555948476697832____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27909895368706889,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P141_W87007543907796244',
    p_attribute_value => '87676372173413628____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27916640189861488,
    p_user_id => 'JAVIER',
    p_preference_name => 'F4000_203904827661009901_SPLITTER_STATE',
    p_attribute_value => '337:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28010160541868356,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P158_W27998040090867887',
    p_attribute_value => '28009647912868351____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28198959225332938,
    p_user_id => 'JAVIER',
    p_preference_name => 'APEX$RDS_4000_1925_2241366915021519_active_tab',
    p_attribute_value => 'R225897994729244504',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30808310029552920,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_30790365705533094_CURRENT_REPORT',
    p_attribute_value => '30791286164533097:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 31331928511298545,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P154_W25765285084418869',
    p_attribute_value => '25774174339425889____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 31334979797541057,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P125_W132606955964901879',
    p_attribute_value => '132611655662902430____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32732892450143087,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP4000_P34_R2317966930424404_SORT',
    p_attribute_value => 'sort_11_desc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32733796954164259,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P4101_W47836204953827708',
    p_attribute_value => '47837809399835130____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33400900043873145,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P74_W85198116169838149',
    p_attribute_value => '85210290574849317____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34380831670858270,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P4_W89268287504468382',
    p_attribute_value => '89271951899469923____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34549932604185832,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P69_W34541600247185302',
    p_attribute_value => '34549420091185831____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34556052657192265,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P69_W34542563416185311',
    p_attribute_value => '34555529232192265____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34780388481219860,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_84629315106511240_CURRENT_REPORT',
    p_attribute_value => '84630213939511243:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34885489671356250,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_87047294638819056_CURRENT_REPORT',
    p_attribute_value => '87093157242017584:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34885880519359870,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P67_W87008799339966397',
    p_attribute_value => '87018834978966666____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34887028085458848,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_27783016575052755_CURRENT_REPORT',
    p_attribute_value => '27783993173052758:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35349831146420080,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_89191290502871371_CURRENT_REPORT',
    p_attribute_value => '89296659822938198:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35349909975420093,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_89717144922977646_CURRENT_REPORT',
    p_attribute_value => '89725351920151568:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35351593910922557,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P81_W89106858508391084',
    p_attribute_value => '89113119402402231____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35450911883853518,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P83_W89181364278869558',
    p_attribute_value => '89197368090945474____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35451289501860505,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P88_W84191184731729958',
    p_attribute_value => '86021043428379125____REPORT',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35451596524860511,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P88_W84192863253729975',
    p_attribute_value => '86036854019594766____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35451636685862078,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX$RDS_100_88_84190741852729954_active_tab',
    p_attribute_value => 'R85999044474206692',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35463905545463254,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P160_W35456769032462459',
    p_attribute_value => '35463484733463253____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35487132262028846,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P130_W150711724511614168',
    p_attribute_value => '150725096894699305____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17507177894468351,
    p_user_id => 'JAVIER',
    p_preference_name => 'APEX_IG_672963075378064002_CURRENT_REPORT',
    p_attribute_value => '690476277412535931:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21132107809217273,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P14_W90238974463657263',
    p_attribute_value => '90248648902669787____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21140573728017422,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP100_P144_R15956859993752634_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21932055777611797,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P65_W86913482206044907',
    p_attribute_value => '86917805647045645____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25979656791049172,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P19_W451745617575288584',
    p_attribute_value => '451746507039288843____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25980881805053999,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P939_W451352700445603348',
    p_attribute_value => '451353909559603360____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27596358802539096,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_87047294638819056_CURRENT_REPORT',
    p_attribute_value => '87093157242017584:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30784859275715075,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P6_W89284489054555433',
    p_attribute_value => '89288285270557020____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 31335157138541527,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P123_W132551657862697151',
    p_attribute_value => '132555948476697832____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 31600110272118317,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_30790365705533094_CURRENT_REPORT',
    p_attribute_value => '30791286164533097:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35486877241024756,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P134_W148199069466785640',
    p_attribute_value => '148204245376786798____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35488156595043061,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P132_W150802249787504388',
    p_attribute_value => '150808065171505315____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17497786059880913,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P12_W90212816298438747',
    p_attribute_value => '90219918271439916____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21133676685361386,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P147_W17520901930588709',
    p_attribute_value => '17525265227589329____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30782098236437337,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P63_W86872860910648321',
    p_attribute_value => '86880353515650953____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30783109015485808,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P65_W86913482206044907',
    p_attribute_value => '86917805647045645____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34886060460380965,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_88979137291797396_CURRENT_REPORT',
    p_attribute_value => '88980098064797398:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35486510732021820,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_85170270520016243_CURRENT_REPORT',
    p_attribute_value => '85188911010970056:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35486614560021832,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_122647327501593444_CURRENT_REPORT',
    p_attribute_value => '122648288274593446:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15968047645894003,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P34_W243294104975845793',
    p_attribute_value => '243322903983850177____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17388936634595817,
    p_user_id => 'JAVIER',
    p_preference_name => 'APEX_IG_712080000591813402_CURRENT_REPORT',
    p_attribute_value => '712386498335634625:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24942493052469039,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP100_P31_R88312893549653941_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25994955716388928,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_85111016970865435_CURRENT_REPORT',
    p_attribute_value => '85111826948865440:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25995337258394172,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P53_W86375606334358460',
    p_attribute_value => '86379412764373211____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34539775347921409,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P69_W87533604381547680',
    p_attribute_value => '87538780291548838____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14549844996289047,
    p_user_id => 'JAVIER',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14550004485289091,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____REPORT',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14550197812289130,
    p_user_id => 'JAVIER',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '100',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17502001880416304,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P4006_W34137717780696512',
    p_attribute_value => '34138618393696778____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17506412368463570,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P405_W3852329031687921',
    p_attribute_value => '3853503855690337____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17506949614463874,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P4050_W29606701090180824',
    p_attribute_value => '17509781276517641____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17526383690597460,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P30_W90405495275452043',
    p_attribute_value => '90418867658537180____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17527252278678067,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP4000_P645_R227779306745025252_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21137116191541246,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P136_W134470839781800019',
    p_attribute_value => '134477304473802125____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27904891114046687,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP100_P140_R425645288479265101_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15534228879213277,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_86057640326151184_CURRENT_REPORT',
    p_attribute_value => '86058546240151187:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17382932222484335,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP_IR_4000_P4110_W1548412223182178',
    p_attribute_value => '1550029190194632____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17525719345589333,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P147_W17520901930588709',
    p_attribute_value => '17525265227589329____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24939207379285437,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P22_W90319875529148393',
    p_attribute_value => '90324494288150842____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25996690191426612,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P56_W87378413949842768',
    p_attribute_value => '87384080069860213____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25997059868442481,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P55_W83189126755200267',
    p_attribute_value => '83913421472638964____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25997382714442486,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P55_W83190636526200282',
    p_attribute_value => '83917275031644996____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25997441280442492,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_87064218306991855_CURRENT_REPORT',
    p_attribute_value => '77811005146157354:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25997554919442497,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_75661459627925261_CURRENT_REPORT',
    p_attribute_value => '75707284826060050:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25997654096442501,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_123554506014774458_CURRENT_REPORT',
    p_attribute_value => '123572532454513542:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25997891252442504,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P55_W135816218092990358',
    p_attribute_value => '137819089847613337____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25998077343442509,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P55_W123552915646774442',
    p_attribute_value => '123559999456751477____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25998795333543913,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P88_W84191184731729958',
    p_attribute_value => '86021043428379125____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25999010241543919,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P88_W84192863253729975',
    p_attribute_value => '86036854019594766____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27821534310830805,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P125_W132606955964901879',
    p_attribute_value => '132611655662902430____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27950641998193476,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P60_W83159900511217248',
    p_attribute_value => '83164069057227447____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34883954917854651,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_88979137291797396_CURRENT_REPORT',
    p_attribute_value => '88980098064797398:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35486275531021143,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P58_W85128502417551721',
    p_attribute_value => '85139399463624043____',
    p_tenant_id => '');
end;
/
----------------
--query builder
--
----------------
--sql scripts
--
----------------
--sql commands
--
----------------
--Quick SQL saved models
--
----------------
--user access log
--
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202512271446','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202512291304','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601051908','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601072024','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202512261523','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512291618','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512301628','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601021835','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601051707','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601051846','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601061451','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601061451','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601021102','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601061911','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512261524','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Credenciales de conexión no válidas');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512301814','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601051227','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601061007','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601072334','YYYYMMDDHH24MI'),
    p_ip_address => '181.122.101.107',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512252129','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512291605','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Credenciales de conexión no válidas');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601021115','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601031628','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601051707','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601051708','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202512252129','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512291305','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512301814','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Credenciales de conexión no válidas');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601021629','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601031328','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601051138','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601051227','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601051227','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Credenciales de conexión no válidas');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512261524','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512261824','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512300009','YYYYMMDDHH24MI'),
    p_ip_address => '181.122.101.107',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601020945','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601021549','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512271453','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202512291304','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601021507','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601061452','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512301644','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512302028','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601051846','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601052109','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601061008','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601021550','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601031328','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512271740','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202512271740','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202512301644','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202512301814','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512291605','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202512291750','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601061922','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601052110','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601052111','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601061935','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Credenciales de conexión no válidas');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601061935','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601081233','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601081234','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601122220','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601131216','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601081713','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601082247','YYYYMMDDHH24MI'),
    p_ip_address => '181.122.101.107',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601090006','YYYYMMDDHH24MI'),
    p_ip_address => '181.122.101.107',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Credenciales de conexión no válidas');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601091622','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601081539','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Credenciales de conexión no válidas');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601081539','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601082012','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601091326','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601122220','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601091325','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601111300','YYYYMMDDHH24MI'),
    p_ip_address => '181.122.101.107',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601131034','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601131034','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601081242','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601081713','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202601082319','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601082322','YYYYMMDDHH24MI'),
    p_ip_address => '181.126.52.17',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601090006','YYYYMMDDHH24MI'),
    p_ip_address => '181.122.101.107',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601091530','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601091828','YYYYMMDDHH24MI'),
    p_ip_address => '131.161.255.45',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601121001','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202601131002','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
prompt Check Compatibility...
begin
-- This date identifies the minimum version required to import this file.
wwv_flow_team_api.check_version(p_version_yyyy_mm_dd=>'2010.05.13');
end;
/
 
begin wwv_flow.g_import_in_progress := true; wwv_flow.g_user := USER; end; 
/
 
--
prompt ...feedback
--
begin
null;
end;
/
--
prompt ...Issue Templates
--
begin
null;
end;
/
--
prompt ...Issue Email Prefs
--
begin
null;
end;
/
--
prompt ...Label Groups
--
begin
null;
end;
/
--
prompt ...Labels
--
begin
null;
end;
/
--
prompt ... Milestones
--
begin
null;
end;
/
--
prompt ... Issues
--
begin
null;
end;
/
--
prompt ... Issue Attachments
--
begin
null;
end;
/
--
prompt ... Issues Milestones
--
begin
null;
end;
/
--
prompt ... Issues Labels
--
begin
null;
end;
/
--
prompt ... Issues stakeholders
--
begin
null;
end;
/
--
prompt ... Issues Comments
--
begin
null;
end;
/
--
prompt ... Issues Events
--
begin
null;
end;
/
--
prompt ... Issues Notifications
--
begin
null;
end;
/
 
prompt ... Extension Links
 
 
prompt ... Extension Grants
 
 
prompt ...workspace objects
 
begin
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(15333049240419840)
,p_name=>'BUCKET_USER'
,p_static_id=>'BUCKET_USER'
,p_authentication_type=>'OCI'
,p_namespace=>'ocid1.tenancy.oc1..aaaaaaaazkulpjlsfhxwqnv3zx7x3gufjvbhz7rxjhjafdq57nvaarnbqhca'
,p_prompt_on_install=>true
);
end;
/
begin
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(19557328778387686)
,p_name=>'Jasper Reports Server'
,p_static_id=>'JASPERSERVER_CRED'
,p_authentication_type=>'BASIC'
,p_prompt_on_install=>true
,p_credential_comment=>'Credenciales en JasperServer.'
);
end;
/
 
prompt ...RESTful Services
 
-- SET SCHEMA
 
begin
 
   wwv_flow_imp.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'SALOTEX';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA SALOTEX - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_240200
-- Exported 12:22 Tuesday January 13, 2026 by: ADMIN
--
 
--------------------------------------------------------------------
prompt User Interface Defaults, Attribute Dictionary
--
-- Exported 12:22 Tuesday January 13, 2026 by: ADMIN
--
-- SHOW EXPORTING WORKSPACE
 
begin
 
   wwv_flow_imp.g_id_offset := 0;
   wwv_flow_hint.g_exp_workspace := 'SALOTEX';
 
end;
/

begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
