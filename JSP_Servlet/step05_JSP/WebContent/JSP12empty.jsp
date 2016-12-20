<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL 자체적으로 제공하는 함수 라이브러리 -->
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP12empty.jsp</title>
</head>
<body>
	<h2>EL tag는 null인 경우 브라우저에 blank 출력</h2>
	<%
		String msg = "";
		String msg2 = null;
		request.setAttribute("m1", msg);
		request.setAttribute("m2", msg2);
		
		String[] s = new String[2];
		request.setAttribute("m3", s);
		
		ArrayList<String> a = new ArrayList<>();
		request.setAttribute("m4", a);
	%>
	
	1. ${m1 }<br>	
	2. ${m2 }<br>
	3. ${m3 }<br>
	4. ${m4 }<br>
	5. <%= request.getAttribute("m2") %><br>
	
	<br><hr><br>
	jstl의 데이터 개수 반환하는 함수로 데이터 존재 유무 확인<br>
	<c:if test="${fn:length(m4) == 0}">1. 데이터가 없으면 출력된다. </c:if>
	
	<br><hr><br>
	m4라는 별칭으로 저장된 객체에 데이터가 없지 않다(있을 경우)를 검증<br>
	<c:if test="${ not empty m4}">2. 데이터가 있으면 출력된다. </c:if>
	
	<br><hr><br>
	m4라는 별칭으로 저장된 객체에 데이터가 없음을 검증 <br>
	<c:if test="${empty m4}">3. 데이터가 없으면 출력된다. </c:if>
	
	<br><hr><br>
	<c:if test="${empty m2}">
	1.  String 변수가 null 인 경우만 출력하는 메세지
	</c:if>
	
	<br><hr><br>
	<c:if test="${not empty m2}">
	2. String 변수가 null 인 경우만 출력하는 메세지
	</c:if>
</body>
</html>