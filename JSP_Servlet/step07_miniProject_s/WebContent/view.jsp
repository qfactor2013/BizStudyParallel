<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR" import="model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	CustomerVo cvo = (CustomerVo)request.getAttribute("cvo");
	session.setAttribute("cvo", cvo);
--%>
	<!-- useBean request�� update.jsp���� ���޴� ������ ������ũ(�����̷���)���� ���� �̵��̶� �׷� -->
	<!--<jsp:useBean id="cvo" class="model.CustomerVo" scope="request"></jsp:useBean><!-->
	<%-- session.setAttribute("cvo", cvo); --%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head>
<title>ȸ������ ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>

<body>
<!-- HTML5�� center �±� ���� -->
<center>
	<h3>���� ȸ�� ���� ����</h3>
	<br>
	  <!-- view Form  -->
	 <form action="CustomerServlet" method="post">
	 	<!-- ���� ���� �����ϴ� update.jsp���� Ȱ��� ����Ÿ�� hidden tag�� ���� -->
	  
	  <table border="1" cellspacing="1" width="60%">
		  <tr>
			<td width=30%>����� ���̵�</td>
			<td width=70%>
			  <%--=cvo.getId()--%>
			  ${requestScope.cvo.id }
			  <input type="hidden" name="id" value="<%--=cvo.getId()--%>${requestScope.cvo.id }">
			</td>
		  </tr>
		  <tr>
			<td width="30%">��й�ȣ</td>
			<td width="70%">
			  <%--=cvo.getPassword()--%>
			  ${requestScope.cvo.password }	
			  <input type="hidden" name="password" value="<%--=cvo.getPassword()--%>${requestScope.cvo.password }">			
			</td>
		  </tr>
		  <tr>
			<td width="30%">�̸�</td>
			<td width="70%">
			  <%--=cvo.getName()--%>
			  ${requestScope.cvo.name }
			  <input type="hidden" name="name" value="<%--=cvo.getName()--%>${requestScope.cvo.name }">
			</td>
		  </tr>
		  <tr>
			<td width="30%">�̸��� �ּ�</td>
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
