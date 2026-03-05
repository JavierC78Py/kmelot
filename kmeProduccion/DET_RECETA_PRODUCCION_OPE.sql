PROMPT CREATE TABLE salotex.det_receta_produccion_ope
CREATE TABLE salotex.det_receta_produccion_ope (
  id_det_receta_ope    NUMBER(10,0)      NOT NULL,
  rec_id_receta        NUMBER(10,0)      NOT NULL,
  descripcion          VARCHAR2(200)     NOT NULL,
  tipo_costo           VARCHAR2(50)      NOT NULL,
  costo_estimado       NUMBER(18,2)      NOT NULL,
  estado               VARCHAR2(10)      NOT NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.det_receta_produccion_ope ADD CONSTRAINT det_receta_ope_estado_ck CHECK
ALTER TABLE salotex.det_receta_produccion_ope
  ADD CONSTRAINT det_receta_ope_estado_ck CHECK (
    estado IN ('ACTIVO', 'INACTIVO')
  )
/

PROMPT ALTER TABLE salotex.det_receta_produccion_ope ADD CONSTRAINT det_receta_ope_tipo_ck CHECK
ALTER TABLE salotex.det_receta_produccion_ope
  ADD CONSTRAINT det_receta_ope_tipo_ck CHECK (
    tipo_costo IN ('FIJO_POR_ORDEN', 'VARIABLE_POR_UNIDAD')
  )
/

PROMPT ALTER TABLE salotex.det_receta_produccion_ope ADD CONSTRAINT det_receta_ope_pk PRIMARY KEY
ALTER TABLE salotex.det_receta_produccion_ope
  ADD CONSTRAINT det_receta_ope_pk PRIMARY KEY (
    id_det_receta_ope
  )
  USING INDEX INITRANS 20 STORAGE (NEXT 1024 K)
/

PROMPT ALTER TABLE salotex.det_receta_produccion_ope ADD CONSTRAINT det_receta_ope_cab_fk FOREIGN KEY
ALTER TABLE salotex.det_receta_produccion_ope
  ADD CONSTRAINT det_receta_ope_cab_fk FOREIGN KEY (
    rec_id_receta
  ) REFERENCES salotex.cab_receta_produccion (
    id_receta
  )
/

PROMPT CREATE SEQUENCE salotex.seq_det_receta_produccion_ope
CREATE SEQUENCE salotex.seq_det_receta_produccion_ope
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
/

PROMPT CREATE OR REPLACE TRIGGER salotex.det_receta_produccion_ope_bt
CREATE OR REPLACE TRIGGER salotex.det_receta_produccion_ope_bt BEFORE
    INSERT ON salotex.det_receta_produccion_ope
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
BEGIN
  IF INSERTING THEN
    IF :new.id_det_receta_ope IS NULL THEN
      :new.id_det_receta_ope := seq_det_receta_produccion_ope.nextval;
    END IF;
  END IF;
END;
/

PROMPT CREATE TABLE salotex.det_receta_produccion_ope_jn
CREATE TABLE salotex.det_receta_produccion_ope_jn (
  jn_operation         VARCHAR2(3) NOT NULL,
  jn_oracle_user       VARCHAR2(30) NOT NULL,
  jn_datetime          DATE NOT NULL,
  jn_notes             VARCHAR2(240),
  jn_appln             VARCHAR2(35),
  jn_session           NUMBER(38),
  id_det_receta_ope    NUMBER(10,0),
  rec_id_receta        NUMBER(10,0),
  descripcion          VARCHAR2(200),
  tipo_costo           VARCHAR2(50),
  costo_estimado       NUMBER(18,2),
  estado               VARCHAR2(10)
)
/

PROMPT CREATE OR REPLACE TRIGGER salotex.det_rec_prod_ope_jntrg
CREATE OR REPLACE TRIGGER salotex.det_rec_prod_ope_jntrg
  AFTER INSERT OR UPDATE OR DELETE ON salotex.det_receta_produccion_ope FOR EACH ROW
DECLARE
  rec SALOTEX.DET_RECETA_PRODUCCION_OPE_JN%ROWTYPE;
  blank SALOTEX.DET_RECETA_PRODUCCION_OPE_JN%ROWTYPE;
BEGIN
  rec := blank;
  IF INSERTING OR UPDATING THEN
    rec.id_det_receta_ope := :NEW.id_det_receta_ope;
    rec.rec_id_receta     := :NEW.rec_id_receta;
    rec.descripcion       := :NEW.descripcion;
    rec.tipo_costo        := :NEW.tipo_costo;
    rec.costo_estimado    := :NEW.costo_estimado;
    rec.estado            := :NEW.estado;
    rec.jn_datetime       := SYSDATE;
    rec.jn_oracle_user    := NVL(V('APP_USER'),USER);
    rec.jn_appln          := SYS_CONTEXT ('USERENV', 'MODULE');
    rec.jn_session        := SYS_CONTEXT ('USERENV', 'SESSIONID');
    IF INSERTING THEN
      rec.jn_operation := 'INS';
    ELSIF UPDATING THEN
      rec.jn_operation := 'UPD';
    END IF;
  ELSIF DELETING THEN
    rec.id_det_receta_ope := :OLD.id_det_receta_ope;
    rec.rec_id_receta     := :OLD.rec_id_receta;
    rec.descripcion       := :OLD.descripcion;
    rec.tipo_costo        := :OLD.tipo_costo;
    rec.costo_estimado    := :OLD.costo_estimado;
    rec.estado            := :OLD.estado;
    rec.jn_datetime       := SYSDATE;
    rec.jn_oracle_user    := NVL(V('APP_USER'),USER);
    rec.jn_appln          := SYS_CONTEXT ('USERENV', 'MODULE');
    rec.jn_session        := SYS_CONTEXT ('USERENV', 'SESSIONID');
    rec.jn_operation      := 'DEL';
  END IF;
  INSERT INTO SALOTEX.DET_RECETA_PRODUCCION_OPE_JN VALUES rec;
END;
/
