<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR" import="model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	CustomerVo cvo = (CustomerVo)request.getAttribute("cvo");
	session.setAttribute("cvo", cvo);
--%>
	<!-- useBean request를 update.jsp에서 못받는 이유는 강제링크(리다이렉팅)으로 인한 이동이라 그럼 -->
	<!--<jsp:useBean id="cvo" class="model.CustomerVo" scope="request"></jsp:useBean><!-->
	<%-- session.setAttribute("cvo", cvo); --%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head>
<title>회원정보 보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>

<body>
<!-- HTML5는 center 태그 비추 -->
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
			  <%--=cvo.getId()--%>
			  ${requestScope.cvo.id }
			  <input type="hidden" name="id" value="<%--=cvo.getId()--%>${requestScope.cvo.id }">
			</td>
		  </tr>
		  <tr>
			<td width="30%">비밀번호</td>
			<td width="70%">
			  <%--=cvo.getPassword()--%>
			  ${requestScope.cvo.password }	
			  <input type="hidden" name="password" value="<%--=cvo.getPassword()--%>${requestScope.cvo.password }">			
			</td>
		  </tr>
		  <tr>
			<td width="30%">이름</td>
			<td width="70%">
			  <%--=cvo.getName()--%>
			  ${requestScope.cvo.name }
			  <input type="hidden" name="name" value="<%--=cvo.getName()--%>${requestScope.cvo.name }">
			</td>
		  </tr>
		  <tr>
			<td width="30%">이메일 주소</td>
			<td width="70%">
			  <%--=cvo.getEmail()--%>
			  ${requestScope.cvo.email }
			  <input type="hidden" name="email" value="<%--=cvo.getEmail()--%>${requestScope.cvo.email }">
			</td>
		  </tr>		  
	  </table>	
	  <br><br>	  
	  <!--<c:set var="username" value="user123" scope="request"/><!-->
	  	<c:set scope="session" value="${requestScope.cvo }" var = "session"></c:set>
		<input type="button" value="update"	onclick="location.href='update.jsp'">&nbsp;
		<input type="submit" value="allView">
		<input type="hidden" name="command" value="allView">
	 </form>
</center>	  


</body>
</html>
