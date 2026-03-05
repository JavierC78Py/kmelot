PROMPT CREATE TABLE salotex.rubro
CREATE TABLE salotex.rubro (
  id_rubro    NUMBER(10,0) NOT NULL,
  descripcion VARCHAR2(50) NOT NULL,
  estado      VARCHAR2(10) NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.rubro ADD CONSTRAINT rubro_estado_ck CHECK
ALTER TABLE salotex.rubro
  ADD CONSTRAINT rubro_estado_ck CHECK (
    estado IN (
        'ACTIVO',
        'INACTIVO'
    )
  )
/

PROMPT ALTER TABLE salotex.rubro ADD CONSTRAINT rubro_pk PRIMARY KEY
ALTER TABLE salotex.rubro
  ADD CONSTRAINT rubro_pk PRIMARY KEY (
    id_rubro
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.rubro ADD CONSTRAINT rubro_uk UNIQUE
ALTER TABLE salotex.rubro
  ADD CONSTRAINT rubro_uk UNIQUE (
    descripcion
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.bt_rubro
CREATE OR REPLACE TRIGGER salotex.bt_rubro
BEFORE INSERT OR UPDATE OR DELETE ON salotex.rubro
FOR EACH ROW
DECLARE
BEGIN
  IF INSERTING THEN
    IF :new.id_rubro IS NULL THEN
      :new.id_rubro := seq_rubro.NEXTVAL;
    END IF;
  END IF;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.rubro_jntrg
CREATE OR REPLACE TRIGGER salotex.rubro_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.rubro for each row

Declare
  rec SALOTEX.RUBRO_JN%ROWTYPE;
  blank SALOTEX.RUBRO_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_RUBRO := :NEW.ID_RUBRO;
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
      rec.ID_RUBRO := :OLD.ID_RUBRO;
      rec.DESCRIPCION := :OLD.DESCRIPCION;
      rec.ESTADO := :OLD.ESTADO;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.RUBRO_JN VALUES rec;
  END;
/


