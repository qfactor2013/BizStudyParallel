--package ����
create or replace package MyPackage is 
	procedure sp_1(v_id in number);
	procedure sp_2(v_sal in number);
end MyPackage;
/
--package �����
create or replace package body MyPackage is 
	procedure sp_1(v_id in number)
	is
	begin
		dbms_output.put_line('���̵�� '|| v_id);
	end sp_1;
	procedure sp_2(v_sal in number)
	is
	begin
		dbms_output.put_line('�޿��� '|| v_sal);
	end sp_2;
end MyPackage;
/



-- TABLE, PL/SQL������ ���̺��� ������ ������ �迭�̴�.
-- ���ν����� execute ������ ����ǰ�
-- ����� select ������ ��밡��
-- Ʈ���Ŵ� �ڵ�ȣ��Ǵ� ���̰�
-- ��Ű���� �������̽�ó�� ���δ� ���̴�.
