<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP7_2EL.jsp</title>
</head>
<body>
	<h2>JSP7EL.jsp���� ������ id �� ȹ�� �� ���, ��Ű ���� ȹ�� �� ���</h2>
	<br><hr><br>
	
	1. request.getParameter("id") �� �� - ${param.id }<br>
	2. Cookie[] getCookies()/getName()/getValue()�� �� - ${cookie.msg.value }
	3. String [] getParameterValues()�� �� - ${paramValues.m } - ${ paramValues.m[0]}
	
</body>
</html>