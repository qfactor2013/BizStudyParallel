<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 
page 지시자
1. jsp scripting tag
2. 용도 : client에게 출력할 포멧설정
3. servlet 동일한 코드 : response.setContentType("text/html; charset=EUC-KR");
 -->  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP1Scripting.jsp</title>
</head>
<body>
	<%-- jsp 만의 주석 --%>
	
	<%-- 멤버 변수와 멤버 메소드 구현 --%>
	<%!  //선언자
		String msg = "나 멤버 변수";
		String getMsg(){
			return msg;
		}
	%>

	<%-- doGet/doPost/service() 와 동일한 로직 구현 tag, scriptlet tag  --%>
	<%
		out.println(msg);
	%>
	<br>
	<%-- 출력 전담 tag : expression tag--%>
	<%= msg %>-<%= getMsg() %>

</body>
</html>





