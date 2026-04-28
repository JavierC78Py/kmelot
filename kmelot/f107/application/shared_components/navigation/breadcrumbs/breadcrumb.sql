prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(206180564029405200)
,p_name=>'Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(132603421327674299)
,p_short_name=>'Detalle de orden de trabajo'
,p_link=>'f?p=&APP_ID.:179:&SESSION.::&DEBUG.:::'
,p_page_id=>179
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(132611845938628526)
,p_short_name=>'Ordenes de trabajo'
,p_link=>'f?p=&APP_ID.:178:&SESSION.::&DEBUG.:::'
,p_page_id=>178
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(132794046854860386)
,p_short_name=>unistr('Maquinas - torner\00EDa')
,p_link=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:::'
,p_page_id=>180
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(132841511909714171)
,p_short_name=>'Dashboard orden de trabajo'
,p_link=>'f?p=&APP_ID.:182:&SESSION.::&DEBUG.:::'
,p_page_id=>182
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(136601741902033094)
,p_short_name=>'Licitaciones'
,p_link=>'f?p=&APP_ID.:145:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>145
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(136758034893244853)
,p_short_name=>unistr('Adjunto licitaci\00F3n')
,p_link=>'f?p=&APP_ID.:147:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>147
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(137383359059198589)
,p_short_name=>unistr('P\00F3lizas - licitaciones')
,p_link=>'f?p=&APP_ID.:149:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>149
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(140562089543646327)
,p_short_name=>'Detalle de entrega de insumos'
,p_link=>'f?p=&APP_ID.:186:&SESSION.::&DEBUG.:::'
,p_page_id=>186
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(145004403238075010)
,p_short_name=>unistr('Licitaci\00F3n, comisiones')
,p_link=>'f?p=&APP_ID.:154:&SESSION.::&DEBUG.:::'
,p_page_id=>154
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(147191849229483424)
,p_short_name=>'Recepciones de producto terminado'
,p_link=>'f?p=&APP_ID.:187:&SESSION.::&DEBUG.:::'
,p_page_id=>187
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(147208194808407958)
,p_short_name=>unistr('Crear/editar detalle de recepci\00F3n')
,p_link=>'f?p=&APP_ID.:188:&SESSION.::&DEBUG.:::'
,p_page_id=>188
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(154689942213118596)
,p_short_name=>'Factura venta con saldo'
,p_link=>'f?p=&APP_ID.:160:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>160
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(155548453776171294)
,p_short_name=>unistr('Ordenes de producci\00F3n abiertas')
,p_link=>'f?p=&APP_ID.:191:&SESSION.::&DEBUG.:::'
,p_page_id=>191
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(157691924057593680)
,p_short_name=>unistr('Nota de cr\00E9dito - cliente')
,p_link=>'f?p=&APP_ID.:192:&SESSION.::&DEBUG.:::'
,p_page_id=>192
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(157695560205578394)
,p_short_name=>unistr('Nota de cr\00E9dito - cliente &P193_NRO_NCREDITO.')
,p_link=>'f?p=&APP_ID.:193:&SESSION.::&DEBUG.:::'
,p_page_id=>193
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(158773421407665707)
,p_short_name=>unistr('Ingreso a dep\00F3sito')
,p_link=>'f?p=&APP_ID.:162:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>162
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(162169620996878303)
,p_short_name=>unistr('Costeo por licitaci\00F3n')
,p_link=>'f?p=&APP_ID.:166:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>166
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(165487236926280088)
,p_short_name=>'Estado de cuenta'
,p_link=>'f?p=&APP_ID.:138:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>138
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(168768637759931250)
,p_short_name=>unistr('Recetas de producci\00F3n')
,p_link=>'f?p=&APP_ID.:168:&SESSION.::&DEBUG.:::'
,p_page_id=>168
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(168793990491951675)
,p_short_name=>'Detalle de receta'
,p_link=>'f?p=&APP_ID.:170:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>170
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(170375716168723319)
,p_short_name=>unistr('\00D3rdenes de Producci\00F3n')
,p_link=>'f?p=&APP_ID.:169:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>169
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(170411136610772806)
,p_short_name=>unistr('Detalle de orden de producci\00F3n')
,p_link=>'f?p=&APP_ID.:173:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>173
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(171698663205507277)
,p_short_name=>'Nota de Presupuesto'
,p_link=>'f?p=&APP_ID.:195:&SESSION.::&DEBUG.:::'
,p_page_id=>195
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(171700765863496753)
,p_short_name=>'Crear/editar presupuesto'
,p_link=>'f?p=&APP_ID.:196:&SESSION.::&DEBUG.:::'
,p_page_id=>196
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(173178253291442441)
,p_short_name=>'Tipo logo - producto'
,p_link=>'f?p=&APP_ID.:176:&SESSION.::&DEBUG.:::'
,p_page_id=>176
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(185004350482247746)
,p_short_name=>'Conversaciones bot'
,p_link=>'f?p=&APP_ID.:143:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>143
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(198116822852108735)
,p_short_name=>'Platilla de mensaje'
,p_link=>'f?p=&APP_ID.:141:&SESSION.::&DEBUG.:::'
,p_page_id=>141
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(201466951435890059)
,p_short_name=>'Departamento'
,p_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:::'
,p_page_id=>36
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(201473490529024371)
,p_short_name=>'Periodo'
,p_link=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:::'
,p_page_id=>44
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(203945993679960455)
,p_short_name=>'Colaborador'
,p_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:::'
,p_page_id=>34
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(203947239175960459)
,p_parent_id=>wwv_flow_imp.id(203945993679960455)
,p_short_name=>'Detalle de colaborador'
,p_link=>'f?p=&APP_ID.:35:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>35
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(203978454644058387)
,p_short_name=>unistr('Secci\00F3n')
,p_link=>'f?p=&APP_ID.:38:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>38
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(203979663316058388)
,p_parent_id=>wwv_flow_imp.id(203978454644058387)
,p_short_name=>unistr('Detalle de secci\00F3n')
,p_link=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:::'
,p_page_id=>39
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(204007928912255958)
,p_short_name=>'Jefatura'
,p_link=>'f?p=&APP_ID.:40:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>40
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(204009107054255959)
,p_parent_id=>wwv_flow_imp.id(204007928912255958)
,p_short_name=>'Detalle de Jefatura'
,p_link=>'f?p=&APP_ID.:41:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>41
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(204077188956138158)
,p_short_name=>'Solicitud de vacaciones'
,p_link=>'f?p=&APP_ID.:42:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>42
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(204078403581138159)
,p_parent_id=>wwv_flow_imp.id(204077188956138158)
,p_short_name=>'Detalle de solicitud'
,p_link=>'f?p=&APP_ID.:43:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>43
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(204152445135258161)
,p_short_name=>'Vacaciones Disponibles'
,p_link=>'f?p=&APP_ID.:32:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>32
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(204153674121258165)
,p_parent_id=>wwv_flow_imp.id(204152445135258161)
,p_short_name=>'Detalle de vacaciones disponibles'
,p_link=>'f?p=&APP_ID.:33:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>33
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(204344300046521572)
,p_short_name=>'Roles de usuario'
,p_link=>'f?p=&APP_ID.:49:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>49
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(204370024081207872)
,p_short_name=>'Factura compra'
,p_link=>'f?p=&APP_ID.:58:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>58
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(205232357295862829)
,p_short_name=>'Transacciones'
,p_link=>'f?p=&APP_ID.:88:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>88
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(206079236906517932)
,p_short_name=>'Control gastos'
,p_link=>'f?p=&APP_ID.:55:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>55
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(206113169563304472)
,p_short_name=>unistr('Puntos de expedici\00F3n')
,p_link=>'f?p=&APP_ID.:63:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>63
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(206150587442701050)
,p_short_name=>unistr('Asignaci\00F3n puntos de expedici\00F3n')
,p_link=>'f?p=&APP_ID.:65:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>65
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(206180711237405205)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(206251027138622543)
,p_short_name=>'Factura venta'
,p_link=>'f?p=&APP_ID.:67:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>67
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(206252237577622545)
,p_parent_id=>wwv_flow_imp.id(206251027138622543)
,p_short_name=>'Crear/editar factura venta'
,p_link=>'f?p=&APP_ID.:68:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>68
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(206460430504406979)
,p_short_name=>unistr('Administraci\00F3n')
,p_link=>'f?p=&APP_ID.:10000:&SESSION.::&DEBUG.:::'
,p_page_id=>10000
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(206616740903498921)
,p_short_name=>'Categorias de gasto'
,p_link=>'f?p=&APP_ID.:56:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>56
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(206771434336203829)
,p_short_name=>unistr('Hist\00F3rico de precios de venta')
,p_link=>'f?p=&APP_ID.:69:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>69
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(207249579026854487)
,p_short_name=>'Instancias  WhatsApp'
,p_link=>'f?p=&APP_ID.:98:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>98
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(207955273508483716)
,p_short_name=>'Movimiento de producto'
,p_link=>'f?p=&APP_ID.:72:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>72
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(207984978719198366)
,p_short_name=>unistr('Movimiento producto dep\00F3sito')
,p_link=>'f?p=&APP_ID.:73:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>73
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(208277099067612524)
,p_short_name=>'Banco'
,p_link=>'f?p=&APP_ID.:75:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>75
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(208297436825711892)
,p_short_name=>'Emisor de tarjeta'
,p_link=>'f?p=&APP_ID.:77:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>77
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(208320222271819039)
,p_short_name=>'Forma de pago'
,p_link=>'f?p=&APP_ID.:79:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>79
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(208344337535047229)
,p_short_name=>unistr('Rendici\00F3n de caja')
,p_link=>'f?p=&APP_ID.:81:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>81
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(208420919818525702)
,p_short_name=>'Cobro factura'
,p_link=>'f?p=&APP_ID.:83:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>83
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(208540596658301198)
,p_short_name=>'Porcentajes de I.V.A.'
,p_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::'
,p_page_id=>8
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(208541717942301208)
,p_parent_id=>wwv_flow_imp.id(208540596658301198)
,p_short_name=>'Crear o Editar IVA'
,p_link=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(208549597383534813)
,p_short_name=>'Monedas'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(208550295539592338)
,p_parent_id=>wwv_flow_imp.id(208549597383534813)
,p_short_name=>'Crear o editar moneda'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(208552015520729621)
,p_short_name=>'Sucursales'
,p_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_page_id=>4
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(208552939147044095)
,p_parent_id=>wwv_flow_imp.id(208552015520729621)
,p_short_name=>'Crear o Editar Sucursal'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(208553165516104606)
,p_short_name=>unistr('Dep\00F3sitos')
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(208554211797126439)
,p_parent_id=>wwv_flow_imp.id(208553165516104606)
,p_short_name=>unistr('Crear o Editar Dep\00F3sito')
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209429940949801787)
,p_short_name=>'Centros de costo'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209431154152801794)
,p_parent_id=>wwv_flow_imp.id(209429940949801787)
,p_short_name=>'Crear o Editar Centro de Costo'
,p_link=>'f?p=&APP_ID.:11:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209478547803313451)
,p_short_name=>unistr('Entidades F\00EDsicas y Jur\00EDdicas')
,p_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
,p_page_id=>14
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209479671608313459)
,p_parent_id=>wwv_flow_imp.id(209478547803313451)
,p_short_name=>'Crear o Editar Entidad'
,p_link=>'f?p=&APP_ID.:15:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>15
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209502585844542150)
,p_short_name=>'Tipos de documentos'
,p_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:::'
,p_page_id=>16
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209503606154542159)
,p_parent_id=>wwv_flow_imp.id(209502585844542150)
,p_short_name=>'Crear o Editar Tipo de Documento'
,p_link=>'f?p=&APP_ID.:17:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>17
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209521703745665054)
,p_short_name=>'Grupo de producto'
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209540950093755717)
,p_short_name=>'Marcas'
,p_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::'
,p_page_id=>20
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209542109864755719)
,p_parent_id=>wwv_flow_imp.id(209540950093755717)
,p_short_name=>'Crear o Editar Marca'
,p_link=>'f?p=&APP_ID.:21:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>21
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209556236611804535)
,p_short_name=>'Origen del producto'
,p_link=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:::'
,p_page_id=>22
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209557473100804538)
,p_parent_id=>wwv_flow_imp.id(209556236611804535)
,p_short_name=>'Crear o Editar Origen Producto'
,p_link=>'f?p=&APP_ID.:23:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>23
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209571891115849113)
,p_short_name=>'Tipos de comprobantes'
,p_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_page_id=>24
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209573015461849115)
,p_parent_id=>wwv_flow_imp.id(209571891115849113)
,p_short_name=>'Crear o Editar Tipo Comprobante'
,p_link=>'f?p=&APP_ID.:25:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>25
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209587468135888825)
,p_short_name=>'Unidades de medida'
,p_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:::'
,p_page_id=>26
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209588698352888827)
,p_parent_id=>wwv_flow_imp.id(209587468135888825)
,p_short_name=>'Crear o Editar Unidad de Medida'
,p_link=>'f?p=&APP_ID.:27:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>27
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209645593904108191)
,p_short_name=>'Productos'
,p_link=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_page_id=>30
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(209646796121108193)
,p_parent_id=>wwv_flow_imp.id(209645593904108191)
,p_short_name=>'Crear o Editar Producto'
,p_link=>'f?p=&APP_ID.:31:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>31
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(211354991970428465)
,p_short_name=>'Pago factura'
,p_link=>'f?p=&APP_ID.:86:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>86
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(214431001110128835)
,p_short_name=>'Grupo mensaje'
,p_link=>'f?p=&APP_ID.:89:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>89
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(217999652849230921)
,p_short_name=>'Pedido de venta'
,p_link=>'f?p=&APP_ID.:94:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>94
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(218343415488762395)
,p_short_name=>unistr('Bot WhatsApp - Flujo de Conversaci\00F3n')
,p_link=>'f?p=&APP_ID.:102:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>102
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(218357458079749641)
,p_parent_id=>wwv_flow_imp.id(218343415488762395)
,p_short_name=>unistr('Crear&#x2F;editar flujo de conversaci\00F3n')
,p_link=>'f?p=&APP_ID.:103:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>103
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(218380138642430315)
,p_short_name=>'Tabla de descuento en venta'
,p_link=>'f?p=&APP_ID.:96:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>96
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(220264740525010337)
,p_short_name=>'Chats'
,p_link=>'f?p=&APP_ID.:105:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>105
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(230272210955282124)
,p_short_name=>'Solicitudes a TI'
,p_link=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:::'
,p_page_id=>107
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(230337614456060408)
,p_short_name=>'Area TI'
,p_link=>'f?p=&APP_ID.:108:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>108
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(231290146461442936)
,p_short_name=>'Nivel pedido TI'
,p_link=>'f?p=&APP_ID.:114:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>114
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(231398552824335703)
,p_short_name=>'Estado tarea TI'
,p_link=>'f?p=&APP_ID.:116:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>116
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(231644682602501679)
,p_short_name=>'Solicitudes a TI'
,p_link=>'f?p=&APP_ID.:99:&SESSION.::&DEBUG.:::'
,p_page_id=>99
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(231686838896881882)
,p_short_name=>unistr('Bit\00E1cora de solicitudes')
,p_link=>'f?p=&APP_ID.:118:&SESSION.::&DEBUG.:::'
,p_page_id=>118
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(242766201796890910)
,p_short_name=>'Disponibilidad'
,p_link=>'f?p=&APP_ID.:119:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>119
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(251788825918353295)
,p_short_name=>'Especialidad'
,p_link=>'f?p=&APP_ID.:123:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>123
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(251844504423558020)
,p_short_name=>'Especialidad por prestador'
,p_link=>'f?p=&APP_ID.:125:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>125
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(252074840172803855)
,p_short_name=>'Paciente'
,p_link=>'f?p=&APP_ID.:127:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>127
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(253281474119825060)
,p_short_name=>'Servicios'
,p_link=>'f?p=&APP_ID.:130:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>130
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(253488642081158371)
,p_short_name=>'Grupo de servicio'
,p_link=>'f?p=&APP_ID.:132:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>132
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(253636288580900871)
,p_short_name=>'Precio de servicio'
,p_link=>'f?p=&APP_ID.:134:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>134
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(253709963337456161)
,p_short_name=>'Parametro reserva'
,p_link=>'f?p=&APP_ID.:136:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>136
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(253920378274484241)
,p_short_name=>'Reserva (consulta)'
,p_link=>'f?p=&APP_ID.:139:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>139
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(254057855641796976)
,p_short_name=>'Consultas - reservas'
,p_link=>'f?p=&APP_ID.:140:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>140
);
wwv_flow_imp.component_end;
end;
/
