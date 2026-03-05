PROMPT CREATE TABLE salotex.det_orden_produccion_mat
CREATE TABLE salotex.det_orden_produccion_mat (
  id_det_orden_mat        NUMBER(10,0)      NOT NULL,
  orp_id_orden_prod       NUMBER(10,0)      NOT NULL,
  pro_id_producto_mat     NUMBER(10,0)      NOT NULL,
  uni_id_unidad_medida    NUMBER(10,0)      NOT NULL,
  cantidad_estimada       NUMBER(15,3)      NOT NULL,
  cantidad_real_consumida NUMBER(15,3)      NULL,
  costo_unitario          NUMBER(18,2)      NULL,
  costo_total             NUMBER(18,2)      NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.det_orden_produccion_mat ADD CONSTRAINT det_orden_mat_pk PRIMARY KEY
ALTER TABLE salotex.det_orden_produccion_mat
  ADD CONSTRAINT det_orden_mat_pk PRIMARY KEY (
    id_det_orden_mat
  )
  USING INDEX INITRANS 20 STORAGE (NEXT 1024 K)
/

PROMPT ALTER TABLE salotex.det_orden_produccion_mat ADD CONSTRAINT det_orden_mat_cab_fk FOREIGN KEY
ALTER TABLE salotex.det_orden_produccion_mat
  ADD CONSTRAINT det_orden_mat_cab_fk FOREIGN KEY (
    orp_id_orden_prod
  ) REFERENCES salotex.cab_orden_produccion (
    id_orden_prod
  )
/

PROMPT ALTER TABLE salotex.det_orden_produccion_mat ADD CONSTRAINT det_orden_mat_prod_fk FOREIGN KEY
ALTER TABLE salotex.det_orden_produccion_mat
  ADD CONSTRAINT det_orden_mat_prod_fk FOREIGN KEY (
    pro_id_producto_mat
  ) REFERENCES salotex.producto (
    id_producto
  )
/

PROMPT ALTER TABLE salotex.det_orden_produccion_mat ADD CONSTRAINT det_orden_mat_uni_fk FOREIGN KEY
ALTER TABLE salotex.det_orden_produccion_mat
  ADD CONSTRAINT det_orden_mat_uni_fk FOREIGN KEY (
    uni_id_unidad_medida
  ) REFERENCES salotex.unidad_medida (
    id_unidad_medida
  )
/

PROMPT CREATE SEQUENCE salotex.seq_det_orden_produccion_mat
CREATE SEQUENCE salotex.seq_det_orden_produccion_mat
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
/

PROMPT CREATE OR REPLACE TRIGGER salotex.det_orden_produccion_mat_bt
CREATE OR REPLACE TRIGGER salotex.det_orden_produccion_mat_bt BEFORE
    INSERT ON salotex.det_orden_produccion_mat
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
BEGIN
  IF INSERTING THEN
    IF :new.id_det_orden_mat IS NULL THEN
      :new.id_det_orden_mat := seq_det_orden_produccion_mat.nextval;
    END IF;
  END IF;
END;
/

PROMPT CREATE TABLE salotex.det_orden_produccion_mat_jn
CREATE TABLE salotex.det_orden_produccion_mat_jn (
  jn_operation            VARCHAR2(3) NOT NULL,
  jn_oracle_user          VARCHAR2(30) NOT NULL,
  jn_datetime             DATE NOT NULL,
  jn_notes                VARCHAR2(240),
  jn_appln                VARCHAR2(35),
  jn_session              NUMBER(38),
  id_det_orden_mat        NUMBER(10,0),
  orp_id_orden_prod       NUMBER(10,0),
  pro_id_producto_mat     NUMBER(10,0),
  uni_id_unidad_medida    NUMBER(10,0),
  cantidad_estimada       NUMBER(15,3),
  cantidad_real_consumida NUMBER(15,3),
  costo_unitario          NUMBER(18,2),
  costo_total             NUMBER(18,2)
)
/

PROMPT CREATE OR REPLACE TRIGGER salotex.det_ord_prod_mat_jntrg
CREATE OR REPLACE TRIGGER salotex.det_ord_prod_mat_jntrg
  AFTER INSERT OR UPDATE OR DELETE ON salotex.det_orden_produccion_mat FOR EACH ROW
DECLARE
  rec SALOTEX.DET_ORDEN_PRODUCCION_MAT_JN%ROWTYPE;
  blank SALOTEX.DET_ORDEN_PRODUCCION_MAT_JN%ROWTYPE;
BEGIN
  rec := blank;
  IF INSERTING OR UPDATING THEN
    rec.id_det_orden_mat        := :NEW.id_det_orden_mat;
    rec.orp_id_orden_prod       := :NEW.orp_id_orden_prod;
    rec.pro_id_producto_mat     := :NEW.pro_id_producto_mat;
    rec.uni_id_unidad_medida    := :NEW.uni_id_unidad_medida;
    rec.cantidad_estimada       := :NEW.cantidad_estimada;
    rec.cantidad_real_consumida := :NEW.cantidad_real_consumida;
    rec.costo_unitario          := :NEW.costo_unitario;
    rec.costo_total             := :NEW.costo_total;
    rec.jn_datetime             := SYSDATE;
    rec.jn_oracle_user          := NVL(V('APP_USER'),USER);
    rec.jn_appln                := SYS_CONTEXT ('USERENV', 'MODULE');
    rec.jn_session              := SYS_CONTEXT ('USERENV', 'SESSIONID');
    IF INSERTING THEN
      rec.jn_operation := 'INS';
    ELSIF UPDATING THEN
      rec.jn_operation := 'UPD';
    END IF;
  ELSIF DELETING THEN
    rec.id_det_orden_mat        := :OLD.id_det_orden_mat;
    rec.orp_id_orden_prod       := :OLD.orp_id_orden_prod;
    rec.pro_id_producto_mat     := :OLD.pro_id_producto_mat;
    rec.uni_id_unidad_medida    := :OLD.uni_id_unidad_medida;
    rec.cantidad_estimada       := :OLD.cantidad_estimada;
    rec.cantidad_real_consumida := :OLD.cantidad_real_consumida;
    rec.costo_unitario          := :OLD.costo_unitario;
    rec.costo_total             := :OLD.costo_total;
    rec.jn_datetime             := SYSDATE;
    rec.jn_oracle_user          := NVL(V('APP_USER'),USER);
    rec.jn_appln                := SYS_CONTEXT ('USERENV', 'MODULE');
    rec.jn_session              := SYS_CONTEXT ('USERENV', 'SESSIONID');
    rec.jn_operation            := 'DEL';
  END IF;
  INSERT INTO SALOTEX.DET_ORDEN_PRODUCCION_MAT_JN VALUES rec;
END;
/
