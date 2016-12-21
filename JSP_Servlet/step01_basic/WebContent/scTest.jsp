<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>scTest.jsp</title>
</head>
<body>
	<h2>모든 servlet과 jsp가 공유하는 자원을 제공해 줄 수 있는 API 학습</h2>
	<br /><hr /><br />
	
	1. ServletContext<br>
	2. setAttribute() : 데이터 저장 <br>
	3. getAttribute() : 데이터 획득 <br>
	<br /><hr /><br />
	
	jsp에서 존재하는 내장 객체들 : session, request, response, out, application <br>
	<%= application.getAttribute("msg") %> - ${applicationScope.msg }
	
	<%-- 더이상 공유할 필요가 없는 자원인 경우 --%>
	<%
		//삭제해줌
		application.removeAttribute("msg");
	%>
	
</body>
</html>