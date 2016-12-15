drop table SCHEDULE_T;
drop table PLAYER_T;
drop table TEAM_T;
drop table STADIUM_T;
drop table TEAM_HISTORY_T;

CREATE TABLE STADIUM_T (
STADIUM_ID    CHAR(3) NOT NULL,
STADIUM_NAME  VARCHAR2(40) NOT NULL,
HOMETEAM_ID   CHAR(3),
SEAT_COUNT    NUMBER,
ADDRESS     VARCHAR2(100),
DDD         VARCHAR2(3),
TEL         VARCHAR2(10),
CONSTRAINT STADIUM_T_PK PRIMARY KEY (STADIUM_ID)
);

CREATE TABLE TEAM_T (
TEAM_ID     CHAR(3) NOT NULL,
REGION_NAME VARCHAR2(10) NOT NULL,
TEAM_NAME   VARCHAR2(20) NOT NULL,
E_TEAM_NAME VARCHAR2(50),
ORIG_YYYY   CHAR(4),
STADIUM_ID  CHAR(3) NOT NULL,
ZIP_CODE1   CHAR(3),
ZIP_CODE2   CHAR(3),
ADDRESS     VARCHAR2(100),
DDD         VARCHAR2(3),
TEL         VARCHAR2(10),
FAX         VARCHAR2(10),
HOMEPAGE    VARCHAR2(50),
OWNER       VARCHAR2(10),
CONSTRAINT TEAM_T_PK PRIMARY KEY (TEAM_ID),
CONSTRAINT TEAM_T_FK FOREIGN KEY (STADIUM_ID) REFERENCES STADIUM_T(STADIUM_ID)
);

CREATE TABLE PLAYER_T (
PLAYER_ID     CHAR(7) NOT NULL,
PLAYER_NAME   VARCHAR2(20) NOT NULL,
TEAM_ID       CHAR(3) NOT NULL,
E_PLAYER_NAME VARCHAR2(40),
NICKNAME      VARCHAR2(30),
JOIN_YYYY     CHAR(4),
POSITION      VARCHAR2(10),
BACK_NO       NUMBER(2),
NATION        VARCHAR2(20),
BIRTH         DATE,
SOLAR         CHAR(1),
HEIGHT        NUMBER(3),
WEIGHT        NUMBER(3),
CONSTRAINT PLAYER_T_PK PRIMARY KEY (PLAYER_ID),
CONSTRAINT PLAYER_T_FK FOREIGN KEY (TEAM_ID) REFERENCES TEAM_T(TEAM_ID)
);

CREATE TABLE SCHEDULE_T (
GUBUN        CHAR(1) NOT NULL,
STADIUM_ID   VARCHAR2(5) NOT NULL,
SCHE_DATE    CHAR(8) NOT NULL,
HOMETEAM_ID  CHAR(3) NOT NULL,
AWAYTEAM_ID  CHAR(3) NOT NULL,
HOME_SCORE   NUMBER(2),
AWAY_SCORE   NUMBER(2),
CONSTRAINT SCHEDULE_T_PK PRIMARY KEY (GUBUN, STADIUM_ID, SCHE_DATE)
);

CREATE TABLE TEAM_HISTORY_T (
TEAM_ID  CHAR(3) NOT NULL,
YYYY     CHAR(4) NOT NULL,
SEQ      NUMBER  NOT NULL,
COMMENTS  VARCHAR2(100),
CONSTRAINT TEAM_HISTORY_T_PK PRIMARY KEY (TEAM_ID, YYYY, SEQ)
);

INSERT INTO team_t VALUES ('K10','����','��Ƽ��','TAEJON CITIZEN','1997','E02','301','030',
'���������� �߱� �λ絿 162-1 �ѹ��� �� ','42','252-2002','221-0669','http://www.tcfc.co.kr','');
INSERT INTO team_t VALUES ('K06','�λ�','�����ܽ�','BUSAN ICONS','1983','C02','57 ','050',
'�λ�� ������ ���ȵ� 1-11���� ������� B/D 9��','51','555-7101','555-7103','http://www.busanicons/co.kr','');
INSERT INTO team_t VALUES ('K04','��õ','SK','BUCHEON SK','1982','B01','110','728',
'���� ���α� ������ 99���� SK ���� 3��','2','2121-5271','2121-5276','http://www.skfc.com','');
INSERT INTO team_t VALUES ('K08','����','��ȭõ��','SEONGNAM ILHWA','1989','B02','462',
'130','��⵵ ������ �߿��� ������ 3110���� �������տ�� ��','31','753-3956','753-4443','http://www.seongnamilhwafc.co.kr','');
INSERT INTO team_t VALUES ('K02','����','�Ｚ�������','SUWON SAMSUNG BLUEWINGS','1995','B04','440','220',
'������ ��ȱ� ������ 601-1 ������ü��ȸ�� 3��','31','247-2002','257-0766','http://www.fcbluewings.com','');
INSERT INTO team_t VALUES ('K09','�Ⱦ�','LGġŸ��','ANYANG LG ','1983','B05','138','221',
'���� ���ı� ���1�� 10���� ���տ�� ��','2','2005-5746','2005-5802','http://www.lgfootball.com','');
INSERT INTO team_t VALUES ('K01','���','����ȣ����','ULSAN HYUNDAI HORANGI','1983','C04','682','060',
'��걤���� ���� ���ϵ� 1����','52','230-6141','230-6145','http://www.horanifc.co.kr','');
INSERT INTO team_t VALUES ('K07','����','�巡����','CHUNNAM DRAGONS','1994','D01','544','010',
'���� ������� �ߵ� 1318-2���� ������� B/D 5��','61','792-5600','792-5605','http://www.dragons.co.kr','');
INSERT INTO team_t VALUES ('K05','����','������ͽ�','CHUNBUK HYUNDAI MOTORS','1994','D03','560','190',
'���� ���ֽ� ������ ������ 1�� 1220����','63','273-1763','273-1762','http://www.hyundai-motors.com','');
INSERT INTO team_t VALUES ('K03','����','��ƿ����','POHANG STEELERS','1973','C06','790','050',
'��� ���׽� �׵��� 645-1 ���� B/D 6��','54','282-2002','282-5955','http://www.steelers.co.kr','');


INSERT INTO stadium_t VALUES ('E01','�ѹ����տ��','K10',30000,'���� ������ �߱� �λ絿 162-1','042','221-2002');
INSERT INTO stadium_t VALUES ('C02','�λ걸��','K06',30000,'�λ걤���� ���� ����ŵ� 3�� 210����','051','247-5771');
INSERT INTO stadium_t VALUES ('B01','��õ����','K04',35000,'��õ�� ���̱� ���ǵ� �� 19����','031','666-0496');
INSERT INTO stadium_t VALUES ('B02','��������','K08',27000,'������ �߿��� ������ 3110����','031','753-3956');
INSERT INTO stadium_t VALUES ('B04','���������ű���','K02',50000,'������ �ȴޱ� �츸1�� 228����','031','259-2150');
INSERT INTO stadium_t VALUES ('B05','�Ⱦ籸��','K09',22500,'��⵵ ���ȱ� ���3�� 1025����','031','380-7212');
INSERT INTO stadium_t VALUES ('C04','��깮������','K01',46102,'��걤���� ���� ���� ��5���� ���ü������','052','220-');
INSERT INTO stadium_t VALUES ('D01','��������','K07',20009,'���� ����� ��ȣ�� 700','061','792-5600');
INSERT INTO stadium_t VALUES ('D03','���ϱ���','K05',28000,'���� ������ ������ 1�� 1220','063','273-1763');
INSERT INTO stadium_t VALUES ('C06','���ױ���','K03',25000,'��� ���׽� ���� ���� 1����','054','282-2002');
INSERT INTO stadium_t VALUES ('B03','��������','','','��⵵ ������','','');
INSERT INTO stadium_t VALUES ('C01','��õ����','','','��� ��õ��','','');
INSERT INTO stadium_t VALUES ('C03','��걸��','','','��걤����','','');
INSERT INTO stadium_t VALUES ('C05','â������','','','�泲 â����','','');
INSERT INTO stadium_t VALUES ('D02','���ֱ���','','','���� ���ֽ�','','');
INSERT INTO stadium_t VALUES ('E02','���������ű���','',41000,'���������� ������ ������ 270����','','');
INSERT INTO stadium_t VALUES ('A01','���� �����Ű����','',63930,'','','');

ALTER Session SET NLS_DATE_LANGUAGE='AMERICAN';
ALTER TABLE PLAYER_T DISABLE CONSTRAINT PLAYER_T_FK;
ALTER TABLE TEAM_T DISABLE CONSTRAINT TEAM_T_FK;
INSERT INTO player_t VALUES ('1999174','�츣���','K06','','','1999','DF','4','����',TO_DATE('30-AUG-77','DD_MON_YY'),'1','180','70');
INSERT INTO player_t VALUES ('1997188','������','K06','','','1995','DF','15','',TO_DATE('01-NOV-72','DD_MON_YY'),'1','180','74');
INSERT INTO player_t VALUES ('2002073','�̱�ȣ','K06','','','2001','DF','23','',TO_DATE('13-JUL-79','DD_MON_YY'),'1','177','72');
INSERT INTO player_t VALUES ('1997178','�̹μ�','K06','','','','DF','20','',TO_DATE('23-JUN-73','DD_MON_YY'),'1','182','73');
INSERT INTO player_t VALUES ('1997191','�����','K06','','���ߵ���,�������','1997','DF','18','',TO_DATE('05-JUN-74','DD_MON_YY'),'2','170','61');
INSERT INTO player_t VALUES ('1998384','����ȿ','K06','','������,��Ű��','1998','DF','19','',TO_DATE('23-JUL-75','DD_MON_YY'),'2','174','68');
INSERT INTO player_t VALUES ('1998395','�����','K06','','�ޱ�','2000','DF','7','',TO_DATE('09-MAR-75','DD_MON_YY'),'2','184','79');
INSERT INTO player_t VALUES ('2001050','�����','K06','','����ȫ�浿','2001','DF','36','',TO_DATE('14-JUN-78','DD_MON_YY'),'1','173','65');
INSERT INTO player_t VALUES ('1997189','���翵','K06','','����','1996','MF','6','',TO_DATE('02-SEP-73','DD_MON_YY'),'2','187','75');
INSERT INTO player_t VALUES ('2001049','���¹�','K06','','ŷī','2001','MF','38','',TO_DATE('25-MAY-82','DD_MON_YY'),'1','180','71');
INSERT INTO player_t VALUES ('2000107','������','K06','','','2000','MF','37','',TO_DATE('04-JUN-81','DD_MON_YY'),'1','178','70');
INSERT INTO player_t VALUES ('2001043','������','K06','','�䷷����','2001','MF','24','',TO_DATE('20-FEB-79','DD_MON_YY'),'1','177','73');
INSERT INTO player_t VALUES ('2001044','������','K06','','���漮','2001','MF','13','',TO_DATE('08-SEP-78','DD_MON_YY'),'1','178','74');
INSERT INTO player_t VALUES ('2002137','�̰�','K06','�̰� �ǹ� �� �丮�̵���','�̰�','2002','MF','21','�����',TO_DATE('25-OCT-79','DD_MON_YY'),'1','181','76');
INSERT INTO player_t VALUES ('1997199','�̿���','K06','','�����','1997','MF','26','',TO_DATE('15-DEC-73','DD_MON_YY'),'2','173','66');
INSERT INTO player_t VALUES ('2002072','�����','K06','','','2002','MF','14','',TO_DATE('22-MAR-79','DD_MON_YY'),'1','176','67');
INSERT INTO player_t VALUES ('1999038','�����','K06','','����������','1999','MF','11','',TO_DATE('25-FEB-77','DD_MON_YY'),'2','175','68');
INSERT INTO player_t VALUES ('1998365','���¼�','K06','','','2001','MF','30','',TO_DATE('16-JUN-77','DD_MON_YY'),'1','177','64');
INSERT INTO player_t VALUES ('2001047','Ȳö��','K06','','��ٸ���','2001','MF','35','',TO_DATE('20-NOV-78','DD_MON_YY'),'1','175','68');
INSERT INTO player_t VALUES ('1998235','�����','K06','','','','FW','39','',TO_DATE('10-OCT-76','DD_MON_YY'),'1','178','71');
INSERT INTO player_t VALUES ('2001048','�����','K06','','','2001','FW','25','',TO_DATE('22-MAY-75','DD_MON_YY'),'1','182','78');
INSERT INTO player_t VALUES ('2002074','��â��','K06','','�Ӷ�','2002','FW','27','',TO_DATE('10-JAN-78','DD_MON_YY'),'1','186','82');
INSERT INTO player_t VALUES ('2002127','���','K06','Sebastiao Pereira do Nascimento','','2002','FW','8','�����',TO_DATE('24-FEB-76','DD_MON_YY'),'1','179','78');
INSERT INTO player_t VALUES ('1997182','����ġ','K06','','�ٶ��� �Ƶ�','1996','FW','9','',TO_DATE('16-JAN-72','DD_MON_YY'),'2','184','80');
INSERT INTO player_t VALUES ('1997195','�켺��','K06','','����','1996','FW','22','',TO_DATE('18-AUG-73','DD_MON_YY'),'2','191','76');
INSERT INTO player_t VALUES ('2000103','����','K06','','¦��','2000','FW','12','',TO_DATE('08-JUL-77','DD_MON_YY'),'1','180','71');
INSERT INTO player_t VALUES ('2002075','�ֱ���','K06','','','2002','FW','29','',TO_DATE('25-SEP-79','DD_MON_YY'),'1','177','73');
INSERT INTO player_t VALUES ('2000087','�ϸ�','K06','','','2000','FW','10','�ݷҺ��',TO_DATE('14-MAY-74','DD_MON_YY'),'1','168','65');
INSERT INTO player_t VALUES ('1900017','����','K06','','','1998','FW','32','',TO_DATE('07-SEP-75','DD_MON_YY'),'2','188','80');
INSERT INTO player_t VALUES ('1900018','���丣','K06','','���丣','2001','FW','28','����������',TO_DATE('05-JAN-75','DD_MON_YY'),'1','183','79');
INSERT INTO player_t VALUES ('1900021','������','K04','CHOI, YOONGYUM','','1985','TM','','',TO_DATE('','DD_MON_YY'),'','178','80');
INSERT INTO player_t VALUES ('1900022','������','K04','HA, JAEHON','','1986','TC','','',TO_DATE('','DD_MON_YY'),'','174','67');
INSERT INTO player_t VALUES ('1900023','����ȣ','K04','LEE, CHUNGHO','','1999','TC','','',TO_DATE('','DD_MON_YY'),'','185','83');
INSERT INTO player_t VALUES ('1900024','�ӱ���','K04','LIM, GIHAN','','1994','TC','','',TO_DATE('','DD_MON_YY'),'','177','85');
INSERT INTO player_t VALUES ('1900025','�̰���','K04','LEE, KYOUNGTAE','','','TD','','',TO_DATE('','DD_MON_YY'),'','','');
INSERT INTO player_t VALUES ('2002054','������','K04','','','','GK','31','',TO_DATE('20-APR-79','DD_MON_YY'),'2','180','72');
INSERT INTO player_t VALUES ('1998499','����ȣ','K04','','','','GK','60','',TO_DATE('04-JUL-68','DD_MON_YY'),'2','185','83');
INSERT INTO player_t VALUES ('2001021','����','K04','','','','GK','1','',TO_DATE('07-NOV-78','DD_MON_YY'),'2','192','85');
INSERT INTO player_t VALUES ('2002052','�ѵ���','K04','','','','GK','21','',TO_DATE('25-AUG-79','DD_MON_YY'),'2','183','78');
INSERT INTO player_t VALUES ('2002126','�ٿ�','K04','','','','DF','61','',TO_DATE('25-SEP-82','DD_MON_YY'),'2','190','80');
INSERT INTO player_t VALUES ('1998182','��ö','K04','','','','DF','15','',TO_DATE('20-AUG-73','DD_MON_YY'),'2','176','77');
INSERT INTO player_t VALUES ('2000112','��â��','K04','','','','DF','23','',TO_DATE('31-DEC-77','DD_MON_YY'),'2','175','67');
INSERT INTO player_t VALUES ('1998424','�Ž�ȣ','K04','','','','DF','2','',TO_DATE('13-MAY-75','DD_MON_YY'),'2','179','70');
INSERT INTO player_t VALUES ('1998450','������','K04','','','','DF','5','',TO_DATE('08-DEC-75','DD_MON_YY'),'1','177','75');
INSERT INTO player_t VALUES ('2001022','�̹���','K04','','','','DF','25','',TO_DATE('11-FEB-79','DD_MON_YY'),'1','182','75');
INSERT INTO player_t VALUES ('2002053','�̻�ȫ','K04','','','','DF','30','',TO_DATE('04-FEB-79','DD_MON_YY'),'1','178','68');
INSERT INTO player_t VALUES ('1900001','����ȣ','K10','','','','TM','','',TO_DATE('29-JAN-61','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900002','����','K10','KIM, SAMSOO','','','TC','','',TO_DATE('08-FEB-63','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900003','������','K10','YOO, DONGWOO','','','TC','40','',TO_DATE('07-MAR-68','DD_MON_YY'),'1','177','70');
INSERT INTO player_t VALUES ('1900004','������','K10','JEON, GIHYUN','','','TD','','',TO_DATE('06-JUN-65','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('2002047','������','K10','KANG, SUNGIL','','2002','GK','30','',TO_DATE('04-JUN-79','DD_MON_YY'),'1','182','80');
INSERT INTO player_t VALUES ('2000057','�̽���','K10','LEE, SEUNGJUN','������','2000','GK','1','',TO_DATE('01-SEP-72','DD_MON_YY'),'1','183','77');
INSERT INTO player_t VALUES ('1997298','������','K10','CHOI, EUNSUNG','��ȣõȲ','1997','GK','21','',TO_DATE('05-APR-71','DD_MON_YY'),'1','184','82');
INSERT INTO player_t VALUES ('1997312','����','K10','KIM, DAESOO','','1997','DF','15','',TO_DATE('20-MAR-75','DD_MON_YY'),'1','184','74');
INSERT INTO player_t VALUES ('2002051','��α�','K10','','','','DF','3','',TO_DATE('25-APR-78','DD_MON_YY'),'1','171','65');
INSERT INTO player_t VALUES ('2000110','�輺��','K10','KIM, SUNGKEUN','','2000','DF','33','',TO_DATE('20-JUN-77','DD_MON_YY'),'1','180','73');
INSERT INTO player_t VALUES ('2001098','�迵��','K10','KIM, YOUNGKWEN','','2001','DF','5','',TO_DATE('12-OCT-78','DD_MON_YY'),'1','180','70');
INSERT INTO player_t VALUES ('1997301','������','K10','KIM, JUNGSOO','','1977','DF','36','',TO_DATE('17-JAN-75','DD_MON_YY'),'2','180','74');
INSERT INTO player_t VALUES ('1997309','��â��','K10','LEE, CHANGYUP','','1997','DF','6','',TO_DATE('19-NOV-74','DD_MON_YY'),'2','174','64');
INSERT INTO player_t VALUES ('1997299','��ö��','K10','JANG, CHULWOO','���ֱ����','2000','DF','7','',TO_DATE('01-APR-71','DD_MON_YY'),'2','172','65');
INSERT INTO player_t VALUES ('2001116','�ݸ�','K10','OMAR PAPA COLY','������Ÿ(Black Camel)','2001','DF','29','���װ�',TO_DATE('20-MAY-75','DD_MON_YY'),'1','182','75');
INSERT INTO player_t VALUES ('1997313','ȫ��ö','K10','HONG, KWANGCHUL','','1997','DF','4','',TO_DATE('09-OCT-74','DD_MON_YY'),'2','172','65');
INSERT INTO player_t VALUES ('1998461','������','K10','KANG, JUNGHOON','','1998','MF','38','',TO_DATE('20-FEB-76','DD_MON_YY'),'1','175','65');
INSERT INTO player_t VALUES ('1997306','������','K10','KONG, OHKYUN','CROW','1997','MF','22','',TO_DATE('10-AUG-74','DD_MON_YY'),'2','177','72');
INSERT INTO player_t VALUES ('2002049','�豹��','K10','KIM, KOOKJIN','','2002','MF','16','',TO_DATE('09-FEB-78','DD_MON_YY'),'1','172','62');
INSERT INTO player_t VALUES ('2001099','�赿��','K10','KIM, DONGSUN','','2001','MF','9','',TO_DATE('15-MAR-78','DD_MON_YY'),'1','170','65');
INSERT INTO player_t VALUES ('2000109','�ڰ��','K10','PARK, KUNGGUY','','2000','MF','10','',TO_DATE('10-MAR-77','DD_MON_YY'),'1','177','72');
INSERT INTO player_t VALUES ('2000111','�ڳ�ö','K10','PARK, RAECHEOL','','2000','MF','24','',TO_DATE('20-AUG-77','DD_MON_YY'),'1','177','71');
INSERT INTO player_t VALUES ('2002048','�輺��','K10','BAE, SUNGJAE','','2002','MF','28','',TO_DATE('01-JUL-79','DD_MON_YY'),'1','178','74');
INSERT INTO player_t VALUES ('2002121','��','K10','','','','MF','25','',TO_DATE('30-APR-79','DD_MON_YY'),'1','174','69');
INSERT INTO player_t VALUES ('2002136','����','K10','','','','MF','26','',TO_DATE('03-JUN-80','DD_MON_YY'),'1','169','70');
INSERT INTO player_t VALUES ('2000056','�̰���','K10','LEE, KWANWOO','SIRIUS','2000','MF','8','',TO_DATE('25-FEB-78','DD_MON_YY'),'1','175','69');
INSERT INTO player_t VALUES ('2002050','�̱���','K10','LEE, KWANGJIN','','2002','MF','13','',TO_DATE('27-MAY-72','DD_MON_YY'),'1','175','75');
INSERT INTO player_t VALUES ('2000113','�̻��','K10','LEE, SANGKYU','','2000','MF','27','',TO_DATE('05-SEP-77','DD_MON_YY'),'1','175','65');
INSERT INTO player_t VALUES ('1999151','�ӿ���','K10','LIM, YOUNGJOO','','1999','MF','23','',TO_DATE('08-MAR-76','DD_MON_YY'),'2','176','68');
INSERT INTO player_t VALUES ('2001101','������','K10','JUNG, YOUNGHOON','','2001','MF','12','',TO_DATE('01-MAY-75','DD_MON_YY'),'1','174','73');
INSERT INTO player_t VALUES ('1998178','������','K10','HAN, JUNGKOOK','','2001','MF','19','',TO_DATE('19-JUL-71','DD_MON_YY'),'1','179','71');
INSERT INTO player_t VALUES ('2002046','�豤��','K10','KIM, KWANGSUN','','2002','FW','32','',TO_DATE('17-JUN-83','DD_MON_YY'),'1','175','68');
INSERT INTO player_t VALUES ('1997315','������','K10','KIM, EUNJUNG','����(SHARP)','1997','FW','18','',TO_DATE('08-APR-79','DD_MON_YY'),'2','184','72');
INSERT INTO player_t VALUES ('1999152','������','K10','KIM. CHANJOONG','','1999','FW','17','',TO_DATE('14-JUN-76','DD_MON_YY'),'2','182','72');
INSERT INTO player_t VALUES ('2001032','�̼�','K10','LEE, SEOK','','2002','FW','20','',TO_DATE('01-FEB-79','DD_MON_YY'),'1','194','85');
INSERT INTO player_t VALUES ('2001100','Ź�ؼ�','K10','TAK, JUNSUK','','2001','FW','11','',TO_DATE('24-MAR-78','DD_MON_YY'),'1','178','69');
INSERT INTO player_t VALUES ('1900011','��ȣ��','K06','','','2000','TM','','',TO_DATE('26-MAR-51','DD_MON_YY'),'1','172','77');
INSERT INTO player_t VALUES ('1900012','�ڰ���','K06','','','','TC','','',TO_DATE('19-JAN-61','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900013','�赿��','K06','','','2000','TC','','',TO_DATE('11-JUN-65','DD_MON_YY'),'1','180','88');
INSERT INTO player_t VALUES ('1900014','�賲ǥ','K06','','','1995','TC','','',TO_DATE('27-JAN-64','DD_MON_YY'),'2','180','77');
INSERT INTO player_t VALUES ('1900015','�豤��','K06','','','1995','TD','','',TO_DATE('30-MAY-68','DD_MON_YY'),'2','180','75');
INSERT INTO player_t VALUES ('1900016','������','K06','','','1996','TD','','',TO_DATE('22-MAY-70','DD_MON_YY'),'1','173','82');
INSERT INTO player_t VALUES ('2001052','�����','K06','','�Ӳ���','2001','GK','41','',TO_DATE('07-FEB-78','DD_MON_YY'),'2','186','78');
INSERT INTO player_t VALUES ('2002076','����','K06','','','2002','GK','40','',TO_DATE('11-OCT-79','DD_MON_YY'),'1','189','83');
INSERT INTO player_t VALUES ('2000108','������','K06','','','2000','GK','31','',TO_DATE('22-NOV-81','DD_MON_YY'),'1','187','77');
INSERT INTO player_t VALUES ('2000059','������','K06','','��������','2000','GK','1','',TO_DATE('10-JUN-77','DD_MON_YY'),'2','186','78');
INSERT INTO player_t VALUES ('2001053','������','K06','','��������','2001','DF','33','',TO_DATE('28-FEB-83','DD_MON_YY'),'1','180','76');
INSERT INTO player_t VALUES ('1997185','����ö','K06','','','1995','DF','3','',TO_DATE('07-NOV-72','DD_MON_YY'),'2','176','73');
INSERT INTO player_t VALUES ('1997193','������','K06','','','1995','DF','17','',TO_DATE('03-JUL-76','DD_MON_YY'),'2','184','68');
INSERT INTO player_t VALUES ('2001055','����ȫ','K06','','���Ӹ�','2001','DF','2','',TO_DATE('13-APR-78','DD_MON_YY'),'1','178','70');
INSERT INTO player_t VALUES ('2001046','������','K06','','��������','2001','DF','34','',TO_DATE('02-JUL-78','DD_MON_YY'),'1','183','79');
INSERT INTO player_t VALUES ('2000058','�����','K06','','������ ��','2000','DF','5','',TO_DATE('11-MAR-77','DD_MON_YY'),'1','184','77');
INSERT INTO player_t VALUES ('1997123','���ӻ�','K04','','','','DF','20','',TO_DATE('17-NOV-71','DD_MON_YY'),'1','183','80');
INSERT INTO player_t VALUES ('1997022','������','K04','','','','DF','36','',TO_DATE('07-JUL-72','DD_MON_YY'),'1','181','72');
INSERT INTO player_t VALUES ('2002058','������','K04','','','','DF','35','',TO_DATE('10-AUG-83','DD_MON_YY'),'1','184','76');
INSERT INTO player_t VALUES ('1999125','�ְŷ�','K04','','','','DF','4','',TO_DATE('26-JUN-76','DD_MON_YY'),'1','183','77');
INSERT INTO player_t VALUES ('2000001','������','K04','','','','DF','3','',TO_DATE('07-OCT-77','DD_MON_YY'),'1','183','78');
INSERT INTO player_t VALUES ('2002134','�丣����','K04','','','','DF','44','',TO_DATE('24-FEB-78','DD_MON_YY'),'1','178','74');
INSERT INTO player_t VALUES ('1900094','������','K03','CHO, MUGYUN','','','TC','','',TO_DATE('18-MAR-61','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1997001','�躴��','K03','KIM, BYUNGJI','','2001','GK','1','',TO_DATE('08-APR-70','DD_MON_YY'),'1','184','77');
INSERT INTO player_t VALUES ('2001069','����ȣ','K03','PARK, JUHO','','2001','GK','51','',TO_DATE('16-JUL-82','DD_MON_YY'),'1','185','75');
INSERT INTO player_t VALUES ('1997130','�̴���','K03','LEE, DAEHEE','','2000','GK','31','',TO_DATE('26-APR-74','DD_MON_YY'),'1','192','88');
INSERT INTO player_t VALUES ('1999133','����ȣ','K03','CHO, JUNHO','','1999','GK','21','',TO_DATE('28-APR-73','DD_MON_YY'),'1','185','77');
INSERT INTO player_t VALUES ('2001065','���ι�','K03','HEO, INMOO','','2001','GK','41','',TO_DATE('14-APR-78','DD_MON_YY'),'1','187','81');
INSERT INTO player_t VALUES ('2001056','����','K03','KANG, YONG','','2001','DF','2','',TO_DATE('14-JAN-79','DD_MON_YY'),'1','179','72');
INSERT INTO player_t VALUES ('1997080','����','K03','GO, BYUNGWOON','','1996','DF','16','',TO_DATE('28-SEP-73','DD_MON_YY'),'1','180','73');
INSERT INTO player_t VALUES ('2002069','�豤��','K03','KIM, KWANGSUK','','2002','DF','39','',TO_DATE('12-FEB-83','DD_MON_YY'),'1','183','72');
INSERT INTO player_t VALUES ('1997002','�����','K03','KIM, SANGHUN','','1996','DF','13','',TO_DATE('08-JUN-73','DD_MON_YY'),'1','183','76');
INSERT INTO player_t VALUES ('2002062','�輮��','K03','KIM, SEOKWOO','','2002','DF','32','',TO_DATE('06-MAY-83','DD_MON_YY'),'1','181','72');
INSERT INTO player_t VALUES ('1999139','������','K03','KIM, EUNSEOK','','1999','DF','5','',TO_DATE('14-MAR-72','DD_MON_YY'),'1','185','80');
INSERT INTO player_t VALUES ('1999030','�ڹμ�','K03','PARK, MINSEO','','1999','DF','3','',TO_DATE('24-AUG-76','DD_MON_YY'),'2','180','78');
INSERT INTO player_t VALUES ('2002064','������','K03','SUNG, JONGHUN','','2002','DF','34','',TO_DATE('02-APR-79','DD_MON_YY'),'1','178','74');
INSERT INTO player_t VALUES ('1998468','�κ�','K03','Jasenko Sabitovic','','1997','DF','4','',TO_DATE('29-MAR-73','DD_MON_YY'),'1','185','78');
INSERT INTO player_t VALUES ('1997277','�����','K03','OH, MYUNGKWAN','','1998','DF','15','',TO_DATE('29-APR-74','DD_MON_YY'),'1','185','76');
INSERT INTO player_t VALUES ('2002063','�̵���','K03','LEE, DONGSIK','','2002','MF','33','',TO_DATE('15-MAR-79','DD_MON_YY'),'1','183','77');
INSERT INTO player_t VALUES ('2002067','�̼���','K03','LEE, SOOKIL','','2002','DF','37','',TO_DATE('09-APR-79','DD_MON_YY'),'1','179','69');
INSERT INTO player_t VALUES ('1998444','�̽¿�','K03','LEE, SEUNGYUB','','1998','DF','12','',TO_DATE('12-OCT-75','DD_MON_YY'),'1','180','74');
INSERT INTO player_t VALUES ('1997101','����ȭ','K03','','','','DF','25','',TO_DATE('04-APR-74','DD_MON_YY'),'1','182','76');
INSERT INTO player_t VALUES ('1997190','�ϼ���','K03','HA, SEOKJU','','2001','DF','17','',TO_DATE('20-FEB-68','DD_MON_YY'),'1','174','71');
INSERT INTO player_t VALUES ('2000065','������','K03','HEO, JAEJUNG','','2000','DF','29','',TO_DATE('02-JUN-77','DD_MON_YY'),'1','175','70');
INSERT INTO player_t VALUES ('1997096','ȫ��','K03','HONG, MYUNGBO','','2002','DF','20','',TO_DATE('12-FEB-69','DD_MON_YY'),'1','181','72');
INSERT INTO player_t VALUES ('1998472','��Ⳳ','K03','KIM, KINAM','','2000','MF','6','',TO_DATE('18-JAN-71','DD_MON_YY'),'1','174','72');
INSERT INTO player_t VALUES ('2001059','����','K03','KIM, SANGROK','','2001','MF','14','',TO_DATE('25-FEB-79','DD_MON_YY'),'1','173','63');
INSERT INTO player_t VALUES ('2001068','�����','K03','NA, HEEKEUN','','2001','FW','22','',TO_DATE('05-MAY-79','DD_MON_YY'),'1','178','72');
INSERT INTO player_t VALUES ('2002133','����','K03','','','','MF','45','',TO_DATE('22-OCT-74','DD_MON_YY'),'1','179','74');
INSERT INTO player_t VALUES ('2002124','�޵�','K03','Medvid Ivan','','2002','MF','44','',TO_DATE('13-OCT-77','DD_MON_YY'),'1','180','78');
INSERT INTO player_t VALUES ('2002068','�ڱ濵','K03','PARK, KILYOUNG','','2002','MF','38','',TO_DATE('04-FEB-80','DD_MON_YY'),'1','172','64');
INSERT INTO player_t VALUES ('1998203','�ڻ���','K03','PARK, SANGIN','','1995','DF','27','',TO_DATE('10-MAR-76','DD_MON_YY'),'1','174','63');
INSERT INTO player_t VALUES ('2001131','����','K03','Josko Jelicic','','2002','MF','8','',TO_DATE('05-JAN-71','DD_MON_YY'),'1','184','79');
INSERT INTO player_t VALUES ('2001061','������','K03','YOU, HYUNGOO','','2001','MF','26','',TO_DATE('25-JAN-83','DD_MON_YY'),'1','170','68');
INSERT INTO player_t VALUES ('1999033','�̱��','K03','LEE, KIBU','','1999','MF','18','',TO_DATE('16-MAR-76','DD_MON_YY'),'2','183','76');
INSERT INTO player_t VALUES ('2002070','�̻���','K03','LEE, SANGIN','','2002','DF','40','',TO_DATE('11-JUL-79','DD_MON_YY'),'1','178','70');
INSERT INTO player_t VALUES ('2001062','������','K03','LEE, JUNGWOON','','2001','MF','19','',TO_DATE('19-APR-78','DD_MON_YY'),'1','178','70');
INSERT INTO player_t VALUES ('2002071','���߱�','K03','LEE, JUNGJYU','','2002','MF','42','',TO_DATE('06-JUN-79','DD_MON_YY'),'1','170','64');
INSERT INTO player_t VALUES ('2002066','��âȣ','K03','LEE, CHANGHO','','2002','MF','36','',TO_DATE('15-MAR-81','DD_MON_YY'),'1','175','75');
INSERT INTO player_t VALUES ('2001063','������','K03','CHOI, JONGBUM','','2001','MF','24','',TO_DATE('27-MAR-78','DD_MON_YY'),'1','178','68');
INSERT INTO player_t VALUES ('2002061','���Ͱ�','K03','NAM, IKKYUNG','','2002','MF','30','',TO_DATE('26-JAN-83','DD_MON_YY'),'1','177','70');
INSERT INTO player_t VALUES ('2001064','������','K03','YOON, BOYOUNG','','2001','FW','23','',TO_DATE('29-APR-78','DD_MON_YY'),'1','177','63');
INSERT INTO player_t VALUES ('1998443','�̵���','K03','LEE, DONGGOOK','','1998','FW','10','',TO_DATE('29-APR-79','DD_MON_YY'),'1','185','80');
INSERT INTO player_t VALUES ('2002060','������','K03','JUNG, JONGWAN','','2002','DF','28','',TO_DATE('05-AUG-83','DD_MON_YY'),'1','188','82');
INSERT INTO player_t VALUES ('2002059','��¡��','K03','Jorge Claudio','','2001','FW','7','�����',TO_DATE('01-OCT-75','DD_MON_YY'),'1','174','70');
INSERT INTO player_t VALUES ('2000044','��ö��','K03','CHOI, CHULWOO','','2000','FW','9','',TO_DATE('30-NOV-77','DD_MON_YY'),'1','185','78');
INSERT INTO player_t VALUES ('2001057','�ڳ�','K03','Goram Petreski','','2000','FW','11','',TO_DATE('23-MAY-72','DD_MON_YY'),'1','180','76');
INSERT INTO player_t VALUES ('1900095','��α�','K03','KIM, MINJYU','','2002','MF','35','',TO_DATE('29-SEP-79','DD_MON_YY'),'1','178','71');
INSERT INTO player_t VALUES ('1900062','������','K01','JAE, HYUNGJIN','','2002','DF','38','',TO_DATE('25-JUN-79','DD_MON_YY'),'1','179','75');
INSERT INTO player_t VALUES ('1900063','������','K01','KWAK, KIHOON','','2002','FW','33','',TO_DATE('05-NOV-79','DD_MON_YY'),'1','177','72');
INSERT INTO player_t VALUES ('1900064','�ڹο�','K01','PARK, MINYOUNG','','2000','FW','37','',TO_DATE('07-MAR-81','DD_MON_YY'),'1','174','67');
INSERT INTO player_t VALUES ('1900071','��ȸ��','K07','','','','TM','','',TO_DATE('11-OCT-46','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900072','������','K07','','','','TC','','',TO_DATE('27-OCT-49','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900073','���ȣ','K07','','','','TC','','',TO_DATE('05-OCT-64','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900074','��ö��','K07','','','','TC','','',TO_DATE('29-SEP-65','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('2002081','�迵��','K07','','','','GK','41','',TO_DATE('28-JUN-83','DD_MON_YY'),'1','185','80');
INSERT INTO player_t VALUES ('1997227','������','K07','','','','GK','1','',TO_DATE('02-OCT-70','DD_MON_YY'),'1','185','76');
INSERT INTO player_t VALUES ('2002088','������','K07','','','','GK','31','',TO_DATE('06-SEP-83','DD_MON_YY'),'1','189','83');
INSERT INTO player_t VALUES ('2002089','������','K07','','','','GK','33','',TO_DATE('12-NOV-79','DD_MON_YY'),'1','185','81');
INSERT INTO player_t VALUES ('1998212','��ö','K07','','','','DF','3','',TO_DATE('02-NOV-71','DD_MON_YY'),'1','178','72');
INSERT INTO player_t VALUES ('2002077','�谭��','K07','','','','DF','37','',TO_DATE('23-MAY-79','DD_MON_YY'),'1','180','73');
INSERT INTO player_t VALUES ('2002083','����ȣ','K07','','','','DF','39','',TO_DATE('09-JUN-83','DD_MON_YY'),'1','184','79');
INSERT INTO player_t VALUES ('1997213','���¿�','K07','','','','DF','7','',TO_DATE('08-NOV-70','DD_MON_YY'),'1','180','74');
INSERT INTO player_t VALUES ('1997209','������','K07','','','','DF','21','',TO_DATE('14-FEB-73','DD_MON_YY'),'1','176','74');
INSERT INTO player_t VALUES ('2002084','������','K07','','','','DF','42','',TO_DATE('23-JUN-79','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('2002085','��ȫö','K07','','','','DF','36','',TO_DATE('02-JUN-79','DD_MON_YY'),'1','181','69');
INSERT INTO player_t VALUES ('1998359','���ÿ�','K07','','','','DF','24','',TO_DATE('15-MAR-72','DD_MON_YY'),'1','177','70');
INSERT INTO player_t VALUES ('2001034','��â��','K07','','','','DF','5','',TO_DATE('10-JUL-75','DD_MON_YY'),'1','183','75');
INSERT INTO player_t VALUES ('2002090','�����','K07','','','','DF','34','',TO_DATE('31-AUG-83','DD_MON_YY'),'1','184','82');
INSERT INTO player_t VALUES ('1998425','�ֿ�ȣ','K07','','','','DF','6','',TO_DATE('24-OCT-75','DD_MON_YY'),'1','185','80');
INSERT INTO player_t VALUES ('2002092','ȫ����','K07','','','','DF','28','',TO_DATE('26-MAY-79','DD_MON_YY'),'1','184','78');
INSERT INTO player_t VALUES ('1999115','�����','K07','','','','MF','49','',TO_DATE('30-AUG-80','DD_MON_YY'),'1','170','65');
INSERT INTO player_t VALUES ('2001035','����','K07','','','','MF','12','',TO_DATE('24-AUG-78','DD_MON_YY'),'1','178','72');
INSERT INTO player_t VALUES ('2000030','�賲��','K07','','','','MF','4','',TO_DATE('14-MAR-77','DD_MON_YY'),'1','182','76');
INSERT INTO player_t VALUES ('2000032','����','K07','','','','MF','18','',TO_DATE('02-APR-78','DD_MON_YY'),'1','182','73');
INSERT INTO player_t VALUES ('1997210','�赵��','K07','','','','MF','10','',TO_DATE('02-MAR-72','DD_MON_YY'),'2','181','69');
INSERT INTO player_t VALUES ('2002078','�赿��','K07','','','','MF','38','',TO_DATE('06-MAY-83','DD_MON_YY'),'1','174','64');
INSERT INTO player_t VALUES ('1997102','����','K07','','','','MF','2','',TO_DATE('15-APR-74','DD_MON_YY'),'1','177','73');
INSERT INTO player_t VALUES ('2002079','�輺��','K07','','','','MF','44','',TO_DATE('20-JAN-79','DD_MON_YY'),'1','178','68');
INSERT INTO player_t VALUES ('2002080','�����','K07','','','','MF','26','',TO_DATE('17-AUG-79','DD_MON_YY'),'1','181','71');
INSERT INTO player_t VALUES ('2002082','���ȯ','K07','','','','MF','25','',TO_DATE('23-MAY-77','DD_MON_YY'),'1','170','62');
INSERT INTO player_t VALUES ('1999100','������','K07','','','','MF','13','',TO_DATE('09-JUN-76','DD_MON_YY'),'2','172','65');
INSERT INTO player_t VALUES ('1998428','������','K07','','','','MF','11','',TO_DATE('10-JUL-73','DD_MON_YY'),'1','173','68');
INSERT INTO player_t VALUES ('2002086','�뺴��','K07','','','','MF','22','',TO_DATE('29-SEP-79','DD_MON_YY'),'1','177','67');
INSERT INTO player_t VALUES ('2002087','������','K07','','','','MF','43','',TO_DATE('11-APR-79','DD_MON_YY'),'1','176','69');
INSERT INTO player_t VALUES ('1997305','������','K07','','','','MF','9','',TO_DATE('27-SEP-74','DD_MON_YY'),'1','176','75');
INSERT INTO player_t VALUES ('2002132','�ǹ�','K07','','','','MF','45','',TO_DATE('20-JUN-77','DD_MON_YY'),'1','173','67');
INSERT INTO player_t VALUES ('2000031','���뱸','K07','','','','MF','15','',TO_DATE('08-AUG-77','DD_MON_YY'),'1','168','60');
INSERT INTO player_t VALUES ('2001127','�̹�','K07','','','','MF','14','',TO_DATE('27-OCT-74','DD_MON_YY'),'1','174','69');
INSERT INTO player_t VALUES ('2001038','�̿���','K07','','','','MF','30','',TO_DATE('30-JUL-78','DD_MON_YY'),'1','175','65');
INSERT INTO player_t VALUES ('1998423','�Ӱ���','K07','','','','MF','29','',TO_DATE('28-JUL-75','DD_MON_YY'),'1','172','68');
INSERT INTO player_t VALUES ('2001036','����ȣ','K07','','','','MF','23','',TO_DATE('06-APR-78','DD_MON_YY'),'1','176','71');
INSERT INTO player_t VALUES ('2001039','�ϱ���','K07','','','','MF','32','',TO_DATE('10-MAR-82','DD_MON_YY'),'1','180','65');
INSERT INTO player_t VALUES ('2000003','���ö','K07','','','','FW','20','',TO_DATE('26-AUG-77','DD_MON_YY'),'1','183','78');
INSERT INTO player_t VALUES ('2000154','������','K07','','','','FW','16','',TO_DATE('23-AUG-74','DD_MON_YY'),'1','172','70');
INSERT INTO player_t VALUES ('1997214','���','K07','','','','FW','8','',TO_DATE('15-DEC-70','DD_MON_YY'),'1','175','74');
INSERT INTO player_t VALUES ('1999149','���Ѽ�','K07','','','','FW','40','',TO_DATE('10-MAR-76','DD_MON_YY'),'2','177','69');
INSERT INTO player_t VALUES ('1999161','���ڸ�','K07','','','','FW','17','',TO_DATE('09-DEC-73','DD_MON_YY'),'1','180','78');
INSERT INTO player_t VALUES ('2002032','�ź�ȣ','K07','','','','FW','27','',TO_DATE('26-APR-77','DD_MON_YY'),'1','177','75');
INSERT INTO player_t VALUES ('2001120','����','K07','','','','FW','27','',TO_DATE('26-JAN-75','DD_MON_YY'),'1','180','67');
INSERT INTO player_t VALUES ('2000037','�ϼ���','K07','','','','FW','35','',TO_DATE('03-FEB-82','DD_MON_YY'),'1','179','68');
INSERT INTO player_t VALUES ('2002091','ȫ��ǥ','K07','','','','FW','19','',TO_DATE('28-OCT-79','DD_MON_YY'),'1','182','73');
INSERT INTO player_t VALUES ('1900081','����ȯ','K05','','','','TM','','',TO_DATE('24-MAY-61','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900082','����ö','K05','','','','TC','','',TO_DATE('26-MAY-58','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900083','�̰���','K05','','','','TC','','',TO_DATE('14-APR-69','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900084','�ڵ���','K05','','','','TC','','',TO_DATE('03-NOV-70','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900085','����','K05','','','','TD','','',TO_DATE('16-MAR-69','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900086','����ġ','K05','','','','TD','','',TO_DATE('06-JAN-69','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1997106','���̼�','K05','KIM, ISUB','�賲','2002','GK','45','',TO_DATE('06-APR-74','DD_MON_YY'),'1','185','78');
INSERT INTO player_t VALUES ('2002007','�ڰ���','K05','PARK, KWANMIN','','2002','GK','31','',TO_DATE('26-MAY-79','DD_MON_YY'),'1','188','85');
INSERT INTO player_t VALUES ('1998179','�ڵ���','K05','','','','GK','60','',TO_DATE('03-NOV-70','DD_MON_YY'),'1','187','78');
INSERT INTO player_t VALUES ('1998138','�̿��','K05','LEE, YONGBAL','','1994','GK','18','',TO_DATE('15-MAR-73','DD_MON_YY'),'1','183','77');
INSERT INTO player_t VALUES ('2002006','��â��','K05','LEE, CHANGMIN','����','2002','GK','1','',TO_DATE('25-JAN-80','DD_MON_YY'),'1','191','87');
INSERT INTO player_t VALUES ('2000010','����','K05','KIM, DAEKEON','','2000','DF','26','',TO_DATE('27-APR-77','DD_MON_YY'),'1','183','78');
INSERT INTO player_t VALUES ('1997159','�����','K05','KIM, BONGHYUN','','1995','MF','23','',TO_DATE('07-JUL-74','DD_MON_YY'),'1','188','74');
INSERT INTO player_t VALUES ('2002009','��â��','K05','KIM, CHANGMIN','�߻���','2002','DF','36','',TO_DATE('22-SEP-79','DD_MON_YY'),'1','181','68');
INSERT INTO player_t VALUES ('2002005','�ڵ���','K05','PARK, DONGHYUK','��ȣ','2002','DF','23','',TO_DATE('18-APR-79','DD_MON_YY'),'1','185','78');
INSERT INTO player_t VALUES ('2002012','���μ�','K05','BAEK, INSEOK','����','2002','MF','40','',TO_DATE('08-AUG-79','DD_MON_YY'),'1','179','72');
INSERT INTO player_t VALUES ('1998391','������','K05','SEO, HYUKSU','�˵�','1998','DF','6','',TO_DATE('01-OCT-73','DD_MON_YY'),'1','178','77');
INSERT INTO player_t VALUES ('2002004','�ȱ�ȣ','K05','AN, KWANGHO','�ձ�','2002','DF','15','',TO_DATE('10-JAN-79','DD_MON_YY'),'1','190','78');
INSERT INTO player_t VALUES ('1999076','������','K05','LIM, HONGHUN','����','1999','DF','31','',TO_DATE('14-JUN-76','DD_MON_YY'),'1','182','74');
INSERT INTO player_t VALUES ('1997148','����ö','K05','CHOI, JINCHEUL','','1996','DF','4','',TO_DATE('26-MAR-71','DD_MON_YY'),'1','187','75');
INSERT INTO player_t VALUES ('1999061','������','K05','HAN, JONGSUNG','','1999','DF','13','',TO_DATE('30-JAN-77','DD_MON_YY'),'1','177','70');
INSERT INTO player_t VALUES ('1999160','ȣ������','K05','Rogerio Prateat','���»���','1999','DF','3','',TO_DATE('09-MAR-73','DD_MON_YY'),'1','185','85');
INSERT INTO player_t VALUES ('1997031','Ȳ����','K05','','','','DF','98','',TO_DATE('09-MAY-72','DD_MON_YY'),'1','176','68');
INSERT INTO player_t VALUES ('2000023','�����','K05','KO, KWANYOUNG','���','2000','MF','32','',TO_DATE('07-DEC-81','DD_MON_YY'),'1','180','72');
INSERT INTO player_t VALUES ('1997155','��淮','K05','KIM, KYUNGRYANG','','1996','MF','19','',TO_DATE('22-DEC-73','DD_MON_YY'),'1','173','65');
INSERT INTO player_t VALUES ('2000025','������','K05','','','','MF','35','',TO_DATE('09-MAR-81','DD_MON_YY'),'1','176','63');
INSERT INTO player_t VALUES ('2002001','��������','K05','Leomar Leiria','����','2002','MF','5','',TO_DATE('26-JUN-71','DD_MON_YY'),'1','183','77');
INSERT INTO player_t VALUES ('1998269','�����','K05','MYUNG, JAEYOENG','','1997','MF','7','',TO_DATE('26-FEB-73','DD_MON_YY'),'2','173','63');
INSERT INTO player_t VALUES ('1997149','���缷','K05','BYUN, JAESUB','������ũ','1997','MF','11','',TO_DATE('17-SEP-75','DD_MON_YY'),'2','170','63');
INSERT INTO player_t VALUES ('2002002','����','K05','Raphael JoseBotti Zacarias Sena','Botti','2002','MF','10','',TO_DATE('23-FEB-81','DD_MON_YY'),'1','174','68');
INSERT INTO player_t VALUES ('2001123','�񿡶�','K05','Vieira','','2001','MF','21','',TO_DATE('25-FEB-74','DD_MON_YY'),'1','176','73');
INSERT INTO player_t VALUES ('1998460','������','K05','SEO, DONGWON','','1998','MF','22','',TO_DATE('14-AUG-75','DD_MON_YY'),'1','184','78');
INSERT INTO player_t VALUES ('2000019','�ȴ���','K05','AN, DAEHYUN','','2000','MF','25','',TO_DATE('20-AUG-77','DD_MON_YY'),'1','179','72');
INSERT INTO player_t VALUES ('2000018','������','K05','YANG, HYUNJUNG','','2000','MF','14','',TO_DATE('25-JUL-77','DD_MON_YY'),'1','176','72');
INSERT INTO player_t VALUES ('2000022','������','K05','YOU, WONSUOB','�Ӹ�','2000','MF','37','',TO_DATE('24-MAY-81','DD_MON_YY'),'1','180','77');
INSERT INTO player_t VALUES ('2002008','�̼�ö','K05','LEE, SUCHEUL','','2002','MF','34','',TO_DATE('26-MAY-79','DD_MON_YY'),'1','171','68');
INSERT INTO player_t VALUES ('2002013','�Ӵ���','K05','LIM, DAHAN','�޸�','2002','DF','39','',TO_DATE('21-JUL-79','DD_MON_YY'),'1','181','67');
INSERT INTO player_t VALUES ('1997087','������','K05','JEON, KYOUNGJOON','','1991','MF','16','',TO_DATE('10-SEP-73','DD_MON_YY'),'1','178','68');
INSERT INTO player_t VALUES ('2000021','�ֿ���','K05','CHOI, YOUNGHOON','����','2000','MF','27','',TO_DATE('18-MAR-81','DD_MON_YY'),'1','178','71');
INSERT INTO player_t VALUES ('2001028','�߿��','K05','CHOO, WOONKI','�ھ˶�','2001','MF','17','',TO_DATE('03-APR-78','DD_MON_YY'),'1','173','69');
INSERT INTO player_t VALUES ('1998393','����ö','K05','HA, EUNCHEUL','','1998','MF','29','',TO_DATE('23-JUN-75','DD_MON_YY'),'1','176','69');
INSERT INTO player_t VALUES ('2001030','��α�','K05','GO, MINGI','','2001','FW','24','',TO_DATE('01-JUL-78','DD_MON_YY'),'1','178','70');
INSERT INTO player_t VALUES ('1998143','�赵��','K05','KIM, DOHOON','���ݱ�','1995','FW','9','',TO_DATE('21-JUL-70','DD_MON_YY'),'1','182','77');
INSERT INTO player_t VALUES ('2002011','�迬��','K05','KIM, YEONGUN','','2002','FW','44','',TO_DATE('12-MAR-81','DD_MON_YY'),'1','188','77');
INSERT INTO player_t VALUES ('2001002','������','K05','KIM, HYUNKI','','2001','FW','28','',TO_DATE('19-MAR-82','DD_MON_YY'),'1','190','82');
INSERT INTO player_t VALUES ('2001003','���õ�','K05','NAM, KUNGDO','','2001','FW','33','',TO_DATE('04-JUN-82','DD_MON_YY'),'1','186','80');
INSERT INTO player_t VALUES ('2000101','������','K05','MOON, TAEHYUK','','2002','FW','41','',TO_DATE('31-MAR-83','DD_MON_YY'),'1','178','74');
INSERT INTO player_t VALUES ('1998392','�ڼ���','K05','PARK, SUNGBAE','����','1998','FW','8','',TO_DATE('28-NOV-75','DD_MON_YY'),'2','181','76');
INSERT INTO player_t VALUES ('2002125','����м�','K05','Edmilson','EDY','2002','FW','20','',TO_DATE('29-MAY-68','DD_MON_YY'),'1','184','79');
INSERT INTO player_t VALUES ('2002003','��Ű','K05','','','','FW','99','',TO_DATE('30-APR-71','DD_MON_YY'),'1','170','76');
INSERT INTO player_t VALUES ('1900087','������','K05','KIM, EUNIK','','2000','FW','35','',TO_DATE('09-MAR-81','DD_MON_YY'),'1','176','65');
INSERT INTO player_t VALUES ('1900091','�ּ�ȣ','K03','CHOI, SOONHO','','','TM','','',TO_DATE('10-JAN-62','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900092','������','K03','YU, DONGKWAN','','','TC','','',TO_DATE('12-MAY-63','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900093','���⵿','K03','CHUNG, GIDONG','','','TC','','',TO_DATE('13-MAY-61','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('2001111','�̹��ں�','K02','','','','MF','47','',TO_DATE('08-FEB-75','DD_MON_YY'),'1','185','78');
INSERT INTO player_t VALUES ('2002020','�̼���','K02','LEE, SUNWOO','','','FW','33','',TO_DATE('01-APR-78','DD_MON_YY'),'1','174','68');
INSERT INTO player_t VALUES ('2001074','�̿���','K02','LEE, YEOSUNG','','','MF','36','',TO_DATE('05-JAN-83','DD_MON_YY'),'1','179','63');
INSERT INTO player_t VALUES ('1997064','�̿��','K02','LEE, YONGWOO','','','FW','27','',TO_DATE('20-JUL-77','DD_MON_YY'),'1','175','70');
INSERT INTO player_t VALUES ('2002019','������','K02','LEE, JONGMIN','','','MF','30','',TO_DATE('01-SEP-83','DD_MON_YY'),'1','174','65');
INSERT INTO player_t VALUES ('1998437','������','K02','JUNG, YONGHOON','','','MF','9','',TO_DATE('11-MAR-79','DD_MON_YY'),'1','175','67');
INSERT INTO player_t VALUES ('1998436','������','K02','CHO, MANKEUN','','','FW','34','',TO_DATE('28-NOV-77','DD_MON_YY'),'1','177','67');
INSERT INTO player_t VALUES ('1997070','�����','K02','CHO, JAEMIN','','','MF','35','',TO_DATE('22-MAY-78','DD_MON_YY'),'1','180','71');
INSERT INTO player_t VALUES ('1997043','������','K02','CHO, HYUNDOO','','','MF','12','',TO_DATE('23-NOV-73','DD_MON_YY'),'1','176','68');
INSERT INTO player_t VALUES ('2002017','�ּ���','K02','CHOI, SUNGYONG','','','DF','20','',TO_DATE('25-DEC-75','DD_MON_YY'),'1','173','70');
INSERT INTO player_t VALUES ('2002018','���±�','K02','HA, TAEKEUN','','','MF','29','',TO_DATE('01-JUL-83','DD_MON_YY'),'1','182','75');
INSERT INTO player_t VALUES ('2002122','��Ʈ��','K02','Mitrovic Slavisa','','','FW','19','�����Ͼ�',TO_DATE('05-JUL-77','DD_MON_YY'),'1','192','89');
INSERT INTO player_t VALUES ('1997048','�ڰ���','K02','PARK, KUNHA','','','FW','18','',TO_DATE('25-JUL-71','DD_MON_YY'),'1','180','75');
INSERT INTO player_t VALUES ('2000168','����','K02','Sandro Cardoso Dos Santos','','','FW','13','�����',TO_DATE('22-MAR-80','DD_MON_YY'),'1','182','78');
INSERT INTO player_t VALUES ('2002023','��ȭ��','K02','YUN, HWAPYUNG','','','FW','42','',TO_DATE('26-MAR-83','DD_MON_YY'),'1','182','74');
INSERT INTO player_t VALUES ('2002022','�̰���','K02','LEE, KWANHEE','','','FW','39','',TO_DATE('29-JUN-83','DD_MON_YY'),'1','180','70');
INSERT INTO player_t VALUES ('1900051','������','K09','','','','TM','','',TO_DATE('19-MAR-54','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900052','���Ἦ','K09','','','','TC','','',TO_DATE('03-FEB-59','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900053','������','K09','','','','TC','','',TO_DATE('26-MAR-59','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900054','�̿���','K09','','','','TC','','',TO_DATE('27-OCT-63','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900055','���ȭ','K09','','','','TC','','',TO_DATE('15-MAR-70','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('2002094','�ڵ���','K09','','','','GK','1','',TO_DATE('03-MAY-81','DD_MON_YY'),'1','190','89');
INSERT INTO player_t VALUES ('2000125','���ö','K09','','','','GK','21','',TO_DATE('28-JUL-77','DD_MON_YY'),'1','185','78');
INSERT INTO player_t VALUES ('1997236','���Ǽ�','K09','','','','GK','44','',TO_DATE('12-JAN-60','DD_MON_YY'),'1','192','87');
INSERT INTO player_t VALUES ('2001018','���½�','K09','','','','GK','31','',TO_DATE('08-JAN-83','DD_MON_YY'),'1','185','75');
INSERT INTO player_t VALUES ('2000117','�赿��','K09','','','','DF','4','',TO_DATE('29-JAN-81','DD_MON_YY'),'1','182','74');
INSERT INTO player_t VALUES ('1998414','�輺��','K09','','','','DF','19','',TO_DATE('13-APR-74','DD_MON_YY'),'1','178','75');
INSERT INTO player_t VALUES ('2002093','��ġ��','K09','','','','DF','17','',TO_DATE('29-JUL-83','DD_MON_YY'),'1','183','76');
INSERT INTO player_t VALUES ('2002095','�ڿ��','K09','','','','DF','5','',TO_DATE('03-DEC-80','DD_MON_YY'),'1','183','75');
INSERT INTO player_t VALUES ('2000119','�ڿ�ȣ','K09','','','','DF','14','',TO_DATE('25-MAR-81','DD_MON_YY'),'1','182','69');
INSERT INTO player_t VALUES ('1997068','������','K09','','','','DF','6','',TO_DATE('19-APR-77','DD_MON_YY'),'1','182','78');
INSERT INTO player_t VALUES ('1997266','������','K09','','','','DF','45','',TO_DATE('20-MAR-72','DD_MON_YY'),'1','175','70');
INSERT INTO player_t VALUES ('2001012','�ȼ���','K09','','','','MF','2','',TO_DATE('11-SEP-82','DD_MON_YY'),'1','176','63');
INSERT INTO player_t VALUES ('1998420','�̻���','K09','','','','DF','25','',TO_DATE('11-OCT-75','DD_MON_YY'),'2','185','80');
INSERT INTO player_t VALUES ('2002102','����ȣ','K09','','','','DF','34','',TO_DATE('07-APR-86','DD_MON_YY'),'1','184','71');
INSERT INTO player_t VALUES ('1997225','������','K09','','','','DF','3','',TO_DATE('17-APR-74','DD_MON_YY'),'1','185','79');
INSERT INTO player_t VALUES ('1999048','�赵��','K09','','','','MF','40','',TO_DATE('28-MAY-76','DD_MON_YY'),'1','168','68');
INSERT INTO player_t VALUES ('2001072','��μ�','K09','','','','MF','24','',TO_DATE('28-MAY-82','DD_MON_YY'),'1','175','64');
INSERT INTO player_t VALUES ('2001008','������','K09','','','','MF','41','',TO_DATE('25-MAY-82','DD_MON_YY'),'1','180','70');
INSERT INTO player_t VALUES ('2002096','������','K09','','','','MF','37','',TO_DATE('21-MAR-83','DD_MON_YY'),'1','172','65');
INSERT INTO player_t VALUES ('2000049','�ȵ巹','K09','','','','MF','18','�����',TO_DATE('16-NOV-72','DD_MON_YY'),'1','172','69');
INSERT INTO player_t VALUES ('2002097','�Ȼ���','K09','','','','MF','33','',TO_DATE('05-MAR-86','DD_MON_YY'),'1','176','67');
INSERT INTO player_t VALUES ('2002098','������','K09','','','','MF','39','',TO_DATE('26-AUG-79','DD_MON_YY'),'1','176','70');
INSERT INTO player_t VALUES ('1997133','�����','K09','','','','MF','43','',TO_DATE('28-AUG-73','DD_MON_YY'),'2','175','67');
INSERT INTO player_t VALUES ('2000048','�̿�ǥ','K09','','','','MF','12','',TO_DATE('23-APR-77','DD_MON_YY'),'1','176','66');
INSERT INTO player_t VALUES ('2002100','���ر�','K09','','','','MF','36','',TO_DATE('25-APR-82','DD_MON_YY'),'1','183','74');
INSERT INTO player_t VALUES ('2002101','������','K09','','','','MF','42','',TO_DATE('21-NOV-84','DD_MON_YY'),'1','183','68');
INSERT INTO player_t VALUES ('1998413','������','K09','','','','FW','23','',TO_DATE('08-JAN-76','DD_MON_YY'),'1','180','70');
INSERT INTO player_t VALUES ('1999051','��â��','K09','','','','MF','27','',TO_DATE('10-AUG-83','DD_MON_YY'),'2','170','63');
INSERT INTO player_t VALUES ('2000118','�ֿ���','K09','','','','MF','13','',TO_DATE('08-NOV-81','DD_MON_YY'),'1','173','65');
INSERT INTO player_t VALUES ('2000120','�躴ä','K09','','','','FW','15','',TO_DATE('14-APR-81','DD_MON_YY'),'1','180','72');
INSERT INTO player_t VALUES ('1999046','�輺��','K09','','','','MF','8','',TO_DATE('17-SEP-76','DD_MON_YY'),'2','178','72');
INSERT INTO player_t VALUES ('2002119','�ѵ�','K09','','','','FW','99','�����',TO_DATE('20-JUN-74','DD_MON_YY'),'1','187','84');
INSERT INTO player_t VALUES ('2002105','������','K09','','','','FW','11','�����',TO_DATE('03-DEC-76','DD_MON_YY'),'1','175','77');
INSERT INTO player_t VALUES ('2001005','�ڼ�ȣ','K09','','','','FW','30','',TO_DATE('27-JUL-82','DD_MON_YY'),'1','187','73');
INSERT INTO player_t VALUES ('2001108','����ȭ','K09','','','','MF','16','',TO_DATE('13-JUN-78','DD_MON_YY'),'1','175','67');
INSERT INTO player_t VALUES ('1999047','����ȯ','K09','','','','FW','20','',TO_DATE('14-JAN-77','DD_MON_YY'),'1','178','70');
INSERT INTO player_t VALUES ('1999005','������','K09','','','','FW','28','',TO_DATE('30-AUG-76','DD_MON_YY'),'2','181','73');
INSERT INTO player_t VALUES ('2002099','������','K09','','','','FW','7','',TO_DATE('08-JAN-80','DD_MON_YY'),'1','184','74');
INSERT INTO player_t VALUES ('2002103','������','K09','','','','FW','22','',TO_DATE('23-AUG-85','DD_MON_YY'),'1','183','68');
INSERT INTO player_t VALUES ('1999044','������','K09','','','','MF','26','',TO_DATE('01-MAR-74','DD_MON_YY'),'2','180','78');
INSERT INTO player_t VALUES ('2000053','���¿�','K09','','','','FW','9','',TO_DATE('13-MAR-81','DD_MON_YY'),'1','173','66');
INSERT INTO player_t VALUES ('2002104','�ѵ���','K09','','','','FW','32','',TO_DATE('06-APR-86','DD_MON_YY'),'1','174','61');
INSERT INTO player_t VALUES ('2001004','����ȭ','K09','','','','FW','29','',TO_DATE('31-OCT-82','DD_MON_YY'),'1','173','63');
INSERT INTO player_t VALUES ('2000164','��ī����','K09','','','','MF','10','�����',TO_DATE('08-JUN-76','DD_MON_YY'),'1','189','71');
INSERT INTO player_t VALUES ('2001082','������','K01','KWON, JUNGHYUK','','2001','GK','1','',TO_DATE('02-AUG-78','DD_MON_YY'),'1','195','80');
INSERT INTO player_t VALUES ('1999070','��â��','K01','PARK, CHANGZOO','','1999','GK','40','',TO_DATE('30-SEP-72','DD_MON_YY'),'1','187','86');
INSERT INTO player_t VALUES ('1997020','������','K01','SEO, DONGMYUNG','','2002','GK','21','',TO_DATE('04-MAY-74','DD_MON_YY'),'1','196','94');
INSERT INTO player_t VALUES ('1998410','������','K01','YANG, JIWON','','1998','GK','45','',TO_DATE('28-APR-74','DD_MON_YY'),'1','181','75');
INSERT INTO player_t VALUES ('2002039','�ֹ���','K01','CHOI, MOOLIM','','2002','GK','31','',TO_DATE('15-APR-79','DD_MON_YY'),'1','185','79');
INSERT INTO player_t VALUES ('2002034','������','K01','KIM, YOONGOO','','2002','DF','20','',TO_DATE('01-SEP-79','DD_MON_YY'),'1','182','75');
INSERT INTO player_t VALUES ('2001106','��������','K01','Cleber Arild','','2001','DF','3','�����',TO_DATE('21-JAN-69','DD_MON_YY'),'1','186','79');
INSERT INTO player_t VALUES ('2001080','�ڰ��','K01','PARK, JYUNGSAM','','2001','DF','25','',TO_DATE('06-JUN-78','DD_MON_YY'),'1','188','74');
INSERT INTO player_t VALUES ('1997004','������','K01','PARK, JONGWOOK','','1997','DF','29','',TO_DATE('11-JAN-75','DD_MON_YY'),'1','185','74');
INSERT INTO player_t VALUES ('2002035','����ȯ','K01','BYUN, SUNGHWAN','','2002','DF','23','',TO_DATE('22-DEC-79','DD_MON_YY'),'1','176','69');
INSERT INTO player_t VALUES ('1998366','�ջ�ȣ','K01','SON, SANGHO','','1997','DF','28','',TO_DATE('04-MAY-74','DD_MON_YY'),'1','187','78');
INSERT INTO player_t VALUES ('2002044','������','K01','YOU, JAEHYUNG','','2002','DF','39','',TO_DATE('24-AUG-77','DD_MON_YY'),'1','180','79');
INSERT INTO player_t VALUES ('2001077','������','K01','CHOI, SAEKWON','','2001','DF','4','',TO_DATE('26-JUN-78','DD_MON_YY'),'1','184','80');
INSERT INTO player_t VALUES ('1999069','�ϼ���','K01','HA, SUNGYONG','','1999','DF','43','',TO_DATE('05-OCT-76','DD_MON_YY'),'1','179','75');
INSERT INTO player_t VALUES ('2000082','������','K01','HAN, JEUNGIL','','2000','DF','41','',TO_DATE('03-MAR-77','DD_MON_YY'),'1','172','65');
INSERT INTO player_t VALUES ('2000054','�����','K01','KIM, KUNHYUNG','','2000','MF','17','',TO_DATE('11-SEP-79','DD_MON_YY'),'1','176','70');
INSERT INTO player_t VALUES ('1999058','�赵��','K01','KIM, DOKYUN','','1999','MF','6','',TO_DATE('13-JAN-77','DD_MON_YY'),'1','184','78');
INSERT INTO player_t VALUES ('2001083','�ڱ��','K01','PARK, KIWOOK','','2001','MF','18','',TO_DATE('22-DEC-78','DD_MON_YY'),'1','175','68');
INSERT INTO player_t VALUES ('2002028','������','K01','PARK, JINSUP','','2002','MF','2','',TO_DATE('11-MAR-77','DD_MON_YY'),'1','179','68');
INSERT INTO player_t VALUES ('2001079','������','K01','SEO, DOUKGUY','','2001','DF','5','',TO_DATE('22-OCT-78','DD_MON_YY'),'1','182','72');
INSERT INTO player_t VALUES ('2002130','����','K01','Edmilson Alves','','2002','MF','7','�����',TO_DATE('17-FEB-76','DD_MON_YY'),'1','182','70');
INSERT INTO player_t VALUES ('1999055','�̱��','K01','LEE, KILYONG','','1999','MF','22','',TO_DATE('30-MAR-76','DD_MON_YY'),'2','183','78');
INSERT INTO player_t VALUES ('2002036','������','K01','LEE, YOONSUB','','2002','MF','26','',TO_DATE('30-JUL-79','DD_MON_YY'),'1','184','77');
INSERT INTO player_t VALUES ('2002029','��õ��','K01','LEE, CHUNSU','','2002','MF','9','',TO_DATE('09-JUL-81','DD_MON_YY'),'1','174','65');
INSERT INTO player_t VALUES ('2002033','�强��','K01','JANG, SUNGWOOK','','2002','MF','19','',TO_DATE('01-SEP-79','DD_MON_YY'),'1','174','71');
INSERT INTO player_t VALUES ('1997023','��ö��','K01','JANG, CHULMIN','','1997','MF','24','',TO_DATE('19-MAY-72','DD_MON_YY'),'1','179','76');
INSERT INTO player_t VALUES ('2001084','����ö','K01','JEON, KWANGCHEOL','','2001','MF','34','',TO_DATE('16-JUL-82','DD_MON_YY'),'1','186','74');
INSERT INTO player_t VALUES ('2002045','�����','K01','JEON, JAEWOON','','2002','MF','42','',TO_DATE('05-JUN-81','DD_MON_YY'),'1','177','67');
INSERT INTO player_t VALUES ('1997008','������','K01','JUNG, JEONGSOO','','1993','MF','8','',TO_DATE('20-NOV-69','DD_MON_YY'),'1','170','61');
INSERT INTO player_t VALUES ('2002042','���ֿ�','K01','HUNG, HUYOUNG','','2002','MF','36','',TO_DATE('03-MAY-79','DD_MON_YY'),'1','172','65');
INSERT INTO player_t VALUES ('2002040','������','K01','CHO, WONHEE','','2002','MF','32','',TO_DATE('17-APR-83','DD_MON_YY'),'1','178','71');
INSERT INTO player_t VALUES ('2002041','������','K01','','','','FW','33','',TO_DATE('05-NOV-79','DD_MON_YY'),'1','177','72');
INSERT INTO player_t VALUES ('1997010','������','K01','KIM, HYUNSEOK','','2001','FW','16','',TO_DATE('05-MAY-67','DD_MON_YY'),'1','178','70');
INSERT INTO player_t VALUES ('2001105','�����ڽ�','K01','Marcos Antonio','','2001','FW','44','�����',TO_DATE('07-APR-77','DD_MON_YY'),'1','170','73');
INSERT INTO player_t VALUES ('2000045','�ڱԼ�','K01','PARK, GYUSUN','','2000','FW','15','',TO_DATE('24-SEP-81','DD_MON_YY'),'1','182','66');
INSERT INTO player_t VALUES ('2002129','�˸���','K01','Alison Barros Moraes','','','FW','14','�����',TO_DATE('30-JUN-82','DD_MON_YY'),'1','171','60');
INSERT INTO player_t VALUES ('2002038','������','K01','LEE, TAEYOO','','2002','FW','30','',TO_DATE('01-OCT-79','DD_MON_YY'),'1','175','64');
INSERT INTO player_t VALUES ('2002030','������','K01','','','','FW','10','',TO_DATE('04-JUL-79','DD_MON_YY'),'1','187','83');
INSERT INTO player_t VALUES ('2002037','���μ�','K01','CHOI, INSUK','','2002','FW','27','',TO_DATE('07-AUG-79','DD_MON_YY'),'1','181','74');
INSERT INTO player_t VALUES ('2001104','�Ŀ︵��','K01','Marcos Paulo Paulrini','','2001','FW','11','�����',TO_DATE('04-MAR-77','DD_MON_YY'),'1','174','75');
INSERT INTO player_t VALUES ('2002031','������','K01','HYUN, YOUNGMIN','','2002','FW','13','',TO_DATE('25-DEC-79','DD_MON_YY'),'1','179','73');
INSERT INTO player_t VALUES ('1900061','ȫ�α�','K01','HONG, INKI','','1998','DF','35','',TO_DATE('15-MAR-79','DD_MON_YY'),'1','182','75');
INSERT INTO player_t VALUES ('1997114','��⵿','K04','','','','MF','6','',TO_DATE('12-JAN-71','DD_MON_YY'),'1','171','66');
INSERT INTO player_t VALUES ('2000005','�����','K04','','','','MF','19','',TO_DATE('10-JUL-77','DD_MON_YY'),'1','173','64');
INSERT INTO player_t VALUES ('2002055','������','K04','','','','MF','32','',TO_DATE('01-APR-79','DD_MON_YY'),'1','176','68');
INSERT INTO player_t VALUES ('1997122','������','K04','','','','MF','14','',TO_DATE('11-JUL-74','DD_MON_YY'),'1','185','74');
INSERT INTO player_t VALUES ('1997137','������','K04','','','','MF','29','',TO_DATE('17-AUG-74','DD_MON_YY'),'1','177','69');
INSERT INTO player_t VALUES ('2002131','����Ÿ��','K04','','','','MF','77','',TO_DATE('08-JAN-75','DD_MON_YY'),'1','180','73');
INSERT INTO player_t VALUES ('2002056','������','K04','','','','MF','33','',TO_DATE('26-JUN-79','DD_MON_YY'),'1','177','73');
INSERT INTO player_t VALUES ('2000004','����ȣ','K04','','','','MF','22','',TO_DATE('07-JUL-77','DD_MON_YY'),'1','183','71');
INSERT INTO player_t VALUES ('1997125','������','K04','','','','MF','17','',TO_DATE('18-FEB-73','DD_MON_YY'),'1','173','66');
INSERT INTO player_t VALUES ('2001103','���ȣ','K04','','','','MF','39','',TO_DATE('23-FEB-83','DD_MON_YY'),'1','174','66');
INSERT INTO player_t VALUES ('1998209','�ֹ���','K04','','','','MF','10','',TO_DATE('23-OCT-71','DD_MON_YY'),'1','173','66');
INSERT INTO player_t VALUES ('1998457','�����','K04','GWAK, JYUNGKEUN','����','1998','FW','9','',TO_DATE('10-OCT-72','DD_MON_YY'),'1','184','81');
INSERT INTO player_t VALUES ('2002120','�ٺ�','K04','Chelck Oumar Dabo','','2002','FW','63','',TO_DATE('','DD_MON_YY'),'1','183','76');
INSERT INTO player_t VALUES ('1997126','�ڼ�ö','K04','PARK, SUNGCHUL','�ڹ̵��','1997','FW','28','',TO_DATE('16-MAR-75','DD_MON_YY'),'1','190','78');
INSERT INTO player_t VALUES ('1997153','��Ż��','K04','VITALIY','','2002','FW','24','',TO_DATE('04-MAY-69','DD_MON_YY'),'1','183','74');
INSERT INTO player_t VALUES ('1999026','�Ƚ���','K04','AN, SEUNGIN','�Ȼ�','1999','FW','13','',TO_DATE('14-MAR-73','DD_MON_YY'),'1','182','75');
INSERT INTO player_t VALUES ('2001019','����ö','K04','','','','FW','8','',TO_DATE('06-JAN-79','DD_MON_YY'),'1','184','75');
INSERT INTO player_t VALUES ('1999027','�̼���','K04','LEE, SUNGJAE','��ġ,����','1999','FW','11','',TO_DATE('16-MAY-76','DD_MON_YY'),'1','178','67');
INSERT INTO player_t VALUES ('1997135','�̿���','K04','LEE, WONSHIK','��, �����','1996','FW','27','',TO_DATE('16-MAY-73','DD_MON_YY'),'1','172','64');
INSERT INTO player_t VALUES ('2002057','������','K04','LEE, JONGMIN','','2002','FW','34','',TO_DATE('01-AUG-83','DD_MON_YY'),'1','184','77');
INSERT INTO player_t VALUES ('2001020','���ʼ�','K04','JUNG, PILSUK','���','2001','FW','18','',TO_DATE('23-JUL-78','DD_MON_YY'),'1','190','83');
INSERT INTO player_t VALUES ('2000084','������','K04','JEFF JI YOUNG','','2001','FW','16','�̱�',TO_DATE('30-OCT-78','DD_MON_YY'),'1','184','76');
INSERT INTO player_t VALUES ('1900026','�Ѷ�','K04','','','2000','FW','','�����ƴϾ�',TO_DATE('','DD_MON_YY'),'','184','81');
INSERT INTO player_t VALUES ('1900027','������ƾ','K04','Selahattin','','2002','FW','11','��Ż����',TO_DATE('','DD_MON_YY'),'','180','75');
INSERT INTO player_t VALUES ('1900031','���溹','K08','','','1998','TM','','',TO_DATE('10-JAN-37','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900032','���й�','K08','','','','','','',TO_DATE('','DD_MON_YY'),'','','');
INSERT INTO player_t VALUES ('1900033','���ͼ�','K08','','','','','','',TO_DATE('','DD_MON_YY'),'','','');
INSERT INTO player_t VALUES ('1900034','����','K08','','','','','','',TO_DATE('','DD_MON_YY'),'','','');
INSERT INTO player_t VALUES ('1999045','������','K08','KWON, CHANSOO','','','GK','21','',TO_DATE('30-MAY-74','DD_MON_YY'),'2','183','77');
INSERT INTO player_t VALUES ('2002107','����','K08','KIM, KYOUNGDOO','','','GK','41','',TO_DATE('','DD_MON_YY'),'1','194','76');
INSERT INTO player_t VALUES ('1997255','���ؿ�','K08','KIM, HAEWOON','','','GK','1','',TO_DATE('25-DEC-73','DD_MON_YY'),'2','185','79');
INSERT INTO player_t VALUES ('1999101','�翵��','K08','YANG, YOUNGMIN','','','GK','31','',TO_DATE('19-JUL-74','DD_MON_YY'),'1','190','80');
INSERT INTO player_t VALUES ('2001087','���̸���','K08','KAIMOTO KOJIRO','','','DF','3','',TO_DATE('14-OCT-77','DD_MON_YY'),'1','182','77');
INSERT INTO player_t VALUES ('2002108','��ο�','K08','KIM, DOYOUNG','','','DF','30','',TO_DATE('07-OCT-80','DD_MON_YY'),'1','181','75');
INSERT INTO player_t VALUES ('2002118','�����','K08','KIM, MYONGHWI','','','DF','37','',TO_DATE('08-MAY-81','DD_MON_YY'),'1','185','76');
INSERT INTO player_t VALUES ('1997329','�迵ö','K08','KIM, YOUNGCHUL','','','DF','5','',TO_DATE('30-JUN-76','DD_MON_YY'),'1','183','80');
INSERT INTO player_t VALUES ('1997259','������','K08','KIM, JUNGJAE','','','DF','13','',TO_DATE('22-MAY-74','DD_MON_YY'),'2','184','80');
INSERT INTO player_t VALUES ('1997186','������','K08','KIM, HYUNSOO','','','DF','15','',TO_DATE('13-MAR-73','DD_MON_YY'),'2','186','80');
INSERT INTO player_t VALUES ('1997089','���°�','K08','NO, TAEKYOUNG','','','DF','25','',TO_DATE('22-APR-72','DD_MON_YY'),'1','175','68');
INSERT INTO player_t VALUES ('1999098','������','K08','MOON, SAMJIN','','','DF','2','',TO_DATE('03-MAR-73','DD_MON_YY'),'1','173','68');
INSERT INTO player_t VALUES ('2002111','�ΰ���','K08','MIN, KYUNGIN','','','DF','12','',TO_DATE('09-MAY-79','DD_MON_YY'),'1','177','71');
INSERT INTO player_t VALUES ('2001091','������','K08','PARK, JONGNAM','','','DF','34','',TO_DATE('17-NOV-76','DD_MON_YY'),'1','182','76');
INSERT INTO player_t VALUES ('1997055','�����','K08','PARK, CHOONGKYUN','','','DF','20','',TO_DATE('20-JUN-73','DD_MON_YY'),'1','184','70');
INSERT INTO player_t VALUES ('2000034','������','K08','BAE, JINSOO','','','DF','38','',TO_DATE('25-JAN-76','DD_MON_YY'),'1','178','72');
INSERT INTO player_t VALUES ('1998471','�̿���','K08','LEE, YOUNGJIN','','','DF','23','',TO_DATE('27-MAR-72','DD_MON_YY'),'2','180','75');
INSERT INTO player_t VALUES ('1998399','�ӱԽ�','K08','LIM, KYUSIK','','','DF','27','',TO_DATE('09-MAY-75','DD_MON_YY'),'1','182','75');
INSERT INTO player_t VALUES ('2002106','��ġ��','K08','KWAK, CHIGOOG','','','MF','32','',TO_DATE('22-APR-79','DD_MON_YY'),'1','170','68');
INSERT INTO player_t VALUES ('1999095','����','K08','KIM, SANGSIK','','','MF','4','',TO_DATE('17-DEC-76','DD_MON_YY'),'1','184','71');
INSERT INTO player_t VALUES ('2001086','�����','K08','KIM, YONGHEE','','','MF','18','',TO_DATE('15-OCT-78','DD_MON_YY'),'1','178','70');
INSERT INTO player_t VALUES ('2002109','��Կ�','K08','','','','MF','33','',TO_DATE('29-APR-78','DD_MON_YY'),'1','180','83');
INSERT INTO player_t VALUES ('2000126','�ڰ���','K08','PARK, KANGJO','','','MF','6','',TO_DATE('24-JAN-80','DD_MON_YY'),'1','165','57');
INSERT INTO player_t VALUES ('1998171','�ڳ���','K08','PARK, NAMRYUL','','','MF','8','',TO_DATE('07-MAY-70','DD_MON_YY'),'2','178','70');
INSERT INTO player_t VALUES ('2001088','�鿵ö','K08','BACK, YOUNGCHUL','','','MF','22','',TO_DATE('11-NOV-78','DD_MON_YY'),'1','177','71');
INSERT INTO player_t VALUES ('1997242','���¿�','K08','SHIN, TAEYONG','','','MF','7','',TO_DATE('11-OCT-70','DD_MON_YY'),'1','174','67');
INSERT INTO player_t VALUES ('2002117','�ø���','K08','Alcir de Oliveira fonseca','','','MF','29','�����',TO_DATE('14-NOV-77','DD_MON_YY'),'1','175','73');
INSERT INTO player_t VALUES ('2001128','�̸���','K08','Ricardo Irineu','','','MF','26','�����',TO_DATE('12-JUL-77','DD_MON_YY'),'1','172','69');
INSERT INTO player_t VALUES ('2002128','�𽺹�','K08','Jasmin Mujidza','','','MF','33','ũ�ξ�Ƽ��',TO_DATE('02-MAR-74','DD_MON_YY'),'1','180','78');
INSERT INTO player_t VALUES ('2002114','����ȣ','K08','CHUN, JAEHO','','','MF','14','',TO_DATE('08-AUG-79','DD_MON_YY'),'1','168','64');
INSERT INTO player_t VALUES ('1998131','����ȣ','K08','CHO, JINHO','','','MF','11','',TO_DATE('02-AUG-73','DD_MON_YY'),'1','174','68');
INSERT INTO player_t VALUES ('2002115','�ֳ���','K08','CHOI, NAKHOON','','','MF','35','',TO_DATE('28-DEC-79','DD_MON_YY'),'1','172','62');
INSERT INTO player_t VALUES ('1997100','ȫ��ǥ','K08','HONG, DOPYO','','','MF','9','',TO_DATE('24-JUL-73','DD_MON_YY'),'1','173','66');
INSERT INTO player_t VALUES ('2000127','�����','K08','KIM, DAEEUI','','','FW','19','',TO_DATE('30-MAY-77','DD_MON_YY'),'1','174','70');
INSERT INTO player_t VALUES ('1999084','�����','K08','KIM, WOOJAE','','','FW','24','',TO_DATE('13-SEP-76','DD_MON_YY'),'1','173','71');
INSERT INTO player_t VALUES ('1997192','����','K08','Drakulic sasa','','','FW','10','',TO_DATE('28-AUG-72','DD_MON_YY'),'1','190','84');
INSERT INTO player_t VALUES ('2002112','������','K08','SIO, KWANSOO','','','FW','17','',TO_DATE('25-FEB-80','DD_MON_YY'),'1','179','74');
INSERT INTO player_t VALUES ('2001095','�̼���','K08','LEE, SUNGWOON','','','FW','40','',TO_DATE('25-DEC-78','DD_MON_YY'),'1','173','64');
INSERT INTO player_t VALUES ('2002113','������','K08','LEE, JUNGWOON','','','FW','28','',TO_DATE('14-MAR-83','DD_MON_YY'),'1','170','68');
INSERT INTO player_t VALUES ('2001094','�嵿��','K08','JANG, DONGHYUN','','','FW','39','',TO_DATE('19-MAR-82','DD_MON_YY'),'1','178','67');
INSERT INTO player_t VALUES ('1997250','Ȳ����','K08','HWANG, YOUNSUCK','','','FW','16','',TO_DATE('17-OCT-73','DD_MON_YY'),'1','192','81');
INSERT INTO player_t VALUES ('1900041','��ȣ','K02','KIM, HO','','','TM','','',TO_DATE('24-NOV-44','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900042','�ռ���','K02','WANG, SUNJAE','','','TC','','',TO_DATE('16-MAR-59','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900043','�ڻ�','K02','Marco Antonio Alvarez Ferreira','','','TC','','�����',TO_DATE('20-JUL-60','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1900044','����ȿ','K02','YOON, SUNGHYO','','','TC','','',TO_DATE('18-MAY-62','DD_MON_YY'),'1','','');
INSERT INTO player_t VALUES ('1997067','�豤��','K02','KIM, JWANGSOO','','','GK','41','',TO_DATE('10-MAR-77','DD_MON_YY'),'1','182','79');
INSERT INTO player_t VALUES ('1999004','��ȣ��','K02','PARK, HOJIN','','','GK','31','',TO_DATE('22-OCT-76','DD_MON_YY'),'1','190','82');
INSERT INTO player_t VALUES ('1997203','�Ź�ö','K02','SIN, BUMCHUL','','','GK','21','',TO_DATE('27-SEP-70','DD_MON_YY'),'2','185','85');
INSERT INTO player_t VALUES ('1997035','�̿���','K02','LEE, WOONJAE','','','GK','1','',TO_DATE('26-APR-73','DD_MON_YY'),'1','182','82');
INSERT INTO player_t VALUES ('1998429','�迵��','K02','KIM, YOUNGSUN','','','DF','16','',TO_DATE('03-APR-75','DD_MON_YY'),'1','184','81');
INSERT INTO player_t VALUES ('2002021','������','K02','KIM, YOUJIN','','','DF','37','',TO_DATE('19-JUN-83','DD_MON_YY'),'1','188','76');
INSERT INTO player_t VALUES ('2001073','�ս���','K02','SON, SEUNGJUN','','','DF','32','',TO_DATE('16-MAY-82','DD_MON_YY'),'1','186','72');
INSERT INTO player_t VALUES ('1997007','��ȫ��','K02','SHIN, HONGGI','','','DF','15','',TO_DATE('04-MAY-68','DD_MON_YY'),'1','175','66');
INSERT INTO player_t VALUES ('2002027','�ȵ���','K02','AN, DONGWON','','','DF','49','',TO_DATE('27-SEP-82','DD_MON_YY'),'1','184','78');
INSERT INTO player_t VALUES ('2002024','�̰���','K02','LEE, KANGJIN','','','DF','43','',TO_DATE('25-APR-86','DD_MON_YY'),'1','181','65');
INSERT INTO player_t VALUES ('1997036','�̺���','K02','LEE, BYOUNGKEUN','','','DF','3','',TO_DATE('28-APR-73','DD_MON_YY'),'1','175','63');
INSERT INTO player_t VALUES ('2002026','���±�','K02','LEE, TAE-KWON','','','DF','46','',TO_DATE('14-JUL-80','DD_MON_YY'),'1','180','75');
INSERT INTO player_t VALUES ('2002014','������','K02','CHO, BYUNGKOOK','','','DF','2','',TO_DATE('01-JUL-81','DD_MON_YY'),'1','183','78');
INSERT INTO player_t VALUES ('2001075','����ȯ','K02','CHO, SUNGHWAN','','','DF','5','',TO_DATE('09-APR-82','DD_MON_YY'),'1','183','75');
INSERT INTO player_t VALUES ('2002123','����','K02','Gabriel Popescu','','','MF','10','�縶�Ͼ�',TO_DATE('25-DEC-73','DD_MON_YY'),'1','177','74');
INSERT INTO player_t VALUES ('2000089','������','K02','','','','MF','26','',TO_DATE('02-FEB-77','DD_MON_YY'),'1','174','65');
INSERT INTO player_t VALUES ('1997051','������','K02','KO, JONGSU','','','MF','22','',TO_DATE('30-OCT-78','DD_MON_YY'),'1','176','70');
INSERT INTO player_t VALUES ('2002015','��â��','K02','KO, CHANGHYUN','','','MF','8','',TO_DATE('15-SEP-83','DD_MON_YY'),'1','170','64');
INSERT INTO player_t VALUES ('1999089','����','K02','KIM, KIBUM','','','MF','28','',TO_DATE('14-AUG-76','DD_MON_YY'),'1','173','65');
INSERT INTO player_t VALUES ('1999083','�赿��','K02','KIM, DONGHYUN','','','MF','25','',TO_DATE('17-AUG-80','DD_MON_YY'),'1','175','72');
INSERT INTO player_t VALUES ('2001071','�����','K02','KIM, DOOHYUN','','','MF','4','',TO_DATE('14-JUL-82','DD_MON_YY'),'1','175','67');
INSERT INTO player_t VALUES ('2002025','����','K02','KIM, JUN','','','MF','44','',TO_DATE('09-DEC-86','DD_MON_YY'),'1','170','65');
INSERT INTO player_t VALUES ('1997040','������','K02','KIM, JINWOO','','','DF','7','',TO_DATE('09-OCT-75','DD_MON_YY'),'1','179','72');
INSERT INTO player_t VALUES ('1997069','���Ͻ�','K02','Laktionov Denis','','','FW','11','���þ�',TO_DATE('04-SEP-77','DD_MON_YY'),'1','176','71');
INSERT INTO player_t VALUES ('1997274','������','K02','SEO, JUNGWON','','','FW','14','',TO_DATE('17-DEC-70','DD_MON_YY'),'1','173','66');
INSERT INTO player_t VALUES ('2002016','�մ�ȣ','K02','SON, DAEHO','','','DF','17','',TO_DATE('11-SEP-81','DD_MON_YY'),'1','186','79');
INSERT INTO player_t VALUES ('2001070','������','K02','OH, GUCHAN','','','MF','24','',TO_DATE('28-AUG-82','DD_MON_YY'),'1','178','71');
INSERT INTO player_t VALUES ('2002135','������','K02','','','','MF','45','',TO_DATE('31-MAR-83','DD_MON_YY'),'1','176','70');
INSERT INTO player_t VALUES ('1999131','�̵���','K02','LEE, DONGWOOK','','','MF','40','',TO_DATE('10-APR-76','DD_MON_YY'),'1','176','68');

INSERT INTO schedule_t VALUES ('A','C02','20020501','K06','K10','2','0');
INSERT INTO schedule_t VALUES ('A','B03','20020505','K02','K01','1','2');
INSERT INTO schedule_t VALUES ('A','B05','20020505','K09','K08','1','3');
INSERT INTO schedule_t VALUES ('A','B02','20020512','K08','K01','1','1');
INSERT INTO schedule_t VALUES ('S','C02','20020707','K06','K01','1','2');
INSERT INTO schedule_t VALUES ('S','B02','20020707','K08','K03','3','2');
INSERT INTO schedule_t VALUES ('S','D03','20020707','K05','K09','2','1');
INSERT INTO schedule_t VALUES ('S','D01','20020707','K07','K10','1','0');
INSERT INTO schedule_t VALUES ('S','B04','20020710','K02','K01','2','1');
INSERT INTO schedule_t VALUES ('S','D03','20020710','K05','K03','1','1');
INSERT INTO schedule_t VALUES ('S','E02','20020710','K10','K04','0','2');
INSERT INTO schedule_t VALUES ('S','C02','20020710','K06','K08','3','1');
INSERT INTO schedule_t VALUES ('S','D01','20020710','K07','K09','0','0');
INSERT INTO schedule_t VALUES ('S','C06','20020713','K03','K06','2','1');
INSERT INTO schedule_t VALUES ('S','B05','20020714','K09','K02','3','0');
INSERT INTO schedule_t VALUES ('S','B01','20020714','K04','K07','1','0');
INSERT INTO schedule_t VALUES ('S','E02','20020714','K10','K08','1','1');
INSERT INTO schedule_t VALUES ('S','D01','20020717','K07','K01','0','0');
INSERT INTO schedule_t VALUES ('S','C06','20020717','K03','K02','2','0');
INSERT INTO schedule_t VALUES ('S','B02','20020717','K08','K04','2','1');
INSERT INTO schedule_t VALUES ('S','C02','20020717','K06','K05','1','2');
INSERT INTO schedule_t VALUES ('S','B05','20020717','K09','K10','1','1');
INSERT INTO schedule_t VALUES ('S','D01','20020720','K07','K03','1','1');
INSERT INTO schedule_t VALUES ('S','B04','20020721','K02','K06','2','2');
INSERT INTO schedule_t VALUES ('S','D03','20020721','K05','K08','2','2');
INSERT INTO schedule_t VALUES ('S','B01','20020721','K04','K09','1','3');
INSERT INTO schedule_t VALUES ('S','D03','20020724','K05','K02','1','1');
INSERT INTO schedule_t VALUES ('S','E02','20020724','K10','K03','1','1');
INSERT INTO schedule_t VALUES ('S','C02','20020724','K06','K07','0','1');
INSERT INTO schedule_t VALUES ('S','B02','20020724','K08','K09','1','1');
INSERT INTO schedule_t VALUES ('S','C06','20020727','K03','K04','2','1');
INSERT INTO schedule_t VALUES ('S','D01','20020727','K07','K05','2','1');
INSERT INTO schedule_t VALUES ('S','C02','20020727','K06','K10','3','0');
INSERT INTO schedule_t VALUES ('S','B05','20020728','K09','K01','1','1');
INSERT INTO schedule_t VALUES ('S','B04','20020728','K02','K08','2','2');
INSERT INTO schedule_t VALUES ('S','B02','20020731','K08','K01','2','0');
INSERT INTO schedule_t VALUES ('S','B05','20020731','K09','K03','3','1');
INSERT INTO schedule_t VALUES ('S','E02','20020731','K10','K05','1','0');
INSERT INTO schedule_t VALUES ('S','B01','20020731','K04','K06','3','2');
INSERT INTO schedule_t VALUES ('S','B04','20020731','K02','K07','1','2');
INSERT INTO schedule_t VALUES ('S','B02','20020803','K08','K07','1','0');
INSERT INTO schedule_t VALUES ('S','C02','20020803','K06','K09','2','1');
INSERT INTO schedule_t VALUES ('S','E02','20020804','K10','K02','0','3');
INSERT INTO schedule_t VALUES ('S','D03','20020804','K05','K04','2','1');
INSERT INTO schedule_t VALUES ('S','B01','20020811','K04','K02','0','2');
INSERT INTO schedule_t VALUES ('S','B05','20020811','K09','K05','0','1');
INSERT INTO schedule_t VALUES ('S','C06','20020811','K03','K08','2','0');
INSERT INTO schedule_t VALUES ('S','D01','20020811','K07','K10','1','1');
INSERT INTO schedule_t VALUES ('S','D03','20020818','K05','K01','0','2');
INSERT INTO schedule_t VALUES ('S','C02','20020818','K06','K03','3','1');
INSERT INTO schedule_t VALUES ('S','B01','20020818','K04','K07','1','0');
INSERT INTO schedule_t VALUES ('S','B04','20020818','K02','K09','1','2');
INSERT INTO schedule_t VALUES ('S','B02','20020818','K08','K10','3','1');
INSERT INTO schedule_t VALUES ('S','B04','20020824','K02','K01','1','1');
INSERT INTO schedule_t VALUES ('S','D03','20020824','K05','K03','3','3');
INSERT INTO schedule_t VALUES ('S','B02','20020824','K08','K06','4','3');
INSERT INTO schedule_t VALUES ('S','E02','20020825','K10','K04','1','1');
INSERT INTO schedule_t VALUES ('S','B05','20020825','K09','K07','1','1');
INSERT INTO schedule_t VALUES ('S','C06','20020828','K03','K02','0','0');
INSERT INTO schedule_t VALUES ('S','C02','20020828','K06','K05','1','1');
INSERT INTO schedule_t VALUES ('S','B01','20020828','K04','K08','2','3');
INSERT INTO schedule_t VALUES ('S','B05','20020828','K09','K10','2','0');
INSERT INTO schedule_t VALUES ('S','E02','20020901','K10','K01','2','3');
INSERT INTO schedule_t VALUES ('S','D01','20020901','K07','K03','0','1');
INSERT INTO schedule_t VALUES ('S','B04','20020901','K02','K06','1','1');
INSERT INTO schedule_t VALUES ('S','D03','20020901','K05','K08','3','3');
INSERT INTO schedule_t VALUES ('S','B01','20020901','K04','K09','2','1');
INSERT INTO schedule_t VALUES ('S','D01','20020911','K07','K05','','');
INSERT INTO schedule_t VALUES ('S','B05','20020911','K09','K01','','');
INSERT INTO schedule_t VALUES ('S','B04','20020911','K02','K08','','');
INSERT INTO schedule_t VALUES ('S','B01','20020911','K04','K03','','');
INSERT INTO schedule_t VALUES ('S','E02','20020911','K10','K06','','');
INSERT INTO schedule_t VALUES ('S','C02','20020914','K06','K04','','');
INSERT INTO schedule_t VALUES ('S','C06','20020914','K03','K09','','');
INSERT INTO schedule_t VALUES ('S','B02','20020914','K08','K01','','');
INSERT INTO schedule_t VALUES ('S','D01','20020914','K07','K02','','');
INSERT INTO schedule_t VALUES ('S','D03','20020915','K05','K10','','');
INSERT INTO schedule_t VALUES ('S','E02','20020918','K10','K02','','');
INSERT INTO schedule_t VALUES ('S','B02','20020918','K08','K07','','');
INSERT INTO schedule_t VALUES ('S','B05','20020918','K09','K06','','');
INSERT INTO schedule_t VALUES ('S','D03','20020918','K05','K04','','');
INSERT INTO schedule_t VALUES ('S','B04','20020925','K02','K10','','');
INSERT INTO schedule_t VALUES ('S','C06','20020925','K03','K01','','');
INSERT INTO schedule_t VALUES ('S','B01','20020925','K04','K05','','');
INSERT INTO schedule_t VALUES ('S','D01','20020925','K07','K08','','');
INSERT INTO schedule_t VALUES ('S','B05','20020925','K09','K06','','');
INSERT INTO schedule_t VALUES ('S','D01','20021019','K07','K02','','');
INSERT INTO schedule_t VALUES ('S','C06','20021019','K03','K09','','');
INSERT INTO schedule_t VALUES ('S','E02','20021020','K10','K05','','');
INSERT INTO schedule_t VALUES ('S','C02','20021020','K06','K04','','');
INSERT INTO schedule_t VALUES ('S','C06','20021023','K03','K04','','');
INSERT INTO schedule_t VALUES ('S','D03','20021023','K05','K07','','');
INSERT INTO schedule_t VALUES ('S','C02','20021023','K06','K10','','');
INSERT INTO schedule_t VALUES ('S','B02','20021023','K08','K02','','');
INSERT INTO schedule_t VALUES ('S','D01','20021026','K07','K06','','');
INSERT INTO schedule_t VALUES ('S','E02','20021027','K10','K03','','');
INSERT INTO schedule_t VALUES ('S','B01','20021027','K04','K01','','');
INSERT INTO schedule_t VALUES ('S','B05','20021027','K09','K08','','');
INSERT INTO schedule_t VALUES ('S','B04','20021027','K02','K05','','');
INSERT INTO schedule_t VALUES ('S','B04','20021030','K02','K04','','');
INSERT INTO schedule_t VALUES ('S','E02','20021030','K10','K08','','');
INSERT INTO schedule_t VALUES ('S','C06','20021102','K03','K07','','');
INSERT INTO schedule_t VALUES ('S','B05','20021103','K09','K04','','');
INSERT INTO schedule_t VALUES ('S','C02','20021103','K06','K02','','');
INSERT INTO schedule_t VALUES ('S','B02','20021103','K08','K05','','');
INSERT INTO schedule_t VALUES ('S','D03','20021106','K05','K06','','');
INSERT INTO schedule_t VALUES ('S','D01','20021106','K07','K01','','');
INSERT INTO schedule_t VALUES ('S','E02','20021106','K10','K09','','');
INSERT INTO schedule_t VALUES ('S','B01','20021106','K04','K08','','');
INSERT INTO schedule_t VALUES ('S','B04','20021106','K02','K03','','');
INSERT INTO schedule_t VALUES ('S','C06','20021109','K03','K05','','');
INSERT INTO schedule_t VALUES ('S','B05','20021110','K09','K07','','');
INSERT INTO schedule_t VALUES ('S','B01','20021110','K04','K10','','');
INSERT INTO schedule_t VALUES ('S','B02','20021110','K08','K06','','');
INSERT INTO schedule_t VALUES ('S','D01','20021113','K07','K04','','');
INSERT INTO schedule_t VALUES ('S','C02','20021113','K06','K03','','');
INSERT INTO schedule_t VALUES ('S','B04','20021113','K02','K09','','');
INSERT INTO schedule_t VALUES ('S','D03','20021113','K05','K01','','');
INSERT INTO schedule_t VALUES ('S','B05','20021117','K09','K05','','');
INSERT INTO schedule_t VALUES ('S','E02','20021117','K10','K07','','');
INSERT INTO schedule_t VALUES ('S','C06','20021117','K03','K08','','');
INSERT INTO schedule_t VALUES ('S','B01','20021117','K04','K02','','');
INSERT INTO schedule_t VALUES ('A','C04','20020508','K01','K08','1','3');
INSERT INTO schedule_t VALUES ('S','C04','20020713','K01','K05','0','0');
INSERT INTO schedule_t VALUES ('S','C04','20020720','K01','K10','0','0');
INSERT INTO schedule_t VALUES ('S','C04','20020724','K01','K04','1','1');
INSERT INTO schedule_t VALUES ('S','C04','20020803','K01','K03','3','0');
INSERT INTO schedule_t VALUES ('S','C04','20020811','K01','K06','0','0');
INSERT INTO schedule_t VALUES ('S','C04','20020828','K01','K07','0','1');
INSERT INTO schedule_t VALUES ('S','C04','20020918','K01','K03','','');
INSERT INTO schedule_t VALUES ('S','C04','20021019','K01','K08','','');
INSERT INTO schedule_t VALUES ('S','C04','20021023','K01','K09','','');
INSERT INTO schedule_t VALUES ('S','C04','20021102','K01','K10','','');
INSERT INTO schedule_t VALUES ('S','C04','20021110','K01','K02','','');
INSERT INTO schedule_t VALUES ('S','C04','20021117','K01','K06','','');
INSERT INTO schedule_t VALUES ('A','C06','20020317','K03','K02','1','2');
INSERT INTO schedule_t VALUES ('A','B02','20020317','K08','K04','6','0');
INSERT INTO schedule_t VALUES ('A','E01','20020317','K10','K06','2','1');
INSERT INTO schedule_t VALUES ('A','C03','20020317','K01','K09','2','2');
INSERT INTO schedule_t VALUES ('A','D01','20020320','K07','K01','1','2');
INSERT INTO schedule_t VALUES ('A','D02','20020320','K05','K03','1','0');
INSERT INTO schedule_t VALUES ('A','B03','20020320','K02','K08','2','3');
INSERT INTO schedule_t VALUES ('A','B05','20020320','K09','K10','2','0');
INSERT INTO schedule_t VALUES ('A','B03','20020323','K02','K05','2','0');
INSERT INTO schedule_t VALUES ('A','C02','20020324','K06','K01','1','2');
INSERT INTO schedule_t VALUES ('A','B01','20020324','K04','K03','1','1');
INSERT INTO schedule_t VALUES ('A','B05','20020324','K09','K07','1','0');
INSERT INTO schedule_t VALUES ('A','D01','20020327','K07','K06','2','1');
INSERT INTO schedule_t VALUES ('A','C06','20020327','K03','K08','1','0');
INSERT INTO schedule_t VALUES ('A','C03','20020327','K01','K10','0','1');
INSERT INTO schedule_t VALUES ('A','D02','20020406','K05','K04','3','2');
INSERT INTO schedule_t VALUES ('A','B01','20020410','K04','K02','2','0');
INSERT INTO schedule_t VALUES ('A','B02','20020410','K08','K05','2','1');
INSERT INTO schedule_t VALUES ('A','E01','20020410','K10','K07','1','1');
INSERT INTO schedule_t VALUES ('A','C02','20020410','K06','K09','1','4');
INSERT INTO schedule_t VALUES ('A','C01','20020414','K10','K01','0','2');
INSERT INTO schedule_t VALUES ('A','B02','20020414','K08','K03','1','1');
INSERT INTO schedule_t VALUES ('A','B01','20020414','K04','K05','1','0');
INSERT INTO schedule_t VALUES ('A','C02','20020414','K06','K07','2','0');
INSERT INTO schedule_t VALUES ('A','D02','20020420','K05','K08','2','2');
INSERT INTO schedule_t VALUES ('A','D01','20020420','K07','K10','0','1');
INSERT INTO schedule_t VALUES ('A','B03','20020421','K02','K04','3','2');
INSERT INTO schedule_t VALUES ('A','B05','20020421','K09','K06','1','0');
INSERT INTO schedule_t VALUES ('A','B02','20020424','K08','K02','1','1');
INSERT INTO schedule_t VALUES ('A','C06','20020424','K03','K05','1','2');
INSERT INTO schedule_t VALUES ('A','C03','20020424','K01','K07','1','2');
INSERT INTO schedule_t VALUES ('A','E01','20020424','K10','K09','1','3');
INSERT INTO schedule_t VALUES ('A','C06','20020427','K03','K04','0','3');
INSERT INTO schedule_t VALUES ('A','C03','20020427','K01','K06','5','2');
INSERT INTO schedule_t VALUES ('A','D01','20020427','K07','K09','0','1');
INSERT INTO schedule_t VALUES ('A','D02','20020428','K05','K02','1','2');
INSERT INTO schedule_t VALUES ('A','B05','20020501','K09','K01','0','0');
INSERT INTO schedule_t VALUES ('A','B03','20020501','K02','K03','1','2');
INSERT INTO schedule_t VALUES ('A','B01','20020501','K04','K08','2','2');
INSERT INTO schedule_t VALUES ('S','D02','20020904','K05','K02','1','2');
INSERT INTO schedule_t VALUES ('S','B02','20020904','K08','K09','1','0');
INSERT INTO schedule_t VALUES ('S','C05','20020904','K01','K04','2','2');
INSERT INTO schedule_t VALUES ('S','C06','20020904','K03','K10','0','0');
INSERT INTO schedule_t VALUES ('S','C02','20020904','K06','K07','2','2');

commit;


ALTER TABLE PLAYER_T DISABLE CONSTRAINT PLAYER_T_FK;
ALTER TABLE TEAM_T DISABLE CONSTRAINT TEAM_T_FK;

ALTER Session SET NLS_DATE_LANGUAGE='KOREAN';
ALTER Session SET NLS_DATE_FORMAT='DD/MM/RR';
