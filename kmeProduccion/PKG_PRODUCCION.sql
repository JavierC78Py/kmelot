PROMPT CREATE OR REPLACE PACKAGE salotex.pkg_produccion
CREATE OR REPLACE PACKAGE salotex.pkg_produccion AS

  /*
   * Procedimiento principal para finalizar una Orden de Produccion.
   * Realiza las validaciones correspondientes y genera el 
   * Ajuste de Inventario (Salida de Insumos + Entrada de Producto Terminado).
   */
  PROCEDURE finalizar_orden (
    p_id_orden_prod IN NUMBER,
    p_usuario       IN VARCHAR2 DEFAULT NVL(v('APP_USER'), USER)
  );

END pkg_produccion;
/

PROMPT CREATE OR REPLACE PACKAGE BODY salotex.pkg_produccion
CREATE OR REPLACE PACKAGE BODY salotex.pkg_produccion AS

  PROCEDURE finalizar_orden (
    p_id_orden_prod IN NUMBER,
    p_usuario       IN VARCHAR2 DEFAULT NVL(v('APP_USER'), USER)
  ) IS
    v_estado_actual          VARCHAR2(20);
    v_id_ajuste              NUMBER;
    v_sucursal               NUMBER;
    v_deposito_orig          NUMBER;
    v_deposito_dest          NUMBER;
    v_producto_fin           NUMBER;
    v_cantidad_producir      NUMBER;
    v_costo_total_orden      NUMBER := 0;
    
    -- Variables para el Ajuste
    v_moneda_local           NUMBER := 1; -- Asumiendo 1 como ID de Moneda Base (Guaraníes/Pesos)
    v_tipo_cambio            NUMBER := 1;
    v_unidad_medida_fin      NUMBER;

  BEGIN
    -- 1. Validar Estado de la Orden
    SELECT estado, suc_id_sucursal, dep_id_deposito_orig, dep_id_deposito_dest, pro_id_producto_fin, cantidad_a_producir
      INTO v_estado_actual, v_sucursal, v_deposito_orig, v_deposito_dest, v_producto_fin, v_cantidad_producir
      FROM cab_orden_produccion
     WHERE id_orden_prod = p_id_orden_prod;

    IF v_estado_actual = 'FINALIZADO' THEN
      RAISE_APPLICATION_ERROR(-20001, 'La orden de producción ya se encuentra FINALIZADA.');
    ELSIF v_estado_actual = 'ANULADO' THEN
      RAISE_APPLICATION_ERROR(-20002, 'No se puede finalizar una orden ANULADA.');
    END IF;

    -- Obtener la unidad de medida del producto final desde la receta usada
    SELECT r.uni_id_unidad_medida
      INTO v_unidad_medida_fin
      FROM cab_orden_produccion o
      JOIN cab_receta_produccion r ON o.rec_id_receta = r.id_receta
     WHERE o.id_orden_prod = p_id_orden_prod;

    -- 2. Crear Cabecera del Ajuste de Inventario
    INSERT INTO cab_ajuste_inventario (
      fecha_ajuste,
      suc_id_sucursal,
      mon_id_moneda,
      tipo_cambio,
      monto,
      observacion,
      estado,
      usuario_registro,
      fecha_registro
    ) VALUES (
      TRUNC(SYSDATE),
      v_sucursal,
      v_moneda_local,
      v_tipo_cambio,
      0, -- El Trigger se encarga de sumar los montos del detalle
      'Ajuste automático generado por Finalización de Orden de Producción #' || p_id_orden_prod,
      'ACTIVO',
      p_usuario,
      SYSDATE
    ) RETURNING id_ajuste INTO v_id_ajuste;

    -- 3. Generar Detalles Negativos (Salida de Materia Prima)
    FOR c_mat IN (
      SELECT pro_id_producto_mat, uni_id_unidad_medida, cantidad_real_consumida, costo_unitario, costo_total
        FROM det_orden_produccion_mat
       WHERE orp_id_orden_prod = p_id_orden_prod
    )
    LOOP
      v_costo_total_orden := v_costo_total_orden + NVL(c_mat.costo_total, 0);

      INSERT INTO det_ajuste_inventario (
        aju_id_ajuste,
        pro_id_producto,
        descripcion,
        uni_id_unidad_medida,
        precio_unitario,
        cantidad,
        monto,
        dep_id_deposito
      ) VALUES (
        v_id_ajuste,
        c_mat.pro_id_producto_mat,
        'Consumo de Materia Prima OP #' || p_id_orden_prod,
        c_mat.uni_id_unidad_medida,
        NVL(c_mat.costo_unitario, 0),
        c_mat.cantidad_real_consumida * -1, -- NEGATIVO para descontar
        NVL(c_mat.costo_total, 0) * -1,
        v_deposito_orig
      );
    END LOOP;

    -- 4. Sumar Costos Operativos al total de la Orden
    FOR c_ope IN (
      SELECT costo_real_total
        FROM det_orden_produccion_ope
       WHERE orp_id_orden_prod = p_id_orden_prod
    )
    LOOP
      v_costo_total_orden := v_costo_total_orden + NVL(c_ope.costo_real_total, 0);
    END LOOP;

    -- 5. Generar Detalle Positivo (Ingreso de Producto Terminado)
    -- El costo unitario del producto terminado sera el total de la orden dividido la cantidad producida.
    INSERT INTO det_ajuste_inventario (
      aju_id_ajuste,
      pro_id_producto,
      descripcion,
      uni_id_unidad_medida,
      precio_unitario,
      cantidad,
      monto,
      dep_id_deposito
    ) VALUES (
      v_id_ajuste,
      v_producto_fin,
      'Ingreso de Producto Terminado OP #' || p_id_orden_prod,
      v_unidad_medida_fin,
      CASE WHEN v_cantidad_producir > 0 THEN v_costo_total_orden / v_cantidad_producir ELSE 0 END,
      v_cantidad_producir, -- POSITIVO para sumar stock
      v_costo_total_orden,
      v_deposito_dest
    );

    -- 6. Actualizar Estado y Costo Real de la Orden
    UPDATE cab_orden_produccion
       SET estado = 'FINALIZADO',
           fecha_fin_real = TRUNC(SYSDATE),
           costo_total_real = v_costo_total_orden
     WHERE id_orden_prod = p_id_orden_prod;

  EXCEPTION
    WHEN OTHERS THEN
      -- Permite que el error suba a APEX (o al entorno de ejecucion) para hacer ROLLBACK
      RAISE;
  END finalizar_orden;

END pkg_produccion;
/
