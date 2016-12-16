<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fail.jsp</title>
</head>
<body>
	실패 page <br>
	<% 
		out.println(request.getAttribute("msg") + " ------<br>");
		out.println(request.getParameter("id") + "--------<br>");
	%>
</body>
</html>
