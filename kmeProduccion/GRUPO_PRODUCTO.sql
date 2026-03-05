PROMPT CREATE TABLE salotex.grupo_producto
CREATE TABLE salotex.grupo_producto (
  id_grupo      NUMBER(10,0)       NOT NULL,
  descripcion   VARCHAR2(100 CHAR) NOT NULL,
  grupo_nivel_1 NUMBER(3,0)        NULL,
  grupo_nivel_2 NUMBER(3,0)        NULL,
  grupo_nivel_3 NUMBER(3,0)        NULL,
  estado        VARCHAR2(10 CHAR)  NOT NULL,
  tipo          VARCHAR2(3)        NOT NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.grupo_producto ADD CONSTRAINT grupo_producto_estado_ck CHECK
ALTER TABLE salotex.grupo_producto
  ADD CONSTRAINT grupo_producto_estado_ck CHECK (
    estado IN (
        'ACTIVO',
        'INACTIVO'
    )
  )
/

PROMPT ALTER TABLE salotex.grupo_producto ADD CONSTRAINT grupo_producto_tipo_ck CHECK
ALTER TABLE salotex.grupo_producto
  ADD CONSTRAINT grupo_producto_tipo_ck CHECK (
    tipo IN ( 'ART', 'SRV' )
  )
/

PROMPT ALTER TABLE salotex.grupo_producto ADD CONSTRAINT grupo_producto_pk PRIMARY KEY
ALTER TABLE salotex.grupo_producto
  ADD CONSTRAINT grupo_producto_pk PRIMARY KEY (
    id_grupo
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.grupo_producto ADD CONSTRAINT grupo_producto_descri_uk UNIQUE
ALTER TABLE salotex.grupo_producto
  ADD CONSTRAINT grupo_producto_descri_uk UNIQUE (
    tipo,
    grupo_nivel_1,
    grupo_nivel_2,
    grupo_nivel_3,
    descripcion
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.grupo_producto_ins_bt
CREATE OR REPLACE TRIGGER salotex.grupo_producto_ins_bt
BEFORE INSERT ON salotex.grupo_producto
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW

DECLARE
PRAGMA AUTONOMOUS_TRANSACTION;

BEGIN
  IF :new.id_grupo IS NULL THEN
    IF :new.grupo_nivel_1 IS NULL THEN
      SELECT Nvl(Max(gp.grupo_nivel_1),0) + 1
      INTO :new.grupo_nivel_1
      FROM grupo_producto gp
      WHERE gp.grupo_nivel_1 IS NOT NULL
      AND   gp.grupo_nivel_2 IS NULL
      AND   gp.grupo_nivel_3 IS NULL
      --AND   gp.tipo = :new.tipo
      ;
    ELSIF :new.grupo_nivel_1 IS NOT NULL AND :new.grupo_nivel_2 IS NULL THEN
      SELECT Nvl(Max(gp.grupo_nivel_2),0) + 1
      INTO :new.grupo_nivel_2
      FROM grupo_producto gp
      WHERE gp.grupo_nivel_1 = :new.grupo_nivel_1
      AND   gp.grupo_nivel_2 IS NOT NULL
      AND   gp.grupo_nivel_3 IS NULL
      --AND   gp.tipo = :new.tipo
      ;
    ELSIF :new.grupo_nivel_2 IS NOT NULL AND :new.grupo_nivel_3 IS NULL THEN
      SELECT Nvl(Max(gp.grupo_nivel_3),0) + 1
      INTO :new.grupo_nivel_3
      FROM grupo_producto gp
      WHERE gp.grupo_nivel_1 = :new.grupo_nivel_1
      AND   gp.grupo_nivel_2 = :new.grupo_nivel_2
      AND   gp.grupo_nivel_3 IS NOT NULL
      --AND   gp.tipo = :new.tipo
      ;
    END IF;
  END IF;
  IF :new.id_grupo IS NULL THEN
    IF :new.grupo_nivel_2 IS NULL AND :new.grupo_nivel_3 IS NULL THEN
      :new.id_grupo := :new.grupo_nivel_1;
    ELSIF :new.grupo_nivel_2 IS NOT NULL AND :new.grupo_nivel_3 IS NULL THEN
      :new.id_grupo := To_Number( To_Char(:new.grupo_nivel_1) || LPad(To_Char(:new.grupo_nivel_2),3,0) ) ;
    ELSIF :new.grupo_nivel_2 IS NOT NULL AND :new.grupo_nivel_3 IS NOT NULL THEN
      :new.id_grupo := To_Number( To_Char(:new.grupo_nivel_1) || LPad(To_Char(:new.grupo_nivel_2),3,0) || LPad(To_Char(:new.grupo_nivel_3),3,0) ) ;
    END IF;
  END IF;
  IF :new.estado IS NULL THEN
    :new.estado := 'ACTIVO';
  END IF;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.grupo_producto_jntrg
CREATE OR REPLACE TRIGGER salotex.grupo_producto_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.grupo_producto for each row

Declare
  rec SALOTEX.GRUPO_PRODUCTO_JN%ROWTYPE;
  blank SALOTEX.GRUPO_PRODUCTO_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_GRUPO := :NEW.ID_GRUPO;
      rec.DESCRIPCION := :NEW.DESCRIPCION;
      rec.GRUPO_NIVEL_1 := :NEW.GRUPO_NIVEL_1;
      rec.GRUPO_NIVEL_2 := :NEW.GRUPO_NIVEL_2;
      rec.GRUPO_NIVEL_3 := :NEW.GRUPO_NIVEL_3;
      rec.ESTADO := :NEW.ESTADO;
      rec.TIPO := :NEW.TIPO;
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
      rec.ID_GRUPO := :OLD.ID_GRUPO;
      rec.DESCRIPCION := :OLD.DESCRIPCION;
      rec.GRUPO_NIVEL_1 := :OLD.GRUPO_NIVEL_1;
      rec.GRUPO_NIVEL_2 := :OLD.GRUPO_NIVEL_2;
      rec.GRUPO_NIVEL_3 := :OLD.GRUPO_NIVEL_3;
      rec.ESTADO := :OLD.ESTADO;
      rec.TIPO := :OLD.TIPO;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.GRUPO_PRODUCTO_JN VALUES rec;
  END;
/


