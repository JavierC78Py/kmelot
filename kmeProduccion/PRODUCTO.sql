PROMPT CREATE TABLE salotex.producto
CREATE TABLE salotex.producto (
  id_producto               NUMBER(10,0)      NOT NULL,
  descripcion               VARCHAR2(200)     NOT NULL,
  ori_id_origen             NUMBER(10,0)      NULL,
  mar_id_marca              NUMBER(10,0)      NULL,
  gru_id_grupo              NUMBER(10,0)      NOT NULL,
  iva_id_iva                NUMBER(4,0)       NOT NULL,
  codigo_barra_fabrica      VARCHAR2(200)     NULL,
  codigo_barra_interno      VARCHAR2(200)     NULL,
  estado                    VARCHAR2(10)      NOT NULL,
  cue_con_id_cta_compra     NUMBER(10,0)      NULL,
  cue_con_id_cta_venta      NUMBER(10,0)      NULL,
  cue_con_id_cta_costo_v    NUMBER(10,0)      NULL,
  cue_con_id_cta_devol_cli  NUMBER(10,0)      NULL,
  cue_con_id_cta_dscto_prov NUMBER(10,0)      NULL,
  es_unico                  VARCHAR2(2)       NOT NULL,
  nombre_archivo            VARCHAR2(200)     NULL,
  mime_type_archivo         VARCHAR2(200)     NULL,
  stock_minimo              NUMBER(15,3)      NULL,
  tipo                      VARCHAR2(3)       NOT NULL,
  producto_codigo           VARCHAR2(20 CHAR) NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.producto ADD CONSTRAINT producto_estado_ck CHECK
ALTER TABLE salotex.producto
  ADD CONSTRAINT producto_estado_ck CHECK (
    estado IN (
        'ACTIVO',
        'INACTIVO'
    )
  )
/

PROMPT ALTER TABLE salotex.producto ADD CONSTRAINT producto_tipo_ck CHECK
ALTER TABLE salotex.producto
  ADD CONSTRAINT producto_tipo_ck CHECK (
    tipo IN ( 'ART', 'SRV' )
  )
/

PROMPT ALTER TABLE salotex.producto ADD CONSTRAINT producto_unico_ck CHECK
ALTER TABLE salotex.producto
  ADD CONSTRAINT producto_unico_ck CHECK (
    es_unico IN (
        'NO',
        'SI'
    )
  )
/

PROMPT ALTER TABLE salotex.producto ADD CONSTRAINT pro_pk PRIMARY KEY
ALTER TABLE salotex.producto
  ADD CONSTRAINT pro_pk PRIMARY KEY (
    id_producto
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.producto ADD CONSTRAINT producto_barr_fab_uk UNIQUE
ALTER TABLE salotex.producto
  ADD CONSTRAINT producto_barr_fab_uk UNIQUE (
    codigo_barra_fabrica
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.producto ADD CONSTRAINT producto_barr_int_uk UNIQUE
ALTER TABLE salotex.producto
  ADD CONSTRAINT producto_barr_int_uk UNIQUE (
    codigo_barra_interno
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.producto ADD CONSTRAINT producto_codigo_uk UNIQUE
ALTER TABLE salotex.producto
  ADD CONSTRAINT producto_codigo_uk UNIQUE (
    producto_codigo
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.producto ADD CONSTRAINT producto_grupo_producto_fk FOREIGN KEY
ALTER TABLE salotex.producto
  ADD CONSTRAINT producto_grupo_producto_fk FOREIGN KEY (
    gru_id_grupo
  ) REFERENCES salotex.grupo_producto (
    id_grupo
  )
/

PROMPT ALTER TABLE salotex.producto ADD CONSTRAINT producto_iva_fk FOREIGN KEY
ALTER TABLE salotex.producto
  ADD CONSTRAINT producto_iva_fk FOREIGN KEY (
    iva_id_iva
  ) REFERENCES salotex.iva (
    id_iva
  )
/

PROMPT ALTER TABLE salotex.producto ADD CONSTRAINT producto_marca_fk FOREIGN KEY
ALTER TABLE salotex.producto
  ADD CONSTRAINT producto_marca_fk FOREIGN KEY (
    mar_id_marca
  ) REFERENCES salotex.marca (
    id_marca
  )
/

PROMPT ALTER TABLE salotex.producto ADD CONSTRAINT producto_origen_producto_fk FOREIGN KEY
ALTER TABLE salotex.producto
  ADD CONSTRAINT producto_origen_producto_fk FOREIGN KEY (
    ori_id_origen
  ) REFERENCES salotex.origen_producto (
    id_origen
  )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.producto_bt
CREATE OR REPLACE TRIGGER salotex.producto_bt BEFORE
    INSERT OR UPDATE OR DELETE ON salotex.producto
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW

BEGIN
  IF INSERTING THEN
    :new.id_producto := seq_producto.nextval;
  END IF;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.producto_jntrg
CREATE OR REPLACE TRIGGER salotex.producto_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.producto for each row

Declare
  rec SALOTEX.PRODUCTO_JN%ROWTYPE;
  blank SALOTEX.PRODUCTO_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_PRODUCTO := :NEW.ID_PRODUCTO;
      rec.DESCRIPCION := :NEW.DESCRIPCION;
      rec.ORI_ID_ORIGEN := :NEW.ORI_ID_ORIGEN;
      rec.MAR_ID_MARCA := :NEW.MAR_ID_MARCA;
      rec.GRU_ID_GRUPO := :NEW.GRU_ID_GRUPO;
      rec.IVA_ID_IVA := :NEW.IVA_ID_IVA;
      rec.CODIGO_BARRA_FABRICA := :NEW.CODIGO_BARRA_FABRICA;
      rec.CODIGO_BARRA_INTERNO := :NEW.CODIGO_BARRA_INTERNO;
      rec.ESTADO := :NEW.ESTADO;
      rec.CUE_CON_ID_CTA_COMPRA := :NEW.CUE_CON_ID_CTA_COMPRA;
      rec.CUE_CON_ID_CTA_VENTA := :NEW.CUE_CON_ID_CTA_VENTA;
      rec.CUE_CON_ID_CTA_COSTO_V := :NEW.CUE_CON_ID_CTA_COSTO_V;
      rec.CUE_CON_ID_CTA_DEVOL_CLI := :NEW.CUE_CON_ID_CTA_DEVOL_CLI;
      rec.CUE_CON_ID_CTA_DSCTO_PROV := :NEW.CUE_CON_ID_CTA_DSCTO_PROV;
      rec.ES_UNICO := :NEW.ES_UNICO;
      rec.NOMBRE_ARCHIVO := :NEW.NOMBRE_ARCHIVO;
      rec.MIME_TYPE_ARCHIVO := :NEW.MIME_TYPE_ARCHIVO;
      rec.STOCK_MINIMO := :NEW.STOCK_MINIMO;
      rec.TIPO := :NEW.TIPO;
      rec.PRODUCTO_CODIGO := :NEW.PRODUCTO_CODIGO;
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
      rec.ID_PRODUCTO := :OLD.ID_PRODUCTO;
      rec.DESCRIPCION := :OLD.DESCRIPCION;
      rec.ORI_ID_ORIGEN := :OLD.ORI_ID_ORIGEN;
      rec.MAR_ID_MARCA := :OLD.MAR_ID_MARCA;
      rec.GRU_ID_GRUPO := :OLD.GRU_ID_GRUPO;
      rec.IVA_ID_IVA := :OLD.IVA_ID_IVA;
      rec.CODIGO_BARRA_FABRICA := :OLD.CODIGO_BARRA_FABRICA;
      rec.CODIGO_BARRA_INTERNO := :OLD.CODIGO_BARRA_INTERNO;
      rec.ESTADO := :OLD.ESTADO;
      rec.CUE_CON_ID_CTA_COMPRA := :OLD.CUE_CON_ID_CTA_COMPRA;
      rec.CUE_CON_ID_CTA_VENTA := :OLD.CUE_CON_ID_CTA_VENTA;
      rec.CUE_CON_ID_CTA_COSTO_V := :OLD.CUE_CON_ID_CTA_COSTO_V;
      rec.CUE_CON_ID_CTA_DEVOL_CLI := :OLD.CUE_CON_ID_CTA_DEVOL_CLI;
      rec.CUE_CON_ID_CTA_DSCTO_PROV := :OLD.CUE_CON_ID_CTA_DSCTO_PROV;
      rec.ES_UNICO := :OLD.ES_UNICO;
      rec.NOMBRE_ARCHIVO := :OLD.NOMBRE_ARCHIVO;
      rec.MIME_TYPE_ARCHIVO := :OLD.MIME_TYPE_ARCHIVO;
      rec.STOCK_MINIMO := :OLD.STOCK_MINIMO;
      rec.TIPO := :OLD.TIPO;
      rec.PRODUCTO_CODIGO := :OLD.PRODUCTO_CODIGO;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.PRODUCTO_JN VALUES rec;
  END;
/


