<%@page import="java.util.HashMap"%>
<%@page import="model.domain.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP6EL.jsp</title>
</head>
<body>
	<h2>EL tag 익숙해지기</h2>
	
	1. 일반 자바 객체를 list/map등에 저장해서 EL로 출력해 보기<br>
	
	<%
		ArrayList<Person> list = new ArrayList<Person>();
		list.add(new Person("유재석", 30));
		list.add(new Person("송지호", 20));
		list.add(new Person("김종국", 40));
		session.setAttribute("list", list);
		
		HashMap<String, Person> map = new HashMap<String, Person>();
		map.put("p1", new Person("지석진", 30));
		map.put("p2", new Person("하하", 50));
		map.put("p3", new Person("이광수", 40));	
		request.setAttribute("map", map);
	%>
	
	${sessionScope.list[1].name} - ${sessionScope.list[1].age}<br>
	<%-- ArrayList list = (ArrayList)sesson.getAttribute("list"); 
			 Person p = (Person)list.get(1);
			 out.println(p.getName() + " - " + p.getAge());  --%>
	${requestScope.map.p2.name} - ${requestScope.map.p2.age}<br>
	<%-- HashMap map = (HashMap)request.getAttribute("map");
			  Person p2 = (Person)map.get("p2");
			  out.println(p2.getName() + " - " + p2.getAge());	 --%>
</body>
</html>
















