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
	<!-- <input type="text" name="idValue"> tag�� �Էµ� ������ -->
	<c:if test="${param.idValue == 'master'}">
		�ȳ��ϼ���
	</c:if>
	<c:if test="${param.idValue != 'master'}">
		��ȿ
	</c:if>

</body>
</html>




