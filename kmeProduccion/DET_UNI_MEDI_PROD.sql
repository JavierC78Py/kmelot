PROMPT CREATE TABLE salotex.det_uni_medi_prod
CREATE TABLE salotex.det_uni_medi_prod (
  id_det_uni_medi      NUMBER(10,0) NOT NULL,
  pro_id_producto      NUMBER(10,0) NULL,
  uni_id_unidad_medida NUMBER(10,0) NULL,
  estado               VARCHAR2(10) NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT CREATE INDEX salotex.det_uni_medi_prod_idx1
CREATE INDEX salotex.det_uni_medi_prod_idx1
  ON salotex.det_uni_medi_prod (
    pro_id_producto,
    uni_id_unidad_medida
  )
  INITRANS  20
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.det_uni_medi_prod ADD CONSTRAINT det_uni_medi_prod_estado_ck CHECK
ALTER TABLE salotex.det_uni_medi_prod
  ADD CONSTRAINT det_uni_medi_prod_estado_ck CHECK (
    estado IN ( 'ACTIVO', 'INACTIVO' )
  )
/

PROMPT ALTER TABLE salotex.det_uni_medi_prod ADD CONSTRAINT det_uni_medi_prod_pk PRIMARY KEY
ALTER TABLE salotex.det_uni_medi_prod
  ADD CONSTRAINT det_uni_medi_prod_pk PRIMARY KEY (
    id_det_uni_medi
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.det_uni_medi_prod ADD CONSTRAINT det_uni_medi_prod_uk UNIQUE
ALTER TABLE salotex.det_uni_medi_prod
  ADD CONSTRAINT det_uni_medi_prod_uk UNIQUE (
    pro_id_producto,
    uni_id_unidad_medida
  )
/

PROMPT ALTER TABLE salotex.det_uni_medi_prod ADD CONSTRAINT det_uni_medi_prod_prod_fk FOREIGN KEY
ALTER TABLE salotex.det_uni_medi_prod
  ADD CONSTRAINT det_uni_medi_prod_prod_fk FOREIGN KEY (
    pro_id_producto
  ) REFERENCES salotex.producto (
    id_producto
  )
/

PROMPT ALTER TABLE salotex.det_uni_medi_prod ADD CONSTRAINT det_uni_medi_prod_uni_fk FOREIGN KEY
ALTER TABLE salotex.det_uni_medi_prod
  ADD CONSTRAINT det_uni_medi_prod_uni_fk FOREIGN KEY (
    uni_id_unidad_medida
  ) REFERENCES salotex.unidad_medida (
    id_unidad_medida
  )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.det_uni_medi_prod_bt
CREATE OR REPLACE TRIGGER salotex.det_uni_medi_prod_bt BEFORE
    INSERT ON salotex.det_uni_medi_prod
    FOR EACH ROW

WHEN ( new.id_det_uni_medi IS NULL )
BEGIN
    :new.id_det_uni_medi := det_uni_medi_prod_seq.nextval;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.det_uni_medi_prod_jntrg
CREATE OR REPLACE TRIGGER salotex.det_uni_medi_prod_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.det_uni_medi_prod for each row

Declare
  rec SALOTEX.DET_UNI_MEDI_PROD_JN%ROWTYPE;
  blank SALOTEX.DET_UNI_MEDI_PROD_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_DET_UNI_MEDI := :NEW.ID_DET_UNI_MEDI;
      rec.PRO_ID_PRODUCTO := :NEW.PRO_ID_PRODUCTO;
      rec.UNI_ID_UNIDAD_MEDIDA := :NEW.UNI_ID_UNIDAD_MEDIDA;
      rec.ESTADO := :NEW.ESTADO;
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
      rec.ID_DET_UNI_MEDI := :OLD.ID_DET_UNI_MEDI;
      rec.PRO_ID_PRODUCTO := :OLD.PRO_ID_PRODUCTO;
      rec.UNI_ID_UNIDAD_MEDIDA := :OLD.UNI_ID_UNIDAD_MEDIDA;
      rec.ESTADO := :OLD.ESTADO;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.DET_UNI_MEDI_PROD_JN VALUES rec;
  END;
/


