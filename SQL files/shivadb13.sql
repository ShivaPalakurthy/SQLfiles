create table contact(contact_id integer not null primary key,
contactname varchar2(45) not null,
email varchar2(45) not null,
address varchar2(100) not null,
phone varchar(15) not null);
Drop table contact;
drop sequence contact_id_SEQU;
CREATE SEQUENCE contact_id_SEQU
  START WITH 10001
  INCREMENT BY 1
  CACHE 50;
    UPDATE contact
   SET contact_id = contact_id_SEQU.nextval;
CREATE OR REPLACE TRIGGER trg_contact_contact_id
  BEFORE INSERT ON contact
  FOR EACH ROW
BEGIN
  :new.contact_id := contact_id_SEQU.nextval;
END;

desc contact;

INSERT INTO CONTACT(CONTACTNAME,EMAIL,ADDRESS,PHONE) VALUES('SHIVA','SHIVA@GMAIL.COM','INDIA','7901720282');
SELECT * FROM CONTACT;
 