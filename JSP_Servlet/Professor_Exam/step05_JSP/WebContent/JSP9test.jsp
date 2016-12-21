<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP9test.jsp</title>
</head>
<body>
	<!-- <input type="text" name="idValue"> tag에 입력된 데이터 -->
	<c:if test="${param.idValue == 'master'}">
		안녕하세요
	</c:if>
	<c:if test="${param.idValue != 'master'}">
		무효
	</c:if>

</body>
</html>




