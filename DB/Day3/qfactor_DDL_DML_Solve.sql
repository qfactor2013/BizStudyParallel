create table player_t(
	player_id char(7),
	team_id char(3) not null,
	player_name varchar2(20),
	nickname varchar2(40),
	join_yyyy char(4),
	position char(2),
	back_no number(2),
	nation varchar2(20),
	birth date,
	solar char(1),
	height number(3),
	weight number(3),
	constraint PLAYER_ID_PK primary key(player_id)
); comment on table player_t is 'K-리그 선수들의 정보를 가지고 있는 테이블';

commit

select * from all_tab_comments where table_name='player_t'

create table team_t(
	team_id char(3),
	region_name varchar2(4) not null,
	stadium_id char(3) not null,
	team_name varchar2(20) not null,
	e_team_name varchar2(50),
	orig_yyyy char(4),
	owner varchar2(10),
	zip_code1 char(3),
	zip_code2 char(3),
	address varchar2(60),
	ddd varchar2(3),
	tel varchar2(10),
	fax varchar2(10),
	homepage varchar2(50),
	constraint TEAM_ID_PK primary key(team_id)
); comment on table team_t is 'K-리그 선수들의 소속 팀에 대한 정보를 가지고 있는 테이블';

commit


create table stadium_t(
	stadium_id char(3),
	stadium_name varchar2(20) constraint STADIUM_NAME_NN not null,
	hometeam_id char(3),
	seat_count number,
	address varchar2(60),
	ddd varchar2(3),
	tel varchar2(10),
	fax varchar2(10),
	constraint STADIUM_T_STADIUM_ID_PK primary key(stadium_id)
);


insert into player_t(player_id, team_id, player_name, position, back_no, height, weight) 
values('1997051','K02','고종수','MF',22,176,70)
insert into player_t(player_id, team_id, player_name, position, back_no, height, weight) 
values('1997035','K02','이운재','GK',1,182,82)
insert into player_t(player_id, team_id, player_name, position, back_no, height, weight)
values('2000030','K07','김남일','MF',4,182,76)
insert into player_t(player_id, team_id, player_name, position, back_no, height, weight)
values('1997213','K07','김태영','DF',7,180,74)

commit;

select player_name 선수명, position 위치, height 키, weight 몸무게 from player_t
where position = 'MF'
and team_id in ('K02', 'K07')

select player_name 선수명, position 위치, back_no 백넘버, height 키
from player_t
where team_id = 'K02'


select * 
from player_t
where height >= 170

select * 
from player_t
where team_id in ('K02', 'K07')

select * 
from player_t
where position = 'MF'

select *
from player_t
where player_name like '고%'

select *
from player_t
where position like 'T%'

select *
from player_t
where height between 170 and 180

select * 
from player_t
where height is null

select *
from player_t
where team_id = 'K02'
and height >= 170

select *
from player_t
where team_id in ('K02', 'K07')
and height between 170 and 180

select avg(height)
from player_t


select position,count(position)
from player_t
where team_id = 'K02'
group by position


select max(mh) from (
select position,max(height) as mh
from player_t
where height >= 180
group by position )

select position ,mh from (
select position,avg(height) as mh
from player_t
group by position )
where mh >= 180

select team_id, position, avg(height)
from player_t
group by team_id, position
order by 1,2,3

select player_name, position, back_no
from player_t
order by back_no desc nulls last

select 
player_name||' 선수' 선수명,
position, 
back_no
from player_t

select player_name, position, back_no
from player_t
where team_id = 'K02'
and position = 'MF'
and height between 175 and 185
order by height desc, back_no asc



select position ,mh from (
select position,avg(height) as mh
from player_t
group by position )
where mh >= 180
order by mh desc


select p.player_name, p.back_no,
		t.region_name, t.team_name
		from player_t p, team_t t
where p.team_id = t.team_id


select t.region_name, t.team_name,
		s.stadium_name, s.seat_count
		from team_t t, stadium_t s
where t.stadium_id = s.stadium_id

select p.player_name, p.back_no,
		t.region_name, t.team_name
from player_t p, team_t t 
where position = 'GK'
and p.team_id = t.team_id
order by back_no



select * from emp
select * from tab
select * from salgrade


select e.*, 
(select grade 
from 	salgrade 
where	losal <= e.sal
and		hisal >= e.sal) as 급여등급
from emp e


select t.region_name, t.team_name, 
s.stadium_name, s.seat_count
from team_t t
RIGHT OUTER JOIN STADIUM_T S
ON T.STADIUM_ID = S.STADIUM_ID
ORDER BY S.SEAT_COUNT DESC NULLS LAST

SELECT * FROM EMP

SELECT E.EMPNO, E.ENAME,
		E.JOB,	E2.ENAME 
FROM EMP E, EMP E2
WHERE E.EMPNO = E2.MGR


SELECT P.PLAYER_NAME, P.POSITION,
		T.REGION_NAME, T.TEAM_NAME,
		S.STADIUM_NAME
FROM PLAYER_T P, TEAM_T T, STADIUM_T S
WHERE P.TEAM_ID = T.TEAM_ID
AND T.STADIUM_ID = S.STADIUM_ID
ORDER BY 1


SELECT PLAYER_NAME, POSITION, BACK_NO
FROM PLAYER_T
WHERE TEAM_ID = (SELECT TEAM_ID 
		FROM PLAYER_T 
		WHERE PLAYER_NAME = '김남일')
ORDER BY 1
		
		
SELECT P.PLAYER_NAME, P.POSITION,
		P.BACK_NO
FROM PLAYER_T P
WHERE HEIGHT < (SELECT AVG(HEIGHT) FROM PLAYER_T)
ORDER BY 1



SELECT P.TEAM_ID 팀코드,
		P.PLAYER_NAME 선수명,
		P.POSITION 포지션,
		P.BACK_NO 백넘버,
		P.HEIGHT	키
FROM PLAYER_T P
WHERE (P.TEAM_ID, P.HEIGHT) IN	(SELECT TEAM_ID, MIN(HEIGHT)
								FROM PLAYER_T
								GROUP BY TEAM_ID)
ORDER BY 1,2


SELECT T.TEAM_NAME, P.PLAYER_NAME, P.POSITION, P.BACK_NO, P.HEIGHT
FROM PLAYER_T P, (SELECT TEAM_ID, AVG(HEIGHT) AS LH
					FROM PLAYER_T 
					GROUP BY TEAM_ID) P2,
TEAM_T T
WHERE P.HEIGHT < P2.LH
AND		P.TEAM_ID = P2.TEAM_ID
AND		P.TEAM_ID = T.TEAM_ID
ORDER BY P.PLAYER_NAME

SELECT P.TEAM_ID, T.TEAM_NAME, AVG(P.HEIGHT)
FROM PLAYER_T P, TEAM_T T
WHERE P.TEAM_ID = T.TEAM_ID
GROUP BY P.TEAM_ID, T.TEAM_NAME
HAVING AVG(P.HEIGHT) <
		(
			SELECT AH FROM (
				SELECT TEAM_ID, AVG(HEIGHT) AS AH
				FROM PLAYER_T
				WHERE TEAM_ID = 'K02'
				GROUP BY TEAM_ID
				ORDER BY 1
				)
		)
		
		------- 예제 3-12까지 풀었음
		