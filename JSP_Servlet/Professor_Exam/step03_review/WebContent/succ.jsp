<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>insert.html</title>
</head>
<body>

<%--
	String name = (String)request.getAttribute("name");
	String id = request.getParameter("id");
	
	out.println(name + "<br>");
	out.println(id);
--%>
	<%= request.getAttribute("name") %>
	<br>
	<%= request.getParameter("id") %>
	
</body>
</html>





