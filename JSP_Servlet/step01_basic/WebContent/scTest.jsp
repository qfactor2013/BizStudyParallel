<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>scTest.jsp</title>
</head>
<body>
	<h2>��� servlet�� jsp�� �����ϴ� �ڿ��� ������ �� �� �ִ� API �н�</h2>
	<br /><hr /><br />
	
	1. ServletContext<br>
	2. setAttribute() : ������ ���� <br>
	3. getAttribute() : ������ ȹ�� <br>
	<br /><hr /><br />
	
	jsp���� �����ϴ� ���� ��ü�� : session, request, response, out, application <br>
	<%= application.getAttribute("msg") %> - ${applicationScope.msg }
	
	<%-- ���̻� ������ �ʿ䰡 ���� �ڿ��� ��� --%>
	<%
		//��������
		application.removeAttribute("msg");
	%>
	
</body>
</html>