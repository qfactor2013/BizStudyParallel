<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" session="false"%> 
    <!-- session false�� �ϸ� �ڵ������� �ȵ� (default true)-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP7EL.jsp</title>
</head>
<body>
		<h2>EL tag ���ο� ��� ������ ���� ��ü�� �н�</h2>
		<font color="red">jsp���� ������ �ڹ� �ڵ� ������ �� ����</font>
		<br><hr><br>
		1. requestScope/sessionScope...<br>
		2. param<br>
		3. cookie : ����� ���ؼ��� �ڵ�� ���� �� Ȱ��, �� EL tag ������ ����<br>
		<br><hr><br>
		
		<a href="JSP7_2EL.jsp?id=master&m=data1&m=data2">page�̵�</a>
		<br>
		<%-- paramValues test �ڵ� ����� : String[] getParameterValues --%>
		
		
		
		
		<% // �����ڹ��ڵ�� ��Ű ��ü ���� -> client pc�� ����
			//Servlet �ڵ�� servlet api import �ʼ�
			//jsp�� servlet api + java.lang import ���� ����
			Cookie c = new Cookie("msg", "data");
			c.setMaxAge(60*60*24);
			response.addCookie(c);
		%>
		
</body>
</html>