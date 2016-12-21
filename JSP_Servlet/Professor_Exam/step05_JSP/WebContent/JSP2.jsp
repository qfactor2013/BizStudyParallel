<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  %>
<%@ page import="util.Info" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP2.jsp</title>
</head>
<body>

	<%-- util.Info의 두개의 메소드 호출 후 결과값 출력
		1. sum() 호출후 출력
		2. sum(숫자) 값 매개인자 대입하면서 호출해서 출력 
		3. 1+2 메소드 호출을 위한 필수 설정 : import 필수  --%>
	 <% 
	 	Info i = new Info();
	 	out.println(i.sum());	 
	 %>
	 <br>	 
	 <%= i.sum(5) %>	

</body>
</html>






