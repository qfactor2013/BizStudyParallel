<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL ��ü������ �����ϴ� �Լ� ���̺귯�� -->
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP12empty.jsp</title>
</head>
<body>
	<h2>EL tag�� null�� ��� �������� blank ���</h2>
	<%
		String msg = "";
		String msg2 = null;
		request.setAttribute("m1", msg);
		request.setAttribute("m2", msg2);
		
		String[] s = new String[2];
		request.setAttribute("m3", s);
		
		ArrayList<String> a = new ArrayList<>();
		request.setAttribute("m4", a);
	%>
	
	1. ${m1 }<br>	
	2. ${m2 }<br>
	3. ${m3 }<br>
	4. ${m4 }<br>
	5. <%= request.getAttribute("m2") %><br>
	
	<br><hr><br>
	jstl�� ������ ���� ��ȯ�ϴ� �Լ��� ������ ���� ���� Ȯ��<br>
	<c:if test="${fn:length(m4) == 0}">1. �����Ͱ� ������ ��µȴ�. </c:if>
	
	<br><hr><br>
	m4��� ��Ī���� ����� ��ü�� �����Ͱ� ���� �ʴ�(���� ���)�� ����<br>
	<c:if test="${ not empty m4}">2. �����Ͱ� ������ ��µȴ�. </c:if>
	
	<br><hr><br>
	m4��� ��Ī���� ����� ��ü�� �����Ͱ� ������ ���� <br>
	<c:if test="${empty m4}">3. �����Ͱ� ������ ��µȴ�. </c:if>
	
	<br><hr><br>
	<c:if test="${empty m2}">
	1.  String ������ null �� ��츸 ����ϴ� �޼���
	</c:if>
	
	<br><hr><br>
	<c:if test="${not empty m2}">
	2. String ������ null �� ��츸 ����ϴ� �޼���
	</c:if>
</body>
</html>