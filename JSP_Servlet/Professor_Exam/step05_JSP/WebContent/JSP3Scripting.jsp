<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP3Scripting.jsp</title>
</head>
<body>
	JSP Scripting tag Review<br>
	
	<br><hr><br>
	<%
		//���ڿ� �迭�� �����͵��� �����ؼ� jdk1.5 ���� �߰��� for, �� ����� table 
		String[] values = {"��", "��", "��", "��", "��"};		
	%>
	
	<table border="2" bordercolor="blue" width="50%">
	<%-- table ���ο� ������ ��µǰ� �� �ּ��� --%>
	
 	<% for(String v : values){ %>
 	
		<tr><td><%= v %></td></tr>
		
	<%} %>
	
 	</table>	
</body>
</html>





