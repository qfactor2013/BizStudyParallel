<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>fail.jsp</title>
</head>
<body>
	실패 page<br>
	<%	out.println(request.getAttribute("msg")); %>	
	 ------<br>
	
	<% out.println(request.getParameter("id")); %>
	-----<br>
		
</body>
</html>




