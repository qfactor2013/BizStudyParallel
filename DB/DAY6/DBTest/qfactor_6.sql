create or replace procedure sp_member(
	v_mno in members.mno%type,
	v_mname out members.mname%type
)
is begin 
	select mname into v_mname
	from MEMBERS
	where mno = v_mno;
end;
/

