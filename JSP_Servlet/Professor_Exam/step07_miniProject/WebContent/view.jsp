<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"
				   import="model.CustomerVo"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원정보 보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>

<%
	System.out.println(1);
%>
-------------------------------------------------<br>

<center>
	<h3>개인 회원 정보 보기</h3>
	<br>
	  <!-- view Form  -->
	 <form action="CustomerServlet" method="post">
	 	<!-- 개인 정보 수정하는 update.jsp에서 활용될 데이타를 hidden tag로 설정 -->
	  
	  <table border="1" cellspacing="1" width="60%">
		  <tr>
			<td width=30%>사용자 아이디</td>
			<td width=70%>
			${sessionScope.cvo.id}
			</td>
		  </tr>
		  <tr>
			<td width="30%">비밀번호</td>
			<td width="70%">
			  ${sessionScope.cvo.password}		
			</td>
		  </tr>
		  <tr>
			<td width="30%">이름</td>
			<td width="70%">
			  ${sessionScope.cvo.name}
			</td>
		  </tr>
		  <tr>
			<td width="30%">이메일 주소</td>
			<td width="70%">
			  ${sessionScope.cvo.email}
			</td>
		  </tr>		  
	  </table>	
	  <br><br>	  
		<%-- 저장 후 단순 확인 화면
			버튼 : 수정을 하고자 하는 버튼
					수정 버튼 클릭시 이미 존재하는데이터를 수정 가능한 화면으로 유지하면서 이동
					화면 이동 : 버튼 클릭(request에 데이터 저장해도 소용 없음)
					데이터 유지 방법 : 세션에 저장해서 이동
		 --%>
		<input type="button" value="update"	Onclick="location.href='update.jsp'">&nbsp;
		
		
		<input type="submit" value="allView">
		<input type="hidden" name="command" value="allView">
	 </form>
</center>	  


</body>
</html>
