ALTER TABLE diagnostico ADD descripcion_larga VARCHAR2(1000);
/
pkg_reserva_consulta
.p_obtener_datos_reserva(
    pi_id_reserva =>
  , po_estado_turno =>
  , po_celular =>
  , po_fecha_turno =>
  , po_id_prestador =>
  , po_ci =>
  , po_nombre_paciente =>
  , po_hora_confirma =>
  , po_hora_recepcion =>
  , po_id_pac =>
  , po_id_prepaga =>
);
/
ALTER TABLE entidad ADD ES_PREPAGA VARCHAR2(2) DEFAULT 'NO';
ALTER TABLE entidad ADD ENT_ID_ENTIDAD_PREPAGA NUMBER(10);
--JN
COMMENT ON COLUMN salotex.entidad.ent_id_entidad_prepaga IS 'Id de la prepaga(seguro medico) del paciente';
/
ALTER TABLE salotex.entidad
  ADD CONSTRAINT entidad_entidad_prepa_fk FOREIGN KEY (
    ent_id_entidad_prepaga
  ) REFERENCES salotex.entidad (
    id_entidad
  )
/
ALTER TABLE reserva_consulta ADD ent_id_entidad_prepaga NUMBER(10);
/
ALTER TABLE salotex.reserva_consulta
  ADD CONSTRAINT reser_cons_ent_prepa_fk FOREIGN KEY (
    ent_id_entidad_prepaga
  ) REFERENCES salotex.entidad (
    id_entidad
  )
/
entidad
/
UPDATE entidad
SET es_paciente = 'SI'
WHERE id_entidad = 5