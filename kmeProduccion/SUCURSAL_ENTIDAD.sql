PROMPT CREATE TABLE salotex.sucursal_entidad
CREATE TABLE salotex.sucursal_entidad (
  id_suc_entidad NUMBER(10,0)       NOT NULL,
  ent_id_entidad NUMBER(10,0)       NOT NULL,
  descripcion    VARCHAR2(100 CHAR) NOT NULL,
  direccion      VARCHAR2(200 CHAR) NULL,
  latitud        VARCHAR2(50 CHAR)  NULL,
  longitud       VARCHAR2(50 CHAR)  NULL,
  telefono1      VARCHAR2(20 CHAR)  NULL,
  telefono2      VARCHAR2(20 CHAR)  NULL,
  es_central     VARCHAR2(2 CHAR)   NULL,
  estado         VARCHAR2(10 CHAR)  NOT NULL,
  ciu_cod_ciudad NUMBER(10,0)       NULL,
  link_mapa      VARCHAR2(200)      NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.sucursal_entidad ADD CONSTRAINT sucursal_entidad_estado_ck CHECK
ALTER TABLE salotex.sucursal_entidad
  ADD CONSTRAINT sucursal_entidad_estado_ck CHECK (
    estado IN (
        'ACTIVO',
        'INACTIVO'
    )
  )
/

PROMPT ALTER TABLE salotex.sucursal_entidad ADD CONSTRAINT sucursal_entidad_es_central_ck CHECK
ALTER TABLE salotex.sucursal_entidad
  ADD CONSTRAINT sucursal_entidad_es_central_ck CHECK (
    es_central IN (
        'NO',
        'SI'
    )
  )
/

PROMPT ALTER TABLE salotex.sucursal_entidad ADD CONSTRAINT sucursal_entidad_pk PRIMARY KEY
ALTER TABLE salotex.sucursal_entidad
  ADD CONSTRAINT sucursal_entidad_pk PRIMARY KEY (
    id_suc_entidad
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.sucursal_entidad ADD CONSTRAINT sucursal_entidad_descrip_uk UNIQUE
ALTER TABLE salotex.sucursal_entidad
  ADD CONSTRAINT sucursal_entidad_descrip_uk UNIQUE (
    descripcion
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.sucursal_entidad ADD CONSTRAINT sucursal_entidad_entidad_fk FOREIGN KEY
ALTER TABLE salotex.sucursal_entidad
  ADD CONSTRAINT sucursal_entidad_entidad_fk FOREIGN KEY (
    ent_id_entidad
  ) REFERENCES salotex.entidad (
    id_entidad
  )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.sucursal_entidad_jntrg
CREATE OR REPLACE TRIGGER salotex.sucursal_entidad_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.sucursal_entidad for each row

Declare
  rec SALOTEX.SUCURSAL_ENTIDAD_JN%ROWTYPE;
  blank SALOTEX.SUCURSAL_ENTIDAD_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_SUC_ENTIDAD := :NEW.ID_SUC_ENTIDAD;
      rec.ENT_ID_ENTIDAD := :NEW.ENT_ID_ENTIDAD;
      rec.DESCRIPCION := :NEW.DESCRIPCION;
      rec.DIRECCION := :NEW.DIRECCION;
      rec.LATITUD := :NEW.LATITUD;
      rec.LONGITUD := :NEW.LONGITUD;
      rec.TELEFONO1 := :NEW.TELEFONO1;
      rec.TELEFONO2 := :NEW.TELEFONO2;
      rec.ES_CENTRAL := :NEW.ES_CENTRAL;
      rec.ESTADO := :NEW.ESTADO;
      rec.CIU_COD_CIUDAD := :NEW.CIU_COD_CIUDAD;
      rec.LINK_MAPA := :NEW.LINK_MAPA;
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
      rec.ID_SUC_ENTIDAD := :OLD.ID_SUC_ENTIDAD;
      rec.ENT_ID_ENTIDAD := :OLD.ENT_ID_ENTIDAD;
      rec.DESCRIPCION := :OLD.DESCRIPCION;
      rec.DIRECCION := :OLD.DIRECCION;
      rec.LATITUD := :OLD.LATITUD;
      rec.LONGITUD := :OLD.LONGITUD;
      rec.TELEFONO1 := :OLD.TELEFONO1;
      rec.TELEFONO2 := :OLD.TELEFONO2;
      rec.ES_CENTRAL := :OLD.ES_CENTRAL;
      rec.ESTADO := :OLD.ESTADO;
      rec.CIU_COD_CIUDAD := :OLD.CIU_COD_CIUDAD;
      rec.LINK_MAPA := :OLD.LINK_MAPA;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.SUCURSAL_ENTIDAD_JN VALUES rec;
  END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.sucur_id_sucur_entidad_bt
CREATE OR REPLACE TRIGGER salotex.sucur_id_sucur_entidad_bt BEFORE
INSERT OR UPDATE OR DELETE ON salotex.sucursal_entidad
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW

BEGIN
  IF :new.id_suc_entidad IS NULL THEN
    :new.id_suc_entidad := seq_sucursal_entidad.nextval;
  END IF;
END;
/


