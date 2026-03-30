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
--   Date and Time:   23:49 Thursday March 19, 2026
--   Exported By:     JAVIER
--   Export Type:     Workspace Export
--   Version:         24.2.14
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
 ,p_files_version => 18
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
    p_attribute_value => '512:false',
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
    p_attribute_value => '87018834978966666____REPORT',
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
    p_attribute_value => '446:false',
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
    p_id => 37933220978852812,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_89191290502871371_CURRENT_REPORT',
    p_attribute_value => '89296659822938198:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 37933386694852823,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_89717144922977646_CURRENT_REPORT',
    p_attribute_value => '89725351920151568:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 37934342282902051,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P86_W107562917834635072',
    p_attribute_value => '107578921646710988____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 37934546052909311,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P30_W90405495275452043',
    p_attribute_value => '90418867658537180____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 37934720931910986,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P130_W150711724511614168',
    p_attribute_value => '150725096894699305____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 37934912449912445,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P132_W150802249787504388',
    p_attribute_value => '150808065171505315____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 37935334758985932,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P24_W90335446063192968',
    p_attribute_value => '90340886931196879____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 38357092387138846,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P86_W107562917834635072',
    p_attribute_value => '107578921646710988____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 38359269888390651,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_107590386392706093_CURRENT_REPORT',
    p_attribute_value => '107695755712772920:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 38359372277390663,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_108116240812812368_CURRENT_REPORT',
    p_attribute_value => '108124447809986290:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 38934083683094746,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P94_W98758926930574761',
    p_attribute_value => '98767164449576506____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 38938727070482966,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P96_W99140955228774167',
    p_attribute_value => '99147942705777335____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39610518717015012,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P162_W124661373765561236',
    p_attribute_value => '124672270811633558____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39794427424816880,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_126325729516370515_CURRENT_REPORT',
    p_attribute_value => '126332457502414080:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39950854382330442,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P164_W39944488533313979',
    p_attribute_value => '39950339066330441____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 40153824368338336,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP4000_P712_R40749510927686102_SORT',
    p_attribute_value => 'sort_4_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 40165417471780744,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P162_W124661373765561236',
    p_attribute_value => '124672270811633558____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 40165708278781312,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_126325729516370515_CURRENT_REPORT',
    p_attribute_value => '126332457502414080:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 40166777213894793,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P18_W90284232166008907',
    p_attribute_value => '90290047550009834____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 43181716799468849,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P166_W42936267370222166',
    p_attribute_value => '43181218196468830____',
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
    p_id => 43193953002676635,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P167_W43187687523656366',
    p_attribute_value => '43193420572676633____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 43199627396974486,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P167_W43187687523656366',
    p_attribute_value => '43193420572676633____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 44184611848314307,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_107590386392706093_CURRENT_REPORT',
    p_attribute_value => '107695755712772920:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 44184770343314316,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_108116240812812368_CURRENT_REPORT',
    p_attribute_value => '108124447809986290:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 44185805853332507,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P73_W103733159605363031',
    p_attribute_value => '103738287155363856____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 46277209460267843,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P138_W46254012355623952',
    p_attribute_value => '46259831045628285____REPORT',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 46281802785304578,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_PDF_ACCESSIBLE',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 49132122064227646,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P138_W45742161703368429',
    p_attribute_value => '48188374530092132____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 49132736789588449,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX$RDS_100_138_45744004741368448_active_tab',
    p_attribute_value => 'R46253913780623952',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 49598722394613325,
    p_user_id => 'JAVIER',
    p_preference_name => 'FSP4000_P73_R78240013758270704_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 50952470311845223,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P168_W49535408577275119',
    p_attribute_value => '49540467528276463____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 50952581294845680,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_49560602120295798_CURRENT_REPORT',
    p_attribute_value => '49561445033295800:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 50952662115845684,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_49572967091327001_CURRENT_REPORT',
    p_attribute_value => '49578880416400877:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 51139908200979880,
    p_user_id => 'JAVIER',
    p_preference_name => 'ADVISOR_CHECKS',
    p_attribute_value => 'SUBSTITUTION_SYNTAX:COLUMN_SYNTAX:BIND_VARIABLE_SYNTAX:APPL_PAGE_ITEM_REF:PAGE_NUMBER_EXISTS:VALID_SQL_PLSQL_CODE:DML_PROCESSES:BRANCH_SEQUENCE:WHEN_BUTTON_PRESSED:BUTTON_DA_COMPATIBLE:SQL_INJECTION:INSECURE_APPLICATION_DEFAULTS:AUTHORIZATION:SESSION_STATE_PROTECTION:BROWSER_SECURITY:IS_ITEM_OF_TARGET_PAGE:PAGE_ITEM_REF_AS_STRING:CLEAR_CACHE_PAGE_NUMBER:ITEM_NAME_LENGTH:BUTTON_DA_INCONSISTENT_REFS:AJAX_ITEMS_WITH_SSP:LEGACY_ORPHAN_COMPONENTS:V_FUNCTION_IN_SQL:UI_INCLUDES_COMPATIBILITY_JS:HARDCODED_APPLICATION_ID:REPORT_DEFAULT_ORDER:HAS_HELP_TEXT:DEPRECATED_ATTRIBUTES:VALIDATION_ASSOCIATED_ITEM:THEME_STYLE_IS_ACCESSIBLE:HAS_PAGE_TITLE:REGION_HAS_ROW_HEADER:ITEM_HAS_LABEL:ITEMS_NO_CONTEXT_CHANGE:IMAGE_ITEM_HAS_ALT',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 51190062648117554,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P172_W51168515165116662',
    p_attribute_value => '51189500045117553____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 51341199530250840,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_51177828520116934_CURRENT_REPORT',
    p_attribute_value => '51178645681116936:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52162833236510656,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_49478483608583630_CURRENT_REPORT',
    p_attribute_value => '52157058738500244:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52383412369130964,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX_IG_49478483608583630_CURRENT_REPORT',
    p_attribute_value => '52157058738500244:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52386086739608146,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'APEX$RDS_100_88_84190741852729954_active_tab',
    p_attribute_value => 'R85999044474206692',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52386319280612016,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P34_W84708786904304280',
    p_attribute_value => '84714483805309657____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52386522969612382,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P38_W84741738000402243',
    p_attribute_value => '84748234259412767____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52386705584612758,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P44_W84860932263724286',
    p_attribute_value => '84864488652728852____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52386973211613237,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P32_W84914849070601992',
    p_attribute_value => '84921002393615395____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52387157136614794,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P42_W84834741015482006',
    p_attribute_value => '84845498412482671____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52387376667618188,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P36_W84725199798354053',
    p_attribute_value => '84728932693360153____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52387813799622020,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P40_W84770309570599813',
    p_attribute_value => '84779775759621799____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52389878395661982,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P105_W135817799103990374',
    p_attribute_value => '142055801414137603____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52390038634661986,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P105_W79348793363184166',
    p_attribute_value => '79380896885160045____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52390232186663667,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P141_W87007543907796244',
    p_attribute_value => '87676372173413628____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52448692341647332,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_49575220110327024_CURRENT_REPORT',
    p_attribute_value => '52445116214642840:GRID',
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
    p_id => 38354901470082946,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P85_W84189936627729946',
    p_attribute_value => '85989367558418933____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39732166501766917,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_124711716039030314_CURRENT_REPORT',
    p_attribute_value => '124730356529984127:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39732287465766931,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_162188773020607515_CURRENT_REPORT',
    p_attribute_value => '162189733793607517:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 40166518639886567,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P20_W90304528996099572',
    p_attribute_value => '90309262689100596____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 46260356235628293,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P138_W46254012355623952',
    p_attribute_value => '46259831045628285____REPORT',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 49540918251276469,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P168_W49535408577275119',
    p_attribute_value => '49540467528276463____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 49571708247296282,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P169_W49554989273295533',
    p_attribute_value => '49571286307296282____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 50332303241354856,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_49560602120295798_CURRENT_REPORT',
    p_attribute_value => '49561445033295800:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 50332460950354869,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_49572967091327001_CURRENT_REPORT',
    p_attribute_value => '49578880416400877:GRID',
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
    p_id => 37932004807803458,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P160_W35456769032462459',
    p_attribute_value => '35463484733463253____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 37932707106842564,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P74_W85198116169838149',
    p_attribute_value => '85210290574849317____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 37933733341860411,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P83_W89181364278869558',
    p_attribute_value => '89197368090945474____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 37933908904870038,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P75_W89040408728956378',
    p_attribute_value => '89044198517957089____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 40169778973275924,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P26_W90351017901232680',
    p_attribute_value => '90356533251236365____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 40731918621526700,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P22_W90319875529148393',
    p_attribute_value => '90324494288150842____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 48190221142111746,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX$RDS_100_138_45744004741368448_active_tab',
    p_attribute_value => 'R46253913780623952',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 51341071973237588,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P169_W51142431013067182',
    p_attribute_value => '51147962827078842____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 51532076867384158,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_51177828520116934_CURRENT_REPORT',
    p_attribute_value => '51178645681116936:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52020346204794284,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_103177062874894104_CURRENT_REPORT',
    p_attribute_value => '103177880035894106:GRID',
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
    p_id => 38354719866082574,
    p_user_id => 'JAVIERC',
    p_preference_name => 'APEX_IG_86784283997356444_CURRENT_REPORT',
    p_attribute_value => '86791011983400009:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 48188857231092137,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P138_W45742161703368429',
    p_attribute_value => '48188374530092132____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 52020264878793557,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_105_P169_W103141665367844352',
    p_attribute_value => '103147197181856012____',
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
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 37933514860856151,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P81_W89106858508391084',
    p_attribute_value => '89113119402402231____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 40165929462783142,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P164_W39944488533313979',
    p_attribute_value => '39950339066330441____REPORT',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 43199463249973711,
    p_user_id => 'CABALLEROA',
    p_preference_name => 'FSP_IR_100_P166_W42936267370222166',
    p_attribute_value => '43181218196468830____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 51148400976078849,
    p_user_id => 'JAVIERC',
    p_preference_name => 'FSP_IR_100_P169_W51142431013067182',
    p_attribute_value => '51147962827078842____',
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
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 52331961013065730
 ,p_command => 
'BEGIN                                                                                                                                                                              '||wwv_flow.LF||
'      ORDS.ENABLE_SCHEMA(                                                                                                                                                            '||wwv_flow.LF||
'          p_enabled => TRUE,'||wwv_flow.LF||
'         '||
' p_schema => ''SALOTEX'','||wwv_flow.LF||
'          p_url_mapping_type => ''BASE_PATH'','||wwv_flow.LF||
'          p_url_mapping_pattern => ''salotex'','||wwv_flow.LF||
'          p_auto_rest_auth => FALSE'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'      COMMIT;'||wwv_flow.LF||
'  END;'
    ,p_created_by => 'JAVIER'
    ,p_created_on => to_date('202603151730','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'SALOTEX');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 52332055374068565
 ,p_command => 
'BEGIN'||wwv_flow.LF||
'      OAUTH.CREATE_CLIENT('||wwv_flow.LF||
'          p_name => ''claude_client'','||wwv_flow.LF||
'          p_grant_type => ''client_credentials'','||wwv_flow.LF||
'          p_owner => ''SALOTEX'','||wwv_flow.LF||
'          p_description => ''Client for API access from Claude'','||wwv_flow.LF||
'          p_support_email => ''javier@kmelot.online'','||wwv_flow.LF||
'          p_privilege_names => NULL'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'      COMMIT;'||wwv_flow.LF||
'  END;'
    ,p_created_by => 'JAVIER'
    ,p_created_on => to_date('202603151731','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'SALOTEX');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 52332100813069841
 ,p_command => 
'SELECT id, name, client_id, client_secret'||wwv_flow.LF||
'  FROM user_ords_clients'||wwv_flow.LF||
''
    ,p_created_by => 'JAVIER'
    ,p_created_on => to_date('202603151731','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'SALOTEX');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 52332293524082636
 ,p_command => 
'BEGIN                                                                                                                                                                              '||wwv_flow.LF||
'      OAUTH.GRANT_CLIENT_ROLE(                                                                                                                                                       '||wwv_flow.LF||
'          p_client_name => ''claude_cli'||
'ent'',                                                                                                                                          '||wwv_flow.LF||
'          p_role_name   => ''oracle.dbtools.role.autorest.SALOTEX.enabled'''||wwv_flow.LF||
'      );                                                                                                                                                                             '||wwv_flow.LF||
''||
'      COMMIT;                                                                                                                                                                        '||wwv_flow.LF||
'  END;   '
    ,p_created_by => 'JAVIER'
    ,p_created_on => to_date('202603151733','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'SALOTEX');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 52332386658087657
 ,p_command => 
'BEGIN'||wwv_flow.LF||
'      OAUTH.GRANT_CLIENT_ROLE('||wwv_flow.LF||
'          p_client_name => ''claude_client'','||wwv_flow.LF||
'          p_role_name   => ''oracle.dbtools.autorest.any.schema'''||wwv_flow.LF||
'      );'||wwv_flow.LF||
'      COMMIT;'||wwv_flow.LF||
'  END;'
    ,p_created_by => 'JAVIER'
    ,p_created_on => to_date('202603151734','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'SALOTEX');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 52332479093088673
 ,p_command => 
'BEGIN                                                                                                                                                                              '||wwv_flow.LF||
'      OAUTH.GRANT_CLIENT_ROLE(                                                                                                                                                       '||wwv_flow.LF||
'          p_client_name => ''claude_cli'||
'ent'',                                                                                                                                          '||wwv_flow.LF||
'          p_role_name   => ''oracle.dbtools.role.autorest.SALOTEX.enabled'''||wwv_flow.LF||
'      );                                                                                                                                                                             '||wwv_flow.LF||
''||
'      COMMIT;                                                                                                                                                                        '||wwv_flow.LF||
'  END;  '
    ,p_created_by => 'JAVIER'
    ,p_created_on => to_date('202603151734','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'SALOTEX');
end;
/
----------------
--Quick SQL saved models
--
----------------
--user access log
--
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202603192303','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.134.114',
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
    p_access_date => to_date('202603192311','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603192341','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603192311','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603192341','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603060941','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603081321','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603110010','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603110944','YYYYMMDDHH24MI'),
    p_ip_address => '190.110.226.69',
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
    p_access_date => to_date('202603131455','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
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
    p_access_date => to_date('202603141403','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603141404','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Credenciales de conexión no válidas');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202603091247','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603111722','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603121640','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603181737','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603071051','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603071052','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
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
    p_access_date => to_date('202603101150','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603101150','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603102348','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603102356','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603121940','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
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
    p_access_date => to_date('202603141938','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603141942','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603171624','YYYYMMDDHH24MI'),
    p_ip_address => '190.110.226.69',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202603171624','YYYYMMDDHH24MI'),
    p_ip_address => '190.110.226.69',
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
    p_access_date => to_date('202603071028','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603111726','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
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
    p_access_date => to_date('202603151700','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603051423','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202603051424','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603052318','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603052318','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603061255','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
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
    p_access_date => to_date('202603171820','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603171820','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603060940','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202603091001','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202603091001','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603091002','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603112326','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603122308','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603130124','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 105,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202603130128','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603131159','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
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
    p_access_date => to_date('202603141938','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202603151730','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603050036','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603111437','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603112320','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603121008','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603141319','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603051009','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603051332','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603110944','YYYYMMDDHH24MI'),
    p_ip_address => '190.110.226.69',
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
    p_access_date => to_date('202603120937','YYYYMMDDHH24MI'),
    p_ip_address => '190.110.226.69',
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
    p_access_date => to_date('202603121337','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603060942','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603061633','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
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
    p_access_date => to_date('202603072157','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603072158','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603091700','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603131929','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603161307','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603171654','YYYYMMDDHH24MI'),
    p_ip_address => '190.110.226.69',
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
    p_access_date => to_date('202603051423','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202603081324','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603120935','YYYYMMDDHH24MI'),
    p_ip_address => '190.110.226.69',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 105,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202603130128','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Credenciales de conexión no válidas');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202603141005','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603171820','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Credenciales de conexión no válidas');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202603051032','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
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
    p_access_date => to_date('202603051311','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603051311','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603051424','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIERC',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202603051424','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603071051','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202603071051','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603101044','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
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
    p_access_date => to_date('202603110009','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603110944','YYYYMMDDHH24MI'),
    p_ip_address => '190.110.226.69',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Credenciales de conexión no válidas');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'CABALLEROA',
    p_auth_method => 'Application Express Accounts',
    p_app => 100,
    p_owner => 'SALOTEX',
    p_access_date => to_date('202603131749','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603141721','YYYYMMDDHH24MI'),
    p_ip_address => '181.124.136.179',
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
    p_access_date => to_date('202603051928','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603090937','YYYYMMDDHH24MI'),
    p_ip_address => '181.120.122.223',
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
    p_access_date => to_date('202603110024','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603110027','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603112319','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603150125','YYYYMMDDHH24MI'),
    p_ip_address => '181.122.101.107',
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
    p_access_date => to_date('202603171157','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603051628','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603062007','YYYYMMDDHH24MI'),
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
    p_access_date => to_date('202603102348','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603122308','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603141404','YYYYMMDDHH24MI'),
    p_ip_address => '186.12.184.26',
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
    p_access_date => to_date('202603171156','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'JAVIER',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202603171156','YYYYMMDDHH24MI'),
    p_ip_address => '181.94.222.243',
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
-- Exported 23:49 Thursday March 19, 2026 by: JAVIER
--
 
--------------------------------------------------------------------
prompt User Interface Defaults, Attribute Dictionary
--
-- Exported 23:49 Thursday March 19, 2026 by: JAVIER
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
