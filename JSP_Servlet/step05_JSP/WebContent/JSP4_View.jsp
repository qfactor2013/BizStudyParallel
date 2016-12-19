<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP4_View.jsp</title>
</head>
<body>

	<h2>JSP4_Action.jsp 에서 생성 및 저장한 데이터 출력하기</h2>
	<%-- 요청 객체로 부터 Person 객체 획득 --%>
	
	<jsp:useBean id="p" class="model.domain.Person" scope="request"></jsp:useBean>
	<%-- model.domain.Person p = (model.domain.Person)request.getAttribute("p"); --%>
	<br>

	3. client가 전송한 데이터값을 보유한 객체의 멤버 변수들 값 획득 및 출력(getXXX()) <br>
		
	<jsp:getProperty property="name" name="p"/> 
	<!-- get메소드 대용 -->
	<%-- 동일한 자바코드
		p.getName(); --%>
</body>
</html>