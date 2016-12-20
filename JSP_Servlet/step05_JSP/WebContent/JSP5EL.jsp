<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--isELIgnored="false" 하면 ELtag 무시하지 않는다. --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP5EL</title>
</head>
<body>
	<h2> 자바의 객체를 동적으로 관리 및 출력하는 tag 학습 : EL tag</h2>
	<br>	1. EL tag는 사칙연산, 논리연산등 다 적용 및 실행 가능<br>
			2. EL tag에 자바의 데이터 관리 및 출력 <br>
	<table border="1" bgcolor="yellow" width="50%">
		<tr><td>2+3</td><td>${2+3 } </td></tr>
		<tr><td>2*3</td><td>${2*3 } </td></tr>
		<tr><td>2>3</td><td>${2>3 } </td></tr>
		<tr><td>'a'=='a'</td><td>${'a'=='a' } </td></tr>
		<tr><td>'a'=='b'</td><td>${'a'=='b' } </td></tr>
	</table>
	
	<br><hr color="blue"><br>
	<%
		ArrayList<String> d1 = new ArrayList<String>();
		d1.add("kosa");
		d1.add("일학습병행");
		d1.add("java");
		//요청 객체에 저장
		
		request.setAttribute("d1", d1);
	%>
	
	<%-- *Scope 생략시 EL tag 실행 시 자동 적용 --%>
	${requestScope.d1[0]} - ${d1[0] }
	
	<br><hr><br>
	<%
		//HashMap : Key : Value 구조
		HashMap<String, String> m = new HashMap<String, String>();
		m.put("a1", "데이터1");
		m.put("a2", "데이터2");
		m.put("a3", "데이터3");
		m.put("a4", "데이터4");
		session.setAttribute("m", m);
	%>
	
	${sessionScope.m.get("a1") } - ${m.get("a1") }
	
	
	<br><hr><br>
	<%
		String msg = "문자열";
		request.setAttribute("data", msg);
	%>
	
		${data }
</body>
</html>