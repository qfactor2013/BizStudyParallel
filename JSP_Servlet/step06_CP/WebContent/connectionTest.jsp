<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="util.ConnectionTest" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>connectionTest.jsp</title>
</head>
<body>
		<h2> �� jsp ����� DB���� ��ü ��û �� DB ���� Ȯ��</h2>
		
		��, ��û �� ��ŭ Connection ��ü ������ �ƴ� server�� ���� �� �����ϰ� CP��� Ȱ��<br>
		<%
			//Connection ��ü ��û �� ȹ��
			//�ּҰ� ���
			//db�� ���� ����ߴ� ����
			//�ڿ� ��ȯ
			
			Connection conn = ConnectionTest.getConnection();
			out.println(conn);
		%>
</body>
</html>