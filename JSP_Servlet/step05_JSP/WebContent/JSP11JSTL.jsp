<%@page import="java.util.HashMap"%>
<%@page import="model.domain.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP11JSTL.jsp</title>
</head>
<body>
	<h2></h2>
	
	<%
		ArrayList<String> sv = new ArrayList<>();
		sv.add("a");
		sv.add("b");
		sv.add("c");
		sv.add("d");
		request.setAttribute("sv", sv);
	%>
	
	
	1. ArrayList�� ����� �����͸� jstl�� forEach tag�� ���δ� ����ϱ� <br>
	<table border="1">
		<c:forEach items="${requestScope.sv }" var="data">
		<tr>
			<td>${data }</td>
		</tr>
		</c:forEach>
	</table>
	ArrayList���� Person ��ü, Person ��ü�� String Ÿ���� �̸���, int Ÿ���� age�� �ִ�.<br>
	ArrayList : session ���� list<br>
	Person : ArrayList���� index�� ã�� <br>
	�̸��� ���� : Person���� name�� age�� ã��
	<%
		ArrayList<Person> list = new ArrayList<Person>();
		list.add(new Person("���缮", 30));
		list.add(new Person("����ȿ", 20));
		list.add(new Person("������", 40));
		session.setAttribute("list", list);
	%>
	
	<%-- items = "${sessionScope.list}" var = "data"
		session���� ���� ArrayList �� ��ȯ�ؼ� ArrayList ������ Person ��ü�� data ������ ����
		${data.name} : Person�� getName() ȣ�� Person Ŭ�������� getName() & getAge() ���� �ʼ� --%>
	<table border ="1">
		<c:forEach items="${sessionScope.list }" var="data">
		<tr>
			<td>${data.name }</td>
			<td>${data.age }</td>
		</tr>
		</c:forEach>
	</table>
	
	<br /><hr /><br />
	<%
		HashMap<String, Person> map = new HashMap<>();
		map.put("p1", new Person("������", 30));
		map.put("p2", new Person("����", 50));
		map.put("p3", new Person("�׻���", 20));
		request.setAttribute("map", map);
	%>
	<table border="1">
		<c:forEach items="${requestScope.map }" var="data">
		<tr>
			<td>${data.key }</td>
			<td>${data.value }</td>
			<td>${data.value.name }</td>
			<td>${data.value.age }</td>
		</tr>
		</c:forEach>
	</table>
	<br /><hr /><br />
	?? p3�� �ش��ϴ� ����� �̸��� ���̰��� ���, �ݵ�� forEach ��� <br>
	
	<table border="1">
		<c:forEach items="${requestScope.map }" var="data">
		<c:if test="${data.key == 'p3'}">
		<tr>
			<td>${data.value.name }</td>
			<td>${data.value.age }</td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	
</body>
</html>