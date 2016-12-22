<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP4Action.jsp</title>
</head>
<body>
	<h2>jsp action tag 학습</h2>
	1. 웹디자이너들과의 협업을 위해서 jsp에는 가급적 tag위주로만 
	즉 java 코드는 최소화로 개발 권장 마인드로 파생된 tag<br>
	2. 기능 : 객체 자동 생성, web query string값으로 setXxx메소드 자동 호출, 
		getXxx를 자동 호출해서 출력, page이동도 tag<br>
	
	
	<br><hr><br>
	
	1. 객체 생성 tag : useBean tag<br>
	<jsp:useBean id="p" class="model.domain.Person" scope="request"/>
	<%-- scope="page"
	 	 생성시킨 Person 객체를 현 JSP4Action.jsp에서만 사용되고 버려지는 객체 의미
	 	 
	 	 동일한 자바 코드
	 	 model.domain.Person p = new model.domain.Person();
	 	 request.setAttribute("p", p);
	  --%>
	
	2. client가 전송한 데이터(web query string, key=value&key2=value2)를 
		이 객체에 저장하기(setXxx())<br>
	<!-- jspAction.html : name/age입력 가능한 form -->
	<jsp:setProperty property="name" name="p"/>
	<jsp:setProperty property="age" name="p"/>
	<%-- 동일한 자바 코드 
		p.setName(request.getParameter("name"));
		p.setAge(request.getParameter("age"));
	 --%>
	
	<%-- forward 방식으로 page이동 --%>
	<jsp:forward page="JSP4View.jsp" />
	<%-- 동일한 자바 코드 
		request.getRequestDispatcher("JSP4View.jsp").forward(request, response);
	--%>

</body>
</html>





