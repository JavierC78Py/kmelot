pm2 start "npm run start" --name "WhatsApp-ClinicaSM"
/
sudo bash -c 'echo "[mysqld]
skip-grant-tables
skip-networking" > /etc/my.cnf.d/skip-grant-tables.cnf'
/*crear backup sin datos*/
mysqldump -u root -p --no-data baileys_db > solo_estructura.sql
//*Crear base y user*/
mysql -u root -e "SHOW DATABASES;"
mysql -u root -e "CREATE DATABASE baileys_db03;"
mysql -u root -e "CREATE USER 'baileys_user03'@'localhost' IDENTIFIED BY 'Secreto*2024';"
GRANT ALL PRIVILEGES ON baileys_db03.* TO 'baileys_user03'@'localhost';
FLUSH PRIVILEGES;
/
/*verificar*/
SHOW DATABASES LIKE 'baileys_db03';
SELECT User, Host FROM mysql.user WHERE User = 'baileys_user03';
SHOW GRANTS FOR 'baileys_user03'@'localhost';
/
mysql -u baileys_user03 -p -D baileys_db03
/
mysql -u root -e "USE baileys_db02; delete  FROM Message;"
mysql -u root -e "USE baileys_db02; delete  FROM Chat;"

/*restaurar backup*/
mysql -u root -p baileys_db03 < solo_estructura.sql

mysql -u root -e "USE baileys_db02; SHOW TABLES;"
mysql -u root -e "USE baileys_db02; SELECT COUNT(*) FROM nombre_de_tabla;"


mysql -u baileys_user02 -p
sudo vi  /etc/my.cnf.d/skip-grant-tables.cnf

sudo systemctl stop  mysqld

/*No se utiliza IPDABLES, esta abajo el servicio.*/
sudo firewall-cmd --add-port=4303/tcp --permanent
sudo firewall-cmd --reload

/
INSERT INTO parametros VALUES (
1,
'SantaMed',
'bucket-javiercpy',
'principal',
'ACTIVO',
'NO',
'SI',
NULL,
'Santa Med',
NULL,
NULL,
NULL,
NULL,
NULL,
'https://baileys03.kmelot.online',
'9x586dyk-620y-458q-b4c7-1t278a43ea5fp');

/
INSERT INTO entidad (
id_entidad,
nombre,
tip_id_tipo_documento,
numero_documento,
es_cliente,
es_proveedor,
es_empleado,
es_usuario,
estado,
fecha_nacimiento,
observacion,
usu_id_usuario,
tipo_entidad,
suc_id_sucursal,
ciu_cod_ciudad,
ent_id_entidad,
es_prestador,
es_paciente,
sexo,
nro_celular,
correo,
fact_responsable,
resp_ent_id_entidad
) VALUES (
   NULL --id_entidad,
  ,'SANTA MED' --nombre,
  ,3 --tip_id_tipo_documento,
  ,'1' --numero_documento,
  ,'NO' --es_cliente,
  ,'NO' --es_proveedor,
  ,'NO' --es_empleado,
  ,'NO' --es_usuario,
  ,'ACTIVO' --estado,
  ,SYSDATE --fecha_nacimiento,
  ,NULL --observacion,
  ,NULL --usu_id_usuario,
  ,NULL --tipo_entidad,
  ,NULL --suc_id_sucursal,
  ,NULL --ciu_cod_ciudad,
  ,NULL --ent_id_entidad,
  ,NULL --es_prestador,
  ,NULL --es_paciente,
  ,NULL --sexo,
  ,NULL --nro_celular,
  ,NULL --correo,
  ,NULL --fact_responsable,
  ,NULL --resp_ent_id_entidad
);
/
INSERT INTO tipo_documento VALUES (1,'CEDULA DE IDENTIDAD'                ,'ACTIVO','C.I.'      );
INSERT INTO tipo_documento VALUES (2,'PASAPORTE'                          ,'ACTIVO','PASAPORTE' );
INSERT INTO tipo_documento VALUES (3,'REGISTRO UNICO DE CONTRIBUYENTE'    ,'ACTIVO','R.U.C.'    );
/
INSERT INTO sucursal_entidad (
id_suc_entidad,
ent_id_entidad,
descripcion,
direccion,
latitud,
longitud,
telefono1,
telefono2,
es_central,
estado,
ciu_cod_ciudad,
link_mapa
) VALUES (
     NULL --id_suc_entidad,
    ,1--ent_id_entidad,
    ,'CASA CENTRAL'--descripcion,
    ,'O’Higgins N° 631 entre Sucre y Lillo'--direccion,
    ,NULL--latitud,
    ,NULL--longitud,
    ,NULL--telefono1,
    ,NULL--telefono2,
    ,'SI'--es_central,
    ,'ACTIVO'--estado,
    ,NULL--ciu_cod_ciudad,
    ,NULL--link_mapa
);
/
INSERT INTO entidad (
id_entidad,
nombre,
tip_id_tipo_documento,
numero_documento,
es_cliente,
es_proveedor,
es_empleado,
es_usuario,
estado,
fecha_nacimiento,
observacion,
usu_id_usuario,
tipo_entidad,
suc_id_sucursal,
ciu_cod_ciudad,
ent_id_entidad,
es_prestador,
es_paciente,
sexo,
nro_celular,
correo,
fact_responsable,
resp_ent_id_entidad
) VALUES (
   NULL --id_entidad,
  ,'JAVIER CABALLERO' --nombre,
  ,1 --tip_id_tipo_documento,
  ,'2484930' --numero_documento,
  ,'NO' --es_cliente,
  ,'NO' --es_proveedor,
  ,'NO' --es_empleado,
  ,'SI' --es_usuario,
  ,'ACTIVO' --estado,
  ,To_Date('21-09-1978','dd-mm-yyyy') --fecha_nacimiento,
  ,NULL --observacion,
  ,1 --usu_id_usuario,
  ,NULL --tipo_entidad,
  ,1 --suc_id_sucursal,
  ,NULL --ciu_cod_ciudad,
  ,NULL --ent_id_entidad,
  ,NULL --es_prestador,
  ,NULL --es_paciente,
  ,NULL --sexo,
  ,NULL --nro_celular,
  ,'javier@kmelot.online' --correo,
  ,NULL --fact_responsable,
  ,NULL --resp_ent_id_entidad
);
/
INSERT INTO pagina VALUES (2,'MONEDA','TESORERIA','DEFINICIONES');
INSERT INTO pagina VALUES (4,'SUCURSAL','CONTABILIDAD','DEFINICIONES');
INSERT INTO pagina VALUES (6,'DEPOSITO','CONTABILIDAD','DEFINICIONES');
INSERT INTO pagina VALUES (8,'I.V.A.','CONTABILIDAD','DEFINICIONES');
INSERT INTO pagina VALUES (10,'CENTRO DE COSTO','CONTABILIDAD','DEFINICIONES');
INSERT INTO pagina VALUES (12,'CONTACTO POR ENTIDAD','GENERAL','DEFINICIONES');
INSERT INTO pagina VALUES (14,'ENTIDAD','GENERAL','DEFINICIONES');
INSERT INTO pagina VALUES (16,'TIPO DE DOCUMENTO','CONTABILIDAD','DEFINICIONES');
INSERT INTO pagina VALUES (18,'GRUPOS DE PRODUCTOS','PRODUCTO','DEFINICIONES');
INSERT INTO pagina VALUES (20,'MARCAS','PRODUCTO','DEFINICIONES');
INSERT INTO pagina VALUES (22,'ORIGEN de PRODUCTO','PRODUCTO','DEFINICIONES');
INSERT INTO pagina VALUES (24,'TIPOS DE COMPROBANTES','CONTABILIDAD','DEFINICIONES');
INSERT INTO pagina VALUES (26,'UNIDAD DE MEDIDA','PRODUCTO','DEFINICIONES');
INSERT INTO pagina VALUES (28,'SUCURSAL POR ENTIDAD','GENERAL','DEFINICIONES');
INSERT INTO pagina VALUES (30,'PRODUCTOS','PRODUCTO','DEFINICIONES');
INSERT INTO pagina VALUES (32,'VACACIONES DISPONIBLES','RRHH','PROCESOS');
INSERT INTO pagina VALUES (34,'COLABORADORES','RRHH','DEFINICIONES');
INSERT INTO pagina VALUES (36,'DEPARTAMENTOS','RRHH','DEFINICIONES');
INSERT INTO pagina VALUES (38,'SECCIONES','RRHH','DEFINICIONES');
INSERT INTO pagina VALUES (40,'JEFATURAS','RRHH','DEFINICIONES');
INSERT INTO pagina VALUES (42,'SOLICITUD DE VACACIONES','RRHH','PROCESOS');
INSERT INTO pagina VALUES (44,'PERIODOS','RRHH','DEFINICIONES');
INSERT INTO pagina VALUES (46,'USUARIOS','ADMINISTRACION_AP','DEFINICIONES');
INSERT INTO pagina VALUES (49,'ROL','ADMINISTRACION_AP','DEFINICIONES');
INSERT INTO pagina VALUES (50,'PAGINA DEL SISTEMA','ADMINISTRACION_AP','DEFINICIONES');
INSERT INTO pagina VALUES (51,'ROL POR PAGINA','ADMINISTRACION_AP','DEFINICIONES');
INSERT INTO pagina VALUES (53,'ROL POR USUARIO','ADMINISTRACION_AP','DEFINICIONES');
INSERT INTO pagina VALUES (55,'CONTROL DE GASTOS','CONTROL_GASTO','PROCESOS');
INSERT INTO pagina VALUES (56,'CATEGORIAS DE GASTO','CONTROL_GASTO','DEFINICIONES');
INSERT INTO pagina VALUES (58,'FACTURA COMPRA','COMPRAS','PROCESOS');
INSERT INTO pagina VALUES (60,'CONCEPTOS GASTOS INGRESOS','CONTROL_GASTO','DEFINICIONES');
INSERT INTO pagina VALUES (62,'TIPO DE CAMBIO DIARIO','TESORERIA','DEFINICIONES');
INSERT INTO pagina VALUES (63,'PUNTOS DE EXPEDICION','CONTABILIDAD','DEFINICIONES');
INSERT INTO pagina VALUES (65,'ASIGNAR PUNTO EXPEDICION','CONTABILIDAD','DEFINICIONES');
INSERT INTO pagina VALUES (67,'GENERAR FACT.VENTA','VENTA','PROCESOS');
INSERT INTO pagina VALUES (69,'PRECIOS VENTA PRODUCTO','PRODUCTO','DEFINICIONES');
INSERT INTO pagina VALUES (72,'MOVIMIENTO PRODUCTO','PRODUCTO','REPORTES');
INSERT INTO pagina VALUES (73,'MOVIMIENTO PRODUCTO DEPOSITO','PRODUCTO','REPORTES');
INSERT INTO pagina VALUES (75,'BANCO','TESORERIA','DEFINICIONES');
INSERT INTO pagina VALUES (77,'EMISOR TARJETA','TESORERIA','DEFINICIONES');
INSERT INTO pagina VALUES (79,'FORMA DE PAGO','TESORERIA','DEFINICIONES');
INSERT INTO pagina VALUES (81,'APERT/CIERRE CAJA-RENDICION','TESORERIA','PROCESOS');
INSERT INTO pagina VALUES (83,'COBRO DE FACTURA VENTA','TESORERIA','PROCESOS');
INSERT INTO pagina VALUES (86,'PAGO DE FACTURA_COMPRA','TESORERIA','PROCESOS');
INSERT INTO pagina VALUES (88,'TRANSACCIONES','TESORERIA','REPORTES');
INSERT INTO pagina VALUES (89,'GRUPO MENSAJE WHATSAPP','WHATSAPP','PROCESOS');
INSERT INTO pagina VALUES (94,'PEDIDO DE VENTA','VENTA','PROCESOS');
INSERT INTO pagina VALUES (96,'TABLA DESCUENTO VENTA','VENTA','DEFINICIONES');
INSERT INTO pagina VALUES (98,'INSTANCIAS WHATSAPP','WHATSAPP','DEFINICIONES');
INSERT INTO pagina VALUES (99,'SOLICITUDES TI','SOLICITUD_TI','REPORTES');
INSERT INTO pagina VALUES (102,'BOT-FLUJO DE CONVERSACION','WHATSAPP','DEFINICIONES');
INSERT INTO pagina VALUES (105,'CHATS WHATSAPP','WHATSAPP','PROCESOS');
INSERT INTO pagina VALUES (107,'SOLICITUDES TI','SOLICITUD_TI','PROCESOS');
INSERT INTO pagina VALUES (108,'AREA TI','SOLICITUD_TI','DEFINICIONES');
INSERT INTO pagina VALUES (114,'NIVEL PEDIDO TI','SOLICITUD_TI','DEFINICIONES');
INSERT INTO pagina VALUES (116,'ESTADO TAREA PEDIDO TI','SOLICITUD_TI','DEFINICIONES');
INSERT INTO pagina VALUES (118,'BITACORA TAREA SOLICITUD TI','SOLICITUD_TI','REPORTES');
INSERT INTO pagina VALUES (119,'DISPONIBILIDAD','TESORERIA','DEFINICIONES');
INSERT INTO pagina VALUES (123,'ESPECIALIDAD','GENERAL','DEFINICIONES');
INSERT INTO pagina VALUES (125,'ESPECIALIDAD POR PRESTADOR','GENERAL','DEFINICIONES');
INSERT INTO pagina VALUES (127,'PACIENTE','GENERAL','DEFINICIONES');
INSERT INTO pagina VALUES (130,'SERVICIO','SERVICIO','DEFINICIONES');
INSERT INTO pagina VALUES (132,'GRUPO SERVICIO','SERVICIO','DEFINICIONES');
INSERT INTO pagina VALUES (134,'PRECIO SERVICIO','SERVICIO','DEFINICIONES');
INSERT INTO pagina VALUES (136,'PARAMETRO RESERVA','CONSULTORIO','DEFINICIONES');
INSERT INTO pagina VALUES (139,'RESERVA(DETALLE)','CONSULTORIO','DEFINICIONES');
INSERT INTO pagina VALUES (141,'PLANTILLA MENSAJE','WHATSAPP','DEFINICIONES');
INSERT INTO pagina VALUES (143,'CONVERSACIONES BOT','WHATSAPP','REPORTES');
/
INSERT INTO rol VALUES (1,'R_INFORMATICA');
INSERT INTO rol VALUES (2,'R_JEFE_INFORMATICA');
INSERT INTO rol VALUES (3,'R_CONTABILIDAD');
INSERT INTO rol VALUES (4,'R_JEFE_CONTABILIDAD');
INSERT INTO rol VALUES (5,'R_VENTA');
INSERT INTO rol VALUES (6,'R_JEFE_VENTA');
INSERT INTO rol VALUES (7,'R_COMPRA');
INSERT INTO rol VALUES (8,'R_JEFE_COMPRA');
INSERT INTO rol VALUES (9,'R_DEPOSITO');
INSERT INTO rol VALUES (10,'R_JEFE_DEPOSITO');
INSERT INTO rol VALUES (11,'R_SUPER');
INSERT INTO rol VALUES (12,'R_GERENTE');
INSERT INTO rol VALUES (13,'R_WHATSAPP');
/
INSERT INTO pagina_rol VALUES (76,49  ,11 ,'SI','SI','SI');
INSERT INTO pagina_rol VALUES (77,50  ,11 ,'SI','SI','SI');
INSERT INTO pagina_rol VALUES (78,51  ,11 ,'SI','SI','SI');
INSERT INTO pagina_rol VALUES (79,53  ,11 ,'SI','SI','SI');
INSERT INTO pagina_rol VALUES (80,46  ,11 ,'SI','SI','SI');
INSERT INTO pagina_rol VALUES (86,34  ,1  ,'SI','SI','SI');
INSERT INTO pagina_rol VALUES (88,141 ,1  ,'SI','SI','SI');
INSERT INTO pagina_rol VALUES (92,143 ,1  ,'NO','NO','NO');
INSERT INTO pagina_rol VALUES (89,28  ,1  ,'SI','SI','SI');
INSERT INTO pagina_rol VALUES (81,98  ,13 ,'SI','SI','SI');
INSERT INTO pagina_rol VALUES (82,105 ,13 ,'SI','SI','SI');
INSERT INTO pagina_rol VALUES (83,14  ,1  ,'SI','SI','SI');
INSERT INTO pagina_rol VALUES (84,36  ,1  ,'SI','SI','SI');
INSERT INTO pagina_rol VALUES (85,38  ,1  ,'SI','SI','SI');
INSERT INTO pagina_rol VALUES (87,102 ,1  ,'SI','SI','SI');
/
INSERT INTO usuario_rol VALUES (2,1,1  );
INSERT INTO usuario_rol VALUES (3,1,11 );
INSERT INTO usuario_rol VALUES (4,1,13 );
/





