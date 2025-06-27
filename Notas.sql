Update
Pag 100
Pag 110
Pag 98
Pag 15
Pag 14
Pag 1
Pag 34
Pag 35
Pag 38
Pag 39
Pag 105
LV_SINO_VINARIO
/
ALTER TABLE seccion ADD cola_bot NUMBER(1) DEFAULT 0;
/
ALTER TABLE cbc.seccion
  ADD CONSTRAINT seccion_cola_bot_ck CHECK (
    cola_bot IN ( 0, 1 )
  )
/
ALTER TABLE chats ADD sec_id_seccion NUMBER(10);
/
ALTER TABLE cbc.chats
  ADD CONSTRAINT seccion_chats_fk FOREIGN KEY (
    sec_id_seccion
  ) REFERENCES cbc.seccion (
    id_seccion
  )
/