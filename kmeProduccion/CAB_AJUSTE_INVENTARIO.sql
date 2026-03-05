PROMPT CREATE TABLE salotex.cab_ajuste_inventario
CREATE TABLE salotex.cab_ajuste_inventario (
  id_ajuste        NUMBER(10,0)      NOT NULL,
  fecha_ajuste     DATE              NULL,
  suc_id_sucursal  NUMBER(10,0)      NOT NULL,
  mon_id_moneda    NUMBER(10,0)      NOT NULL,
  tipo_cambio      NUMBER(9,2)       NOT NULL,
  monto            NUMBER(18,2)      NOT NULL,
  observacion      VARCHAR2(500)     NOT NULL,
  estado           VARCHAR2(10)      NOT NULL,
  usuario_registro VARCHAR2(20 CHAR) NULL,
  fecha_registro   DATE              NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.cab_ajuste_inventario ADD CONSTRAINT cab_ajuste_estado_ck CHECK
ALTER TABLE salotex.cab_ajuste_inventario
  ADD CONSTRAINT cab_ajuste_estado_ck CHECK (
    estado IN ( 'ACTIVO', 'ANULADO' )
  )
/

PROMPT ALTER TABLE salotex.cab_ajuste_inventario ADD CONSTRAINT cab_ajuste_inventario_pk PRIMARY KEY
ALTER TABLE salotex.cab_ajuste_inventario
  ADD CONSTRAINT cab_ajuste_inventario_pk PRIMARY KEY (
    id_ajuste
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.cab_ajuste_inventario ADD CONSTRAINT cab_ajuste_moneda_fk FOREIGN KEY
ALTER TABLE salotex.cab_ajuste_inventario
  ADD CONSTRAINT cab_ajuste_moneda_fk FOREIGN KEY (
    mon_id_moneda
  ) REFERENCES salotex.moneda (
    id_moneda
  )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.cab_ajuste_inventario_bt
CREATE OR REPLACE TRIGGER salotex.cab_ajuste_inventario_bt
BEFORE INSERT ON salotex.cab_ajuste_inventario
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW

BEGIN
  IF INSERTING THEN
    IF :new.id_ajuste IS NULL THEN
      :new.id_ajuste := seq_ajuste_inventario.nextval;
    END IF;
  END IF;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.cab_ajuste_inventario_jntrg
CREATE OR REPLACE TRIGGER salotex.cab_ajuste_inventario_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.cab_ajuste_inventario for each row

Declare
  rec SALOTEX.CAB_AJUSTE_INVENTARIO_JN%ROWTYPE;
  blank SALOTEX.CAB_AJUSTE_INVENTARIO_JN%ROWTYPE;
  BEGIN
  	/* Javier Caballero */
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_AJUSTE := :NEW.ID_AJUSTE;
      rec.FECHA_AJUSTE := :NEW.FECHA_AJUSTE;
      rec.SUC_ID_SUCURSAL := :NEW.SUC_ID_SUCURSAL;
      rec.MON_ID_MONEDA := :NEW.MON_ID_MONEDA;
      rec.TIPO_CAMBIO := :NEW.TIPO_CAMBIO;
      rec.MONTO := :NEW.MONTO;
      rec.OBSERVACION := :NEW.OBSERVACION;
      rec.ESTADO := :NEW.ESTADO;
      rec.USUARIO_REGISTRO := :NEW.USUARIO_REGISTRO;
      rec.FECHA_REGISTRO := :NEW.FECHA_REGISTRO;
      rec.JN_DATETIME := SYSDATE;
      rec.JN_ORACLE_USER := Nvl(v('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      IF INSERTING THEN
        rec.JN_OPERATION := 'INS';
      ELSIF UPDATING THEN
        rec.JN_OPERATION := 'UPD';
      END IF;
    ELSIF DELETING THEN
      rec.ID_AJUSTE := :OLD.ID_AJUSTE;
      rec.FECHA_AJUSTE := :OLD.FECHA_AJUSTE;
      rec.SUC_ID_SUCURSAL := :OLD.SUC_ID_SUCURSAL;
      rec.MON_ID_MONEDA := :OLD.MON_ID_MONEDA;
      rec.TIPO_CAMBIO := :OLD.TIPO_CAMBIO;
      rec.MONTO := :OLD.MONTO;
      rec.OBSERVACION := :OLD.OBSERVACION;
      rec.ESTADO := :OLD.ESTADO;
      rec.USUARIO_REGISTRO := :OLD.USUARIO_REGISTRO;
      rec.FECHA_REGISTRO := :OLD.FECHA_REGISTRO;
      rec.JN_DATETIME := SYSDATE;
      rec.JN_ORACLE_USER := Nvl(v('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.CAB_AJUSTE_INVENTARIO_JN VALUES rec;
  END;
/


