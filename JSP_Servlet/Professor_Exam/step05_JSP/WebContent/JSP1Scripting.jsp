<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 
page ������
1. jsp scripting tag
2. �뵵 : client���� ����� ���伳��
3. servlet ������ �ڵ� : response.setContentType("text/html; charset=EUC-KR");
 -->  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP1Scripting.jsp</title>
</head>
<body>
	<%-- jsp ���� �ּ� --%>
	
	<%-- ��� ������ ��� �޼ҵ� ���� --%>
	<%!  //������
		String msg = "�� ��� ����";
		String getMsg(){
			return msg;
		}
	%>

	<%-- doGet/doPost/service() �� ������ ���� ���� tag, scriptlet tag  --%>
	<%
		out.println(msg);
	%>
	<br>
	<%-- ��� ���� tag : expression tag--%>
	<%= msg %>-<%= getMsg() %>

</body>
</html>





