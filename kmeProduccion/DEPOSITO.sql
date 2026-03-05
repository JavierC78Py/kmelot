PROMPT CREATE TABLE salotex.deposito
CREATE TABLE salotex.deposito (
  id_deposito     NUMBER(10,0) NOT NULL,
  descripcion     VARCHAR2(50) NOT NULL,
  suc_id_sucursal NUMBER(20,0) NOT NULL,
  bloqueo_stock   VARCHAR2(2)  NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.deposito ADD CONSTRAINT dep_pk PRIMARY KEY
ALTER TABLE salotex.deposito
  ADD CONSTRAINT dep_pk PRIMARY KEY (
    id_deposito
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.deposito ADD CONSTRAINT deposito_descrip_uk UNIQUE
ALTER TABLE salotex.deposito
  ADD CONSTRAINT deposito_descrip_uk UNIQUE (
    descripcion
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.deposito ADD CONSTRAINT deposito_sucursal_fk FOREIGN KEY
ALTER TABLE salotex.deposito
  ADD CONSTRAINT deposito_sucursal_fk FOREIGN KEY (
    suc_id_sucursal
  ) REFERENCES salotex.sucursal_entidad (
    id_suc_entidad
  )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.deposito_id_deposito_ins
CREATE OR REPLACE TRIGGER salotex.deposito_id_deposito_ins BEFORE
    INSERT ON salotex.deposito
    FOR EACH ROW


WHEN ( new.id_deposito IS NULL )
BEGIN
    :new.id_deposito := seq_deposito.nextval;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.deposito_jntrg
CREATE OR REPLACE TRIGGER salotex.deposito_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.deposito for each row

Declare
  rec SALOTEX.DEPOSITO_JN%ROWTYPE;
  blank SALOTEX.DEPOSITO_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_DEPOSITO := :NEW.ID_DEPOSITO;
      rec.DESCRIPCION := :NEW.DESCRIPCION;
      rec.SUC_ID_SUCURSAL := :NEW.SUC_ID_SUCURSAL;
      rec.BLOQUEO_STOCK := :NEW.BLOQUEO_STOCK;
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
      rec.ID_DEPOSITO := :OLD.ID_DEPOSITO;
      rec.DESCRIPCION := :OLD.DESCRIPCION;
      rec.SUC_ID_SUCURSAL := :OLD.SUC_ID_SUCURSAL;
      rec.BLOQUEO_STOCK := :OLD.BLOQUEO_STOCK;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.DEPOSITO_JN VALUES rec;
  END;
/


