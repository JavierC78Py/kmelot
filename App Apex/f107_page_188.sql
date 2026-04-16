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
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
end;
/
 
prompt APPLICATION 107 - Kmelot
--
-- Application Export:
--   Application:     107
--   Name:            Kmelot
--   Exported By:     JAVIER
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 188
--   Manifest End
--   Version:         24.2.5
--   Instance ID:     8374509199337391
--

begin
null;
end;
/
prompt --application/pages/delete_00188
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>188);
end;
/
prompt --application/pages/page_00188
begin
wwv_flow_imp_page.create_page(
 p_id=>188
,p_name=>'Detalle de Recepcion'
,p_alias=>'DETALLE-RECEPCION-PROD'
,p_step_title=>'Detalle de Recepcion'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function urlVerPDF(){',
'    apex.navigation.openInNewWindow(',
'        apex.server.url( {',
'            p_request: "application_process=ver_pdf",',
'            x01: apex.item("P188_ID_RECEPCION_PROD").getValue()',
'        })',
'    );',
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#template-floating-minimalista#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-contentInner {',
'    padding-top: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900188001)
,p_plug_name=>unistr('Recepci\00F3n &P188_NRO_RECEPCION.')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_RECEPCION_PROD,',
'       NRO_RECEPCION,',
'       ORD_ID_ORDEN_PROD,',
'       FECHA_RECEPCION,',
'       HORA_RECEPCION,',
'       DEP_ID_DEPOSITO,',
'       OBSERVACION,',
'       ESTADO,',
'       USUARIO_REGISTRO,',
'       FECHA_REGISTRO,',
'       FACTURADO',
'  FROM CAB_RECEPCION_PRODUCTO'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900188100)
,p_plug_name=>'Productos recibidos'
,p_region_name=>'REG_DET_RECEPCION'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT  d.id_det_recepcion_prod',
'      , d.rec_id_recepcion_prod',
'      , d.pro_id_producto',
'      , p.descripcion AS nombre_producto',
'      , pt.tamanho',
'      , ot.cantidad AS cantidad_a_producir',
'      , d.cantidad',
'      , d.precio_unitario',
'      , d.opt_id_ord_prod_tam',
'      , d.costo_mano_obra_unit',
'      , (d.cantidad * d.precio_unitario) costo_total',
'FROM det_recepcion_producto d',
'    ,cab_recepcion_producto c',
'    ,producto p',
'    ,cab_orden_produccion cp',
'    ,orden_produccion_tamanho ot',
'    ,receta_produccion_tamanho rp',
'    ,producto_tamanho pt',
'WHERE d.rec_id_recepcion_prod = :P188_ID_RECEPCION_PROD',
'AND p.id_producto = d.pro_id_producto',
'AND c.id_recepcion_prod = d.rec_id_recepcion_prod',
'AND cp.id_orden_prod = c.ord_id_orden_prod',
'AND ot.id_ord_prod_tam = d.opt_id_ord_prod_tam',
'AND rp.id_tamanho_receta = ot.tam_id_tamanho_receta',
'AND pt.id_tamanho = rp.tam_id_tamanho'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P188_ID_RECEPCION_PROD'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P188_ID_RECEPCION_PROD'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_plug_header=>'Productos recibidos'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(150128421863328321)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:190:&SESSION.::&DEBUG.::P190_ID_DET_RECEPCION_PROD:#ID_DET_RECEPCION_PROD#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'JAVIER'
,p_internal_uid=>150128421863328321
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(150128548007328322)
,p_db_column_name=>'ID_DET_RECEPCION_PROD'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Det Recepcion Prod'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(150128665635328323)
,p_db_column_name=>'REC_ID_RECEPCION_PROD'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Rec Id Recepcion Prod'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(150128729415328324)
,p_db_column_name=>'PRO_ID_PRODUCTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Producto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(150128854543328325)
,p_db_column_name=>'NOMBRE_PRODUCTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre producto'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(150128954616328326)
,p_db_column_name=>'TAMANHO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Tama\00F1o')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(150129057932328327)
,p_db_column_name=>'CANTIDAD_A_PRODUCIR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Cantidad a producir'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(150129104206328328)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(150129239068328329)
,p_db_column_name=>'PRECIO_UNITARIO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Precio unitario'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(150129334718328330)
,p_db_column_name=>'OPT_ID_ORD_PROD_TAM'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Opt Id Ord Prod Tam'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(150129488388328331)
,p_db_column_name=>'COSTO_MANO_OBRA_UNIT'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Costo Mano Obra Unit'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(150129558157328332)
,p_db_column_name=>'COSTO_TOTAL'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Costo Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(151972165326610001)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1519722'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DET_RECEPCION_PROD:REC_ID_RECEPCION_PROD:PRO_ID_PRODUCTO:NOMBRE_PRODUCTO:TAMANHO:CANTIDAD_A_PRODUCIR:CANTIDAD:PRECIO_UNITARIO:OPT_ID_ORD_PROD_TAM:COSTO_MANO_OBRA_UNIT:COSTO_TOTAL'
,p_sum_columns_on_break=>'CANTIDAD:CANTIDAD_A_PRODUCIR:COSTO_TOTAL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(900188200)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(206180564029405200)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(150129654547328333)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>30
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900188305)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900188001)
,p_button_name=>'VER_PDF'
,p_button_static_id=>'btn_ver_pdf'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Ver PDF'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'javascript:urlVerPDF();'
,p_button_condition=>':P188_ID_RECEPCION_PROD IS NOT NULL'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900188302)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(900188001)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'CHANGE'
,p_button_condition=>':P188_ID_RECEPCION_PROD IS NOT NULL'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900188301)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(900188001)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:187:&SESSION.::&DEBUG.:::'
,p_button_condition=>'P188_P_ORIGEN'
,p_button_condition2=>'173'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(150129821484328335)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(900188001)
,p_button_name=>'CANCEL_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Retornar'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.::P173_ID_ORDEN_PROD:&P188_ORD_ID_ORDEN_PROD.'
,p_button_condition=>'P188_P_ORIGEN'
,p_button_condition2=>'173'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900188303)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(900188001)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'CREATE'
,p_button_condition=>':P188_ID_RECEPCION_PROD IS NULL'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(900188304)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(900188001)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_condition=>':P188_ID_RECEPCION_PROD IS NOT NULL'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(900188401)
,p_branch_name=>'Go To Page 188 after create'
,p_branch_action=>'f?p=&APP_ID.:188:&SESSION.::&DEBUG.::P188_ID_RECEPCION_PROD,P188_ORD_ID_ORDEN_PROD:&P188_ID_RECEPCION_PROD.,&P188_ORD_ID_ORDEN_PROD.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'CREATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(900188402)
,p_branch_name=>'Go To Page 187 after delete'
,p_branch_action=>'f?p=&APP_ID.:187:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188501)
,p_name=>'P188_ID_RECEPCION_PROD'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_item_source_plug_id=>wwv_flow_imp.id(900188001)
,p_source=>'ID_RECEPCION_PROD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188502)
,p_name=>'P188_ORD_ID_ORDEN_PROD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>12
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_item_source_plug_id=>wwv_flow_imp.id(900188001)
,p_source=>'ORD_ID_ORDEN_PROD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188503)
,p_name=>'P188_NRO_RECEPCION'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_item_source_plug_id=>wwv_flow_imp.id(900188001)
,p_prompt=>'Nro. Recepcion'
,p_source=>'NRO_RECEPCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>20
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188504)
,p_name=>'P188_FECHA_RECEPCION'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_item_source_plug_id=>wwv_flow_imp.id(900188001)
,p_prompt=>'Fecha Recepcion'
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'FECHA_RECEPCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188505)
,p_name=>'P188_HORA_RECEPCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>42
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_item_source_plug_id=>wwv_flow_imp.id(900188001)
,p_prompt=>'Hora'
,p_source=>'HORA_RECEPCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188506)
,p_name=>'P188_DEP_ID_DEPOSITO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>44
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_item_source_plug_id=>wwv_flow_imp.id(900188001)
,p_prompt=>'Deposito'
,p_source=>'DEP_ID_DEPOSITO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_DEPOSITO'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione -'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188507)
,p_name=>'P188_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_item_source_plug_id=>wwv_flow_imp.id(900188001)
,p_prompt=>'Observacion'
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>500
,p_cHeight=>3
,p_colspan=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188508)
,p_name=>'P188_ESTADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_item_source_plug_id=>wwv_flow_imp.id(900188001)
,p_prompt=>'Estado'
,p_source=>'ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188509)
,p_name=>'P188_USUARIO_REGISTRO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>65
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_item_source_plug_id=>wwv_flow_imp.id(900188001)
,p_prompt=>'Usuario'
,p_source=>'USUARIO_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188510)
,p_name=>'P188_FECHA_REGISTRO'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_item_source_plug_id=>wwv_flow_imp.id(900188001)
,p_source=>'FECHA_REGISTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188511)
,p_name=>'P188_FACTURADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>75
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_item_source_plug_id=>wwv_flow_imp.id(900188001)
,p_source=>'FACTURADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188512)
,p_name=>'P188_NRO_ORDEN'
,p_item_sequence=>15
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_prompt=>'Nro Orden Prod.'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188513)
,p_name=>'P188_PRODUCTOR'
,p_item_sequence=>16
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_prompt=>'Productor'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188514)
,p_name=>'P188_PRODUCTO'
,p_item_sequence=>17
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_prompt=>'Producto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188515)
,p_name=>'P188_CANT_A_PRODUCIR'
,p_item_sequence=>18
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_prompt=>'Cant. a Producir'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188516)
,p_name=>'P188_CANT_YA_RECIBIDA'
,p_item_sequence=>19
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_prompt=>'Cant. ya Recibida'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_css_classes=>'apex_disabled'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(900188520)
,p_name=>'P188_LOV_ORDEN_PROD'
,p_item_sequence=>13
,p_item_plug_id=>wwv_flow_imp.id(900188001)
,p_prompt=>'Orden de Produccion'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT op.nro_orden || '' | '' || e.nombre || '' | '' || p.descripcion ||',
'       '' (Pendiente: '' || TO_CHAR(PKG_RECEPCION_PRODUCTO.F_CANTIDAD_PENDIENTE(op.id_orden_prod),''FM999G999G990'') || '')'' d,',
'       op.id_orden_prod r',
'FROM cab_orden_produccion op,',
'     entidad e,',
'     producto p',
'WHERE e.id_entidad = op.ent_id_entidad_productor',
'AND p.id_producto = op.pro_id_producto_fin',
'AND op.estado IN (''PENDIENTE'',''EN_PROCESO'')',
'AND PKG_RECEPCION_PRODUCTO.F_CANTIDAD_PENDIENTE(op.id_orden_prod) > 0',
'ORDER BY op.nro_orden'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Seleccione una Orden de Produccion -'
,p_colspan=>6
,p_display_when=>':P188_ID_RECEPCION_PROD IS NULL AND NVL(:P188_P_ORIGEN,''X'') != ''173'''
,p_display_when2=>'SQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(150129761413328334)
,p_name=>'P188_P_ORIGEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(150129654547328333)
,p_prompt=>'P Origen'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(900188801)
,p_name=>'DA_CARGAR_INFO_OP'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P188_LOV_ORDEN_PROD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(900188802)
,p_event_id=>wwv_flow_imp.id(900188801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_cant_pend NUMBER;',
'BEGIN',
'    IF :P188_LOV_ORDEN_PROD IS NOT NULL THEN',
'        :P188_ORD_ID_ORDEN_PROD := :P188_LOV_ORDEN_PROD;',
'        SELECT op.NRO_ORDEN, e.NOMBRE, p.DESCRIPCION,',
'               op.CANTIDAD_A_PRODUCIR,',
'               PKG_RECEPCION_PRODUCTO.F_CANTIDAD_PENDIENTE(op.ID_ORDEN_PROD),',
'               op.DEP_ID_DEPOSITO_DEST',
'        INTO :P188_NRO_ORDEN, :P188_PRODUCTOR, :P188_PRODUCTO,',
'             :P188_CANT_A_PRODUCIR, v_cant_pend,',
'             :P188_DEP_ID_DEPOSITO',
'        FROM CAB_ORDEN_PRODUCCION op, ENTIDAD e, PRODUCTO p',
'        WHERE op.ID_ORDEN_PROD = :P188_LOV_ORDEN_PROD',
'        AND e.ID_ENTIDAD = op.ENT_ID_ENTIDAD_PRODUCTOR',
'        AND p.ID_PRODUCTO = op.PRO_ID_PRODUCTO_FIN;',
'        :P188_CANT_YA_RECIBIDA := :P188_CANT_A_PRODUCIR - v_cant_pend;',
'    ELSE',
'        :P188_ORD_ID_ORDEN_PROD := NULL;',
'        :P188_NRO_ORDEN := NULL;',
'        :P188_PRODUCTOR := NULL;',
'        :P188_PRODUCTO := NULL;',
'        :P188_CANT_A_PRODUCIR := NULL;',
'        :P188_CANT_YA_RECIBIDA := NULL;',
'        :P188_DEP_ID_DEPOSITO := NULL;',
'    END IF;',
'END;'))
,p_attribute_02=>'P188_LOV_ORDEN_PROD'
,p_attribute_03=>'P188_ORD_ID_ORDEN_PROD,P188_NRO_ORDEN,P188_PRODUCTOR,P188_PRODUCTO,P188_CANT_A_PRODUCIR,P188_CANT_YA_RECIBIDA,P188_DEP_ID_DEPOSITO'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(150130031542328337)
,p_name=>'Refresca al regresar'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(900188001)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(150130112650328338)
,p_event_id=>wwv_flow_imp.id(150130031542328337)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(900188001)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900188611)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(900188001)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form CAB_RECEPCION_PRODUCTO'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'Error al procesar el registro.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Registro procesado correctamente.'
,p_internal_uid=>900188611
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900188601)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(900188001)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form CAB_RECEPCION_PRODUCTO'
,p_internal_uid=>900188601
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900188602)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P188_ID_RECEPCION_PROD IS NULL THEN',
'    :P188_NRO_RECEPCION := ''REC-'' || LPAD(SEQ_NRO_RECEPCION.NEXTVAL, 6, ''0'');',
'    :P188_FECHA_RECEPCION := TO_CHAR(SYSDATE, ''DD-MM-YYYY'');',
'    :P188_HORA_RECEPCION := TO_CHAR(SYSDATE, ''HH24:MI'');',
'    :P188_USUARIO_REGISTRO := NVL(V(''APP_USER''), USER);',
'    :P188_ESTADO := ''ACTIVO'';',
'    :P188_FACTURADO := ''NO'';',
'    -- Pre-cargar deposito desde OP',
'    BEGIN',
'        SELECT DEP_ID_DEPOSITO_DEST',
'        INTO :P188_DEP_ID_DEPOSITO',
'        FROM CAB_ORDEN_PRODUCCION',
'        WHERE ID_ORDEN_PROD = :P188_ORD_ID_ORDEN_PROD;',
'    EXCEPTION WHEN NO_DATA_FOUND THEN NULL;',
'    END;',
'END IF;',
'-- Cargar datos informativos de la OP',
'BEGIN',
'    SELECT op.NRO_ORDEN, e.NOMBRE, p.DESCRIPCION,',
'           op.CANTIDAD_A_PRODUCIR,',
'           PKG_RECEPCION_PRODUCTO.F_CANTIDAD_PENDIENTE(op.ID_ORDEN_PROD)',
'    INTO :P188_NRO_ORDEN, :P188_PRODUCTOR, :P188_PRODUCTO,',
'         :P188_CANT_A_PRODUCIR, :P188_CANT_YA_RECIBIDA',
'    FROM CAB_ORDEN_PRODUCCION op, ENTIDAD e, PRODUCTO p',
'    WHERE op.ID_ORDEN_PROD = NVL(:P188_ORD_ID_ORDEN_PROD,',
'          (SELECT ORD_ID_ORDEN_PROD FROM CAB_RECEPCION_PRODUCTO WHERE ID_RECEPCION_PROD = :P188_ID_RECEPCION_PROD))',
'    AND e.ID_ENTIDAD = op.ENT_ID_ENTIDAD_PRODUCTOR',
'    AND p.ID_PRODUCTO = op.PRO_ID_PRODUCTO_FIN;',
'    ',
'    -- Mostrar cantidad ya recibida (CANTIDAD_A_PRODUCIR - pendiente)',
'    :P188_CANT_YA_RECIBIDA := :P188_CANT_A_PRODUCIR - :P188_CANT_YA_RECIBIDA;',
'EXCEPTION WHEN NO_DATA_FOUND THEN NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900188602
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900188511)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ver_pdf'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  vl_vNomReporte VARCHAR2(255);',
'  vl_empresa parametros.nombre%type;',
'BEGIN',
'    SELECT p.nombre',
'    INTO vl_empresa',
'    FROM parametros p;',
'  vl_vNomReporte := ''RECEPCION_PRODUCTO'';',
'  pkg_jasperreports_server.descarga_reporte(',
'      p_vNomReporte  => vl_vNomReporte',
'     ,p_aNomParams   => apex_util.string_to_table(''P_ID_RECEPCION_PROD:P_USUARIO:P_EMPRESA'')',
'     ,p_aValParams   => apex_util.string_to_table(apex_application.g_x01||'':''||:APP_USER||'':''||vl_empresa)',
'  );',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900188511
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
