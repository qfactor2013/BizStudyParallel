<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- �ܺ� ���̺귯�� ����� ���� ���� : tag library ������ -->
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 		��Ī				�±� api �ּҰ�				 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP8JSTL.jsp</title>
</head>
<body>
	<h2>JSP Standard Tag Library</h2>
	<br>
	1. jsp���� �ڹ� �ڵ带 �ּ�ȭ �ϰ��� �Ļ��� ���� ǥ�� tag<br>
	2. ȯ�漳�� : web server ���� �⺻���� �������� ���� ���� ���� <br>
		-tomcat8/webapps/ example/WEB-INF/lib���� ����<br>
		<font color="red">jsp���� ����� ���� ���� �ʼ�</font><br>
	3. sun(jsp ���� ���� ������) : jsp scription tag/jsp action<br>
	
	<font color="red"> 4. JSTL�� EL�� �Բ� ȥ���ؼ� ����� �ַ� ��</font><br>
	
	<br><hr><br>
	'a' == 'a' &nbsp;&nbsp;&nbsp; ${'a'=='a' }
	<br><hr><br>
	1. ���ǿ� ���� ���<br>
	<c:if test="${'a'=='a' }" >
		���
	</c:if><br>
	<c:if test="${'a'!='a' }" >
		���2
	</c:if><br>
	<c:if test="${3>2 }" >
		���3
	</c:if><br>
	2. ���� ���ǿ� ���� ��� (if~ else if ~ else �� ��)<br>
	<c:choose>
		<c:when test="${1>2 }"> ����</c:when>
		<c:when test="${3<2 }"> ����2</c:when>
		<c:otherwise>����ƴ�</c:otherwise>
	</c:choose>
	<br>
	
	<br><hr><br>
	3. �ڹ� ��ü�� ���밪 �� <br>
		<%--data�� ���ؼ� 3-1�� ��µǰ� ���ǽ� �ϼ��ϱ� --%>
		<% 
			String msg = "data";
			request.setAttribute("m", msg);
		%>
		<c:choose>
			<c:when test="${requestScope.m == 'data' }">����</c:when>
			<c:when test="${requestScope.m != 'data' }">����2</c:when>
			<c:otherwise>�ش����</c:otherwise>
		</c:choose>
	
	
</body>
</html>