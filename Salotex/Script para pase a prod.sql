/*


ACTUALIZAR PROD


*/
ALTER TABLE cab_orden_produccion ADD sexo VARCHAR2(1);
/
ALTER TABLE cab_orden_produccion
  ADD CONSTRAINT cab_orden_produc_sex_ck CHECK (
    sexo IN ( 'M', 'F', 'U' )
  )
/
ALTER TABLE cab_orden_produccion ADD tip_id_tipo_logo NUMBER(10);
/
ALTER TABLE cab_orden_produccion
  ADD CONSTRAINT cab_orden_produc_tipo_logo_fk FOREIGN KEY (
    tip_id_tipo_logo
  ) REFERENCES tipo_logo (
    id_tipo_logo
  )
/
ALTER TABLE cab_orden_produccion ADD tam_id_tamanho_receta NUMBER(10);
/
ALTER TABLE cab_orden_produccion
  ADD CONSTRAINT cab_orden_produc_tamanho_fk FOREIGN KEY (
    tam_id_tamanho_receta
  ) REFERENCES receta_produccion_tamanho (
    id_tamanho_receta
  )
/
f_dev_costo_promedio_compra
/
Pag 170
/
SELECT f_dev_costo_promedio_compra(
    p_id_producto => 244
  , p_id_unidad_medida => 7
  , p_id_moneda => 1
  , p_fecha => SYSDATE
  , p_mensaje => 1)
FROM dual;
/
--receta
SELECT c.id_receta,
       c.pro_id_producto_fin,
       c.descripcion_receta,
       c.cantidad_base,
       c.uni_id_unidad_medida,
       c.estado,
       c.usuario_registro,
       c.fecha_registro,
       c.sexo,
       c.tip_id_tipo_logo
FROM cab_receta_produccion c
WHERE c.id_receta = 25
/
--insumos
SELECT x.id_det_receta,
       x.rec_id_receta,
       x.pro_id_producto_mat,
       x.uni_id_unidad_medida,
       x.cantidad_requerida,
       x.mermas_porcentaje,
       x.estado,
       x.tipo_articulo,
       x.costo_promedio,
       (x.costo_promedio * x.cantidad_requerida) AS costo_insumo
FROM (
  SELECT d.id_det_receta,
         d.rec_id_receta,
         d.pro_id_producto_mat,
         d.uni_id_unidad_medida,
         d.cantidad_requerida,
         d.mermas_porcentaje,
         d.estado,
         (
          SELECT p.tipo
          FROM producto p
          WHERE p.id_producto = d.pro_id_producto_mat
         ) tipo_articulo,
         f_dev_costo_promedio_compra(
             p_id_producto => d.pro_id_producto_mat
           , p_id_unidad_medida => d.uni_id_unidad_medida
           , p_id_moneda => 1
           , p_fecha => c.fecha_registro
           , p_mensaje => 0) costo_promedio
  FROM cab_receta_produccion c
      ,det_receta_produccion d
  WHERE c.id_receta = 1
  AND d.rec_id_receta = c.id_receta
) x

/
--costos operativos
SELECT o.id_det_receta_ope,
       o.rec_id_receta,
       o.descripcion,
       o.tipo_costo,
       o.costo_estimado,
       o.estado
FROM det_receta_produccion_ope o
WHERE o.rec_id_receta = 1
AND o.estado = 'ACTIVO'
/
--prestadores
SELECT p.id_det_prestador,
       p.rec_id_receta,
       p.ent_id_entidad_prestador
FROM det_cabecera_produccion p
WHERE p.rec_id_receta = 25