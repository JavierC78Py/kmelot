SELECT *
FROM licitacion
WHERE nro_licitacion = 445827
/
SELECT *
FROM licita_det_prod_tmp_venta
WHERE lic_id_licitacion = 4
/
SELECT *
FROM licitacion_det_producto
WHERE lic_id_licitacion = 4
/
SELECT *
FROM cab_factura_venta
WHERE lic_id_licitacion = 4
/
SELECT *
FROM det_cuenta_venta
WHERE fac_id_factura_venta IN (
37
,38
,34
,36
,35
,33
);
/
SELECT *
FROM det_factura_venta
WHERE fac_id_factura_venta IN (
37
,38
,34
,36
,35
,33
);
