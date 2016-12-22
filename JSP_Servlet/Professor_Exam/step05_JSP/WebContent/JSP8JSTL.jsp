<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!--  외부 library 사용을 위한 선언 : tag library 지시자-->
<%-- <%@ taglib prefix="별칭"  uri="사용하고자하는 tag 구분값" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP8JSTL.jsp</title>
</head>
<body>
	<h2>JSP Standard Tag Library</h2>
	<br>
	1. jsp에서 자바 코드를 최소화 하고자 파생된 업계 표준 tag<br>
	2. 환경셋팅 : web server들이 기본으로 제공하지 않음, 별도 셋팅<br>
		- tomcat8/webapps/examples/WEB-INF/lib 에서 복북<br>
		<font color="red">jsp에서 사용을 위한 선언 필수</font><br>
		
	3. sun(jsp 최초 개발 벤더사) : jsp scripting tag/jsp action<br>
	<font color="red">4. JSTL 은 EL과 함께 혼용해서 사용을 주로 함</font>		
	
	<br><hr><br>
	'a' == 'a' &nbsp;&nbsp;&nbsp;   ${'a' == 'a'}
	<br><hr><br>
	1. 조건에 따라 출력<br>
	<c:if test="${'a' == 'a'}">
		1-1. 실행되나?
	</c:if>
	<br>
	<c:if test="${'a' != 'a'}">
		1-2. 실행되나?
	</c:if>
	<br>
	 <c:if test="${3 > 2}">
		1-3. 실행되나?
	</c:if>
	<br><hr><br>
	
	2. 다중 조건에 따른 출력 : if~else if~else와 상동<br>
	<c:choose>
		<c:when test="${1>2}">
			2-1. 첫번째 조건이 true인 경우 실행
		</c:when>
		<c:when test="${3<2}">
			2-2. 두번째 조건이 true인 경우 실행
		</c:when>
		<c:otherwise>
			2-3. 모든 조건에 해당되지 않을때 실행 
		</c:otherwise>
	</c:choose>
	
	<br><hr><br>
	3. 자바 객체의 내용값 비교<br>
	<% 
		String msg = "data";
		request.setAttribute("m", msg);	
	%>
	<%-- ? 반드시 data와 비교해서 3-1이 출력되게 조건식 완성하기 --%>
	<c:choose>
		<c:when test="${requestScope.m == 'data'}">
			3-1. 첫번째 조건이 true인 경우 실행
		</c:when>
		<c:when test="${requestScope.m != 'data'}">
			3-2. 두번째 조건이 true인 경우 실행
		</c:when>
		<c:otherwise>
			3-3. 모든 조건에 해당되지 않을때 실행 
		</c:otherwise>
	</c:choose>
	
</body>
</html>









