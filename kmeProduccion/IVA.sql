PROMPT CREATE TABLE salotex.iva
CREATE TABLE salotex.iva (
  id_iva        NUMBER(10,0)      NOT NULL,
  descripcion   VARCHAR2(50 CHAR) NOT NULL,
  porc_impuesto NUMBER(10,2)      NOT NULL,
  porc_gravado  NUMBER(10,2)      NOT NULL,
  estado        VARCHAR2(10 CHAR) NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.iva ADD CONSTRAINT iva_ck_estado_ck CHECK
ALTER TABLE salotex.iva
  ADD CONSTRAINT iva_ck_estado_ck CHECK (
    estado IN (
        'ACTIVO',
        'INACTIVO'
    )
  )
/

PROMPT ALTER TABLE salotex.iva ADD CONSTRAINT iva_pk PRIMARY KEY
ALTER TABLE salotex.iva
  ADD CONSTRAINT iva_pk PRIMARY KEY (
    id_iva
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.iva ADD CONSTRAINT iva_descrip_uk UNIQUE
ALTER TABLE salotex.iva
  ADD CONSTRAINT iva_descrip_uk UNIQUE (
    descripcion
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.iva ADD CONSTRAINT iva_porc_imp_uk UNIQUE
ALTER TABLE salotex.iva
  ADD CONSTRAINT iva_porc_imp_uk UNIQUE (
    porc_impuesto
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.iva_id_iva_ins
CREATE OR REPLACE TRIGGER salotex.iva_id_iva_ins BEFORE
    INSERT ON salotex.iva
    FOR EACH ROW


WHEN ( new.id_iva IS NULL )
BEGIN
    :new.id_iva := seq_iva.nextval;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.iva_jntrg
CREATE OR REPLACE TRIGGER salotex.iva_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.iva for each row

Declare
  rec SALOTEX.IVA_JN%ROWTYPE;
  blank SALOTEX.IVA_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_IVA := :NEW.ID_IVA;
      rec.DESCRIPCION := :NEW.DESCRIPCION;
      rec.PORC_IMPUESTO := :NEW.PORC_IMPUESTO;
      rec.PORC_GRAVADO := :NEW.PORC_GRAVADO;
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
      rec.ID_IVA := :OLD.ID_IVA;
      rec.DESCRIPCION := :OLD.DESCRIPCION;
      rec.PORC_IMPUESTO := :OLD.PORC_IMPUESTO;
      rec.PORC_GRAVADO := :OLD.PORC_GRAVADO;
      rec.ESTADO := :OLD.ESTADO;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.IVA_JN VALUES rec;
  END;
/


