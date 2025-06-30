Update
Pag 100
Pag 110
Pag 98
Pag 15
Pag 14
Pag 1
Pag 34
Pag 35
Pag 38
Pag 39
Pag 105
LV_SINO_VINARIO
/
ALTER TABLE seccion ADD cola_bot NUMBER(1) DEFAULT 0;
/
ALTER TABLE cbc.seccion
  ADD CONSTRAINT seccion_cola_bot_ck CHECK (
    cola_bot IN ( 0, 1 )
  )
/
ALTER TABLE chats ADD sec_id_seccion NUMBER(10);
/
ALTER TABLE cbc.chats
  ADD CONSTRAINT seccion_chats_fk FOREIGN KEY (
    sec_id_seccion
  ) REFERENCES cbc.seccion (
    id_seccion
  )
/
ALTER TABLE sucursal_entidad ADD link_mapa VARCHAR2(200);
/
borrar fk entidad a sucursal.
/
/*update*/
ALTER TABLE cbc.bot_flows
  ADD CONSTRAINT bot_flows_sucursal_fk FOREIGN KEY (
    suc_id_sucursal
  ) REFERENCES cbc.sucursal_entidad (
    id_suc_entidad
  )
/
/*update*/
ALTER TABLE cbc.cab_cobro
  ADD CONSTRAINT cab_cobro_sucursal_fk FOREIGN KEY (
    suc_id_sucursal
  ) REFERENCES cbc.sucursal_entidad (
    id_suc_entidad
  )
/
/*update*/
ALTER TABLE cbc.cab_factura_venta
  ADD CONSTRAINT cab_factura_venta_sucursal_fk FOREIGN KEY (
    suc_id_sucursal
  ) REFERENCES cbc.sucursal_entidad (
    id_suc_entidad
  )
/
/*update*/
ALTER TABLE cbc.cab_pago
  ADD CONSTRAINT cab_pago_sucursal_fk FOREIGN KEY (
    suc_id_sucursal
  ) REFERENCES cbc.sucursal_entidad (
    id_suc_entidad
  )
/
/*update*/
ALTER TABLE cbc.deposito
  ADD CONSTRAINT deposito_sucursal_fk FOREIGN KEY (
    suc_id_sucursal
  ) REFERENCES cbc.sucursal_entidad (
    id_suc_entidad
  )
/
/*update*/
ALTER TABLE cbc.devices
  ADD CONSTRAINT device_sucursal_fk FOREIGN KEY (
    suc_id_sucursal
  ) REFERENCES cbc.sucursal_entidad (
    id_suc_entidad
  )
/
/*update*/
ALTER TABLE cbc.rendicion_caja
  ADD CONSTRAINT rendicion_caja_sucursal_fk FOREIGN KEY (
    suc_id_sucursal
  ) REFERENCES cbc.sucursal_entidad (
    id_suc_entidad
  )
/
/*update*/
LV_SUCURSAL
/
Habilitar API para enviar por id_reserva el resultado obtenido por el BOT.
Habilitar API para marcar como enviado el mensaje para la reserva.( bandera para no volver a enviar a la API)
/

entidad
/
SELECT *
FROM sucursal
/
SELECT *
FROM parametros
/
SELECT *
FROM sucursal_entidad
/
DELETE devices
/
DELETE chats
/
pkg_gestion_bot
pkg_gestion_bot.p_caducar