<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP3Scripting</title>
</head>
<body>
	JSP Scripting tag Review<br>
	
	<br><hr><br>
	
	<%
		//문자열 배열에 데이터들을 저장해서 jdk 1.5부터 추가된 for, 단 출력은 table
		String[] values = {"가", "나", "다", "라", "마"};
	%>
	
	<table border = "2" bordercolor="blue" width="50%">
	<%-- table 내부에 데이터 출력되게 해주세요 --%>
		<% for(int i = 0; i < values.length; i++) {%>
		<td><%= values[i] %></td>
		<%} %>
	</table>
	
</body>
</html>