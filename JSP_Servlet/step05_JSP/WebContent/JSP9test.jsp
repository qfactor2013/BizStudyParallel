<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP9test.jsp</title>
</head>
<body>
	<c:choose>
		<c:when test="${param.id == 'master' && param.pw == 'YES'}">성공</c:when>
		<!-- C 태그로 request를 받을 때는 param으로 받는다. -->
		<c:when test="${param.id == 'master' && param.pw != 'YES'}">비번틀림</c:when>
		<c:otherwise>로그인 실패</c:otherwise>
	</c:choose>
</body>
</html>