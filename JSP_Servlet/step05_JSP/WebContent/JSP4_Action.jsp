<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP4_Action</title>
</head>
<body>

	<h2>jsp action tag 학습</h2>
	
	1. 웹 디자이너들과의 협업을 위해서 jsp 에는 가급적 tag위주로만
	즉 java 코드는 최소화로 개발 권장 마인드로 파생된 tag
	
	2. 기능 : 객체 자동생성, web query 값으로 set XXX 메소드 자동 호출,
				get XXX를 자동 호출해서 출력, page 이동도 tag
	
	<br><hr><br>
	1. 객체 생성 tag : useBean tag<br>
	<jsp:useBean id="p" class="model.domain.Person" scope="request"/>
	<!--  useBean을 사용하면 해당 클래스의 객체를 생성하게 된다. 풀패키지명으로 경로지정-->
	<!--  현재 페이지에서만 생성 사용되고 버려지는 객체임 -->
	<!--  model.domain.Person p = new model.domain.Person(); 과 동일하다.-->
	<!-- scope를 추가하면 request.setAttribute("p", p)를 한것과 동일하다. -->
	
	2. client가 전송한 데이터(web query string, key = value&&key2=value2)를 
	이 객체에 저장하기(setXXX()) <br>
	<!-- jspAction.html : name/age 입력 가능한 form --><br>
	<jsp:setProperty property="name" name="p"/><!-- set메소드 대용 -->
	<jsp:setProperty property="age" name="p"/>
	<%-- 동일한 자바코드  
			p.setName(request.getParameter("name"));
			p.setAge(request.getParameter("age"));
	--%>
	
	<%-- forward 방식으로 page 이동 --%>
	<jsp:forward page="JSP4_View.jsp"></jsp:forward>
	<%-- request.getRequestDispatcher("JSP4View.jsp").forward(request,response); --%>
	
</body>
</html>