<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% String url = application.getContextPath() + "/"; %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� ������ �� ���� ȭ��</title>
</head>
<body>
<br><br><br>
<center>

${requestScope.successMsg}

<h3>��� ������</h3>
<hr><p>

<!-- ???
	EL tag�� ��� ���� �ϼ��ϱ�
 -->
<table border="1">
	<tr>
		<th>������ id</th><th>�����ڸ�</th><th>��������о�</th>
	</tr>
	<c:choose>
		<c:when test="${not empty requestScope.receiver || fn:length(requestScope.receiver) != 0 }">
		 	<tr>
		 	<td>${requestScope.receiver.id }</td>
		 	<td>${requestScope.receiver.name }</td>
		 	<td>${requestScope.receiver.receiveContent }</td>
		 	</tr>
	 	</c:when>
	 	<c:otherwise>
	 		�ش� ������ �����ϴ�.
	 	</c:otherwise>
 	</c:choose>
</table>

<br><br><br>
<a href="probono?command=activistUpdateReq&activistId=${receiver.id}">�����ϱ�</a>

<a href="probono?command=activistDelete&activistId=${receiver.id}">Ż���ϱ�</a>

&nbsp;&nbsp;&nbsp;<a href="<%=url%>index.html">���� ȭ�� �̵�</a>

</center>
</body>
</html>