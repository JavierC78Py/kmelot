PROMPT CREATE TABLE salotex.tipo_documento
CREATE TABLE salotex.tipo_documento (
  id_tipo_documento NUMBER(10,0)      NOT NULL,
  descripcion       VARCHAR2(100)     NOT NULL,
  estado            VARCHAR2(10 CHAR) NOT NULL,
  abreviatura       VARCHAR2(10)      NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.tipo_documento ADD CONSTRAINT tipo_documento_estado_ck CHECK
ALTER TABLE salotex.tipo_documento
  ADD CONSTRAINT tipo_documento_estado_ck CHECK (
    estado IN (
        'ACTIVO',
        'INACTIVO'
    )
  )
/

PROMPT ALTER TABLE salotex.tipo_documento ADD CONSTRAINT tipo_documento_pk PRIMARY KEY
ALTER TABLE salotex.tipo_documento
  ADD CONSTRAINT tipo_documento_pk PRIMARY KEY (
    id_tipo_documento
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.tipo_documento ADD CONSTRAINT tip_doc_desc_uk UNIQUE
ALTER TABLE salotex.tipo_documento
  ADD CONSTRAINT tip_doc_desc_uk UNIQUE (
    descripcion
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.tipo_documento_id_tip_doc_ins
CREATE OR REPLACE TRIGGER salotex.tipo_documento_id_tip_doc_ins BEFORE
    INSERT ON salotex.tipo_documento
    FOR EACH ROW


WHEN ( new.id_tipo_documento IS NULL )
BEGIN
    :new.id_tipo_documento := seq_tipo_documento.nextval;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.tipo_documento_jntrg
CREATE OR REPLACE TRIGGER salotex.tipo_documento_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.tipo_documento for each row

Declare
  rec SALOTEX.TIPO_DOCUMENTO_JN%ROWTYPE;
  blank SALOTEX.TIPO_DOCUMENTO_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_TIPO_DOCUMENTO := :NEW.ID_TIPO_DOCUMENTO;
      rec.DESCRIPCION := :NEW.DESCRIPCION;
      rec.ESTADO := :NEW.ESTADO;
      rec.ABREVIATURA := :NEW.ABREVIATURA;
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
      rec.ID_TIPO_DOCUMENTO := :OLD.ID_TIPO_DOCUMENTO;
      rec.DESCRIPCION := :OLD.DESCRIPCION;
      rec.ESTADO := :OLD.ESTADO;
      rec.ABREVIATURA := :OLD.ABREVIATURA;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.TIPO_DOCUMENTO_JN VALUES rec;
  END;
/


