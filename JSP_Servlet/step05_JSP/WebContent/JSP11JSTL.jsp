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
	
	
	1. ArrayList에 저장된 데이터를 jstl의 forEach tag로 라인당 출력하기 <br>
	<table border="1">
		<c:forEach items="${requestScope.sv }" var="data">
		<tr>
			<td>${data }</td>
		</tr>
		</c:forEach>
	</table>
	ArrayList에는 Person 객체, Person 객체는 String 타입의 이름과, int 타입의 age가 있다.<br>
	ArrayList : session 에서 list<br>
	Person : ArrayList에서 index로 찾음 <br>
	이름과 나이 : Person에서 name과 age로 찾음
	<%
		ArrayList<Person> list = new ArrayList<Person>();
		list.add(new Person("유재석", 30));
		list.add(new Person("송지효", 20));
		list.add(new Person("김종국", 40));
		session.setAttribute("list", list);
	%>
	
	<%-- items = "${sessionScope.list}" var = "data"
		session으로 부터 ArrayList 를 반환해서 ArrayList 보유한 Person 객체를 data 변수에 대입
		${data.name} : Person의 getName() 호출 Person 클래스에는 getName() & getAge() 구현 필수 --%>
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
		map.put("p1", new Person("지석진", 30));
		map.put("p2", new Person("하하", 50));
		map.put("p3", new Person("뿡빵이", 20));
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
	?? p3에 해당하는 사람의 이름과 나이값만 출력, 반드시 forEach 사용 <br>
	
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