<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR" import="model.*"%>

<%--
	CustomerVo cvo = (CustomerVo)request.getAttribute("cvo");
	session.setAttribute("cvo", cvo);
--%>
	<jsp:useBean id="cvo" class="model.CustomerVo" scope="request"></jsp:useBean>
	<% session.setAttribute("cvo", cvo); %>
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
			  <%=cvo.getId()%>
			  <input type="hidden" name="id" value="<%=cvo.getId()%>">
			</td>
		  </tr>
		  <tr>
			<td width="30%">��й�ȣ</td>
			<td width="70%">
			  <%=cvo.getPassword()%>	
			  <input type="hidden" name="password" value="<%=cvo.getPassword()%>">			
			</td>
		  </tr>
		  <tr>
			<td width="30%">�̸�</td>
			<td width="70%">
			  <%=cvo.getName()%>
			  <input type="hidden" name="name" value="<%=cvo.getName()%>">
			</td>
		  </tr>
		  <tr>
			<td width="30%">�̸��� �ּ�</td>
			<td width="70%">
			  <%=cvo.getEmail()%>
			  <input type="hidden" name="email" value="<%=cvo.getEmail()%>">
			</td>
		  </tr>		  
	  </table>	
	  <br><br>	  

		<input type="button" value="update"	onclick="location.href='update.jsp'">&nbsp;
		<input type="submit" value="allView">
		<input type="hidden" name="command" value="allView">
	 </form>
</center>	  


</body>
</html>
