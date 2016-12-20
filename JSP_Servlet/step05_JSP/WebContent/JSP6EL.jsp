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
	
	1. 일반 자바 객체를 list/map 등에 저장해서 EL로 출력해 보기<br>
	<%
		ArrayList<Person> list = new ArrayList<Person>();
		list.add(new Person("유재석", 30));
		list.add(new Person("송지효", 20));
		list.add(new Person("김종국", 40));
		session.setAttribute("list", list);
		
		HashMap<String, Person> map = new HashMap<>();
		map.put("p1", new Person("지석진", 30));
		map.put("p2", new Person("하하", 50));
		request.setAttribute("map", map);
	%>
	<%--EL tag로 송지효, 하하 데이터들 출력
		출력 구조 : 이름-나이 --%>
	
	${list[1].getName() } - ${list[1].getAge() } 
	<%-- ArrayList list = (ArrayList)session.getAttribute("list");
		 Person p = (Person)list.get(1);
		 out.println("p.getNAme() + "-" + p.getAge());
		  --%>
	${map.get("p2").getName() } - ${map.get("p2").getAge() }
	
</body>
</html>