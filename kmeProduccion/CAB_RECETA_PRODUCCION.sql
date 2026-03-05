PROMPT CREATE TABLE salotex.cab_receta_produccion
CREATE TABLE salotex.cab_receta_produccion (
  id_receta            NUMBER(10,0)      NOT NULL,
  pro_id_producto_fin  NUMBER(10,0)      NOT NULL,
  descripcion_receta   VARCHAR2(200)     NOT NULL,
  cantidad_base        NUMBER(15,3)      NOT NULL,
  uni_id_unidad_medida NUMBER(10,0)      NOT NULL,
  estado               VARCHAR2(10)      NOT NULL,
  usuario_registro     VARCHAR2(20 CHAR) NULL,
  fecha_registro       DATE              NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.cab_receta_produccion ADD CONSTRAINT cab_receta_estado_ck CHECK
ALTER TABLE salotex.cab_receta_produccion
  ADD CONSTRAINT cab_receta_estado_ck CHECK (
    estado IN (
        'ACTIVO',
        'INACTIVO'
    )
  )
/

PROMPT ALTER TABLE salotex.cab_receta_produccion ADD CONSTRAINT cab_receta_pk PRIMARY KEY
ALTER TABLE salotex.cab_receta_produccion
  ADD CONSTRAINT cab_receta_pk PRIMARY KEY (
    id_receta
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.cab_receta_produccion ADD CONSTRAINT cab_receta_producto_fk FOREIGN KEY
ALTER TABLE salotex.cab_receta_produccion
  ADD CONSTRAINT cab_receta_producto_fk FOREIGN KEY (
    pro_id_producto_fin
  ) REFERENCES salotex.producto (
    id_producto
  )
/

PROMPT ALTER TABLE salotex.cab_receta_produccion ADD CONSTRAINT cab_receta_unidad_medida_fk FOREIGN KEY
ALTER TABLE salotex.cab_receta_produccion
  ADD CONSTRAINT cab_receta_unidad_medida_fk FOREIGN KEY (
    uni_id_unidad_medida
  ) REFERENCES salotex.unidad_medida (
    id_unidad_medida
  )
/

PROMPT CREATE SEQUENCE salotex.seq_cab_receta_produccion
CREATE SEQUENCE salotex.seq_cab_receta_produccion
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
/

PROMPT CREATE OR REPLACE TRIGGER salotex.cab_receta_produccion_bt
CREATE OR REPLACE TRIGGER salotex.cab_receta_produccion_bt BEFORE
    INSERT ON salotex.cab_receta_produccion
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
BEGIN
  IF INSERTING THEN
    IF :new.id_receta IS NULL THEN
      :new.id_receta := seq_cab_receta_produccion.nextval;
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

PROMPT CREATE TABLE salotex.cab_receta_produccion_jn
CREATE TABLE salotex.cab_receta_produccion_jn (
  jn_operation         VARCHAR2(3) NOT NULL,
  jn_oracle_user       VARCHAR2(30) NOT NULL,
  jn_datetime          DATE NOT NULL,
  jn_notes             VARCHAR2(240),
  jn_appln             VARCHAR2(35),
  jn_session           NUMBER(38),
  id_receta            NUMBER(10,0),
  pro_id_producto_fin  NUMBER(10,0),
  descripcion_receta   VARCHAR2(200),
  cantidad_base        NUMBER(15,3),
  uni_id_unidad_medida NUMBER(10,0),
  estado               VARCHAR2(10),
  usuario_registro     VARCHAR2(20 CHAR),
  fecha_registro       DATE
)
/

PROMPT CREATE OR REPLACE TRIGGER salotex.cab_receta_produccion_jntrg
CREATE OR REPLACE TRIGGER salotex.cab_receta_produccion_jntrg
  AFTER INSERT OR UPDATE OR DELETE ON salotex.cab_receta_produccion FOR EACH ROW
DECLARE
  rec SALOTEX.CAB_RECETA_PRODUCCION_JN%ROWTYPE;
  blank SALOTEX.CAB_RECETA_PRODUCCION_JN%ROWTYPE;
BEGIN
  rec := blank;
  IF INSERTING OR UPDATING THEN
    rec.id_receta            := :NEW.id_receta;
    rec.pro_id_producto_fin  := :NEW.pro_id_producto_fin;
    rec.descripcion_receta   := :NEW.descripcion_receta;
    rec.cantidad_base        := :NEW.cantidad_base;
    rec.uni_id_unidad_medida := :NEW.uni_id_unidad_medida;
    rec.estado               := :NEW.estado;
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
    rec.id_receta            := :OLD.id_receta;
    rec.pro_id_producto_fin  := :OLD.pro_id_producto_fin;
    rec.descripcion_receta   := :OLD.descripcion_receta;
    rec.cantidad_base        := :OLD.cantidad_base;
    rec.uni_id_unidad_medida := :OLD.uni_id_unidad_medida;
    rec.estado               := :OLD.estado;
    rec.usuario_registro     := :OLD.usuario_registro;
    rec.fecha_registro       := :OLD.fecha_registro;
    rec.jn_datetime          := SYSDATE;
    rec.jn_oracle_user       := NVL(V('APP_USER'),USER);
    rec.jn_appln             := SYS_CONTEXT ('USERENV', 'MODULE');
    rec.jn_session           := SYS_CONTEXT ('USERENV', 'SESSIONID');
    rec.jn_operation         := 'DEL';
  END IF;
  INSERT INTO SALOTEX.CAB_RECETA_PRODUCCION_JN VALUES rec;
END;
/
