<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!--  �ܺ� library ����� ���� ���� : tag library ������-->
<%-- <%@ taglib prefix="��Ī"  uri="����ϰ����ϴ� tag ���а�" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	2. ȯ����� : web server���� �⺻���� �������� ����, ���� ����<br>
		- tomcat8/webapps/examples/WEB-INF/lib ���� ����<br>
		<font color="red">jsp���� ����� ���� ���� �ʼ�</font><br>
		
	3. sun(jsp ���� ���� ������) : jsp scripting tag/jsp action<br>
	<font color="red">4. JSTL �� EL�� �Բ� ȥ���ؼ� ����� �ַ� ��</font>		
	
	<br><hr><br>
	'a' == 'a' &nbsp;&nbsp;&nbsp;   ${'a' == 'a'}
	<br><hr><br>
	1. ���ǿ� ���� ���<br>
	<c:if test="${'a' == 'a'}">
		1-1. ����ǳ�?
	</c:if>
	<br>
	<c:if test="${'a' != 'a'}">
		1-2. ����ǳ�?
	</c:if>
	<br>
	 <c:if test="${3 > 2}">
		1-3. ����ǳ�?
	</c:if>
	<br><hr><br>
	
	2. ���� ���ǿ� ���� ��� : if~else if~else�� ��<br>
	<c:choose>
		<c:when test="${1>2}">
			2-1. ù��° ������ true�� ��� ����
		</c:when>
		<c:when test="${3<2}">
			2-2. �ι�° ������ true�� ��� ����
		</c:when>
		<c:otherwise>
			2-3. ��� ���ǿ� �ش���� ������ ���� 
		</c:otherwise>
	</c:choose>
	
	<br><hr><br>
	3. �ڹ� ��ü�� ���밪 ��<br>
	<% 
		String msg = "data";
		request.setAttribute("m", msg);	
	%>
	<%-- ? �ݵ�� data�� ���ؼ� 3-1�� ��µǰ� ���ǽ� �ϼ��ϱ� --%>
	<c:choose>
		<c:when test="${requestScope.m == 'data'}">
			3-1. ù��° ������ true�� ��� ����
		</c:when>
		<c:when test="${requestScope.m != 'data'}">
			3-2. �ι�° ������ true�� ��� ����
		</c:when>
		<c:otherwise>
			3-3. ��� ���ǿ� �ش���� ������ ���� 
		</c:otherwise>
	</c:choose>
	
</body>
</html>









