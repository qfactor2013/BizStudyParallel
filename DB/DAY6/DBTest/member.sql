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
 values (seq_mno.nextval, 's1@test.com', '1234', '민아', sysdate,sysdate);
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's2@test.com', '1234', '형준', sysdate,sysdate);
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's3@test.com', '1234', '기운', sysdate,sysdate);
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's4@test.com', '1234', '진호', sysdate,sysdate);
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's5@test.com', '128', '진태', sysdate,sysdate);
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's6@test.com', '1234', '도형', sysdate,sysdate);
 
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's7@test.com', '1234', '영하', sysdate,sysdate);
 
 
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's8@test.com', '1234', '선연', sysdate,sysdate);

 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's9@test.com', '1234', '승원', sysdate,sysdate);

 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's10@test.com', '1234', '혜인', sysdate,sysdate);

 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's11@test.com', '1234', '기환', sysdate,sysdate);

  insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's12@test.com', '1234', '지웅', sysdate,sysdate);
 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's13@test.com', '1234', '영택', sysdate,sysdate);

 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's14@test.com', '1234', '의환', sysdate,sysdate);

 insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's15@test.com', '1234', '규민', sysdate,sysdate);

 
  insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's16@test.com', '1234', '지혜', sysdate,sysdate);

   insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's17@test.com', '1234', '미라', sysdate,sysdate);

  insert into members (mno, email, pwd, mname,  cre_date, mod_date )
 values (seq_mno.nextval, 's18@test.com', '1234', '환희', sysdate,sysdate);

insert into members (mno, email, pwd, mname,  cre_date, mod_date )
values (seq_mno.nextval, 's19@test.com', '1234', '두영', sysdate,sysdate);

insert into members (mno,email,pwd,mname,cre_date,mod_date)
 values(seq_mno.nextval, 's20@test.com','1234','재원',sysdate, sysdate);


insert into members (mno,email,pwd,mname,cre_date,mod_date)
 values(seq_mno.nextval, 's21@test.com','1234','성호',sysdate, sysdate);


 select * from members
 
 
  