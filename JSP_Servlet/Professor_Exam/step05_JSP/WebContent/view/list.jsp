<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.util.ArrayList, model.domain.Person" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>view/list.jsp</title>
</head>
<body>
	친구 정보 출력
	<br><hr><br>
	<%
		ArrayList<Person> all 
		= (ArrayList<Person>)request.getAttribute("datas");	
		Person p = null;
	%>	
	<table border="1" width="50%">
		<tr><th>이름</th><th>나이</th></tr>
		<%
			for(int i=0; i < all.size(); i++){		
				p = all.get(i);
		%>
				<tr><td><%=p.getName()%></td><td><%=p.getAge()%></td></tr>
		<%		
			}	
		%>	
	</table>
</body>
</html>







