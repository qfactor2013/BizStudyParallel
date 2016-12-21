<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="model.*" %>

<html>
<head>
<title>개인 정보 수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>

<br>
<center>
<h3>개인 정보 수정하기</h3>
<br>

<%-- CustomerServlet : Session 개인 정보 저장? --%>

<form action="CustomerServlet" method="post">
	  <!-- update Form  -->	
	  <table border="1" cellspacing="1" width="60%">
		  <tr>
			<td width=30%>사용자 아이디</td>
			<td width=70%>	
				${sessionScope.cvo.id}			
			</td>
		  </tr>
		  <tr>
			<td width="30%">이름</td>
			<td width="70%">	
				${sessionScope.cvo.name}
			</td>
		  </tr>
		  <tr>
			<td width="30%">비밀번호 수정</td>
			<td width="70%">
				<input type="password" name="password" value="${sessionScope.cvo.password}">
			</td>
		  </tr>			  
		
		  <tr>
		
			<td width="30%">이메일 주소</td>
			<td width="70%">
				<input type="type" name="email" value="${sessionScope.cvo.email}">
			</td>		  
		  <tr>				  
	</table>  
	<p/>

	<%-- hidden tag완성 하세요
			 value값으로 설정해야 하는 값은? 
	--%>
	<input type="hidden" value="update"  name="command">

	<input type="submit" value="수정" > &nbsp;
	<input type="reset" value="취소">&nbsp;
	<input type="button" value="모두보기" Onclick="location.href='CustomerServlet?command=allView'">
</form>

</body>
</html>





