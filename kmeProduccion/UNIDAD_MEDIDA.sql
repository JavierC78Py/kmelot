PROMPT CREATE TABLE salotex.unidad_medida
CREATE TABLE salotex.unidad_medida (
  id_unidad_medida NUMBER(10,0)  NOT NULL,
  descripcion      VARCHAR2(200) NULL,
  abreviatura      VARCHAR2(3)   NULL,
  estado           VARCHAR2(10)  NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT CREATE INDEX salotex.uni_medi_abrev_uk
CREATE UNIQUE INDEX salotex.uni_medi_abrev_uk
  ON salotex.unidad_medida (
    abreviatura
  )
  INITRANS  20
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.unidad_medida ADD CONSTRAINT uma_pk PRIMARY KEY
ALTER TABLE salotex.unidad_medida
  ADD CONSTRAINT uma_pk PRIMARY KEY (
    id_unidad_medida
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.unidad_medida ADD CONSTRAINT uni_medi_desc_uk UNIQUE
ALTER TABLE salotex.unidad_medida
  ADD CONSTRAINT uni_medi_desc_uk UNIQUE (
    descripcion
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.unidad_id_uni_medi_ins
CREATE OR REPLACE TRIGGER salotex.unidad_id_uni_medi_ins BEFORE
    INSERT ON salotex.unidad_medida
    FOR EACH ROW


WHEN ( new.id_unidad_medida IS NULL )
BEGIN
    :new.id_unidad_medida := seq_unidad_medida.nextval;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.unidad_medida_jntrg
CREATE OR REPLACE TRIGGER salotex.unidad_medida_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.unidad_medida for each row

Declare
  rec SALOTEX.UNIDAD_MEDIDA_JN%ROWTYPE;
  blank SALOTEX.UNIDAD_MEDIDA_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_UNIDAD_MEDIDA := :NEW.ID_UNIDAD_MEDIDA;
      rec.DESCRIPCION := :NEW.DESCRIPCION;
      rec.ABREVIATURA := :NEW.ABREVIATURA;
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
      rec.ID_UNIDAD_MEDIDA := :OLD.ID_UNIDAD_MEDIDA;
      rec.DESCRIPCION := :OLD.DESCRIPCION;
      rec.ABREVIATURA := :OLD.ABREVIATURA;
      rec.ESTADO := :OLD.ESTADO;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.UNIDAD_MEDIDA_JN VALUES rec;
  END;
/


