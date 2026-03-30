prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(86947038457749062)
,p_name=>'Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(17368216330376956)
,p_short_name=>'Licitaciones'
,p_link=>'f?p=&APP_ID.:145:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>145
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(17524509321588715)
,p_short_name=>unistr('Adjunto licitaci\00F3n')
,p_link=>'f?p=&APP_ID.:147:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>147
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(18149833487542451)
,p_short_name=>unistr('P\00F3lizas - licitaciones')
,p_link=>'f?p=&APP_ID.:149:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>149
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(25770877666418872)
,p_short_name=>unistr('Licitaci\00F3n, comisiones')
,p_link=>'f?p=&APP_ID.:154:&SESSION.::&DEBUG.:::'
,p_page_id=>154
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35456416641462458)
,p_short_name=>'Factura venta con saldo'
,p_link=>'f?p=&APP_ID.:160:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>160
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(39539895836009569)
,p_short_name=>unistr('Ingreso a dep\00F3sito')
,p_link=>'f?p=&APP_ID.:162:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>162
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(42936095425222165)
,p_short_name=>unistr('Costeo por licitaci\00F3n')
,p_link=>'f?p=&APP_ID.:166:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>166
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(46253711354623950)
,p_short_name=>'Estado de cuenta'
,p_link=>'f?p=&APP_ID.:138:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>138
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(49535112188275112)
,p_short_name=>unistr('Recetas de Producci\00F3n')
,p_link=>'f?p=&APP_ID.:168:&SESSION.::&DEBUG.:::'
,p_page_id=>168
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(49560464920295537)
,p_short_name=>'Detalle de receta'
,p_link=>'f?p=&APP_ID.:170:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>170
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(51142190597067181)
,p_short_name=>unistr('\00D3rdenes de Producci\00F3n')
,p_link=>'f?p=&APP_ID.:169:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>169
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(51177611039116668)
,p_short_name=>unistr('Detalle de orden de producci\00F3n')
,p_link=>'f?p=&APP_ID.:173:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>173
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(65770824910591608)
,p_short_name=>'Conversaciones bot'
,p_link=>'f?p=&APP_ID.:143:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>143
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(78883297280452597)
,p_short_name=>'Platilla de mensaje'
,p_link=>'f?p=&APP_ID.:141:&SESSION.::&DEBUG.:::'
,p_page_id=>141
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(82233425864233921)
,p_short_name=>'Departamento'
,p_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:::'
,p_page_id=>36
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(82239964957368233)
,p_short_name=>'Periodo'
,p_link=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:::'
,p_page_id=>44
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(84712468108304317)
,p_short_name=>'Colaborador'
,p_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:::'
,p_page_id=>34
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(84713713604304321)
,p_parent_id=>wwv_flow_imp.id(84712468108304317)
,p_short_name=>'Detalle de colaborador'
,p_link=>'f?p=&APP_ID.:35:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>35
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(84744929072402249)
,p_short_name=>unistr('Secci\00F3n')
,p_link=>'f?p=&APP_ID.:38:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>38
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(84746137744402250)
,p_parent_id=>wwv_flow_imp.id(84744929072402249)
,p_short_name=>unistr('Detalle de secci\00F3n')
,p_link=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:::'
,p_page_id=>39
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(84774403340599820)
,p_short_name=>'Jefatura'
,p_link=>'f?p=&APP_ID.:40:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>40
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(84775581482599821)
,p_parent_id=>wwv_flow_imp.id(84774403340599820)
,p_short_name=>'Detalle de Jefatura'
,p_link=>'f?p=&APP_ID.:41:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>41
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(84843663384482020)
,p_short_name=>'Solicitud de vacaciones'
,p_link=>'f?p=&APP_ID.:42:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>42
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(84844878009482021)
,p_parent_id=>wwv_flow_imp.id(84843663384482020)
,p_short_name=>'Detalle de solicitud'
,p_link=>'f?p=&APP_ID.:43:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>43
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(84918919563602023)
,p_short_name=>'Vacaciones Disponibles'
,p_link=>'f?p=&APP_ID.:32:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>32
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(84920148549602027)
,p_parent_id=>wwv_flow_imp.id(84918919563602023)
,p_short_name=>'Detalle de vacaciones disponibles'
,p_link=>'f?p=&APP_ID.:33:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>33
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(85110774474865434)
,p_short_name=>'Roles de usuario'
,p_link=>'f?p=&APP_ID.:49:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>49
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(85136498509551734)
,p_short_name=>'Factura compra'
,p_link=>'f?p=&APP_ID.:58:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>58
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(85998831724206691)
,p_short_name=>'Transacciones'
,p_link=>'f?p=&APP_ID.:88:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>88
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(86845711334861794)
,p_short_name=>'Control gastos'
,p_link=>'f?p=&APP_ID.:55:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>55
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(86879643991648334)
,p_short_name=>unistr('Puntos de expedici\00F3n')
,p_link=>'f?p=&APP_ID.:63:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>63
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(86917061871044912)
,p_short_name=>unistr('Asignaci\00F3n puntos de expedici\00F3n')
,p_link=>'f?p=&APP_ID.:65:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>65
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(86947185665749067)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(87017501566966405)
,p_short_name=>'Factura venta'
,p_link=>'f?p=&APP_ID.:67:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>67
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(87018712005966407)
,p_parent_id=>wwv_flow_imp.id(87017501566966405)
,p_short_name=>'Crear/editar factura venta'
,p_link=>'f?p=&APP_ID.:68:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>68
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(87226904932750841)
,p_short_name=>unistr('Administraci\00F3n')
,p_link=>'f?p=&APP_ID.:10000:&SESSION.::&DEBUG.:::'
,p_page_id=>10000
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(87383215331842783)
,p_short_name=>'Categorias de gasto'
,p_link=>'f?p=&APP_ID.:56:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>56
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(87537908764547691)
,p_short_name=>unistr('Hist\00F3rico de precios de venta')
,p_link=>'f?p=&APP_ID.:69:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>69
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(88016053455198349)
,p_short_name=>'Instancias  WhatsApp'
,p_link=>'f?p=&APP_ID.:98:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>98
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(88721747936827578)
,p_short_name=>'Movimiento de producto'
,p_link=>'f?p=&APP_ID.:72:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>72
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(88751453147542228)
,p_short_name=>unistr('Movimiento producto dep\00F3sito')
,p_link=>'f?p=&APP_ID.:73:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>73
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(89043573495956386)
,p_short_name=>'Banco'
,p_link=>'f?p=&APP_ID.:75:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>75
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(89063911254055754)
,p_short_name=>'Emisor de tarjeta'
,p_link=>'f?p=&APP_ID.:77:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>77
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(89086696700162901)
,p_short_name=>'Forma de pago'
,p_link=>'f?p=&APP_ID.:79:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>79
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(89110811963391091)
,p_short_name=>unistr('Rendici\00F3n de caja')
,p_link=>'f?p=&APP_ID.:81:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>81
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(89187394246869564)
,p_short_name=>'Cobro factura'
,p_link=>'f?p=&APP_ID.:83:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>83
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(89307071086645060)
,p_short_name=>'Porcentajes de I.V.A.'
,p_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::'
,p_page_id=>8
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(89308192370645070)
,p_parent_id=>wwv_flow_imp.id(89307071086645060)
,p_short_name=>'Crear o Editar IVA'
,p_link=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(89316071811878675)
,p_short_name=>'Monedas'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(89316769967936200)
,p_parent_id=>wwv_flow_imp.id(89316071811878675)
,p_short_name=>'Crear o editar moneda'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(89318489949073483)
,p_short_name=>'Sucursales'
,p_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_page_id=>4
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(89319413575387957)
,p_parent_id=>wwv_flow_imp.id(89318489949073483)
,p_short_name=>'Crear o Editar Sucursal'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(89319639944448468)
,p_short_name=>unistr('Dep\00F3sitos')
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(89320686225470301)
,p_parent_id=>wwv_flow_imp.id(89319639944448468)
,p_short_name=>unistr('Crear o Editar Dep\00F3sito')
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90196415378145649)
,p_short_name=>'Centros de costo'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90197628581145656)
,p_parent_id=>wwv_flow_imp.id(90196415378145649)
,p_short_name=>'Crear o Editar Centro de Costo'
,p_link=>'f?p=&APP_ID.:11:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90245022231657313)
,p_short_name=>unistr('Entidades F\00EDsicas y Jur\00EDdicas')
,p_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
,p_page_id=>14
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90246146036657321)
,p_parent_id=>wwv_flow_imp.id(90245022231657313)
,p_short_name=>'Crear o Editar Entidad'
,p_link=>'f?p=&APP_ID.:15:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>15
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90269060272886012)
,p_short_name=>'Tipos de documentos'
,p_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:::'
,p_page_id=>16
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90270080582886021)
,p_parent_id=>wwv_flow_imp.id(90269060272886012)
,p_short_name=>'Crear o Editar Tipo de Documento'
,p_link=>'f?p=&APP_ID.:17:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>17
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90288178174008916)
,p_short_name=>'Grupo de producto'
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90307424522099579)
,p_short_name=>'Marcas'
,p_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::'
,p_page_id=>20
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90308584293099581)
,p_parent_id=>wwv_flow_imp.id(90307424522099579)
,p_short_name=>'Crear o Editar Marca'
,p_link=>'f?p=&APP_ID.:21:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>21
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90322711040148397)
,p_short_name=>'Origen del producto'
,p_link=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:::'
,p_page_id=>22
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90323947529148400)
,p_parent_id=>wwv_flow_imp.id(90322711040148397)
,p_short_name=>'Crear o Editar Origen Producto'
,p_link=>'f?p=&APP_ID.:23:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>23
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90338365544192975)
,p_short_name=>'Tipos de comprobantes'
,p_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_page_id=>24
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90339489890192977)
,p_parent_id=>wwv_flow_imp.id(90338365544192975)
,p_short_name=>'Crear o Editar Tipo Comprobante'
,p_link=>'f?p=&APP_ID.:25:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>25
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90353942564232687)
,p_short_name=>'Unidades de medida'
,p_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:::'
,p_page_id=>26
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90355172781232689)
,p_parent_id=>wwv_flow_imp.id(90353942564232687)
,p_short_name=>'Crear o Editar Unidad de Medida'
,p_link=>'f?p=&APP_ID.:27:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>27
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90412068332452053)
,p_short_name=>'Productos'
,p_link=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_page_id=>30
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(90413270549452055)
,p_parent_id=>wwv_flow_imp.id(90412068332452053)
,p_short_name=>'Crear o Editar Producto'
,p_link=>'f?p=&APP_ID.:31:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>31
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(92121466398772327)
,p_short_name=>'Pago factura'
,p_link=>'f?p=&APP_ID.:86:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>86
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(95197475538472697)
,p_short_name=>'Grupo mensaje'
,p_link=>'f?p=&APP_ID.:89:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>89
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(98766127277574783)
,p_short_name=>'Pedido de venta'
,p_link=>'f?p=&APP_ID.:94:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>94
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(99109889917106257)
,p_short_name=>unistr('Bot WhatsApp - Flujo de Conversaci\00F3n')
,p_link=>'f?p=&APP_ID.:102:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>102
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(99123932508093503)
,p_parent_id=>wwv_flow_imp.id(99109889917106257)
,p_short_name=>unistr('Crear&#x2F;editar flujo de conversaci\00F3n')
,p_link=>'f?p=&APP_ID.:103:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>103
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(99146613070774177)
,p_short_name=>'Tabla de descuento en venta'
,p_link=>'f?p=&APP_ID.:96:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>96
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(101031214953354199)
,p_short_name=>'Chats'
,p_link=>'f?p=&APP_ID.:105:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>105
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(111038685383625986)
,p_short_name=>'Solicitudes a TI'
,p_link=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:::'
,p_page_id=>107
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(111104088884404270)
,p_short_name=>'Area TI'
,p_link=>'f?p=&APP_ID.:108:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>108
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(112056620889786798)
,p_short_name=>'Nivel pedido TI'
,p_link=>'f?p=&APP_ID.:114:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>114
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(112165027252679565)
,p_short_name=>'Estado tarea TI'
,p_link=>'f?p=&APP_ID.:116:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>116
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(112411157030845541)
,p_short_name=>'Solicitudes a TI'
,p_link=>'f?p=&APP_ID.:99:&SESSION.::&DEBUG.:::'
,p_page_id=>99
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(112453313325225744)
,p_short_name=>unistr('Bit\00E1cora de solicitudes')
,p_link=>'f?p=&APP_ID.:118:&SESSION.::&DEBUG.:::'
,p_page_id=>118
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(123532676225234772)
,p_short_name=>'Disponibilidad'
,p_link=>'f?p=&APP_ID.:119:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>119
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(132555300346697157)
,p_short_name=>'Especialidad'
,p_link=>'f?p=&APP_ID.:123:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>123
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(132610978851901882)
,p_short_name=>'Especialidad por prestador'
,p_link=>'f?p=&APP_ID.:125:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>125
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(132841314601147717)
,p_short_name=>'Paciente'
,p_link=>'f?p=&APP_ID.:127:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>127
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(134047948548168922)
,p_short_name=>'Servicios'
,p_link=>'f?p=&APP_ID.:130:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>130
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(134255116509502233)
,p_short_name=>'Grupo de servicio'
,p_link=>'f?p=&APP_ID.:132:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>132
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(134402763009244733)
,p_short_name=>'Precio de servicio'
,p_link=>'f?p=&APP_ID.:134:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>134
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(134476437765800023)
,p_short_name=>'Parametro reserva'
,p_link=>'f?p=&APP_ID.:136:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>136
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(134686852702828103)
,p_short_name=>'Reserva (consulta)'
,p_link=>'f?p=&APP_ID.:139:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>139
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(134824330070140838)
,p_short_name=>'Consultas - reservas'
,p_link=>'f?p=&APP_ID.:140:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>140
);
wwv_flow_imp.component_end;
end;
/
