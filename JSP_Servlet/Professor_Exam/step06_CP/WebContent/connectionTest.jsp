<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="util.ConnectionTest" %>   
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>connectionTest.jsp</title>
</head>
<body>
	<h2>이 jsp 실행시 DB접속 객체 요청 후 DB접속 확인 jsp</h2>
	
	단, 요청수 만큼 Connection 객체 생성이 아닌 server의 승인 및 관리하는 CP 기능 활용<br>
	<%
		//Connection 객체 요청 및 획득
		//주소값 출력 
		//db의 정보 사용했다 가정
		//자원 반환
		java.sql.Connection con = ConnectionTest.getConnection();
		out.println(con);
	%>

</body>
</html>









