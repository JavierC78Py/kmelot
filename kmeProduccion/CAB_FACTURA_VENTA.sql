PROMPT CREATE TABLE salotex.cab_factura_venta
CREATE TABLE salotex.cab_factura_venta (
  id_factura_venta        NUMBER(10,0)  NOT NULL,
  fecha_factura           DATE          NULL,
  fecha_vencimiento       DATE          NULL,
  ent_id_entidad          NUMBER(10,0)  NOT NULL,
  tip_id_tipo_comprobante NUMBER(10,0)  NOT NULL,
  condicion_venta         VARCHAR2(40)  NOT NULL,
  tim_id_timbrado         NUMBER(10,0)  NULL,
  nro_factura             NUMBER(13,0)  NOT NULL,
  mon_id_moneda           NUMBER(10,0)  NOT NULL,
  tipo_cambio             NUMBER(9,2)   NOT NULL,
  monto                   NUMBER(18,2)  NULL,
  saldo                   NUMBER(18,2)  NULL,
  suc_id_sucursal         NUMBER(10,0)  NOT NULL,
  estado                  VARCHAR2(10)  NOT NULL,
  dcto_sedeco             NUMBER(10,2)  NOT NULL,
  usuario_registro        VARCHAR2(80)  NULL,
  fecha_registro          DATE          NULL,
  usuario_anulo           VARCHAR2(80)  NULL,
  fecha_anulo             DATE          NULL,
  razon_social            VARCHAR2(200) NULL,
  numero_documento        VARCHAR2(20)  NULL,
  tip_id_tipo_documento   NUMBER(10,0)  NULL,
  lic_id_licitacion       NUMBER(10,0)  NULL,
  orden_compra            VARCHAR2(20)  NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT CREATE INDEX salotex.cab_factura_venta_entidad_idx
CREATE INDEX salotex.cab_factura_venta_entidad_idx
  ON salotex.cab_factura_venta (
    ent_id_entidad
  )
  INITRANS  20
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT CREATE INDEX salotex.cab_factura_venta_idx1
CREATE INDEX salotex.cab_factura_venta_idx1
  ON salotex.cab_factura_venta (
    id_factura_venta,
    estado,
    ent_id_entidad,
    lic_id_licitacion
  )
  INITRANS  20
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT CREATE INDEX salotex.cab_factura_venta_idx2
CREATE INDEX salotex.cab_factura_venta_idx2
  ON salotex.cab_factura_venta (
    lic_id_licitacion,
    estado
  )
  INITRANS  20
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT CREATE INDEX salotex.cab_fact_vent_entidad_saldo_idx
CREATE INDEX salotex.cab_fact_vent_entidad_saldo_idx
  ON salotex.cab_factura_venta (
    ent_id_entidad,
    saldo
  )
  INITRANS  20
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.cab_factura_venta ADD CONSTRAINT cab_factura_venta_monto_ck CHECK
ALTER TABLE salotex.cab_factura_venta
  ADD CONSTRAINT cab_factura_venta_monto_ck CHECK (
    monto >= 0
  )
/

PROMPT ALTER TABLE salotex.cab_factura_venta ADD CONSTRAINT cab_factura_venta_saldo_ck CHECK
ALTER TABLE salotex.cab_factura_venta
  ADD CONSTRAINT cab_factura_venta_saldo_ck CHECK (
    saldo >= 0
  )
/

PROMPT ALTER TABLE salotex.cab_factura_venta ADD CONSTRAINT fact_venta_condi_venta_ck CHECK
ALTER TABLE salotex.cab_factura_venta
  ADD CONSTRAINT fact_venta_condi_venta_ck CHECK (
    condicion_venta IN ( 'CONTADO', 'CREDITO' )
  )
/

PROMPT ALTER TABLE salotex.cab_factura_venta ADD CONSTRAINT fact_venta_estado_ck CHECK
ALTER TABLE salotex.cab_factura_venta
  ADD CONSTRAINT fact_venta_estado_ck CHECK (
    estado IN ( 'ACTIVO', 'ANULADO' )
  )
/

PROMPT ALTER TABLE salotex.cab_factura_venta ADD CONSTRAINT cab_factura_venta_pk PRIMARY KEY
ALTER TABLE salotex.cab_factura_venta
  ADD CONSTRAINT cab_factura_venta_pk PRIMARY KEY (
    id_factura_venta
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.cab_factura_venta ADD CONSTRAINT cab_factura_venta_nro_fact_uk UNIQUE
ALTER TABLE salotex.cab_factura_venta
  ADD CONSTRAINT cab_factura_venta_nro_fact_uk UNIQUE (
    tim_id_timbrado,
    nro_factura
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.cab_factura_venta ADD CONSTRAINT cab_factura_venta_licita_fk FOREIGN KEY
ALTER TABLE salotex.cab_factura_venta
  ADD CONSTRAINT cab_factura_venta_licita_fk FOREIGN KEY (
    lic_id_licitacion
  ) REFERENCES salotex.licitacion (
    id_licitacion
  )
/

PROMPT ALTER TABLE salotex.cab_factura_venta ADD CONSTRAINT cab_factura_venta_moneda_fk FOREIGN KEY
ALTER TABLE salotex.cab_factura_venta
  ADD CONSTRAINT cab_factura_venta_moneda_fk FOREIGN KEY (
    mon_id_moneda
  ) REFERENCES salotex.moneda (
    id_moneda
  )
/

PROMPT ALTER TABLE salotex.cab_factura_venta ADD CONSTRAINT cab_factura_venta_sucursal_fk FOREIGN KEY
ALTER TABLE salotex.cab_factura_venta
  ADD CONSTRAINT cab_factura_venta_sucursal_fk FOREIGN KEY (
    suc_id_sucursal
  ) REFERENCES salotex.sucursal_entidad (
    id_suc_entidad
  )
/

PROMPT ALTER TABLE salotex.cab_factura_venta ADD CONSTRAINT cab_factura_venta_timbrado_fk FOREIGN KEY
ALTER TABLE salotex.cab_factura_venta
  ADD CONSTRAINT cab_factura_venta_timbrado_fk FOREIGN KEY (
    tim_id_timbrado
  ) REFERENCES salotex.timbrado (
    id_timbrado
  )
/

PROMPT ALTER TABLE salotex.cab_factura_venta ADD CONSTRAINT cab_factura_venta_tipo_comprobante_fk FOREIGN KEY
ALTER TABLE salotex.cab_factura_venta
  ADD CONSTRAINT cab_factura_venta_tipo_comprobante_fk FOREIGN KEY (
    tip_id_tipo_comprobante
  ) REFERENCES salotex.tipo_comprobante (
    id_tipo_comprobante
  )
/

PROMPT ALTER TABLE salotex.cab_factura_venta ADD CONSTRAINT cab_factura_vta_entidad_fk FOREIGN KEY
ALTER TABLE salotex.cab_factura_venta
  ADD CONSTRAINT cab_factura_vta_entidad_fk FOREIGN KEY (
    ent_id_entidad
  ) REFERENCES salotex.entidad (
    id_entidad
  )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.cab_factura_venta_jntrg
CREATE OR REPLACE TRIGGER salotex.cab_factura_venta_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.cab_factura_venta for each row

Declare
  rec SALOTEX.CAB_FACTURA_VENTA_JN%ROWTYPE;
  blank SALOTEX.CAB_FACTURA_VENTA_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_FACTURA_VENTA := :NEW.ID_FACTURA_VENTA;
      rec.FECHA_FACTURA := :NEW.FECHA_FACTURA;
      rec.FECHA_VENCIMIENTO := :NEW.FECHA_VENCIMIENTO;
      rec.ENT_ID_ENTIDAD := :NEW.ENT_ID_ENTIDAD;
      rec.TIP_ID_TIPO_COMPROBANTE := :NEW.TIP_ID_TIPO_COMPROBANTE;
      rec.CONDICION_VENTA := :NEW.CONDICION_VENTA;
      rec.TIM_ID_TIMBRADO := :NEW.TIM_ID_TIMBRADO;
      rec.NRO_FACTURA := :NEW.NRO_FACTURA;
      rec.MON_ID_MONEDA := :NEW.MON_ID_MONEDA;
      rec.TIPO_CAMBIO := :NEW.TIPO_CAMBIO;
      rec.MONTO := :NEW.MONTO;
      rec.SALDO := :NEW.SALDO;
      rec.SUC_ID_SUCURSAL := :NEW.SUC_ID_SUCURSAL;
      rec.ESTADO := :NEW.ESTADO;
      rec.DCTO_SEDECO := :NEW.DCTO_SEDECO;
      rec.USUARIO_REGISTRO := :NEW.USUARIO_REGISTRO;
      rec.FECHA_REGISTRO := :NEW.FECHA_REGISTRO;
      rec.USUARIO_ANULO := :NEW.USUARIO_ANULO;
      rec.FECHA_ANULO := :NEW.FECHA_ANULO;
      rec.RAZON_SOCIAL := :NEW.RAZON_SOCIAL;
      rec.NUMERO_DOCUMENTO := :NEW.NUMERO_DOCUMENTO;
      rec.TIP_ID_TIPO_DOCUMENTO := :NEW.TIP_ID_TIPO_DOCUMENTO;
      rec.LIC_ID_LICITACION := :NEW.LIC_ID_LICITACION;
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
      rec.ID_FACTURA_VENTA := :OLD.ID_FACTURA_VENTA;
      rec.FECHA_FACTURA := :OLD.FECHA_FACTURA;
      rec.FECHA_VENCIMIENTO := :OLD.FECHA_VENCIMIENTO;
      rec.ENT_ID_ENTIDAD := :OLD.ENT_ID_ENTIDAD;
      rec.TIP_ID_TIPO_COMPROBANTE := :OLD.TIP_ID_TIPO_COMPROBANTE;
      rec.CONDICION_VENTA := :OLD.CONDICION_VENTA;
      rec.TIM_ID_TIMBRADO := :OLD.TIM_ID_TIMBRADO;
      rec.NRO_FACTURA := :OLD.NRO_FACTURA;
      rec.MON_ID_MONEDA := :OLD.MON_ID_MONEDA;
      rec.TIPO_CAMBIO := :OLD.TIPO_CAMBIO;
      rec.MONTO := :OLD.MONTO;
      rec.SALDO := :OLD.SALDO;
      rec.SUC_ID_SUCURSAL := :OLD.SUC_ID_SUCURSAL;
      rec.ESTADO := :OLD.ESTADO;
      rec.DCTO_SEDECO := :OLD.DCTO_SEDECO;
      rec.USUARIO_REGISTRO := :OLD.USUARIO_REGISTRO;
      rec.FECHA_REGISTRO := :OLD.FECHA_REGISTRO;
      rec.USUARIO_ANULO := :OLD.USUARIO_ANULO;
      rec.FECHA_ANULO := :OLD.FECHA_ANULO;
      rec.RAZON_SOCIAL := :OLD.RAZON_SOCIAL;
      rec.NUMERO_DOCUMENTO := :OLD.NUMERO_DOCUMENTO;
      rec.TIP_ID_TIPO_DOCUMENTO := :OLD.TIP_ID_TIPO_DOCUMENTO;
      rec.LIC_ID_LICITACION := :OLD.LIC_ID_LICITACION;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.CAB_FACTURA_VENTA_JN VALUES rec;
  END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.factura_venta_bt
CREATE OR REPLACE TRIGGER salotex.factura_venta_bt
BEFORE INSERT OR UPDATE
ON salotex.cab_factura_venta
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW

BEGIN
  IF INSERTING THEN
    IF :new.id_factura_venta IS NULL THEN
      :new.id_factura_venta := seq_factura_venta.nextval;
    END IF;
  END IF;
  IF UPDATING THEN
    IF if_update(:new.estado,:old.estado) AND :new.estado = 'ANULADO' THEN
      :new.usuario_anulo := Nvl(v('APP_USER'),USER);
      :new.fecha_anulo := CURRENT_DATE;
    END IF;
  END IF;
END;
/


