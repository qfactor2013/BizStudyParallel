<%@page import="model.domain.Food"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>food.jsp</title>
</head>
<body>
	<!-- 체리 데이터만 요청 객체에 저장해서 page(forward) 이동 -->
	<%
		Food f = new Food();
		String command = request.getParameter("command");
		String value = f.getCherries();
		request.setAttribute("cherries", value);
	%>
	<jsp:forward page="foodView.jsp"></jsp:forward>
</body>
</html>
