<%@ page contentType="text/html; charset=euc-kr"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%--
		String name = (String) request.getAttribute("name"); 
		String id = request.getParameter("id"); // web query String
		
		out.println(name + "<br>");
		out.println(id);
 --%>
 <%= request.getAttribute("name") %><br>
</body>
</html>
