PROMPT CREATE TABLE salotex.marca
CREATE TABLE salotex.marca (
  id_marca    NUMBER(10,0)       NOT NULL,
  descripcion VARCHAR2(100 CHAR) NOT NULL,
  estado      VARCHAR2(10 CHAR)  NOT NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.marca ADD CONSTRAINT marca_estado_ck CHECK
ALTER TABLE salotex.marca
  ADD CONSTRAINT marca_estado_ck CHECK (
    estado IN (
        'ACTIVO',
        'INACTIVO'
    )
  )
/

PROMPT ALTER TABLE salotex.marca ADD CONSTRAINT marca_pk PRIMARY KEY
ALTER TABLE salotex.marca
  ADD CONSTRAINT marca_pk PRIMARY KEY (
    id_marca
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.marca ADD CONSTRAINT marca_descripcion_uk UNIQUE
ALTER TABLE salotex.marca
  ADD CONSTRAINT marca_descripcion_uk UNIQUE (
    descripcion
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.marca_bt
CREATE OR REPLACE TRIGGER salotex.marca_bt BEFORE
    INSERT OR UPDATE OR DELETE ON salotex.marca
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW

BEGIN
  IF INSERTING THEN
    :new.id_marca := seq_marca.nextval;
  END IF;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.marca_jntrg
CREATE OR REPLACE TRIGGER salotex.marca_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.marca for each row

Declare
  rec SALOTEX.MARCA_JN%ROWTYPE;
  blank SALOTEX.MARCA_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_MARCA := :NEW.ID_MARCA;
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
      rec.ID_MARCA := :OLD.ID_MARCA;
      rec.DESCRIPCION := :OLD.DESCRIPCION;
      rec.ESTADO := :OLD.ESTADO;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.MARCA_JN VALUES rec;
  END;
/


