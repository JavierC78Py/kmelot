PROMPT CREATE OR REPLACE VIEW salotex.v_movimiento_producto
CREATE OR REPLACE VIEW salotex.v_movimiento_producto (
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
      ,sum(v.cantidad) OVER (PARTITION BY v.pro_id_producto ORDER BY v.pro_id_producto, v.orden) stock
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
    SELECT 'FACTURA_VENTA' TIPO
          ,c.fecha_registro fecha_evento
          ,c.id_factura_venta id_transaccion
          ,c.tip_id_tipo_comprobante
          ,c.nro_factura nro_comprobante
          ,d.id_det_factura_venta id_detalle_transaccion
          ,d.pro_id_producto
          ,d.uni_id_unidad_medida
          ,(d.cantidad * -1 ) cantidad
          ,d.dep_id_deposito
          ,e.nombre nombre_entidad
    FROM cab_factura_venta c
        ,det_factura_venta d
        ,entidad e
    WHERE d.fac_id_factura_venta = c.id_factura_venta
    AND e.id_entidad = c.ent_id_entidad
    ORDER BY pro_id_producto, fecha_evento
  ) b
) v
/

