<%@ page language="java" 
contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="model.CustomerVo,java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� �� ����</title>
</head>
<body>
<center>  
<h3>��� �� ����</h3>
<table border="1"  width="70%">
	<tr>
		<td width="20%">id</td>
		<td width="20%">�̸�</td>
		<td width="40%">�̸��� �ּ�</td>
		<td width="20%">Ż��</td>
	</tr>	

?
	
	<tr>
			<td><%= cvo.getId() %> </td>
			<td><%= cvo.getName() %></td>
			<td><%= cvo.getEmail() %> </td>
			<td>
			?
			</td>
	</tr>
?

	
</table>
<p>
<a href="index.html">�������� �̵�</a>
</center>
</body>
</html>
