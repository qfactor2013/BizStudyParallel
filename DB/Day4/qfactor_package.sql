--package 명세부
create or replace package MyPackage is 
	procedure sp_1(v_id in number);
	procedure sp_2(v_sal in number);
end MyPackage;
/
--package 실행부
create or replace package body MyPackage is 
	procedure sp_1(v_id in number)
	is
	begin
		dbms_output.put_line('아이디는 '|| v_id);
	end sp_1;
	procedure sp_2(v_sal in number)
	is
	begin
		dbms_output.put_line('급여는 '|| v_sal);
	end sp_2;
end MyPackage;
/



-- TABLE, PL/SQL에서의 테이블은 일종의 일차원 배열이다.
-- 프로시저는 execute 문에서 실행되고
-- 펑션은 select 절에서 사용가능
-- 트리거는 자동호출되는 것이고
-- 패키지는 인터페이스처럼 감싸는 것이다.
