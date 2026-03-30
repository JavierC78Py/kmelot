SELECT *
FROM detalle_tarifa
WHERE id_tarifa = 14516
/
SELECT *
FROM grupo_beneficiario
WHERE id_grupo_beneficiario IN (9634,9801,9804)
/
SELECT *
FROM PLAN
WHERE id_plan IN(293,300,353)
/
SELECT *
FROM DET_GRUPO_beneficiario
WHERE  grup_beneid_grupo_beneficiario = 9804
/
SELECT c.prom_id_promotor, p.usuario
FROM contrato_cliente_web c
    ,prom p
WHERE c.fecha_evento_fe > To_Date('31-12-2025 23:59','dd-mm-yyyy hh24:mi')
AND p.id_promotor(+) = c.prom_id_promotor
ORDER BY 1 DESC