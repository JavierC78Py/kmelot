--------------------------------------------------------------------------------
-- Name: Kmelot
-- Copyright (c) 2021, 2026, Kmelot.
--------------------------------------------------------------------------------
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
,p_release=>'24.2.13'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
end;
/
 
prompt APPLICATION 100 - Kmelot
--
-- Application Export:
--   Application:     100
--   Name:            Kmelot
--   Exported By:     JAVIER
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 163
--   Manifest End
--   Version:         24.2.13
--   Instance ID:     8131532866458080
--

begin
null;
end;
/
prompt --application/pages/delete_00163
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>163);
end;
/
prompt --application/pages/page_00163
begin
wwv_flow_imp_page.create_page(
 p_id=>163
,p_name=>'Crear/Editar ingreso'
,p_alias=>'CREAR-EDITAR-INGRESO'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear/Editar ingreso'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#mascara_fecha#MIN#.js',
'#APP_FILES#mascara_fecha_hora#MIN#.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function($) {',
'    /**',
unistr('     * Parsea un valor num\00E9rico de un string, considerando separadores de miles ''.'' y decimales '',''.'),
'     * @param {string|number|null|undefined} value El valor a parsear.',
unistr('     * @returns {number} El n\00FAmero parseado o 0 si el valor es inv\00E1lido.'),
'     */',
'    function parseCurrency(value) {',
'        console.log(''antes ''+value);',
'        if (value === null || value === undefined) {',
'            return 0;',
'        }',
'        let strValue = String(value);',
'        if (typeof strValue === ''string'') {',
'            strValue = strValue.replace(/\./g, '''').replace('','', ''.'');',
'        }',
'        const num = parseFloat(strValue);',
'        console.log(''despues ''+num);',
'        return isNaN(num) ? 0 : num;',
'    }',
'    function update(model) {',
'        const montoKey = model.getFieldKey("MONTO");',
'        let total = 0;',
'        console.log(">> starting sum MONTO column");',
'        model.forEach(function(record, index, id) {',
'            const meta = model.getRecordMetadata(id);',
'            if (!meta.deleted && !meta.agg) {',
'                const monto = parseCurrency(record[montoKey]);',
'                total += monto;',
'            }',
'        });',
'        const format = (num) => num.toFixed(0);',
'        console.log(`>> setting total - TOTAL: ${format(total)}`);',
'        try {',
'            $s("P163_MONTO", format(total));',
'        } catch (e) {',
'            console.error("Error al actualizar items:", e);',
'        }',
'    }',
'    $(function() {',
'        $("#GRID_DETALLE").on("interactivegridviewmodelcreate", function(event, ui) {',
'            const model = ui.model;',
'            if (ui.viewId === "grid") {',
'                model.subscribe({',
'                    onChange: function(type, change) {',
'                        console.log(">> model changed ", type, change);',
'                        if (type === "set") {',
'                            if (change.field === "MONTO") {',
'                                update(model);',
'                            }',
'                        } else if (type !== "move" && type !== "metaChange") {',
'                            update(model);',
'                        }',
'                    },',
'                    progressView: $("#P163_MONTO")',
'                });',
'                update(model);',
'                model.fetchAll(function() {});',
'            }',
'        });',
'    });',
'})(apex.jQuery);'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!apex.item("P163_ID_AJUSTE").isEmpty()) {',
'    $("#P163_SUC_ID_SUCURSAL").addClass("apex_disabled");',
'    $("#P163_SUC_ID_SUCURSAL").attr("tabindex", "-1");',
'    $("#P163_FECHA_AJUSTE").addClass("apex_disabled");',
'    $("#P163_FECHA_AJUSTE").attr("tabindex", "-1");',
'    $("#P163_MON_ID_MONEDA").addClass("apex_disabled");',
'    $("#P163_MON_ID_MONEDA").attr("tabindex", "-1");',
'    $("#P163_TIPO_CAMBIO").addClass("apex_disabled");',
'    $("#P163_TIPO_CAMBIO").attr("tabindex", "-1");',
'    if (apex.item("P163_ESTADO").getValue() == ''ANULADO'') {',
'        $("#P163_OBSERVACION").addClass("apex_disabled");',
'        $("#P163_OBSERVACION").attr("tabindex", "-1");',
'        $("#P163_ESTADO").addClass("apex_disabled");',
'        $("#P163_ESTADO").attr("tabindex", "-1");',
'    }',
'} else {',
'    setTimeout(function(){',
'        apex.item("P163_SUC_ID_SUCURSAL").setFocus();',
'    },500);',
'}',
'$("#P163_MONTO").addClass("apex_disabled");',
'$("#P163_MONTO").attr("tabindex", "-1");',
'mascaraFechaHoraRegex("#P163_FECHA_AJUSTE");',
''))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#btn_agregar_entidad,#btn_calcular, #btn_regresar, #BTN_VER_CUOTAS {    ',
'    margin-top: 17px;',
'    }',
'',
'.text-dark {',
'    color:rgb(107, 100, 100) !important;',
'    opacity: 1 !important;',
'}',
'',
'.aling_derecha {',
'    text-align: right;',
'}',
'',
'#P59_SUC_ID_SUCURSAL {',
'    background-color: rgb(190, 190, 190);',
'    color :rgb(0, 0, 0);',
'    text-align: center;',
'}',
'',
'#P59_ENT_ID_ENTIDAD,',
'#P59_CONDICION_COMPRA,',
'#P59_TIMBRADO_input,',
'#P59_VTO_TIMBRADO_input,',
'#P59_NRO_FACTURA',
'{',
'    background-color: rgb(240, 215, 102) !important;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_required_role=>wwv_flow_imp.id(40151891609312239)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(75013823661710096)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>50
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(124654028304565745)
,p_plug_name=>'Crear/Editar ingreso'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT id_ajuste',
'     , fecha_ajuste',
'     , suc_id_sucursal',
'     , mon_id_moneda',
'     , tipo_cambio',
'     , monto',
'     , observacion',
'     , estado',
'     , usuario_registro',
'     , fecha_registro ',
'FROM cab_ajuste_inventario',
''))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(124665023910565778)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(126325729516370515)
,p_plug_name=>'Detalle de ingreso'
,p_region_name=>'GRID_DETALLE'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_DETALLE_AJUSTE',
'      ,PRO_ID_PRODUCTO',
'      ,DESCRIPCION',
'      ,UNI_ID_UNIDAD_MEDIDA',
'      ,PRECIO_UNITARIO',
'      ,CANTIDAD',
'      ,MONTO',
'      ,LOTE',
'      ,VENCIMIENTO',
'      ,CEN_ID_CENTRO_COSTO',
'      ,DEP_ID_DEPOSITO',
'      ,AJU_ID_AJUSTE',
'FROM det_ajuste_inventario',
'WHERE aju_id_ajuste = :P163_ID_AJUSTE'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P163_ID_AJUSTE'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P163_ESTADO'
,p_plug_read_only_when2=>'ANULADO'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(39624729421563015)
,p_name=>'ID_DETALLE_AJUSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DETALLE_AJUSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>unistr('Licitaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164:P164_P_ID_DETALLE_AJUSTE,P164_ID_UNIDAD_MEDIDA,P164_ID_PRODUCTO,P164_P_PRECIO,P164_CANTIDAD:&ID_DETALLE_AJUSTE.,&UNI_ID_UNIDAD_MEDIDA.,&PRO_ID_PRODUCTO.,\&PRECIO_UNITARIO.\,\&CANTIDAD.\'
,p_link_text=>'<span class="t-Icon fa fa-ai" aria-hidden="true"></span><span class="t-Button-label">Afectar</span>'
,p_link_attributes=>'class="t-Button t-Button--icon t-Button--small t-Button--iconLeft"'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_condition=>'P163_ESTADO'
,p_display_condition2=>'ANULADO'
,p_escape_on_http_output=>false
,p_security_scheme=>wwv_flow_imp.id(40161789611524189)
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(39624802216563016)
,p_name=>'MONTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MONTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Monto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_static_id=>'MONTO'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(39626964847563037)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(39627091517563038)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'Y',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(39627941977563047)
,p_name=>'AJU_ID_AJUSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AJU_ID_AJUSTE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(126326307545370521)
,p_name=>'PRO_ID_PRODUCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRO_ID_PRODUCTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Producto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '600',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '900')).to_clob
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(87561607060077175)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'Seleccione'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'UPPER'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(126326450688370522)
,p_name=>'DESCRIPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPCION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>400
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(126326642928370524)
,p_name=>'UNI_ID_UNIDAD_MEDIDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNI_ID_UNIDAD_MEDIDA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Unidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(38351932844884456)
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(126326677914370525)
,p_name=>'PRECIO_UNITARIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRECIO_UNITARIO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Precio unitario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>true
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(126326819819370526)
,p_name=>'CANTIDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>true
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(126327452390370532)
,p_name=>'LOTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOTE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(126327480522370533)
,p_name=>'VENCIMIENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VENCIMIENTO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'N',
  'use_defaults', 'N')).to_clob
,p_format_mask=>'DD-MM-YYYY'
,p_is_required=>false
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(126327753822370535)
,p_name=>'CEN_ID_CENTRO_COSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CEN_ID_CENTRO_COSTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Centro de costo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(85708386146458860)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'APP_CENTRO_COSTO'
,p_display_condition2=>'SI'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(126328028843370538)
,p_name=>'DEP_ID_DEPOSITO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEP_ID_DEPOSITO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>unistr('Dep\00F3sito')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d.descripcion d, id_deposito r',
'FROM deposito d',
'WHERE d.suc_id_sucursal = :APP_ID_SUCURSAL;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(126325852367370516)
,p_internal_uid=>126325852367370516
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_add_authorization_scheme=>wwv_flow_imp.id(40152241106315467)
,p_update_authorization_scheme=>wwv_flow_imp.id(40152071960314180)
,p_delete_authorization_scheme=>wwv_flow_imp.id(40152428406316745)
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No se encuentran registros.'
,p_show_toolbar=>true
,p_toolbar_buttons=>'SAVE'
,p_enable_save_public_report=>true
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>true
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(126332457502414080)
,p_interactive_grid_id=>wwv_flow_imp.id(126325852367370516)
,p_static_id=>'130580'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(126332568131414081)
,p_report_id=>wwv_flow_imp.id(126332457502414080)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(39774953465801016)
,p_view_id=>wwv_flow_imp.id(126332568131414081)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(39624729421563015)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(39775856040801019)
,p_view_id=>wwv_flow_imp.id(126332568131414081)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(39624802216563016)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(39987766060638594)
,p_view_id=>wwv_flow_imp.id(126332568131414081)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(39626964847563037)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(40012617450874108)
,p_view_id=>wwv_flow_imp.id(126332568131414081)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(39627941977563047)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(126336247331414094)
,p_view_id=>wwv_flow_imp.id(126332568131414081)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(126326307545370521)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>241
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(126337143633414096)
,p_view_id=>wwv_flow_imp.id(126332568131414081)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(126326450688370522)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(126338931140414100)
,p_view_id=>wwv_flow_imp.id(126332568131414081)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(126326642928370524)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(126339858098414102)
,p_view_id=>wwv_flow_imp.id(126332568131414081)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(126326677914370525)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(126340763915414105)
,p_view_id=>wwv_flow_imp.id(126332568131414081)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(126326819819370526)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(126346142800414118)
,p_view_id=>wwv_flow_imp.id(126332568131414081)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(126327452390370532)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(126347036362414120)
,p_view_id=>wwv_flow_imp.id(126332568131414081)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(126327480522370533)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(126348774247414124)
,p_view_id=>wwv_flow_imp.id(126332568131414081)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(126327753822370535)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(126351475823414132)
,p_view_id=>wwv_flow_imp.id(126332568131414081)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(126328028843370538)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39574133374014111)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_condition=>'P163_ESTADO'
,p_button_condition2=>'ANULADO'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
,p_security_scheme=>wwv_flow_imp.id(40152071960314180)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39573316690014110)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(124665023910565778)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39573772583014111)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(124665023910565778)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P163_ID_AJUSTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(40152428406316745)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39574962594014111)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(124665023910565778)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P163_ID_AJUSTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(40152241106315467)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39623907261563007)
,p_name=>'P163_ID_AJUSTE'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_item_source_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_prompt=>'Id ajuste'
,p_source=>'ID_AJUSTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>1
,p_read_only_when=>'P163_ID_AJUSTE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39624015052563008)
,p_name=>'P163_FECHA_AJUSTE'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_item_source_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_prompt=>'Fecha/hora ajuste'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_source=>'FECHA_AJUSTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>16
,p_cMaxlength=>16
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_on', 'IMAGE',
  'show_time', 'Y',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39624143386563009)
,p_name=>'P163_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_item_source_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>500
,p_cHeight=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39624244264563010)
,p_name=>'P163_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_item_source_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_item_default=>'ACTIVO'
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:ACTIVO;ACTIVO,ANULADO;ANULADO'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39627637422563044)
,p_name=>'P163_P_ID_AJUSTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(75013823661710096)
,p_prompt=>'P Id Ajuste'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(124659967823565775)
,p_name=>'P163_MON_ID_MONEDA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_item_source_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_prompt=>'Moneda'
,p_source=>'MON_ID_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MONEDA'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'text-dark'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(124660325501565775)
,p_name=>'P163_TIPO_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_item_source_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_prompt=>'Cambio'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'TIPO_CAMBIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>1609121967514267634
,p_item_css_classes=>'aling_derecha'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(124660736545565775)
,p_name=>'P163_MONTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_item_source_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_prompt=>'Monto'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'MONTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(124661555800565776)
,p_name=>'P163_USUARIO_REGISTRO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_item_source_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_prompt=>unistr('Usuario registr\00F3')
,p_source=>'USUARIO_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>80
,p_colspan=>2
,p_display_when=>'P163_ID_AJUSTE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'is-readonly apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(124661918611565776)
,p_name=>'P163_FECHA_REGISTRO'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_item_source_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_prompt=>unistr('Fecha registr\00F3')
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'FECHA_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P163_ID_AJUSTE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'is-readonly apex_disabled text-dark'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126663151592415514)
,p_name=>'P163_SUC_ID_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_item_source_plug_id=>wwv_flow_imp.id(124654028304565745)
,p_item_default=>'APP_ID_SUCURSAL'
,p_item_default_type=>'ITEM'
,p_prompt=>'Sucursal'
,p_source=>'SUC_ID_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SUCURSAL_ENTIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.id_suc_entidad AS r',
'      ,s.descripcion AS d',
'FROM sucursal_entidad s',
'WHERE s.ent_id_entidad = :APP_ID_ENTIDAD',
'AND s.estado = ''ACTIVO''',
''))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(39583965452014125)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(39573316690014110)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39584448690014125)
,p_event_id=>wwv_flow_imp.id(39583965452014125)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(39585739227014126)
,p_name=>'Buscar cambio'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P163_MON_ID_MONEDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P163_ID_AJUSTE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39586212467014126)
,p_event_id=>wwv_flow_imp.id(39585739227014126)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_compra moneda.tc_compra%type;',
'    v_venta  moneda.tc_venta%type;',
'    v_fecha  date := trunc(to_date(:P163_FECHA_AJUSTE,''dd-mm-yyyy hh24:mi''));',
'begin ',
'    p_devuelve_tipo_cambio ( P_FECHA => v_fecha',
'                            ,P_ID_MONEDA => :P163_MON_ID_MONEDA',
'                            ,P_COMPRA => v_compra',
'                            ,P_VENTA => v_venta',
'    );',
'    :P163_TIPO_CAMBIO := v_venta;',
'end;'))
,p_attribute_02=>'P163_FECHA_AJUSTE,P163_MON_ID_MONEDA'
,p_attribute_03=>'P163_TIPO_CAMBIO'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'ITEM_IS_NULL'
,p_server_condition_expr1=>'P163_ID_AJUSTE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(39595437606014130)
,p_name=>'Habilita set focus a grilla'
,p_event_sequence=>140
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39595970932014130)
,p_event_id=>wwv_flow_imp.id(39595437606014130)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var ig$ = apex.region("GRID_DETALLE").widget();',
'ig$.interactiveGrid("getActions").set("edit", true);',
'var grid$ = ig$.interactiveGrid("getViews").grid.view$;',
'grid$.on("gridmodechange", function(event, ui) {',
'    if ( !ui.editMode ) {',
'        setTimeout(function() {',
'            if ( grid$.find(".a-GV-cell.is-focused").trigger("dblclick").length === 0) {',
'            ig$.interactiveGrid("getActions").set("edit", true);',
'            }',
'        }, 100);',
'    }',
'});',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(39624369955563011)
,p_name=>'Buscar TC'
,p_event_sequence=>300
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P163_FECHA_AJUSTE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39624473527563012)
,p_event_id=>wwv_flow_imp.id(39624369955563011)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT p.id_moneda_principal',
'    INTO :P163_MON_ID_MONEDA',
'    FROM parametros p',
'    FETCH FIRST 1 ROW ONLY;',
'END;'))
,p_attribute_03=>'P163_MON_ID_MONEDA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(39627278673563040)
,p_name=>'Monto'
,p_event_sequence=>320
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(126325729516370515)
,p_triggering_element=>'PRECIO_UNITARIO,CANTIDAD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39627354961563041)
,p_event_id=>wwv_flow_imp.id(39627278673563040)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#MONTO").removeAttr(''readonly'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39627556089563043)
,p_event_id=>wwv_flow_imp.id(39627278673563040)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':MONTO := TO_NUMBER(:PRECIO_UNITARIO,''999g999g999d99'') * TO_NUMBER(:CANTIDAD,''999g999g999d99'');'
,p_attribute_02=>'PRECIO_UNITARIO,CANTIDAD'
,p_attribute_03=>'MONTO'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39627416123563042)
,p_event_id=>wwv_flow_imp.id(39627278673563040)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#MONTO").attr(''readonly'',''readonly'');'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(40144714662956603)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(124654028304565745)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Updarw'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(39574133374014111)
,p_internal_uid=>40144714662956603
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(39583193715014125)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar ajuste'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_inventario.p_crea_entrada(',
'    pi_fecha_ajuste => :P163_FECHA_AJUSTE',
'  , pi_suc_id_sucursal => :P163_SUC_ID_SUCURSAL',
'  , pi_mon_id_moneda => :P163_MON_ID_MONEDA',
'  , pi_tipo_cambio => :P163_TIPO_CAMBIO',
'  , pi_observacion => :P163_OBSERVACION',
'  , po_id_ajuste => :P163_P_ID_AJUSTE);',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(39574962594014111)
,p_process_success_message=>'Guardado...'
,p_internal_uid=>39583193715014125
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(39627822903563046)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(126325729516370515)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Set pk'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    case :APEX$ROW_STATUS',
'    when ''C'' then',
'        :AJU_ID_AJUSTE := :P163_P_ID_AJUSTE;',
'    when ''U'' then',
'        NULL;',
'    when ''D'' then',
'        NULL;',
'    end case;',
'end;'))
,p_attribute_05=>'N'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>39627822903563046
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(39627130250563039)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(126325729516370515)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Detalle de ingreso - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>39627130250563039
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(39582383554014124)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>39582383554014124
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(39552931901014084)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(124654028304565745)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Crear/Editar factura compra'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>39552931901014084
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(39582725387014125)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Iniciar coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_collection.create_or_truncate_collection(p_collection_name => ''COLL_DETALLE_PAGOS'');',
'apex_collection.create_or_truncate_collection(p_collection_name => ''COLL_DETALLE'');',
'IF :P163_ID_AJUSTE IS NOT NULL THEN',
'    :P163_P_ID_AJUSTE := :P163_ID_AJUSTE;',
'ELSE',
'    :P163_FECHA_AJUSTE := TO_CHAR(CURRENT_DATE,''DD-MM-YYYY HH24:MI'');',
'    :P163_FECHA_REGISTRO := :P163_FECHA_AJUSTE;    ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>39582725387014125
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
