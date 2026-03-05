PROMPT CREATE TABLE salotex.centro_costo
CREATE TABLE salotex.centro_costo (
  id_centro_costo NUMBER(10,0)  NOT NULL,
  descripcion     VARCHAR2(200) NOT NULL,
  estado          VARCHAR2(10)  NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.centro_costo ADD CONSTRAINT centro_costo_estado_ck CHECK
ALTER TABLE salotex.centro_costo
  ADD CONSTRAINT centro_costo_estado_ck CHECK (
    estado IN (
        'ACTIVO',
        'INACTIVO'
    )
  )
/

PROMPT ALTER TABLE salotex.centro_costo ADD CONSTRAINT centro_costo_pk PRIMARY KEY
ALTER TABLE salotex.centro_costo
  ADD CONSTRAINT centro_costo_pk PRIMARY KEY (
    id_centro_costo
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.centro_costo ADD CONSTRAINT cen_cos_desc_uk UNIQUE
ALTER TABLE salotex.centro_costo
  ADD CONSTRAINT cen_cos_desc_uk UNIQUE (
    descripcion
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.centro_costo_id_centro_ins
CREATE OR REPLACE TRIGGER salotex.centro_costo_id_centro_ins BEFORE
    INSERT ON salotex.centro_costo
    FOR EACH ROW


WHEN ( new.id_centro_costo IS NULL )
BEGIN
    :new.id_centro_costo := seq_centro_costo.nextval;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.centro_costo_jntrg
CREATE OR REPLACE TRIGGER salotex.centro_costo_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.centro_costo for each row

Declare
  rec SALOTEX.CENTRO_COSTO_JN%ROWTYPE;
  blank SALOTEX.CENTRO_COSTO_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_CENTRO_COSTO := :NEW.ID_CENTRO_COSTO;
      rec.DESCRIPCION := :NEW.DESCRIPCION;
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
      rec.ID_CENTRO_COSTO := :OLD.ID_CENTRO_COSTO;
      rec.DESCRIPCION := :OLD.DESCRIPCION;
      rec.ESTADO := :OLD.ESTADO;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.CENTRO_COSTO_JN VALUES rec;
  END;
/


