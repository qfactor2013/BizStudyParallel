<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP4View.jsp</title>
</head>
<body>
	<h2>JSP4Action.jsp���� ���� �� ������ ������ ����ϱ�</h2>
	<%-- ��û ��ü�� ���� Person��ü ȹ�� --%>
	<jsp:useBean id="p" class="model.domain.Person" scope="request"/>
	<%--
		model.domain.Person p = (model.domain.Person)request.getAttribute("p");
	 --%>
	
	<br>
	3. client�� ������ �����Ͱ��� ������ ��ü�� ��� �����鰪 ȹ�� �� ���(getXxx())
	<jsp:getProperty property="name" name="p"/>
	<%-- ������ �ڹ� �ڵ�
	   <%= p.getName() %>
	 --%>
	
</body>
</html>