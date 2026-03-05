PROMPT CREATE TABLE salotex.cab_factura_compra
CREATE TABLE salotex.cab_factura_compra (
  id_factura_compra       NUMBER(10,0)      NOT NULL,
  fecha_factura           DATE              NULL,
  fecha_vencimiento       DATE              NULL,
  ent_id_entidad          NUMBER(10,0)      NOT NULL,
  tip_id_tipo_comprobante NUMBER(10,0)      NOT NULL,
  condicion_compra        VARCHAR2(10 CHAR) NOT NULL,
  timbrado                NUMBER(20,0)      NULL,
  vto_timbrado            DATE              NULL,
  nro_factura             NUMBER(13,0)      NOT NULL,
  mon_id_moneda           NUMBER(10,0)      NOT NULL,
  tipo_cambio             NUMBER(9,2)       NOT NULL,
  monto                   NUMBER(18,2)      NULL,
  saldo                   NUMBER(18,2)      NULL,
  usuario_registro        VARCHAR2(20 CHAR) NULL,
  fecha_registro          DATE              NULL,
  suc_id_sucursal         NUMBER(10,0)      NOT NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT CREATE INDEX salotex.cab_factura_compra_entidad_idx
CREATE INDEX salotex.cab_factura_compra_entidad_idx
  ON salotex.cab_factura_compra (
    ent_id_entidad
  )
  INITRANS  20
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT CREATE INDEX salotex.cab_factura_compra_idx1
CREATE INDEX salotex.cab_factura_compra_idx1
  ON salotex.cab_factura_compra (
    id_factura_compra,
    ent_id_entidad
  )
  INITRANS  20
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT CREATE INDEX salotex.cab_factura_compra_timbrado
CREATE INDEX salotex.cab_factura_compra_timbrado
  ON salotex.cab_factura_compra (
    timbrado
  )
  INITRANS  20
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.cab_factura_compra ADD CONSTRAINT cab_factura_compra_monto_ck CHECK
ALTER TABLE salotex.cab_factura_compra
  ADD CONSTRAINT cab_factura_compra_monto_ck CHECK (
    monto >= 0
  )
/

PROMPT ALTER TABLE salotex.cab_factura_compra ADD CONSTRAINT cab_factura_compra_saldo_ck CHECK
ALTER TABLE salotex.cab_factura_compra
  ADD CONSTRAINT cab_factura_compra_saldo_ck CHECK (
    saldo >= 0
  )
/

PROMPT ALTER TABLE salotex.cab_factura_compra ADD CONSTRAINT fact_compra_condi_compra_ck CHECK
ALTER TABLE salotex.cab_factura_compra
  ADD CONSTRAINT fact_compra_condi_compra_ck CHECK (
    condicion_compra IN ( 'CONTADO', 'CREDITO' )
  )
/

PROMPT ALTER TABLE salotex.cab_factura_compra ADD CONSTRAINT cab_factura_compra_pk PRIMARY KEY
ALTER TABLE salotex.cab_factura_compra
  ADD CONSTRAINT cab_factura_compra_pk PRIMARY KEY (
    id_factura_compra
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.cab_factura_compra ADD CONSTRAINT cab_factura_compra_nro_fact_uk UNIQUE
ALTER TABLE salotex.cab_factura_compra
  ADD CONSTRAINT cab_factura_compra_nro_fact_uk UNIQUE (
    ent_id_entidad,
    nro_factura
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.cab_factura_compra ADD CONSTRAINT cab_factura_compra_moneda_fk FOREIGN KEY
ALTER TABLE salotex.cab_factura_compra
  ADD CONSTRAINT cab_factura_compra_moneda_fk FOREIGN KEY (
    mon_id_moneda
  ) REFERENCES salotex.moneda (
    id_moneda
  )
/

PROMPT ALTER TABLE salotex.cab_factura_compra ADD CONSTRAINT cab_factura_compra_tipo_comprobante_fk FOREIGN KEY
ALTER TABLE salotex.cab_factura_compra
  ADD CONSTRAINT cab_factura_compra_tipo_comprobante_fk FOREIGN KEY (
    tip_id_tipo_comprobante
  ) REFERENCES salotex.tipo_comprobante (
    id_tipo_comprobante
  )
/

PROMPT ALTER TABLE salotex.cab_factura_compra ADD CONSTRAINT cab_factura_entidad_fk FOREIGN KEY
ALTER TABLE salotex.cab_factura_compra
  ADD CONSTRAINT cab_factura_entidad_fk FOREIGN KEY (
    ent_id_entidad
  ) REFERENCES salotex.entidad (
    id_entidad
  )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.cab_factura_compra_jntrg
CREATE OR REPLACE TRIGGER salotex.cab_factura_compra_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.cab_factura_compra for each row

Declare
  rec SALOTEX.CAB_FACTURA_COMPRA_JN%ROWTYPE;
  blank SALOTEX.CAB_FACTURA_COMPRA_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_FACTURA_COMPRA := :NEW.ID_FACTURA_COMPRA;
      rec.FECHA_FACTURA := :NEW.FECHA_FACTURA;
      rec.FECHA_VENCIMIENTO := :NEW.FECHA_VENCIMIENTO;
      rec.ENT_ID_ENTIDAD := :NEW.ENT_ID_ENTIDAD;
      rec.TIP_ID_TIPO_COMPROBANTE := :NEW.TIP_ID_TIPO_COMPROBANTE;
      rec.CONDICION_COMPRA := :NEW.CONDICION_COMPRA;
      rec.TIMBRADO := :NEW.TIMBRADO;
      rec.VTO_TIMBRADO := :NEW.VTO_TIMBRADO;
      rec.NRO_FACTURA := :NEW.NRO_FACTURA;
      rec.MON_ID_MONEDA := :NEW.MON_ID_MONEDA;
      rec.TIPO_CAMBIO := :NEW.TIPO_CAMBIO;
      rec.MONTO := :NEW.MONTO;
      rec.SALDO := :NEW.SALDO;
      rec.USUARIO_REGISTRO := :NEW.USUARIO_REGISTRO;
      rec.FECHA_REGISTRO := :NEW.FECHA_REGISTRO;
      rec.SUC_ID_SUCURSAL := :NEW.SUC_ID_SUCURSAL;
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
      rec.ID_FACTURA_COMPRA := :OLD.ID_FACTURA_COMPRA;
      rec.FECHA_FACTURA := :OLD.FECHA_FACTURA;
      rec.FECHA_VENCIMIENTO := :OLD.FECHA_VENCIMIENTO;
      rec.ENT_ID_ENTIDAD := :OLD.ENT_ID_ENTIDAD;
      rec.TIP_ID_TIPO_COMPROBANTE := :OLD.TIP_ID_TIPO_COMPROBANTE;
      rec.CONDICION_COMPRA := :OLD.CONDICION_COMPRA;
      rec.TIMBRADO := :OLD.TIMBRADO;
      rec.VTO_TIMBRADO := :OLD.VTO_TIMBRADO;
      rec.NRO_FACTURA := :OLD.NRO_FACTURA;
      rec.MON_ID_MONEDA := :OLD.MON_ID_MONEDA;
      rec.TIPO_CAMBIO := :OLD.TIPO_CAMBIO;
      rec.MONTO := :OLD.MONTO;
      rec.SALDO := :OLD.SALDO;
      rec.USUARIO_REGISTRO := :OLD.USUARIO_REGISTRO;
      rec.FECHA_REGISTRO := :OLD.FECHA_REGISTRO;
      rec.SUC_ID_SUCURSAL := :OLD.SUC_ID_SUCURSAL;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.CAB_FACTURA_COMPRA_JN VALUES rec;
  END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.factura_compra_bt
CREATE OR REPLACE TRIGGER salotex.factura_compra_bt
BEFORE INSERT ON salotex.cab_factura_compra
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW

BEGIN
  IF INSERTING THEN
    IF :new.id_factura_compra IS NULL THEN
      :new.id_factura_compra := seq_factura_compra.nextval;
    END IF;
  END IF;
END;
/


