<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP7_2EL.jsp</title>
</head>
<body>
	<h2>JSP7EL.jsp에서 전송한 id값 획득 및 출력, 쿠키 정보 획득 및 출력</h2>
	<font color="red">jsp에는 가급적 자바 코드 배제가 주 목적, 사용 빈도 최고</font>
	<br><hr><br>
	
	
	1. request.getParameter("id")와 상동 - ${param.id}<br>
	2. Cookie[] getCookies()/getName()/getValue()와 상동 - ${cookie.msg.value}
	3. String[] getPrarameterValues()와 상동 
			- ${paramValues.m}-${paramValues.m[0]}-${paramValues.m[1]}



</body>
</html>