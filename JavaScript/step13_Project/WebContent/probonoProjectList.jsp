<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<% String url = application.getContextPath() + "/"; %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� Probono Project list ȭ��</title>
</head>
<body>
<br><br><br>
<center>
<h3>��� ��� ������Ʈ list</h3>
<hr><p>

<table border="1">
	<tr>
		<th>������Ʈ id</th><th>������Ʈ��</th><th>��ɱ���� id</th>
		<th>��� ������  id</th><th>��ɱ�� ����</th>
	</tr>
	
	<!-- ???
		1. ��� ��� ��� ������Ʈ list ����ϱ�
		2. ��� ����� id Ŭ���ϸ� �� ���� ȭ������ �̵�
		3. ��� ������ id Ŭ���ϸ� �̿ϼ� �����̱� ������ blank ȭ�� 
	 -->
	<c:forEach items="${requestScope.probonoProjectAll}" var="dataAll"> 
 		<tr>
 			<td>${dataAll.probonoProjectId}</td>
 			<td>${dataAll.probonoProjectName}</td>
 			<td><a href='<%=url%>probono?command=activist&activistId=${dataAll.activistId}'>${dataAll.activistId}</a></td>
 			<td><a href='<%=url%>probono?command=recipient&recipientId=${dataAll.receiveId}'>${dataAll.receiveId}</a></td>
 			<td>${dataAll.projectContent}</td>
 		</tr>
 	</c:forEach> 
</table>

<br><br><br>
<font color="blue">��� ����� id �� ��� ������ id�� Ŭ���ϸ� �� ���� Ȯ���� �����մϴ�</font>

</center>
</body>
</html>