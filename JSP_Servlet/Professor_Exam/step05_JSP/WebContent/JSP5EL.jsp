<%@page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList" isELIgnored="false"%>
<%-- isELIgnored="false"
	- EL tag 무시할거지? false 아니라는 의미
	- jsp는 이 속성이 생략이 되어있고 false 가 기본값이나
	경우에 따라선 선언 권장 --%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP5EL.jsp</title>
</head>
<body>

	<h2> 자바의 객체를 동적으로 관리 및 출력하는 tag 학습 : EL tag</h2>
	1. EL tag는 사칙연산, 논리연산등 다 적용 및 실행 가능<br>
	2. EL tag에 자바의 데이터 관리 및 출력<br>
	<br>
	<table border="1" bgcolor="yellow"  width="50%">
		<tr><td>2+3</td><td>${2+3}</td></tr>
		<tr><td>2*3</td><td>${2*3}</td></tr>
		<tr><td>2>3</td><td>${2>3}</td></tr>
		<tr><td>'a' == 'a'</td><td>${'a' == 'a'}</td></tr>
		<tr><td>'a' == 'b'</td><td>${'a' == 'b'}</td></tr>
	</table>
	
	<br><hr color="blue"><br>
	<%
		//ArrayList의 데이터 EL로 조작하기 
		ArrayList<String> d1 = new ArrayList<String>();
		d1.add("kosa");  //0번째 저장된 데이터
		d1.add("일학습병행"); //1	""
		d1.add("java");
		//요청 객체에 저장
		request.setAttribute("d1", d1);		
	
	/* 	ArrayList<String> d2 = (ArrayList<String>)request.getAttribute("d1");	
		String s = d2.get(0);
		out.println(s);  */
	%>
	<%-- *Scope 생략시 EL tag실행시 자동 적용 --%>
	${requestScope.d1[0]} - ${d1[0]}
	<br><hr><br>
	<%
		//HashMap : key와 value 매핑된 구조
		HashMap<String, String> m = new HashMap<String, String>();
		m.put("a1", "데이터1");
		m.put("a2", "데이터2");
		m.put("a3", "데이터3");
		session.setAttribute("m", m);
	%>
	${sessionScope.m.a2}  - ${m.a2}
	
	<br><hr><br>
	<%
		String msg = "문자열";
		request.setAttribute("data", msg);
	%>
	${requestScope.data} - ${data}
	
</body>
</html>










