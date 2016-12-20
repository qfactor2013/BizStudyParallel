<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" session="false"%> 
    <!-- session false를 하면 자동생성이 안됨 (default true)-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP7EL.jsp</title>
</head>
<body>
		<h2>EL tag 내부에 사용 가능한 내장 객체들 학습</h2>
		<font color="red">jsp에는 가급적 자바 코드 배제가 주 목적</font>
		<br><hr><br>
		1. requestScope/sessionScope...<br>
		2. param<br>
		3. cookie : 사용을 위해서는 코드로 생성 및 활용, 단 EL tag 문법은 쉽다<br>
		<br><hr><br>
		
		<a href="JSP7_2EL.jsp?id=master&m=data1&m=data2">page이동</a>
		<br>
		<%-- paramValues test 코드 만들기 : String[] getParameterValues --%>
		
		
		
		
		<% // 순수자바코드로 쿠키 객체 생성 -> client pc에 저장
			//Servlet 코드는 servlet api import 필수
			//jsp는 servlet api + java.lang import 생략 가능
			Cookie c = new Cookie("msg", "data");
			c.setMaxAge(60*60*24);
			response.addCookie(c);
		%>
		
</body>
</html>