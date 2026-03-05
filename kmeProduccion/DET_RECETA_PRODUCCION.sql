PROMPT CREATE TABLE salotex.det_receta_produccion
CREATE TABLE salotex.det_receta_produccion (
  id_det_receta        NUMBER(10,0)      NOT NULL,
  rec_id_receta        NUMBER(10,0)      NOT NULL,
  pro_id_producto_mat  NUMBER(10,0)      NOT NULL,
  uni_id_unidad_medida NUMBER(10,0)      NOT NULL,
  cantidad_requerida   NUMBER(15,3)      NOT NULL,
  mermas_porcentaje    NUMBER(5,2)       NULL,
  estado               VARCHAR2(10)      NOT NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.det_receta_produccion ADD CONSTRAINT det_receta_estado_ck CHECK
ALTER TABLE salotex.det_receta_produccion
  ADD CONSTRAINT det_receta_estado_ck CHECK (
    estado IN ('ACTIVO', 'INACTIVO')
  )
/

PROMPT ALTER TABLE salotex.det_receta_produccion ADD CONSTRAINT det_receta_pk PRIMARY KEY
ALTER TABLE salotex.det_receta_produccion
  ADD CONSTRAINT det_receta_pk PRIMARY KEY (
    id_det_receta
  )
  USING INDEX INITRANS 20 STORAGE (NEXT 1024 K)
/

PROMPT ALTER TABLE salotex.det_receta_produccion ADD CONSTRAINT det_receta_cab_fk FOREIGN KEY
ALTER TABLE salotex.det_receta_produccion
  ADD CONSTRAINT det_receta_cab_fk FOREIGN KEY (
    rec_id_receta
  ) REFERENCES salotex.cab_receta_produccion (
    id_receta
  )
/

PROMPT ALTER TABLE salotex.det_receta_produccion ADD CONSTRAINT det_receta_producto_mat_fk FOREIGN KEY
ALTER TABLE salotex.det_receta_produccion
  ADD CONSTRAINT det_receta_producto_mat_fk FOREIGN KEY (
    pro_id_producto_mat
  ) REFERENCES salotex.producto (
    id_producto
  )
/

PROMPT ALTER TABLE salotex.det_receta_produccion ADD CONSTRAINT det_receta_uni_medida_fk FOREIGN KEY
ALTER TABLE salotex.det_receta_produccion
  ADD CONSTRAINT det_receta_uni_medida_fk FOREIGN KEY (
    uni_id_unidad_medida
  ) REFERENCES salotex.unidad_medida (
    id_unidad_medida
  )
/

PROMPT CREATE SEQUENCE salotex.seq_det_receta_produccion
CREATE SEQUENCE salotex.seq_det_receta_produccion
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
/

PROMPT CREATE OR REPLACE TRIGGER salotex.det_receta_produccion_bt
CREATE OR REPLACE TRIGGER salotex.det_receta_produccion_bt BEFORE
    INSERT ON salotex.det_receta_produccion
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
BEGIN
  IF INSERTING THEN
    IF :new.id_det_receta IS NULL THEN
      :new.id_det_receta := seq_det_receta_produccion.nextval;
    END IF;
  END IF;
END;
/

PROMPT CREATE TABLE salotex.det_receta_produccion_jn
CREATE TABLE salotex.det_receta_produccion_jn (
  jn_operation         VARCHAR2(3) NOT NULL,
  jn_oracle_user       VARCHAR2(30) NOT NULL,
  jn_datetime          DATE NOT NULL,
  jn_notes             VARCHAR2(240),
  jn_appln             VARCHAR2(35),
  jn_session           NUMBER(38),
  id_det_receta        NUMBER(10,0),
  rec_id_receta        NUMBER(10,0),
  pro_id_producto_mat  NUMBER(10,0),
  uni_id_unidad_medida NUMBER(10,0),
  cantidad_requerida   NUMBER(15,3),
  mermas_porcentaje    NUMBER(5,2),
  estado               VARCHAR2(10)
)
/

PROMPT CREATE OR REPLACE TRIGGER salotex.det_receta_produccion_jntrg
CREATE OR REPLACE TRIGGER salotex.det_receta_produccion_jntrg
  AFTER INSERT OR UPDATE OR DELETE ON salotex.det_receta_produccion FOR EACH ROW
DECLARE
  rec SALOTEX.DET_RECETA_PRODUCCION_JN%ROWTYPE;
  blank SALOTEX.DET_RECETA_PRODUCCION_JN%ROWTYPE;
BEGIN
  rec := blank;
  IF INSERTING OR UPDATING THEN
    rec.id_det_receta        := :NEW.id_det_receta;
    rec.rec_id_receta        := :NEW.rec_id_receta;
    rec.pro_id_producto_mat  := :NEW.pro_id_producto_mat;
    rec.uni_id_unidad_medida := :NEW.uni_id_unidad_medida;
    rec.cantidad_requerida   := :NEW.cantidad_requerida;
    rec.mermas_porcentaje    := :NEW.mermas_porcentaje;
    rec.estado               := :NEW.estado;
    rec.jn_datetime          := SYSDATE;
    rec.jn_oracle_user       := NVL(V('APP_USER'),USER);
    rec.jn_appln             := SYS_CONTEXT ('USERENV', 'MODULE');
    rec.jn_session           := SYS_CONTEXT ('USERENV', 'SESSIONID');
    IF INSERTING THEN
      rec.jn_operation := 'INS';
    ELSIF UPDATING THEN
      rec.jn_operation := 'UPD';
    END IF;
  ELSIF DELETING THEN
    rec.id_det_receta        := :OLD.id_det_receta;
    rec.rec_id_receta        := :OLD.rec_id_receta;
    rec.pro_id_producto_mat  := :OLD.pro_id_producto_mat;
    rec.uni_id_unidad_medida := :OLD.uni_id_unidad_medida;
    rec.cantidad_requerida   := :OLD.cantidad_requerida;
    rec.mermas_porcentaje    := :OLD.mermas_porcentaje;
    rec.estado               := :OLD.estado;
    rec.jn_datetime          := SYSDATE;
    rec.jn_oracle_user       := NVL(V('APP_USER'),USER);
    rec.jn_appln             := SYS_CONTEXT ('USERENV', 'MODULE');
    rec.jn_session           := SYS_CONTEXT ('USERENV', 'SESSIONID');
    rec.jn_operation         := 'DEL';
  END IF;
  INSERT INTO SALOTEX.DET_RECETA_PRODUCCION_JN VALUES rec;
END;
/
