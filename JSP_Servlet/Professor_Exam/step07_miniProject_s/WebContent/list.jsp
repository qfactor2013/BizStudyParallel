<%@ page language="java" 
contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="model.CustomerVo,java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>모든 고객 보기</title>
</head>
<body>
<center>  
<h3>모든 고객 보기</h3>
<table border="1"  width="70%">
	<tr>
		<td width="20%">id</td>
		<td width="20%">이름</td>
		<td width="40%">이메일 주소</td>
		<td width="20%">탈퇴</td>
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
<a href="index.html">메인으로 이동</a>
</center>
</body>
</html>
