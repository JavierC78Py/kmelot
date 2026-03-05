PROMPT CREATE TABLE salotex.det_ajuste_inventario
CREATE TABLE salotex.det_ajuste_inventario (
  id_detalle_ajuste    NUMBER(10,0)       NOT NULL,
  aju_id_ajuste        NUMBER(10,0)       NOT NULL,
  pro_id_producto      NUMBER(10,0)       NOT NULL,
  descripcion          VARCHAR2(100 CHAR) NULL,
  uni_id_unidad_medida NUMBER(10,0)       NOT NULL,
  precio_unitario      NUMBER(18,2)       NOT NULL,
  cantidad             NUMBER(12,4)       NOT NULL,
  monto                NUMBER(18,2)       NULL,
  lote                 VARCHAR2(10 CHAR)  NULL,
  vencimiento          DATE               NULL,
  cen_id_centro_costo  NUMBER(10,0)       NULL,
  dep_id_deposito      NUMBER(10,0)       NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.det_ajuste_inventario ADD CONSTRAINT det_ajuste_inventario_pk PRIMARY KEY
ALTER TABLE salotex.det_ajuste_inventario
  ADD CONSTRAINT det_ajuste_inventario_pk PRIMARY KEY (
    id_detalle_ajuste
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.det_ajuste_inventario ADD CONSTRAINT det_ajuste_invent_deposito_fk FOREIGN KEY
ALTER TABLE salotex.det_ajuste_inventario
  ADD CONSTRAINT det_ajuste_invent_deposito_fk FOREIGN KEY (
    dep_id_deposito
  ) REFERENCES salotex.deposito (
    id_deposito
  )
/

PROMPT ALTER TABLE salotex.det_ajuste_inventario ADD CONSTRAINT det_ajust_invent_ccosto_fk FOREIGN KEY
ALTER TABLE salotex.det_ajuste_inventario
  ADD CONSTRAINT det_ajust_invent_ccosto_fk FOREIGN KEY (
    cen_id_centro_costo
  ) REFERENCES salotex.centro_costo (
    id_centro_costo
  )
/

PROMPT ALTER TABLE salotex.det_ajuste_inventario ADD CONSTRAINT det_ajust_invent_producto_fk FOREIGN KEY
ALTER TABLE salotex.det_ajuste_inventario
  ADD CONSTRAINT det_ajust_invent_producto_fk FOREIGN KEY (
    pro_id_producto
  ) REFERENCES salotex.producto (
    id_producto
  )
/

PROMPT ALTER TABLE salotex.det_ajuste_inventario ADD CONSTRAINT det_ajus_invent_uni_medida_fk FOREIGN KEY
ALTER TABLE salotex.det_ajuste_inventario
  ADD CONSTRAINT det_ajus_invent_uni_medida_fk FOREIGN KEY (
    uni_id_unidad_medida
  ) REFERENCES salotex.unidad_medida (
    id_unidad_medida
  )
/

PROMPT ALTER TABLE salotex.det_ajuste_inventario ADD CONSTRAINT det_ajus_inv_cab_ajus_inv_fk FOREIGN KEY
ALTER TABLE salotex.det_ajuste_inventario
  ADD CONSTRAINT det_ajus_inv_cab_ajus_inv_fk FOREIGN KEY (
    aju_id_ajuste
  ) REFERENCES salotex.cab_ajuste_inventario (
    id_ajuste
  )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.det_ajuste_inventario_bt
CREATE OR REPLACE TRIGGER salotex.det_ajuste_inventario_bt BEFORE
    INSERT OR UPDATE OR DELETE ON salotex.det_ajuste_inventario
    FOR EACH ROW
BEGIN
  IF INSERTING THEN
    IF :new.id_detalle_ajuste IS NULL THEN
      :new.id_detalle_ajuste := seq_det_ajuste_inventario.nextval;
    END IF;

    UPDATE cab_ajuste_inventario c
    SET c.monto = c.monto + :new.monto
    WHERE c.id_ajuste = :new.aju_id_ajuste;

  END IF;
  IF UPDATING THEN
    IF if_update(:new.monto,:old.monto) THEN
      IF :new.monto > :old.monto THEN
        UPDATE cab_ajuste_inventario c
        SET c.monto = c.monto + (:new.monto - :old.monto)
        WHERE c.id_ajuste = :new.aju_id_ajuste;
      ELSE
        UPDATE cab_ajuste_inventario c
        SET c.monto = c.monto - (:old.monto - :new.monto)
        WHERE c.id_ajuste = :new.aju_id_ajuste;
      END IF;
    END IF;
  END IF;
  IF DELETING THEN
    UPDATE cab_ajuste_inventario c
    SET c.monto = (c.monto - :old.monto)
    WHERE c.id_ajuste = :old.aju_id_ajuste;
  END IF;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.det_ajuste_inventario_jntrg
CREATE OR REPLACE TRIGGER salotex.det_ajuste_inventario_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.det_ajuste_inventario for each row

Declare
  rec SALOTEX.DET_AJUSTE_INVENTARIO_JN%ROWTYPE;
  blank SALOTEX.DET_AJUSTE_INVENTARIO_JN%ROWTYPE;
  BEGIN
  	/* Javier Caballero */
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_DETALLE_AJUSTE := :NEW.ID_DETALLE_AJUSTE;
      rec.AJU_ID_AJUSTE := :NEW.AJU_ID_AJUSTE;
      rec.PRO_ID_PRODUCTO := :NEW.PRO_ID_PRODUCTO;
      rec.DESCRIPCION := :NEW.DESCRIPCION;
      rec.UNI_ID_UNIDAD_MEDIDA := :NEW.UNI_ID_UNIDAD_MEDIDA;
      rec.PRECIO_UNITARIO := :NEW.PRECIO_UNITARIO;
      rec.CANTIDAD := :NEW.CANTIDAD;
      rec.MONTO := :NEW.MONTO;
      rec.LOTE := :NEW.LOTE;
      rec.VENCIMIENTO := :NEW.VENCIMIENTO;
      rec.CEN_ID_CENTRO_COSTO := :NEW.CEN_ID_CENTRO_COSTO;
      rec.DEP_ID_DEPOSITO := :NEW.DEP_ID_DEPOSITO;
      rec.JN_DATETIME := SYSDATE;
      rec.JN_ORACLE_USER := Nvl(v('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      IF INSERTING THEN
        rec.JN_OPERATION := 'INS';
      ELSIF UPDATING THEN
        rec.JN_OPERATION := 'UPD';
      END IF;
    ELSIF DELETING THEN
      rec.ID_DETALLE_AJUSTE := :OLD.ID_DETALLE_AJUSTE;
      rec.AJU_ID_AJUSTE := :OLD.AJU_ID_AJUSTE;
      rec.PRO_ID_PRODUCTO := :OLD.PRO_ID_PRODUCTO;
      rec.DESCRIPCION := :OLD.DESCRIPCION;
      rec.UNI_ID_UNIDAD_MEDIDA := :OLD.UNI_ID_UNIDAD_MEDIDA;
      rec.PRECIO_UNITARIO := :OLD.PRECIO_UNITARIO;
      rec.CANTIDAD := :OLD.CANTIDAD;
      rec.MONTO := :OLD.MONTO;
      rec.LOTE := :OLD.LOTE;
      rec.VENCIMIENTO := :OLD.VENCIMIENTO;
      rec.CEN_ID_CENTRO_COSTO := :OLD.CEN_ID_CENTRO_COSTO;
      rec.DEP_ID_DEPOSITO := :OLD.DEP_ID_DEPOSITO;
      rec.JN_DATETIME := SYSDATE;
      rec.JN_ORACLE_USER := Nvl(v('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.DET_AJUSTE_INVENTARIO_JN VALUES rec;
  END;
/


