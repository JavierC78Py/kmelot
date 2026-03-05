PROMPT CREATE TABLE salotex.det_orden_produccion_ope
CREATE TABLE salotex.det_orden_produccion_ope (
  id_det_orden_ope        NUMBER(10,0)      NOT NULL,
  orp_id_orden_prod       NUMBER(10,0)      NOT NULL,
  descripcion             VARCHAR2(200)     NOT NULL,
  tipo_costo              VARCHAR2(50)      NOT NULL,
  costo_real_total        NUMBER(18,2)      NOT NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.det_orden_produccion_ope ADD CONSTRAINT det_orden_ope_tipo_ck CHECK
ALTER TABLE salotex.det_orden_produccion_ope
  ADD CONSTRAINT det_orden_ope_tipo_ck CHECK (
    tipo_costo IN ('FIJO_POR_ORDEN', 'VARIABLE_POR_UNIDAD')
  )
/

PROMPT ALTER TABLE salotex.det_orden_produccion_ope ADD CONSTRAINT det_orden_ope_pk PRIMARY KEY
ALTER TABLE salotex.det_orden_produccion_ope
  ADD CONSTRAINT det_orden_ope_pk PRIMARY KEY (
    id_det_orden_ope
  )
  USING INDEX INITRANS 20 STORAGE (NEXT 1024 K)
/

PROMPT ALTER TABLE salotex.det_orden_produccion_ope ADD CONSTRAINT det_orden_ope_cab_fk FOREIGN KEY
ALTER TABLE salotex.det_orden_produccion_ope
  ADD CONSTRAINT det_orden_ope_cab_fk FOREIGN KEY (
    orp_id_orden_prod
  ) REFERENCES salotex.cab_orden_produccion (
    id_orden_prod
  )
/

PROMPT CREATE SEQUENCE salotex.seq_det_orden_produccion_ope
CREATE SEQUENCE salotex.seq_det_orden_produccion_ope
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
/

PROMPT CREATE OR REPLACE TRIGGER salotex.det_orden_produccion_ope_bt
CREATE OR REPLACE TRIGGER salotex.det_orden_produccion_ope_bt BEFORE
    INSERT ON salotex.det_orden_produccion_ope
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
BEGIN
  IF INSERTING THEN
    IF :new.id_det_orden_ope IS NULL THEN
      :new.id_det_orden_ope := seq_det_orden_produccion_ope.nextval;
    END IF;
  END IF;
END;
/

PROMPT CREATE TABLE salotex.det_orden_produccion_ope_jn
CREATE TABLE salotex.det_orden_produccion_ope_jn (
  jn_operation         VARCHAR2(3) NOT NULL,
  jn_oracle_user       VARCHAR2(30) NOT NULL,
  jn_datetime          DATE NOT NULL,
  jn_notes             VARCHAR2(240),
  jn_appln             VARCHAR2(35),
  jn_session           NUMBER(38),
  id_det_orden_ope     NUMBER(10,0),
  orp_id_orden_prod    NUMBER(10,0),
  descripcion          VARCHAR2(200),
  tipo_costo           VARCHAR2(50),
  costo_real_total     NUMBER(18,2)
)
/

PROMPT CREATE OR REPLACE TRIGGER salotex.det_ord_prod_ope_jntrg
CREATE OR REPLACE TRIGGER salotex.det_ord_prod_ope_jntrg
  AFTER INSERT OR UPDATE OR DELETE ON salotex.det_orden_produccion_ope FOR EACH ROW
DECLARE
  rec SALOTEX.DET_ORDEN_PRODUCCION_OPE_JN%ROWTYPE;
  blank SALOTEX.DET_ORDEN_PRODUCCION_OPE_JN%ROWTYPE;
BEGIN
  rec := blank;
  IF INSERTING OR UPDATING THEN
    rec.id_det_orden_ope := :NEW.id_det_orden_ope;
    rec.orp_id_orden_prod := :NEW.orp_id_orden_prod;
    rec.descripcion := :NEW.descripcion;
    rec.tipo_costo := :NEW.tipo_costo;
    rec.costo_real_total := :NEW.costo_real_total;
    rec.jn_datetime := SYSDATE;
    rec.jn_oracle_user := NVL(V('APP_USER'),USER);
    rec.jn_appln := SYS_CONTEXT ('USERENV', 'MODULE');
    rec.jn_session := SYS_CONTEXT ('USERENV', 'SESSIONID');
    IF INSERTING THEN
      rec.jn_operation := 'INS';
    ELSIF UPDATING THEN
      rec.jn_operation := 'UPD';
    END IF;
  ELSIF DELETING THEN
    rec.id_det_orden_ope := :OLD.id_det_orden_ope;
    rec.orp_id_orden_prod := :OLD.orp_id_orden_prod;
    rec.descripcion := :OLD.descripcion;
    rec.tipo_costo := :OLD.tipo_costo;
    rec.costo_real_total := :OLD.costo_real_total;
    rec.jn_datetime := SYSDATE;
    rec.jn_oracle_user := NVL(V('APP_USER'),USER);
    rec.jn_appln := SYS_CONTEXT ('USERENV', 'MODULE');
    rec.jn_session := SYS_CONTEXT ('USERENV', 'SESSIONID');
    rec.jn_operation := 'DEL';
  END IF;
  INSERT INTO SALOTEX.DET_ORDEN_PRODUCCION_OPE_JN VALUES rec;
END;
/
