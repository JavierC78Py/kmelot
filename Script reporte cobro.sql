SELECT cfv.id_factura_venta
      ,cfv.fecha_factura
      ,cfv.fecha_vencimiento
      ,cfv.ent_id_entidad
      ,e.nombre AS nombre_entidad
      ,Translate(To_Char(cfv.nro_factura,'000G000G0000000'),',.','--') AS nro_factura
      ,cfv.mon_id_moneda
      ,cfv.monto
      ,cfv.lic_id_licitacion
      ,cfv.orden_compra
      ,dcv.importe
      ,dcv.saldo
      ,cc.id_cobro
      ,cc.nro_comprobante AS nro_recibo
      ,cc.fecha AS fecha_cobro
      ,cc.ren_id_rendicion_caja
      ,fp.descripcion
      ,t.importe AS importe_transaccion
FROM cab_factura_venta cfv
    ,entidad e
    ,licitacion l
    ,det_cuenta_venta dcv
    ,det_cobro dc
    ,cab_cobro cc
    ,det_formas_cobro dfc
    ,transaccion t
    ,forma_pago fp
WHERE id_factura_venta = 69
AND e.id_entidad = cfv.ent_id_entidad
AND l.id_licitacion(+) = cfv.lic_id_licitacion
AND dcv.fac_id_factura_venta = cfv.id_factura_venta
AND dc.det_id_detalle_cuenta = dcv.id_detalle_cuenta
AND cc.id_cobro = dc.cob_id_cobro
AND dfc.cob_id_cobro = cc.id_cobro
AND t.id_transaccion = dfc.tran_id_transaccion
AND t.tipo_transaccion = 'COBRO'
AND fp.id_forma_pago = t.for_id_forma_pago