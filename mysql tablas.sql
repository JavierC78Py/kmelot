SELECT count(*) FROM baileys_db04.Chat;
SELECT count(*) FROM baileys_db04.Message;
delete from baileys_db04.Chat where pkId>0;
delete from baileys_db04.Message where pkId>0;
commit;