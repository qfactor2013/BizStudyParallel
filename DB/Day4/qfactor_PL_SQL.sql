create or replace function func_tax(v_num in number)
return number
is 
v_result number;
begin
	v_result := v_num * 0.07;
	return v_result;
end ;
/

--PL/SQL에서 변수는 : 붙여줘야하며
--대입은 := 로 한다.
--프로시저랑 펑션은 거의 같다

create or replace procedure sp_tax(v_num in number, v_result out number)
is
		v_su number;
begin
		v_su := 100;
		v_result := v_num * 0.07;
end ;
/



select first_name, salary, salary*0.07, func_tax(salary)
from employees


create or replace procedure sp_tax2(v_num in number, v_result out number)
is
		v_su number := 100;
		v_hire_date date := sysdate+7;
begin
		v_result := v_num * 0.07 + v_su;
		dbms_output.put_line('입사일: ' || to_char(v_hire_date,'yyyy/mm/dd'));
		 dbms_output.put_line('입력값: ' || v_num);
		 dbms_output.put_line('v_su: ' || v_su);
		 dbms_output.put_line('출력값: ' || v_result);
end ;
/

set serverout on   -- db상에서 출력하게끔 하는 설정

select * from emp2


drop table emp2
create table emp2
as select * from employees


--특정직원의 급여를 10% 인상하기
-- 각 문장의 끝에 ; 무조건 붙여줘야한다.
create or replace procedure sp_salup(v_id in emp2.employee_id%type)
is
	v_sal emp2.salary%type;
	v_date emp2.hire_date%type;
begin
	update emp2
	set salary = salary*1.1
	where employee_id = v_id;
	commit;
	
	select salary, hire_date
	into v_sal, v_date
	from emp2 
	where employee_id = v_id;
	
	dbms_output.put_line('입력된 직원번호 :  '|| v_id);
	dbms_output.put_line('수정된 급여 :  '|| v_sal);
	dbms_output.put_line('직원의 입사일 :  '|| to_char(v_date, 'yyyy-mm-dd'));
end ;
/

-- %rowtype
-- 특정직원의 모든 정보를 출력하시오
-- 괄호도 잘보자..... 에러난다.... 
create or replace procedure sp_emp(v_empid in emp2.employee_id%type, 
v_empname out emp2.first_name%type, v_salary out emp2.salary%type)		
is
		v_record emp2%rowtype;
begin
	if 			 mod(v_empid, 10) = 0  then		  
	 dbms_output.put_line('직원의 번호가 10의 배수이다');	
	 -- elseif 아님 ㅡ,.ㅡ;;;
	elsif		 mod(v_empid, 100) = 0  then 	 	
	 dbms_output.put_line('직원의 번호가 100의 배수이다');	
	 
	else		 
	 dbms_output.put_line('직원의 번호가 10의 배수가 아니다');	 	
	end if;		 
	
	
	select * 
	into v_record
	from emp2 where employee_id = v_empid;
	
	v_empname := v_record.first_name;
	v_salary  := v_record.salary;
	
	dbms_output.put_line('직원의 번호 :  '|| v_record.employee_id);
	dbms_output.put_line('직원의 이름 :  '|| v_record.first_name);
	dbms_output.put_line('직원의 급여 :  '|| v_record.salary);
	dbms_output.put_line('직원의 이메일 :  '|| v_record.email);
	dbms_output.put_line('직원의 입사일 :  '|| to_char(v_record.hire_date, 'yyyy-mm-dd'));
end ;
	/
	
	
create or replace procedure sp_print(v_count in number)
is
	v_index number := 1;
begin
--	loop
--		dbms_output.put_line(v_index);
--		v_index := v_index+1;
--		exit when v_index > v_count;
--	end loop;
	
	for v_index in reverse 1..v_count loop
		dbms_output.put_line(v_index);
	end loop;
	
	while v_index < v_count loop
		dbms_output.put_line(v_index);
		v_index := v_index+1;
	end loop;
	
end ;
/


-- 프로시저는 out(리턴)에 해당하는 변수도 아규먼트로 줘야한다.
create or replace procedure sp_emp(v_sal in emp2.salary%type)		
is
		v_record emp2%rowtype;
begin
	select *
	into v_record
	from emp2
	where salary >= v_sal;
	
	dbms_output.put_line('직원의 번호 :  '|| v_record.employee_id);
	dbms_output.put_line('직원의 이름 :  '|| v_record.first_name);
	dbms_output.put_line('직원의 급여 :  '|| v_record.salary);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('해당하는 데이터가 없다');
	WHEN TOO_MANY_ROWS THEN
		dbms_output.put_line('데이터건수가 많다...');
	WHEN OTHERS THEN
		dbms_output.put_line('기타오류');
end ;
	/


	
	-- CURSOR 
	-- SQL문을 실행할때마다 처리를 위한 메모리 공간
	-- 결과 SET의 행들을 하나씩 얻어오는 작업에 이용된다.
	
	-- 1. 묵시적 커서(Implicit Cursor)
	-- PL/SQL 블록 실행시 자동 생성된다. 사용 후 바로 닫히므로 
	
	create or replace procedure sp_empdel(v_sal in emp2.salary%type)
	is
	begin
		delete from emp2
		where salary < v_sal;
		if sql%found then
			dbms_output.put_line('삭제건수' || sql%rowcount);
			commit;
		else  -- sql%notfound
			dbms_output.put_line('삭제되지 않았습니다');
			--dbms_output.put_line(to_char(sql%notfound));
			rollback;
		end if;
	end ;
	/
	
	
	-- 2. 명시적 커서(Explicit Cursor)
	-- 사용자 정의 커서
	-- DECLARE CURSOR 커서명 IS SELECT 문장;
	-- 커서열기 OPEN 커서명, 커서얻기 FETCH 커서명 INTO 변수1, 변수2, ....; 커서닫기 CLOSE 커서명;
	-- %ROWCOUNT %FOUND %NOTFOUND %ISOPEN

create or replace procedure sp_empselect
is
	--변수선언
	v_name emp2.first_name%type;
	v_sal emp2.salary%type;
	v_date emp2.hire_date%type;
	--커서선언
	Cursor cur_emp is 
		select first_name, salary, hire_date from emp2;
begin
		open cur_emp; 
		Loop
			fetch cur_emp into v_name, v_sal, v_date;
			exit when cur_emp%notfound;
			dbms_output.put_line('이름' || v_name);
			dbms_output.put_line('급여' || v_sal);
			dbms_output.put_line('입사일' || to_char(v_date, 'yyyy-mm-dd'));
			dbms_output.put_line('=============================');
		end Loop;
			dbms_output.put_line('전체 건수 : ' || cur_emp%rowcount);
		close cur_emp;
end;
/





create or replace procedure sp_empselect2
is
	v_record emp2%rowtype;
	--커서선언
	Cursor cur_emp is 
		select * from emp2;
begin
	FOR V_RECORD IN CUR_EMP LOOP
		dbms_output.put_line('이름' || V_RECORD.FIRST_NAME);
		dbms_output.put_line('급여' || V_RECORD.SALARY);
		dbms_output.put_line('입사일' || to_char(V_RECORD.HIRE_DATE, 'yyyy-mm-dd'));
		dbms_output.put_line('=============================');
	END LOOP;
end;
/



Trigger
before 데이터 처리가 실행되기전
after 데이터 처리가 실행 된 후
for each row  데이터 처리 시 건건이 모두 트리거 실행


