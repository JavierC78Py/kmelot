PROMPT CREATE TABLE salotex.origen_producto
CREATE TABLE salotex.origen_producto (
  id_origen   NUMBER(10,0)      NOT NULL,
  descripcion VARCHAR2(50 CHAR) NOT NULL,
  estado      VARCHAR2(10 CHAR) NOT NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.origen_producto ADD CONSTRAINT origen_producto_estado_ck CHECK
ALTER TABLE salotex.origen_producto
  ADD CONSTRAINT origen_producto_estado_ck CHECK (
    estado IN (
        'ACTIVO',
        'INACTIVO'
    )
  )
/

PROMPT ALTER TABLE salotex.origen_producto ADD CONSTRAINT origen_producto_pk PRIMARY KEY
ALTER TABLE salotex.origen_producto
  ADD CONSTRAINT origen_producto_pk PRIMARY KEY (
    id_origen
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.origen_producto ADD CONSTRAINT origen_producto_descrip_uk UNIQUE
ALTER TABLE salotex.origen_producto
  ADD CONSTRAINT origen_producto_descrip_uk UNIQUE (
    descripcion
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.origen_producto_bt
CREATE OR REPLACE TRIGGER salotex.origen_producto_bt BEFORE
    INSERT OR UPDATE OR DELETE ON salotex.origen_producto
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW

BEGIN
  IF INSERTING THEN
    :new.id_origen := seq_origen_producto.nextval;
  END IF;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.origen_producto_jntrg
CREATE OR REPLACE TRIGGER salotex.origen_producto_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.origen_producto for each row

Declare
  rec SALOTEX.ORIGEN_PRODUCTO_JN%ROWTYPE;
  blank SALOTEX.ORIGEN_PRODUCTO_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_ORIGEN := :NEW.ID_ORIGEN;
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
      rec.ID_ORIGEN := :OLD.ID_ORIGEN;
      rec.DESCRIPCION := :OLD.DESCRIPCION;
      rec.ESTADO := :OLD.ESTADO;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.ORIGEN_PRODUCTO_JN VALUES rec;
  END;
/


