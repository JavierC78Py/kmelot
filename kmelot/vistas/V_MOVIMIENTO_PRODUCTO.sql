CREATE OR REPLACE VIEW v_movimiento_producto (
  tipo,
  fecha_evento,
  id_transaccion,
  tip_id_tipo_comprobante,
  nro_comprobante,
  id_detalle_transaccion,
  pro_id_producto,
  uni_id_unidad_medida,
  cantidad,
  dep_id_deposito,
  nombre_entidad,
  orden,
  stock
) AS
SELECT v.tipo
      ,v.fecha_evento
      ,v.id_transaccion
      ,v.tip_id_tipo_comprobante
      ,v.nro_comprobante
      ,v.id_detalle_transaccion
      ,v.pro_id_producto
      ,v.uni_id_unidad_medida
      ,v.cantidad
      ,v.dep_id_deposito
      ,v.nombre_entidad
      ,v.orden
      ,SUM(CASE WHEN v.tipo = 'ENTREGA_INSUMO' THEN 0 ELSE v.cantidad END)
           OVER (PARTITION BY v.pro_id_producto ORDER BY v.pro_id_producto, v.orden) stock
FROM (
  SELECT b.tipo
        ,b.fecha_evento
        ,b.id_transaccion
        ,b.tip_id_tipo_comprobante
        ,b.nro_comprobante
        ,b.id_detalle_transaccion
        ,b.pro_id_producto
        ,b.uni_id_unidad_medida
        ,b.cantidad
        ,b.dep_id_deposito
        ,b.nombre_entidad
        ,ROWNUM orden
  FROM (
    /* FACTURA_COMPRA - entrada de stock */
    SELECT 'FACTURA_COMPRA' TIPO
          ,c.fecha_factura fecha_evento
          ,c.id_factura_compra id_transaccion
          ,c.tip_id_tipo_comprobante
          ,c.nro_factura nro_comprobante
          ,d.id_det_factura_compra id_detalle_transaccion
          ,d.pro_id_producto
          ,d.uni_id_unidad_medida
          ,d.cantidad
          ,d.dep_id_deposito
          ,e.nombre nombre_entidad
    FROM cab_factura_compra c
        ,det_factura_compra d
        ,entidad e
    WHERE d.fac_id_factura_compra = c.id_factura_compra
    AND e.id_entidad = c.ent_id_entidad
    UNION ALL
    /* FACTURA_VENTA - salida de stock */
    SELECT 'FACTURA_VENTA' TIPO
          ,c.fecha_registro fecha_evento
          ,c.id_factura_venta id_transaccion
          ,c.tip_id_tipo_comprobante
          ,c.nro_factura nro_comprobante
          ,d.id_det_factura_venta id_detalle_transaccion
          ,d.pro_id_producto
          ,d.uni_id_unidad_medida
          ,(d.cantidad * -1) cantidad
          ,d.dep_id_deposito
          ,e.nombre nombre_entidad
    FROM cab_factura_venta c
        ,det_factura_venta d
        ,entidad e
    WHERE d.fac_id_factura_venta = c.id_factura_venta
    AND e.id_entidad = c.ent_id_entidad
    UNION ALL
    /* AJUSTE_INVENTARIO - ingreso/egreso a deposito (pag 163) */
    SELECT 'AJUSTE_INVENTARIO' TIPO
          ,c.fecha_ajuste fecha_evento
          ,c.id_ajuste id_transaccion
          ,NULL tip_id_tipo_comprobante
          ,NULL nro_comprobante
          ,d.id_detalle_ajuste id_detalle_transaccion
          ,d.pro_id_producto
          ,d.uni_id_unidad_medida
          ,d.cantidad
          ,d.dep_id_deposito
          ,NULL nombre_entidad
    FROM cab_ajuste_inventario c
        ,det_ajuste_inventario d
    WHERE d.aju_id_ajuste = c.id_ajuste
    AND c.estado = 'ACTIVO'
    UNION ALL
    /* ENTREGA_INSUMO - trazabilidad, NO afecta stock */
    SELECT 'ENTREGA_INSUMO' TIPO
          ,c.fecha_entrega fecha_evento
          ,c.id_entrega_insumo id_transaccion
          ,NULL tip_id_tipo_comprobante
          ,NULL nro_comprobante
          ,d.id_det_entrega id_detalle_transaccion
          ,m.pro_id_producto_mat pro_id_producto
          ,m.uni_id_unidad_medida
          ,(d.cantidad_entregada * -1) cantidad
          ,op.dep_id_deposito_orig dep_id_deposito
          ,NULL nombre_entidad
    FROM cab_entrega_insumo c
        ,det_entrega_insumo d
        ,det_orden_produccion_mat m
        ,cab_orden_produccion op
    WHERE d.ent_id_entrega_insumo = c.id_entrega_insumo
    AND m.id_det_orden_mat = d.det_id_det_orden_mat
    AND op.id_orden_prod = c.ord_id_orden_prod
    AND c.estado = 'ACTIVO'
    ORDER BY pro_id_producto, fecha_evento
  ) b
) v
/

