create or replace function func_tax(v_num in number)
return number
is 
v_result number;
begin
	v_result := v_num * 0.07;
	return v_result;
end ;
/

--PL/SQL���� ������ : �ٿ�����ϸ�
--������ := �� �Ѵ�.
--���ν����� ����� ���� ����

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
		dbms_output.put_line('�Ի���: ' || to_char(v_hire_date,'yyyy/mm/dd'));
		 dbms_output.put_line('�Է°�: ' || v_num);
		 dbms_output.put_line('v_su: ' || v_su);
		 dbms_output.put_line('��°�: ' || v_result);
end ;
/

set serverout on   -- db�󿡼� ����ϰԲ� �ϴ� ����

select * from emp2


drop table emp2
create table emp2
as select * from employees


--Ư�������� �޿��� 10% �λ��ϱ�
-- �� ������ ���� ; ������ �ٿ�����Ѵ�.
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
	
	dbms_output.put_line('�Էµ� ������ȣ :  '|| v_id);
	dbms_output.put_line('������ �޿� :  '|| v_sal);
	dbms_output.put_line('������ �Ի��� :  '|| to_char(v_date, 'yyyy-mm-dd'));
end ;
/

-- %rowtype
-- Ư�������� ��� ������ ����Ͻÿ�
-- ��ȣ�� �ߺ���..... ��������.... 
create or replace procedure sp_emp(v_empid in emp2.employee_id%type, 
v_empname out emp2.first_name%type, v_salary out emp2.salary%type)		
is
		v_record emp2%rowtype;
begin
	if 			 mod(v_empid, 10) = 0  then		  
	 dbms_output.put_line('������ ��ȣ�� 10�� ����̴�');	
	 -- elseif �ƴ� ��,.��;;;
	elsif		 mod(v_empid, 100) = 0  then 	 	
	 dbms_output.put_line('������ ��ȣ�� 100�� ����̴�');	
	 
	else		 
	 dbms_output.put_line('������ ��ȣ�� 10�� ����� �ƴϴ�');	 	
	end if;		 
	
	
	select * 
	into v_record
	from emp2 where employee_id = v_empid;
	
	v_empname := v_record.first_name;
	v_salary  := v_record.salary;
	
	dbms_output.put_line('������ ��ȣ :  '|| v_record.employee_id);
	dbms_output.put_line('������ �̸� :  '|| v_record.first_name);
	dbms_output.put_line('������ �޿� :  '|| v_record.salary);
	dbms_output.put_line('������ �̸��� :  '|| v_record.email);
	dbms_output.put_line('������ �Ի��� :  '|| to_char(v_record.hire_date, 'yyyy-mm-dd'));
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


-- ���ν����� out(����)�� �ش��ϴ� ������ �ƱԸ�Ʈ�� ����Ѵ�.
create or replace procedure sp_emp(v_sal in emp2.salary%type)		
is
		v_record emp2%rowtype;
begin
	select *
	into v_record
	from emp2
	where salary >= v_sal;
	
	dbms_output.put_line('������ ��ȣ :  '|| v_record.employee_id);
	dbms_output.put_line('������ �̸� :  '|| v_record.first_name);
	dbms_output.put_line('������ �޿� :  '|| v_record.salary);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('�ش��ϴ� �����Ͱ� ����');
	WHEN TOO_MANY_ROWS THEN
		dbms_output.put_line('�����ͰǼ��� ����...');
	WHEN OTHERS THEN
		dbms_output.put_line('��Ÿ����');
end ;
	/


	
	-- CURSOR 
	-- SQL���� �����Ҷ����� ó���� ���� �޸� ����
	-- ��� SET�� ����� �ϳ��� ������ �۾��� �̿�ȴ�.
	
	-- 1. ������ Ŀ��(Implicit Cursor)
	-- PL/SQL ��� ����� �ڵ� �����ȴ�. ��� �� �ٷ� �����Ƿ� 
	
	create or replace procedure sp_empdel(v_sal in emp2.salary%type)
	is
	begin
		delete from emp2
		where salary < v_sal;
		if sql%found then
			dbms_output.put_line('�����Ǽ�' || sql%rowcount);
			commit;
		else  -- sql%notfound
			dbms_output.put_line('�������� �ʾҽ��ϴ�');
			--dbms_output.put_line(to_char(sql%notfound));
			rollback;
		end if;
	end ;
	/
	
	
	-- 2. ����� Ŀ��(Explicit Cursor)
	-- ����� ���� Ŀ��
	-- DECLARE CURSOR Ŀ���� IS SELECT ����;
	-- Ŀ������ OPEN Ŀ����, Ŀ����� FETCH Ŀ���� INTO ����1, ����2, ....; Ŀ���ݱ� CLOSE Ŀ����;
	-- %ROWCOUNT %FOUND %NOTFOUND %ISOPEN

create or replace procedure sp_empselect
is
	--��������
	v_name emp2.first_name%type;
	v_sal emp2.salary%type;
	v_date emp2.hire_date%type;
	--Ŀ������
	Cursor cur_emp is 
		select first_name, salary, hire_date from emp2;
begin
		open cur_emp; 
		Loop
			fetch cur_emp into v_name, v_sal, v_date;
			exit when cur_emp%notfound;
			dbms_output.put_line('�̸�' || v_name);
			dbms_output.put_line('�޿�' || v_sal);
			dbms_output.put_line('�Ի���' || to_char(v_date, 'yyyy-mm-dd'));
			dbms_output.put_line('=============================');
		end Loop;
			dbms_output.put_line('��ü �Ǽ� : ' || cur_emp%rowcount);
		close cur_emp;
end;
/





create or replace procedure sp_empselect2
is
	v_record emp2%rowtype;
	--Ŀ������
	Cursor cur_emp is 
		select * from emp2;
begin
	FOR V_RECORD IN CUR_EMP LOOP
		dbms_output.put_line('�̸�' || V_RECORD.FIRST_NAME);
		dbms_output.put_line('�޿�' || V_RECORD.SALARY);
		dbms_output.put_line('�Ի���' || to_char(V_RECORD.HIRE_DATE, 'yyyy-mm-dd'));
		dbms_output.put_line('=============================');
	END LOOP;
end;
/



Trigger
before ������ ó���� ����Ǳ���
after ������ ó���� ���� �� ��
for each row  ������ ó�� �� �ǰ��� ��� Ʈ���� ����


