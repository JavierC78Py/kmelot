PROMPT CREATE TABLE salotex.cab_orden_produccion
CREATE TABLE salotex.cab_orden_produccion (
  id_orden_prod        NUMBER(10,0)      NOT NULL,
  nro_orden            VARCHAR2(50)      NOT NULL,
  fecha_orden          DATE              NOT NULL,
  fecha_inicio_est     DATE              NULL,
  fecha_fin_real       DATE              NULL,
  suc_id_sucursal      NUMBER(20,0)      NOT NULL,
  dep_id_deposito_orig NUMBER(10,0)      NOT NULL,
  dep_id_deposito_dest NUMBER(10,0)      NOT NULL,
  rec_id_receta        NUMBER(10,0)      NOT NULL,
  pro_id_producto_fin  NUMBER(10,0)      NOT NULL,
  cantidad_a_producir  NUMBER(15,3)      NOT NULL,
  costo_total_estimado NUMBER(18,2)      NULL,
  costo_total_real     NUMBER(18,2)      NULL,
  estado               VARCHAR2(20)      NOT NULL,
  observacion          VARCHAR2(500)     NULL,
  usuario_registro     VARCHAR2(20 CHAR) NULL,
  fecha_registro       DATE              NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.cab_orden_produccion ADD CONSTRAINT cab_orden_estado_ck CHECK
ALTER TABLE salotex.cab_orden_produccion
  ADD CONSTRAINT cab_orden_estado_ck CHECK (
    estado IN (
        'PENDIENTE',
        'EN_PROCESO',
        'FINALIZADO',
        'ANULADO'
    )
  )
/

PROMPT ALTER TABLE salotex.cab_orden_produccion ADD CONSTRAINT cab_orden_produccion_pk PRIMARY KEY
ALTER TABLE salotex.cab_orden_produccion
  ADD CONSTRAINT cab_orden_produccion_pk PRIMARY KEY (
    id_orden_prod
  )
  USING INDEX INITRANS 20 STORAGE (NEXT 1024 K)
/

PROMPT ALTER TABLE salotex.cab_orden_produccion ADD CONSTRAINT cab_orden_sucursal_fk FOREIGN KEY
ALTER TABLE salotex.cab_orden_produccion
  ADD CONSTRAINT cab_orden_sucursal_fk FOREIGN KEY (
    suc_id_sucursal
  ) REFERENCES salotex.sucursal_entidad (
    id_suc_entidad
  )
/

PROMPT ALTER TABLE salotex.cab_orden_produccion ADD CONSTRAINT cab_orden_deposito_orig_fk FOREIGN KEY
ALTER TABLE salotex.cab_orden_produccion
  ADD CONSTRAINT cab_orden_deposito_orig_fk FOREIGN KEY (
    dep_id_deposito_orig
  ) REFERENCES salotex.deposito (
    id_deposito
  )
/

PROMPT ALTER TABLE salotex.cab_orden_produccion ADD CONSTRAINT cab_orden_deposito_dest_fk FOREIGN KEY
ALTER TABLE salotex.cab_orden_produccion
  ADD CONSTRAINT cab_orden_deposito_dest_fk FOREIGN KEY (
    dep_id_deposito_dest
  ) REFERENCES salotex.deposito (
    id_deposito
  )
/

PROMPT ALTER TABLE salotex.cab_orden_produccion ADD CONSTRAINT cab_orden_receta_fk FOREIGN KEY
ALTER TABLE salotex.cab_orden_produccion
  ADD CONSTRAINT cab_orden_receta_fk FOREIGN KEY (
    rec_id_receta
  ) REFERENCES salotex.cab_receta_produccion (
    id_receta
  )
/

PROMPT ALTER TABLE salotex.cab_orden_produccion ADD CONSTRAINT cab_orden_producto_fk FOREIGN KEY
ALTER TABLE salotex.cab_orden_produccion
  ADD CONSTRAINT cab_orden_producto_fk FOREIGN KEY (
    pro_id_producto_fin
  ) REFERENCES salotex.producto (
    id_producto
  )
/

PROMPT CREATE SEQUENCE salotex.seq_cab_orden_produccion
CREATE SEQUENCE salotex.seq_cab_orden_produccion
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
/

PROMPT CREATE OR REPLACE TRIGGER salotex.cab_orden_produccion_bt
CREATE OR REPLACE TRIGGER salotex.cab_orden_produccion_bt BEFORE
    INSERT ON salotex.cab_orden_produccion
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
BEGIN
  IF INSERTING THEN
    IF :new.id_orden_prod IS NULL THEN
      :new.id_orden_prod := seq_cab_orden_produccion.nextval;
    END IF;
    IF :new.fecha_registro IS NULL THEN
      :new.fecha_registro := SYSDATE;
    END IF;
    IF :new.usuario_registro IS NULL THEN
      :new.usuario_registro := NVL(V('APP_USER'), USER);
    END IF;
  END IF;
END;
/

PROMPT CREATE TABLE salotex.cab_orden_produccion_jn
CREATE TABLE salotex.cab_orden_produccion_jn (
  jn_operation         VARCHAR2(3) NOT NULL,
  jn_oracle_user       VARCHAR2(30) NOT NULL,
  jn_datetime          DATE NOT NULL,
  jn_notes             VARCHAR2(240),
  jn_appln             VARCHAR2(35),
  jn_session           NUMBER(38),
  id_orden_prod        NUMBER(10,0),
  nro_orden            VARCHAR2(50),
  fecha_orden          DATE,
  fecha_inicio_est     DATE,
  fecha_fin_real       DATE,
  suc_id_sucursal      NUMBER(20,0),
  dep_id_deposito_orig NUMBER(10,0),
  dep_id_deposito_dest NUMBER(10,0),
  rec_id_receta        NUMBER(10,0),
  pro_id_producto_fin  NUMBER(10,0),
  cantidad_a_producir  NUMBER(15,3),
  costo_total_estimado NUMBER(18,2),
  costo_total_real     NUMBER(18,2),
  estado               VARCHAR2(20),
  observacion          VARCHAR2(500),
  usuario_registro     VARCHAR2(20 CHAR),
  fecha_registro       DATE
)
/

PROMPT CREATE OR REPLACE TRIGGER salotex.cab_orden_produccion_jntrg
CREATE OR REPLACE TRIGGER salotex.cab_orden_produccion_jntrg
  AFTER INSERT OR UPDATE OR DELETE ON salotex.cab_orden_produccion FOR EACH ROW
DECLARE
  rec SALOTEX.CAB_ORDEN_PRODUCCION_JN%ROWTYPE;
  blank SALOTEX.CAB_ORDEN_PRODUCCION_JN%ROWTYPE;
BEGIN
  rec := blank;
  IF INSERTING OR UPDATING THEN
    rec.id_orden_prod        := :NEW.id_orden_prod;
    rec.nro_orden            := :NEW.nro_orden;
    rec.fecha_orden          := :NEW.fecha_orden;
    rec.fecha_inicio_est     := :NEW.fecha_inicio_est;
    rec.fecha_fin_real       := :NEW.fecha_fin_real;
    rec.suc_id_sucursal      := :NEW.suc_id_sucursal;
    rec.dep_id_deposito_orig := :NEW.dep_id_deposito_orig;
    rec.dep_id_deposito_dest := :NEW.dep_id_deposito_dest;
    rec.rec_id_receta        := :NEW.rec_id_receta;
    rec.pro_id_producto_fin  := :NEW.pro_id_producto_fin;
    rec.cantidad_a_producir  := :NEW.cantidad_a_producir;
    rec.costo_total_estimado := :NEW.costo_total_estimado;
    rec.costo_total_real     := :NEW.costo_total_real;
    rec.estado               := :NEW.estado;
    rec.observacion          := :NEW.observacion;
    rec.usuario_registro     := :NEW.usuario_registro;
    rec.fecha_registro       := :NEW.fecha_registro;
    rec.jn_datetime          := SYSDATE;
    rec.jn_oracle_user       := NVL(V('APP_USER'),USER);
    rec.jn_appln             := SYS_CONTEXT ('USERENV', 'MODULE');
    rec.jn_session           := SYS_CONTEXT ('USERENV', 'SESSIONID');
    IF INSERTING THEN
      rec.jn_operation := 'INS';
    ELSIF UPDATING THEN
      rec.jn_operation := 'UPD';
    END IF;
  ELSIF DELETING THEN
    rec.id_orden_prod        := :OLD.id_orden_prod;
    rec.nro_orden            := :OLD.nro_orden;
    rec.fecha_orden          := :OLD.fecha_orden;
    rec.fecha_inicio_est     := :OLD.fecha_inicio_est;
    rec.fecha_fin_real       := :OLD.fecha_fin_real;
    rec.suc_id_sucursal      := :OLD.suc_id_sucursal;
    rec.dep_id_deposito_orig := :OLD.dep_id_deposito_orig;
    rec.dep_id_deposito_dest := :OLD.dep_id_deposito_dest;
    rec.rec_id_receta        := :OLD.rec_id_receta;
    rec.pro_id_producto_fin  := :OLD.pro_id_producto_fin;
    rec.cantidad_a_producir  := :OLD.cantidad_a_producir;
    rec.costo_total_estimado := :OLD.costo_total_estimado;
    rec.costo_total_real     := :OLD.costo_total_real;
    rec.estado               := :OLD.estado;
    rec.observacion          := :OLD.observacion;
    rec.usuario_registro     := :OLD.usuario_registro;
    rec.fecha_registro       := :OLD.fecha_registro;
    rec.jn_datetime          := SYSDATE;
    rec.jn_oracle_user       := NVL(V('APP_USER'),USER);
    rec.jn_appln             := SYS_CONTEXT ('USERENV', 'MODULE');
    rec.jn_session           := SYS_CONTEXT ('USERENV', 'SESSIONID');
    rec.jn_operation         := 'DEL';
  END IF;
  INSERT INTO SALOTEX.CAB_ORDEN_PRODUCCION_JN VALUES rec;
END;
/
