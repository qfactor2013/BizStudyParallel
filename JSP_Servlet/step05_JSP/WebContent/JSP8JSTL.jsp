<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 외부 라이브러리 사용을 위한 선언 : tag library 지시자 -->
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 		별칭				태그 api 주소값				 -->
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
	2. 환경설정 : web server 들이 기본으로 제공하지 않음 별도 세팅 <br>
		-tomcat8/webapps/ example/WEB-INF/lib에서 복붙<br>
		<font color="red">jsp에서 사용을 위한 선언 필수</font><br>
	3. sun(jsp 최초 개발 벤더사) : jsp scription tag/jsp action<br>
	
	<font color="red"> 4. JSTL은 EL과 함께 혼용해서 사용을 주로 함</font><br>
	
	<br><hr><br>
	'a' == 'a' &nbsp;&nbsp;&nbsp; ${'a'=='a' }
	<br><hr><br>
	1. 조건에 따라 출력<br>
	<c:if test="${'a'=='a' }" >
		띠용
	</c:if><br>
	<c:if test="${'a'!='a' }" >
		띠용2
	</c:if><br>
	<c:if test="${3>2 }" >
		띠용3
	</c:if><br>
	2. 다중 조건에 따른 출력 (if~ else if ~ else 와 상동)<br>
	<c:choose>
		<c:when test="${1>2 }"> 띠띠용</c:when>
		<c:when test="${3<2 }"> 띠띠용2</c:when>
		<c:otherwise>띠띠용아님</c:otherwise>
	</c:choose>
	<br>
	
	<br><hr><br>
	3. 자바 객체의 내용값 비교 <br>
		<%--data와 비교해서 3-1이 출력되게 조건식 완성하기 --%>
		<% 
			String msg = "data";
			request.setAttribute("m", msg);
		%>
		<c:choose>
			<c:when test="${requestScope.m == 'data' }">개굴</c:when>
			<c:when test="${requestScope.m != 'data' }">개굴2</c:when>
			<c:otherwise>해당없음</c:otherwise>
		</c:choose>
	
	
</body>
</html>