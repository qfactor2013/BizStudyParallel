<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String url = application.getContextPath() + "/"; %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� Activist list ȭ��</title>
</head>
<body>
<br><br><br>
<center>
<h3>��� ����� list</h3>
<hr><p>

<table border="1">
	<thead>
		<tr>
			<th>����� id</th><th>����� �̸�</th><th>�ֿ� �о�</th>
		</tr>
	</thead>
	
	<%--???
	 	��� ����� ���� ���� : ����� id�� Ŭ���ϸ� "��� �����"�� ���� ������ ����Ǿ�� �� --%>
	<c:choose>
		<c:when test="${not empty requestScope.allActivist || fn:length(requestScope.allActivist) != 0 }">
			<c:forEach items="${requestScope.allActivist }" var="data">
			<tr>
				<td><a href="probono?activistId=${data.id }&command=activist" >${data.id }</a></td>
				<td>${data.name }</td>
				<td>${data.major }</td>
			</tr>
			</c:forEach>
		</c:when>
	</c:choose>
	
</table>

<br><br><br>
<font color="blue">��� ����� id�� Ŭ���ϸ� �� ���� Ȯ���� �����մϴ�</font>

</center>
</body>
</html>