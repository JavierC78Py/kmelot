PROMPT CREATE TABLE salotex.det_factura_compra
CREATE TABLE salotex.det_factura_compra (
  id_det_factura_compra NUMBER(10,0)       NOT NULL,
  fac_id_factura_compra NUMBER(10,0)       NOT NULL,
  pro_id_producto       NUMBER(10,0)       NOT NULL,
  descripcion           VARCHAR2(100 CHAR) NOT NULL,
  iva_id_iva            NUMBER(10,0)       NOT NULL,
  uni_id_unidad_medida  NUMBER(10,0)       NOT NULL,
  precio_unitario       NUMBER(18,2)       NOT NULL,
  cantidad              NUMBER(12,4)       NOT NULL,
  exento                NUMBER(18,2)       NOT NULL,
  gravado               NUMBER(18,2)       NOT NULL,
  iva                   NUMBER(18,2)       NOT NULL,
  monto_descuento       NUMBER(18,2)       NULL,
  porc_descuento        NUMBER(6,2)        NULL,
  lote                  VARCHAR2(10 CHAR)  NULL,
  vencimiento           DATE               NULL,
  total                 NUMBER(18,2)       NULL,
  cen_id_centro_costo   NUMBER(18,2)       NULL,
  dep_id_deposito       NUMBER(10,0)       NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.det_factura_compra ADD CONSTRAINT det_factura_compra_pk PRIMARY KEY
ALTER TABLE salotex.det_factura_compra
  ADD CONSTRAINT det_factura_compra_pk PRIMARY KEY (
    id_det_factura_compra
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.det_factura_compra ADD CONSTRAINT det_factura_compra_cab_factura_compra_fk FOREIGN KEY
ALTER TABLE salotex.det_factura_compra
  ADD CONSTRAINT det_factura_compra_cab_factura_compra_fk FOREIGN KEY (
    fac_id_factura_compra
  ) REFERENCES salotex.cab_factura_compra (
    id_factura_compra
  )
/

PROMPT ALTER TABLE salotex.det_factura_compra ADD CONSTRAINT det_factura_compra_deposito_fk FOREIGN KEY
ALTER TABLE salotex.det_factura_compra
  ADD CONSTRAINT det_factura_compra_deposito_fk FOREIGN KEY (
    dep_id_deposito
  ) REFERENCES salotex.deposito (
    id_deposito
  )
/

PROMPT ALTER TABLE salotex.det_factura_compra ADD CONSTRAINT det_factura_compra_iva_fk FOREIGN KEY
ALTER TABLE salotex.det_factura_compra
  ADD CONSTRAINT det_factura_compra_iva_fk FOREIGN KEY (
    iva_id_iva
  ) REFERENCES salotex.iva (
    id_iva
  )
/

PROMPT ALTER TABLE salotex.det_factura_compra ADD CONSTRAINT det_factura_compra_producto_fk FOREIGN KEY
ALTER TABLE salotex.det_factura_compra
  ADD CONSTRAINT det_factura_compra_producto_fk FOREIGN KEY (
    pro_id_producto
  ) REFERENCES salotex.producto (
    id_producto
  )
/

PROMPT ALTER TABLE salotex.det_factura_compra ADD CONSTRAINT det_factura_compra_unidad_medida_fk FOREIGN KEY
ALTER TABLE salotex.det_factura_compra
  ADD CONSTRAINT det_factura_compra_unidad_medida_fk FOREIGN KEY (
    uni_id_unidad_medida
  ) REFERENCES salotex.unidad_medida (
    id_unidad_medida
  )
/

PROMPT ALTER TABLE salotex.det_factura_compra ADD CONSTRAINT det_fact_compra_ccosto_fk FOREIGN KEY
ALTER TABLE salotex.det_factura_compra
  ADD CONSTRAINT det_fact_compra_ccosto_fk FOREIGN KEY (
    cen_id_centro_costo
  ) REFERENCES salotex.centro_costo (
    id_centro_costo
  )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.det_factura_compra_bt
CREATE OR REPLACE TRIGGER salotex.det_factura_compra_bt BEFORE
    INSERT ON salotex.det_factura_compra
    FOR EACH ROW

WHEN ( new.id_det_factura_compra IS NULL )
BEGIN
    :new.id_det_factura_compra := seq_det_factura_compra.nextval;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.det_factura_compra_jntrg
CREATE OR REPLACE TRIGGER salotex.det_factura_compra_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.det_factura_compra for each row

Declare
  rec SALOTEX.DET_FACTURA_COMPRA_JN%ROWTYPE;
  blank SALOTEX.DET_FACTURA_COMPRA_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_DET_FACTURA_COMPRA := :NEW.ID_DET_FACTURA_COMPRA;
      rec.FAC_ID_FACTURA_COMPRA := :NEW.FAC_ID_FACTURA_COMPRA;
      rec.PRO_ID_PRODUCTO := :NEW.PRO_ID_PRODUCTO;
      rec.DESCRIPCION := :NEW.DESCRIPCION;
      rec.IVA_ID_IVA := :NEW.IVA_ID_IVA;
      rec.UNI_ID_UNIDAD_MEDIDA := :NEW.UNI_ID_UNIDAD_MEDIDA;
      rec.PRECIO_UNITARIO := :NEW.PRECIO_UNITARIO;
      rec.CANTIDAD := :NEW.CANTIDAD;
      rec.EXENTO := :NEW.EXENTO;
      rec.GRAVADO := :NEW.GRAVADO;
      rec.IVA := :NEW.IVA;
      rec.MONTO_DESCUENTO := :NEW.MONTO_DESCUENTO;
      rec.PORC_DESCUENTO := :NEW.PORC_DESCUENTO;
      rec.LOTE := :NEW.LOTE;
      rec.VENCIMIENTO := :NEW.VENCIMIENTO;
      rec.TOTAL := :NEW.TOTAL;
      rec.CEN_ID_CENTRO_COSTO := :NEW.CEN_ID_CENTRO_COSTO;
      rec.DEP_ID_DEPOSITO := :NEW.DEP_ID_DEPOSITO;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      IF INSERTING THEN
        rec.JN_OPERATION := 'INS';
      ELSIF UPDATING THEN
        rec.JN_OPERATION := 'UPD';
      END IF;
    ELSIF DELETING THEN
      rec.ID_DET_FACTURA_COMPRA := :OLD.ID_DET_FACTURA_COMPRA;
      rec.FAC_ID_FACTURA_COMPRA := :OLD.FAC_ID_FACTURA_COMPRA;
      rec.PRO_ID_PRODUCTO := :OLD.PRO_ID_PRODUCTO;
      rec.DESCRIPCION := :OLD.DESCRIPCION;
      rec.IVA_ID_IVA := :OLD.IVA_ID_IVA;
      rec.UNI_ID_UNIDAD_MEDIDA := :OLD.UNI_ID_UNIDAD_MEDIDA;
      rec.PRECIO_UNITARIO := :OLD.PRECIO_UNITARIO;
      rec.CANTIDAD := :OLD.CANTIDAD;
      rec.EXENTO := :OLD.EXENTO;
      rec.GRAVADO := :OLD.GRAVADO;
      rec.IVA := :OLD.IVA;
      rec.MONTO_DESCUENTO := :OLD.MONTO_DESCUENTO;
      rec.PORC_DESCUENTO := :OLD.PORC_DESCUENTO;
      rec.LOTE := :OLD.LOTE;
      rec.VENCIMIENTO := :OLD.VENCIMIENTO;
      rec.TOTAL := :OLD.TOTAL;
      rec.CEN_ID_CENTRO_COSTO := :OLD.CEN_ID_CENTRO_COSTO;
      rec.DEP_ID_DEPOSITO := :OLD.DEP_ID_DEPOSITO;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.DET_FACTURA_COMPRA_JN VALUES rec;
  END;
/


