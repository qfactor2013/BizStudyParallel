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

	<%-- util.Info�� �ΰ��� �޼ҵ� ȣ�� �� ����� ���
		1. sum() ȣ���� ���
		2. sum(����) �� �Ű����� �����ϸ鼭 ȣ���ؼ� ��� 
		3. 1+2 �޼ҵ� ȣ���� ���� �ʼ� ���� : import �ʼ�  --%>
	 <% 
	 	Info i = new Info();
	 	out.println(i.sum());	 
	 %>
	 <br>	 
	 <%= i.sum(5) %>	

</body>
</html>






