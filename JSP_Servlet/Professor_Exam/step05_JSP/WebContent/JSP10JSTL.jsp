<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP10JSTL.jsp</title>
</head>
<body>
	<h3>jstl의 반복 tag</h3>
	<br>
	1. forEach tag - 반복 tag<br>
	2. begin 속성 - 반복 시작 index<br>
	3. end 속성 - 반복 끝 범위 <br>
	4. step 속성 - 증가치<br>
	5. var 속성 - 현 반복 tag 내부에서 사용될 변수 선언, 반드시 el tag로 출력<br>
	6. varStatus 속성 - 반복 상태 파악 가능 속성<br>
		6-1. count : 순번 counting
		6-2. index : step 속성값 까지 고려한 반복 변수에 사용된 값<br>
	
	<br><hr><br>
	<c:forEach begin="1" end="5" step="2" var="data" >
		${data}-
	</c:forEach>
	
	<br><hr><br>
	<c:forEach begin="1" end="10" step="1" var="data" varStatus="kosa">
		${data}-${kosa.count}-${kosa.index}<br>
	</c:forEach>
	
	<br><hr><br>
	<c:forEach begin="4" end="10" step="2" var="data" varStatus="kosa">
		${data}-${kosa.count}-${kosa.index}<br>
	</c:forEach>
	
	<br><hr size="3" color="blue"><br>
	<h4>자바 객체를 forEach tag로 관리하기</h4>
	<%
		String [] v = {"a", "b", "c", "d", "e"};
		pageContext.setAttribute("datas", v);//현 jsp에서만 사용되는 객체
	%>
	<c:forEach var="vData" items="${pageScope.datas}">
		${vData}-
	</c:forEach>
	
</body>
</html>











