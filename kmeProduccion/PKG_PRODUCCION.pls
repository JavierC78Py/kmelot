PROMPT CREATE OR REPLACE PACKAGE salotex.pkg_produccion
CREATE OR REPLACE PACKAGE salotex.pkg_produccion AS

  /*
   * Finaliza una Orden de Producción.
   * Genera Ajuste de Inventario (Salida de Insumos + Entrada de Producto Terminado).
   */
  PROCEDURE finalizar_orden (
    p_id_orden_prod IN NUMBER,
    p_usuario       IN VARCHAR2 DEFAULT NVL(v('APP_USER'), USER)
  );

  PROCEDURE cargar_insumos_orden (
    p_id_orden_prod IN NUMBER
  );

  /*
   * Retorna el Costo Promedio Ponderado de un producto,
   * considerando compras con fecha_factura <= p_fecha_tope.
   */
  FUNCTION get_costo_promedio (
    p_id_producto  IN NUMBER,
    p_fecha_tope   IN DATE
  ) RETURN NUMBER;

  /*
   * Retorna el Costo de la Última Compra de un producto,
   * considerando compras con fecha_factura <= p_fecha_tope.
   */
  FUNCTION get_costo_ultima_compra (
    p_id_producto  IN NUMBER,
    p_fecha_tope   IN DATE
  ) RETURN NUMBER;

  /*
   * Calcula y actualiza los costos de materiales de una Orden de Producción.
   * p_metodo_costeo: 'PROMEDIO' o 'ULTIMA_COMPRA'
   */
  PROCEDURE calcular_costos_orden (
    p_id_orden_prod  IN NUMBER,
    p_metodo_costeo  IN VARCHAR2
  );

END pkg_produccion;
/

PROMPT CREATE OR REPLACE PACKAGE BODY salotex.pkg_produccion
CREATE OR REPLACE PACKAGE BODY salotex.pkg_produccion AS

  FUNCTION get_costo_promedio (
    p_id_producto  IN NUMBER,
    p_fecha_tope   IN DATE
  ) RETURN NUMBER
  IS
    v_costo NUMBER := 0;
  BEGIN
    SELECT NVL(
             CASE
               WHEN SUM(d.cantidad) > 0
               THEN SUM(d.cantidad * d.precio_unitario) / SUM(d.cantidad)
               ELSE 0
             END, 0)
      INTO v_costo
      FROM salotex.det_factura_compra d
      JOIN salotex.cab_factura_compra c
        ON d.fac_id_factura_compra = c.id_factura_compra
     WHERE d.pro_id_producto = p_id_producto
       AND c.fecha_factura   <= TRUNC(p_fecha_tope);

    RETURN ROUND(v_costo, 2);
  END get_costo_promedio;

  -- =====================================================================
  -- Precio unitario de la factura de compra más reciente <= fecha tope
  -- =====================================================================
  FUNCTION get_costo_ultima_compra (
    p_id_producto  IN NUMBER,
    p_fecha_tope   IN DATE
  ) RETURN NUMBER
  IS
    v_costo NUMBER := 0;
  BEGIN
    SELECT NVL(precio_unitario, 0)
      INTO v_costo
      FROM (
        SELECT d.precio_unitario
          FROM salotex.det_factura_compra d
          JOIN salotex.cab_factura_compra c
            ON d.fac_id_factura_compra = c.id_factura_compra
         WHERE d.pro_id_producto = p_id_producto
           AND c.fecha_factura   <= TRUNC(p_fecha_tope)
         ORDER BY c.fecha_factura DESC, c.id_factura_compra DESC
      )
     WHERE ROWNUM = 1;

    RETURN ROUND(v_costo, 2);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN 0;
  END get_costo_ultima_compra;

  -- =====================================================================
  -- Actualiza costo_unitario y costo_total en DET_ORDEN_PRODUCCION_MAT
  -- y el costo_total_estimado en la cabecera
  -- =====================================================================
  PROCEDURE calcular_costos_orden (
    p_id_orden_prod  IN NUMBER,
    p_metodo_costeo  IN VARCHAR2
  ) IS
    v_fecha_orden     DATE;
    v_costo_unitario  NUMBER;
    v_costo_total_mat NUMBER := 0;
    v_costo_total_ope NUMBER := 0;
  BEGIN
    -- Obtener la fecha de la orden como tope
    SELECT fecha_orden
    INTO v_fecha_orden
    FROM cab_orden_produccion
    WHERE id_orden_prod = p_id_orden_prod;

    -- Recorrer cada material y calcular su costo
    FOR r IN (
      SELECT id_det_orden_mat,
             pro_id_producto_mat,
             NVL(cantidad_real_consumida, cantidad_estimada) AS cantidad
       FROM det_orden_produccion_mat
       WHERE ord_id_orden_prod = p_id_orden_prod
    ) LOOP
      -- Obtener costo según método
      IF UPPER(p_metodo_costeo) = 'PROMEDIO' THEN
        v_costo_unitario := get_costo_promedio(r.pro_id_producto_mat, v_fecha_orden);
      ELSIF UPPER(p_metodo_costeo) = 'ULTIMA_COMPRA' THEN
        v_costo_unitario := get_costo_ultima_compra(r.pro_id_producto_mat, v_fecha_orden);
      ELSE
        RAISE_APPLICATION_ERROR(-20010,'Método de costeo no válido: ' || p_metodo_costeo || '. Use PROMEDIO o ULTIMA_COMPRA.');
      END IF;

      -- Actualizar el detalle de material
      UPDATE salotex.det_orden_produccion_mat
         SET costo_unitario = v_costo_unitario,
             costo_total    = v_costo_unitario * r.cantidad
       WHERE id_det_orden_mat = r.id_det_orden_mat;

      v_costo_total_mat := v_costo_total_mat + (v_costo_unitario * r.cantidad);
    END LOOP;

    -- Sumar costos operativos
    SELECT NVL(SUM(costo_real_total), 0)
      INTO v_costo_total_ope
      FROM salotex.det_orden_produccion_ope
     WHERE orp_id_orden_prod = p_id_orden_prod;

    -- Actualizar costo total estimado en la cabecera
    UPDATE salotex.cab_orden_produccion
       SET costo_total_estimado = v_costo_total_mat + v_costo_total_ope
     WHERE id_orden_prod = p_id_orden_prod;

  END calcular_costos_orden;

  -- =====================================================================
  -- PROCEDIMIENTO: finalizar_orden (existente, sin cambios)
  -- =====================================================================
  PROCEDURE finalizar_orden (
    p_id_orden_prod IN NUMBER,
    p_usuario       IN VARCHAR2 DEFAULT NVL(v('APP_USER'), USER)
  ) IS
    v_estado_actual     VARCHAR2(20);
    v_id_ajuste         NUMBER;
    v_sucursal          NUMBER;
    v_deposito_orig     NUMBER;
    v_deposito_dest     NUMBER;
    v_producto_fin      NUMBER;
    v_cantidad_producir NUMBER;
    v_costo_total_orden NUMBER := 0;
    v_moneda_local      NUMBER := 1;
    v_tipo_cambio       NUMBER := 1;
    v_unidad_medida_fin NUMBER;
  BEGIN
    SELECT estado
          ,suc_id_sucursal
          ,dep_id_deposito_orig
          ,dep_id_deposito_dest
          ,pro_id_producto_fin
          ,cantidad_a_producir
    INTO v_estado_actual
        ,v_sucursal
        ,v_deposito_orig
        ,v_deposito_dest
        ,v_producto_fin
        ,v_cantidad_producir
    FROM cab_orden_produccion
    WHERE id_orden_prod = p_id_orden_prod;

    IF v_estado_actual = 'FINALIZADO' THEN
      Raise_Application_Error(-20001, 'La orden de producción ya se encuentra FINALIZADA.');
    ELSIF v_estado_actual = 'ANULADO' THEN
      Raise_Application_Error(-20002, 'No se puede finalizar una orden ANULADA.');
    END IF;

    SELECT r.uni_id_unidad_medida
    INTO v_unidad_medida_fin
    FROM cab_orden_produccion o
        ,cab_receta_produccion r
    WHERE o.id_orden_prod = P_ID_ORDEN_PROD
    AND r.id_receta = o.rec_id_receta;

    -- 2. Crear Cabecera del Ajuste de Inventario
    INSERT INTO cab_ajuste_inventario (
        fecha_ajuste
      , suc_id_sucursal
      , mon_id_moneda
      , tipo_cambio
      , monto
      , observacion
      , estado
      , usuario_registro
      , fecha_registro
    ) VALUES (
        Trunc(SYSDATE)
      , v_sucursal
      , v_moneda_local
      , v_tipo_cambio
      , 0
      , 'Ajuste automático generado por Finalización de Orden de Producción #' || P_ID_ORDEN_PROD
      , 'ACTIVO'
      , P_USUARIO
      , SYSDATE
    ) RETURNING id_ajuste INTO v_id_ajuste;

    -- 3. Detalles Negativos (Salida de Materia Prima)
    FOR c_mat IN (
      SELECT  pro_id_producto_mat
            , uni_id_unidad_medida
            , cantidad_real_consumida
            , costo_unitario
            , costo_total
      FROM det_orden_produccion_mat
      WHERE ord_id_orden_prod = p_id_orden_prod
    ) LOOP
      v_costo_total_orden := v_costo_total_orden + NVL(c_mat.costo_total, 0);
      INSERT INTO det_ajuste_inventario (
          aju_id_ajuste
        , pro_id_producto
        , descripcion
        , uni_id_unidad_medida
        , precio_unitario
        , cantidad
        , monto
        , dep_id_deposito
      ) VALUES (
          v_id_ajuste
        , c_mat.pro_id_producto_mat
        , 'Consumo de Materia Prima OP #' || P_ID_ORDEN_PROD
        , c_mat.uni_id_unidad_medida
        , NVL(c_mat.costo_unitario, 0)
        , c_mat.cantidad_real_consumida * -1
        , NVL(c_mat.costo_total, 0) * -1
        , v_deposito_orig
      );
    END LOOP;

    -- 4. Sumar Costos Operativos
    FOR c_ope IN (
      SELECT costo_real_total
        FROM det_orden_produccion_ope
       WHERE orp_id_orden_prod = p_id_orden_prod
    ) LOOP
      v_costo_total_orden := v_costo_total_orden + NVL(c_ope.costo_real_total, 0);
    END LOOP;

    -- 5. Detalle Positivo (Ingreso de Producto Terminado)
    INSERT INTO det_ajuste_inventario (
        aju_id_ajuste
      , pro_id_producto
      , descripcion
      , uni_id_unidad_medida
      , precio_unitario
      , cantidad
      , monto
      , dep_id_deposito
    ) VALUES (
        v_id_ajuste
      , v_producto_fin
      , 'Ingreso de Producto Terminado OP #' || P_ID_ORDEN_PROD
      , v_unidad_medida_fin
      , CASE WHEN v_cantidad_producir > 0 THEN v_costo_total_orden / v_cantidad_producir ELSE 0 END
      , v_cantidad_producir
      , v_costo_total_orden
      , v_deposito_dest
    );

    -- 6. Actualizar Estado y Costo Real
    UPDATE cab_orden_produccion
    SET estado = 'FINALIZADO',
        fecha_fin_real = TRUNC(SYSDATE),
        costo_total_real = v_costo_total_orden
    WHERE id_orden_prod = p_id_orden_prod;
  END finalizar_orden;

  PROCEDURE cargar_insumos_orden (
    p_id_orden_prod IN NUMBER
  ) IS
    v_receta              NUMBER;
    v_cantidad_a_producir NUMBER;
    v_cantidad_base       NUMBER;
    v_count_insumos       NUMBER;
  BEGIN
    SELECT o.rec_id_receta, o.cantidad_a_producir, NVL(r.cantidad_base, 1)
      INTO v_receta, v_cantidad_a_producir, v_cantidad_base
      FROM cab_orden_produccion o
          ,cab_receta_produccion r
     WHERE o.id_orden_prod = P_ID_ORDEN_PROD
     AND r.id_receta = o.rec_id_receta;

    SELECT COUNT(*)
    INTO v_count_insumos
    FROM det_orden_produccion_mat
    WHERE ord_id_orden_prod = P_ID_ORDEN_PROD;

    IF v_count_insumos > 0 THEN
      RAISE_APPLICATION_ERROR(-20003,'La orden ya tiene insumos cargados. Por favor borre los detalles actuales de la grilla antes de volver a cargarlos desde la receta.');
    END IF;

    INSERT INTO det_orden_produccion_mat (
      ord_id_orden_prod, pro_id_producto_mat, uni_id_unidad_medida,
      cantidad_estimada, cantidad_real_consumida, costo_unitario, costo_total
    )
    SELECT p_id_orden_prod
          ,pro_id_producto_mat
          ,uni_id_unidad_medida
          ,(cantidad_requerida / v_cantidad_base) * v_cantidad_a_producir
          ,(cantidad_requerida / v_cantidad_base) * v_cantidad_a_producir
          ,0
          ,0
      FROM det_receta_produccion
     WHERE rec_id_receta = v_receta;

    INSERT INTO det_orden_produccion_ope (
      orp_id_orden_prod, descripcion, tipo_costo, costo_real_total
    )
    SELECT p_id_orden_prod, descripcion, tipo_costo, costo_estimado
      FROM det_receta_produccion_ope
     WHERE rec_id_receta = v_receta;

  END cargar_insumos_orden;

END pkg_produccion;
/
