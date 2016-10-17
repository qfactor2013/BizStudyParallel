drop  table members;

create table members(
 mno number  primary key ,
 email varchar2(40) unique ,
 pwd varchar2(100),
 mname varchar2(50),
 cre_date date,
 mod_date date 
 );
 
 create sequence seq_mno ;
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's1@test.com', '1234', '�ξ�', sysdate,sysdate);
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's2@test.com', '1234', '����', sysdate,sysdate);
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's3@test.com', '1234', '���', sysdate,sysdate);
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's4@test.com', '1234', '��ȣ', sysdate,sysdate);
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's5@test.com', '128', '����', sysdate,sysdate);
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's6@test.com', '1234', '����', sysdate,sysdate);
 
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's7@test.com', '1234', '����', sysdate,sysdate);
 
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's8@test.com', '1234', '����', sysdate,sysdate);

 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's9@test.com', '1234', '�¿�', sysdate,sysdate);

 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's10@test.com', '1234', '����', sysdate,sysdate);

 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's11@test.com', '1234', '��ȯ', sysdate,sysdate);

  insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's12@test.com', '1234', '����', sysdate,sysdate);
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's13@test.com', '1234', '����', sysdate,sysdate);

 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's14@test.com', '1234', '��ȯ', sysdate,sysdate);

 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's15@test.com', '1234', '�Թ�', sysdate,sysdate);

 
  insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's16@test.com', '1234', '����', sysdate,sysdate);

   insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's17@test.com', '1234', '�̶�', sysdate,sysdate);

  insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's18@test.com', '1234', 'ȯ��', sysdate,sysdate);

insert into members (mno, email, pwd, mname,  cre_date, mod_date )
values (seq_mno.nextval, 's19@test.com', '1234', '�ο�', sysdate,sysdate);

insert into members (mno,email,pwd,mname,cre_date,mod_date)
 values(seq_mno.nextval, 's20@test.com','1234','���',sysdate, sysdate);


insert into members (mno,email,pwd,mname,cre_date,mod_date)
 values(seq_mno.nextval, 's21@test.com','1234','��ȣ',sysdate, sysdate);


 select * from members
 
 
  