PROMPT CREATE TABLE salotex.tipo_comprobante
CREATE TABLE salotex.tipo_comprobante (
  id_tipo_comprobante NUMBER(10,0)       NOT NULL,
  descripcion         VARCHAR2(100 CHAR) NOT NULL,
  estado              VARCHAR2(20)       NULL,
  venta               VARCHAR2(2)        NOT NULL,
  compra              VARCHAR2(2)        NOT NULL,
  pago                VARCHAR2(2)        NOT NULL,
  cobro               VARCHAR2(2)        NOT NULL,
  devolucion          VARCHAR2(2)        DEFAULT 'NO' NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.tipo_comprobante ADD CONSTRAINT ck_estado_tip_compro CHECK
ALTER TABLE salotex.tipo_comprobante
  ADD CONSTRAINT ck_estado_tip_compro CHECK (
    estado IN (
        'ACTIVO',
        'INACTIVO'
    )
  )
/

PROMPT ALTER TABLE salotex.tipo_comprobante ADD CONSTRAINT tipo_comprobante_cobro CHECK
ALTER TABLE salotex.tipo_comprobante
  ADD CONSTRAINT tipo_comprobante_cobro CHECK (
    cobro IN ( 'SI', 'NO' )
  )
/

PROMPT ALTER TABLE salotex.tipo_comprobante ADD CONSTRAINT tipo_comprobante_compra CHECK
ALTER TABLE salotex.tipo_comprobante
  ADD CONSTRAINT tipo_comprobante_compra CHECK (
    compra IN ( 'SI', 'NO' )
  )
/

PROMPT ALTER TABLE salotex.tipo_comprobante ADD CONSTRAINT tipo_comprobante_pago CHECK
ALTER TABLE salotex.tipo_comprobante
  ADD CONSTRAINT tipo_comprobante_pago CHECK (
    pago IN ( 'SI', 'NO' )
  )
/

PROMPT ALTER TABLE salotex.tipo_comprobante ADD CONSTRAINT tipo_comprobante_venta CHECK
ALTER TABLE salotex.tipo_comprobante
  ADD CONSTRAINT tipo_comprobante_venta CHECK (
    venta IN ( 'SI', 'NO' )
  )
/

PROMPT ALTER TABLE salotex.tipo_comprobante ADD CONSTRAINT tipo_comprobante_pk PRIMARY KEY
ALTER TABLE salotex.tipo_comprobante
  ADD CONSTRAINT tipo_comprobante_pk PRIMARY KEY (
    id_tipo_comprobante
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.tipo_comprobante ADD CONSTRAINT tip_compro_desc_uk UNIQUE
ALTER TABLE salotex.tipo_comprobante
  ADD CONSTRAINT tip_compro_desc_uk UNIQUE (
    descripcion
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.tipo_comprobante_bt
CREATE OR REPLACE TRIGGER salotex.tipo_comprobante_bt BEFORE
 INSERT OR DELETE OR UPDATE ON salotex.tipo_comprobante
 REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW


BEGIN
  IF INSERTING THEN
    :new.id_tipo_comprobante := seq_tipo_comprobante.nextval;
  END IF;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.tipo_comprobante_jntrg
CREATE OR REPLACE TRIGGER salotex.tipo_comprobante_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.tipo_comprobante for each row

Declare
  rec SALOTEX.TIPO_COMPROBANTE_JN%ROWTYPE;
  blank SALOTEX.TIPO_COMPROBANTE_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_TIPO_COMPROBANTE := :NEW.ID_TIPO_COMPROBANTE;
      rec.DESCRIPCION := :NEW.DESCRIPCION;
      rec.ESTADO := :NEW.ESTADO;
      rec.VENTA := :NEW.VENTA;
      rec.COMPRA := :NEW.COMPRA;
      rec.PAGO := :NEW.PAGO;
      rec.COBRO := :NEW.COBRO;
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
      rec.ID_TIPO_COMPROBANTE := :OLD.ID_TIPO_COMPROBANTE;
      rec.DESCRIPCION := :OLD.DESCRIPCION;
      rec.ESTADO := :OLD.ESTADO;
      rec.VENTA := :OLD.VENTA;
      rec.COMPRA := :OLD.COMPRA;
      rec.PAGO := :OLD.PAGO;
      rec.COBRO := :OLD.COBRO;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.TIPO_COMPROBANTE_JN VALUES rec;
  END;
/


