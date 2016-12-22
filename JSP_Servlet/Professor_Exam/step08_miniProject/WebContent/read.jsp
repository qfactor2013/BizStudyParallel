<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<SCRIPT language=javascript>
function sendUpdate(){
		document.requestForm.command.value ="updateForm";
		document.requestForm.submit();
}	

function sendDelete(){
		var password = prompt("������ �Խù��� ��й�ȣ�� �Է��ϼ���");	
		if(password){
			document.requestForm.command.value ="delete";
			document.requestForm.password.value = password;
			document.requestForm.submit();			
		}else{
			return false;
		}
}	
</script>
</HEAD>
<!-- request.setAttribute("resultContent", gContent); -->
<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
    <tr>
        <td width="1220" height="20" colspan="4" bgcolor="#336699">
            <p align="center"><font color="white" size="3"><b>
            ${requestScope.resultContent.num}  �� �Խù� �ڼ�������</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">�ۼ���</span></b></p>
        </td>
        <td width="450" height="20" colspan="3"><span style="font-size:9pt;"><b>
		${requestScope.resultContent.author}</b></span></td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">�ۼ���</span></b></p>
        </td>
        <td width="300" height="20" "><span style="font-size:9pt;"><b>
		${requestScope.resultContent.writeday}</b></span></td>
        <td width="100" height="20" >
                <p align="right"><b><span style="font-size:9pt;">��ȸ��</span></b></p>
		</td>
        <td width="100" height="20">
				<p><b><span style="font-size:9pt;"></span>
				${requestScope.resultContent.readnum}</b></p>
		</td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">�� ��</span></b></p>
        </td>
        <td width="450" height="20" colspan="3"><span style="font-size:9pt;"><b>
		${requestScope.resultContent.title}</b></span></td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">�� ��</span></b></p>
        </td>
		<!-- �������� �� ������ �ѷ��� ���� ���๮��(\n)�� <br>�±׷� ��ȯ�� ���ڿ��� ������� �Ѵ�. -->
        <td width="450" height="200" valign="top" colspan="3"><span style="font-size:9pt;"><b>
		${requestScope.resultContent.content}</b></span></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">&nbsp;</span></b></p>
        </td>
        <td height="20" colspan="3">
	        <table>
				<tr>
					<td>
						<!-- ������ �ʿ��� �����͵��� hidden���� ���ܳ��� �� �����ͷ� �����ش�. -->
						<form name="requestForm" method=post action="guestbook.do">
							<input type=hidden name=num value="${requestScope.resultContent.num}">
							<input type=hidden name="command" value="">
							<input type=hidden name="password" value="">
							<input type=button value="�����ϱ�" onClick="sendUpdate()">
							<input type=button value="�����ϱ�" onClick="sendDelete()">
						</form>
					</td>
				</tr>
			</table>
		</td>
    </tr>
</table>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="guestbook.do">����Ʈ�� ���ư���</a>&gt;</span></div>
