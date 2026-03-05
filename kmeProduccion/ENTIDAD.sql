PROMPT CREATE TABLE salotex.entidad
CREATE TABLE salotex.entidad (
  id_entidad             NUMBER(10,0)       NOT NULL,
  nombre                 VARCHAR2(200)      NOT NULL,
  tip_id_tipo_documento  NUMBER(10,0)       NOT NULL,
  numero_documento       VARCHAR2(20)       NOT NULL,
  es_cliente             VARCHAR2(2)        DEFAULT 'NO' NULL,
  es_proveedor           VARCHAR2(2)        DEFAULT 'NO' NULL,
  es_empleado            VARCHAR2(2)        DEFAULT 'NO' NULL,
  es_usuario             VARCHAR2(2)        DEFAULT 'NO' NULL,
  estado                 VARCHAR2(10)       NULL,
  fecha_nacimiento       DATE               NULL,
  observacion            VARCHAR2(200 CHAR) NULL,
  usu_id_usuario         NUMBER(10,0)       NULL,
  tipo_entidad           VARCHAR2(10)       NULL,
  suc_id_sucursal        NUMBER(10,0)       NULL,
  ciu_cod_ciudad         NUMBER(10,0)       NULL,
  ent_id_entidad         NUMBER(10,0)       NULL,
  es_prestador           VARCHAR2(2)        DEFAULT 'NO' NULL,
  es_paciente            VARCHAR2(2)        DEFAULT 'NO' NULL,
  sexo                   VARCHAR2(1 CHAR)   NULL,
  nro_celular            VARCHAR2(15 CHAR)  NULL,
  correo                 VARCHAR2(100 CHAR) NULL,
  fact_responsable       VARCHAR2(2 CHAR)   DEFAULT 'NO' NULL,
  resp_ent_id_entidad    NUMBER(10,0)       NULL,
  es_estatal             VARCHAR2(2)        DEFAULT 'NO' NULL,
  es_prepaga             VARCHAR2(2)        DEFAULT 'NO' NULL,
  ent_id_entidad_prepaga NUMBER(10,0)       NULL
)
  INITRANS  10
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT CREATE INDEX salotex.entidad_idx1
CREATE INDEX salotex.entidad_idx1
  ON salotex.entidad (
    usu_id_usuario,
    tipo_entidad,
    estado,
    es_empleado,
    es_usuario,
    ent_id_entidad
  )
  INITRANS  20
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT CREATE INDEX salotex.entidad_nombre_uk
CREATE UNIQUE INDEX salotex.entidad_nombre_uk
  ON salotex.entidad (
    nombre
  )
  INITRANS  20
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_estado_ck CHECK
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_estado_ck CHECK (
    estado IN (
        'ACTIVO',
        'INACTIVO'
    )
  )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_estatal_ck CHECK
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_estatal_ck CHECK (
    es_estatal IN ( 'SI', 'NO' )
  )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_es_cliente_ck CHECK
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_es_cliente_ck CHECK (
    es_cliente IN (
        'NO',
        'SI'
    )
  )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_es_empleado_ck CHECK
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_es_empleado_ck CHECK (
    es_empleado IN (
        'NO',
        'SI'
    )
  )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_es_proveedor_ck CHECK
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_es_proveedor_ck CHECK (
    es_proveedor IN (
        'NO',
        'SI'
    )
  )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_es_usuario_ck CHECK
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_es_usuario_ck CHECK (
    es_usuario IN (
        'NO',
        'SI'
    )
  )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_f_respo_ck CHECK
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_f_respo_ck CHECK (
    fact_responsable IN ( 'SI', 'NO' )
  )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_sexo_ck CHECK
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_sexo_ck CHECK (
    sexo IN ( 'M', 'F' )
  )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_pk PRIMARY KEY
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_pk PRIMARY KEY (
    id_entidad
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_nro_doc_uk UNIQUE
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_nro_doc_uk UNIQUE (
    numero_documento
  )
  USING INDEX
    INITRANS  20
    STORAGE (
      NEXT       1024 K
    )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_entidad_fk FOREIGN KEY
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_entidad_fk FOREIGN KEY (
    resp_ent_id_entidad
  ) REFERENCES salotex.entidad (
    id_entidad
  )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_entidad_prepa_fk FOREIGN KEY
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_entidad_prepa_fk FOREIGN KEY (
    ent_id_entidad_prepaga
  ) REFERENCES salotex.entidad (
    id_entidad
  )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_localidad_fk FOREIGN KEY
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_localidad_fk FOREIGN KEY (
    ciu_cod_ciudad
  ) REFERENCES salotex.localidad (
    cod_ciudad
  )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_sucursal_ent_fk FOREIGN KEY
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_sucursal_ent_fk FOREIGN KEY (
    suc_id_sucursal
  ) REFERENCES salotex.sucursal_entidad (
    id_suc_entidad
  )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_tipo_documento_fk FOREIGN KEY
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_tipo_documento_fk FOREIGN KEY (
    tip_id_tipo_documento
  ) REFERENCES salotex.tipo_documento (
    id_tipo_documento
  )
/

PROMPT ALTER TABLE salotex.entidad ADD CONSTRAINT entidad_usuarios_fk FOREIGN KEY
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_usuarios_fk FOREIGN KEY (
    usu_id_usuario
  ) REFERENCES salotex.usuarios (
    id_usuario
  )
/

PROMPT CREATE OR REPLACE TRIGGER salotex.entidad_bt
CREATE OR REPLACE TRIGGER salotex.entidad_bt
BEFORE INSERT OR UPDATE OR DELETE ON salotex.entidad
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW

BEGIN
  IF INSERTING THEN
    :new.id_entidad := seq_entidad.nextval;
  END IF;
  IF INSERTING OR UPDATING THEN
    IF :new.es_usuario = 'SI' AND :new.usu_id_usuario IS NULL THEN
      Raise_Application_Error(-20999,'Debe declarar USUARIO del colaborador');
    END IF;
  END IF;
END;
/

PROMPT CREATE OR REPLACE TRIGGER salotex.entidad_jntrg
CREATE OR REPLACE TRIGGER salotex.entidad_jntrg
  AFTER
  INSERT OR
  UPDATE OR
  DELETE ON salotex.entidad for each row

Declare
  rec SALOTEX.ENTIDAD_JN%ROWTYPE;
  blank SALOTEX.ENTIDAD_JN%ROWTYPE;
  BEGIN
    rec := blank;
    IF INSERTING OR UPDATING THEN
      rec.ID_ENTIDAD := :NEW.ID_ENTIDAD;
      rec.NOMBRE := :NEW.NOMBRE;
      rec.TIP_ID_TIPO_DOCUMENTO := :NEW.TIP_ID_TIPO_DOCUMENTO;
      rec.NUMERO_DOCUMENTO := :NEW.NUMERO_DOCUMENTO;
      rec.ES_CLIENTE := :NEW.ES_CLIENTE;
      rec.ES_PROVEEDOR := :NEW.ES_PROVEEDOR;
      rec.ES_EMPLEADO := :NEW.ES_EMPLEADO;
      rec.ES_USUARIO := :NEW.ES_USUARIO;
      rec.ESTADO := :NEW.ESTADO;
      rec.FECHA_NACIMIENTO := :NEW.FECHA_NACIMIENTO;
      rec.OBSERVACION := :NEW.OBSERVACION;
      rec.USU_ID_USUARIO := :NEW.USU_ID_USUARIO;
      rec.TIPO_ENTIDAD := :NEW.TIPO_ENTIDAD;
      rec.SUC_ID_SUCURSAL := :NEW.SUC_ID_SUCURSAL;
      rec.CIU_COD_CIUDAD := :NEW.CIU_COD_CIUDAD;
      rec.ENT_ID_ENTIDAD := :NEW.ENT_ID_ENTIDAD;
      rec.ES_PRESTADOR := :NEW.ES_PRESTADOR;
      rec.ES_PACIENTE := :NEW.ES_PACIENTE;
      rec.SEXO := :NEW.SEXO;
      rec.NRO_CELULAR := :NEW.NRO_CELULAR;
      rec.CORREO := :NEW.CORREO;
      rec.FACT_RESPONSABLE := :NEW.FACT_RESPONSABLE;
      rec.RESP_ENT_ID_ENTIDAD := :NEW.RESP_ENT_ID_ENTIDAD;
      rec.ES_ESTATAL := :NEW.ES_ESTATAL;
      rec.ES_PREPAGA := :NEW.ES_PREPAGA;
      rec.ENT_ID_ENTIDAD_PREPAGA := :NEW.ENT_ID_ENTIDAD_PREPAGA;
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
      rec.ID_ENTIDAD := :OLD.ID_ENTIDAD;
      rec.NOMBRE := :OLD.NOMBRE;
      rec.TIP_ID_TIPO_DOCUMENTO := :OLD.TIP_ID_TIPO_DOCUMENTO;
      rec.NUMERO_DOCUMENTO := :OLD.NUMERO_DOCUMENTO;
      rec.ES_CLIENTE := :OLD.ES_CLIENTE;
      rec.ES_PROVEEDOR := :OLD.ES_PROVEEDOR;
      rec.ES_EMPLEADO := :OLD.ES_EMPLEADO;
      rec.ES_USUARIO := :OLD.ES_USUARIO;
      rec.ESTADO := :OLD.ESTADO;
      rec.FECHA_NACIMIENTO := :OLD.FECHA_NACIMIENTO;
      rec.OBSERVACION := :OLD.OBSERVACION;
      rec.USU_ID_USUARIO := :OLD.USU_ID_USUARIO;
      rec.TIPO_ENTIDAD := :OLD.TIPO_ENTIDAD;
      rec.SUC_ID_SUCURSAL := :OLD.SUC_ID_SUCURSAL;
      rec.CIU_COD_CIUDAD := :OLD.CIU_COD_CIUDAD;
      rec.ENT_ID_ENTIDAD := :OLD.ENT_ID_ENTIDAD;
      rec.ES_PRESTADOR := :OLD.ES_PRESTADOR;
      rec.ES_PACIENTE := :OLD.ES_PACIENTE;
      rec.SEXO := :OLD.SEXO;
      rec.NRO_CELULAR := :OLD.NRO_CELULAR;
      rec.CORREO := :OLD.CORREO;
      rec.FACT_RESPONSABLE := :OLD.FACT_RESPONSABLE;
      rec.RESP_ENT_ID_ENTIDAD := :OLD.RESP_ENT_ID_ENTIDAD;
      rec.ES_ESTATAL := :OLD.ES_ESTATAL;
      rec.ES_PREPAGA := :OLD.ES_PREPAGA;
      rec.ENT_ID_ENTIDAD_PREPAGA := :OLD.ENT_ID_ENTIDAD_PREPAGA;
      rec.JN_DATETIME := CURRENT_TIMESTAMP;
      rec.JN_ORACLE_USER := NVL(V('APP_USER'),USER);
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE');
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID');
      rec.JN_OPERATION := 'DEL';
    END IF;
    INSERT into SALOTEX.ENTIDAD_JN VALUES rec;
  END;
/

COMMENT ON COLUMN salotex.entidad.ent_id_entidad IS 'En caso de ser persona fisica, se declara la empresa a la que pertenece.';
COMMENT ON COLUMN salotex.entidad.resp_ent_id_entidad IS 'Id del responsable de pago';
COMMENT ON COLUMN salotex.entidad.ent_id_entidad_prepaga IS 'Id de la prepaga(seguro medico) del paciente';

