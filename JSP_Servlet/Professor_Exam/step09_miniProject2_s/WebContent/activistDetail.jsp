<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<% String url = application.getContextPath() + "/"; %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� ����� �� ���� ȭ��</title>
</head>
<body>
<br><br><br>
<center>

${requestScope.successMsg}

<h3>��� �����</h3>
<hr><p>

<!-- ???
	EL tag�� ��� ���� �ϼ��ϱ�
 -->
<table border="1">
	<tr>
		<th>����� id</th><th>����ڸ�</th><th>�����о�</th>
	</tr>
 	<tr>



 	</tr>
</table>

<br><br><br>
<a href="probono?command=activistUpdateReq&activistId=${activist.id}">�����ϱ�</a>

<a href="probono?command=activistDelete&activistId=${activist.id}">Ż���ϱ�</a>

&nbsp;&nbsp;&nbsp;<a href="<%=url%>index.html">���� ȭ�� �̵�</a>

</center>
</body>
</html>