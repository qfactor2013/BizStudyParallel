<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br><br><br>
<center>

<h3>��� ����� ���� �����ϱ� - ��� �о� ����</h3>
<hr><p>

<form action="probono?command=activistUpdate" method="post">
<table border="1">
	<thead>
		<tr>
			<th>����� id</th><th>����ڸ�</th><th>��й�ȣ</th><th>�����о�</th>
		</tr>
 	<tr>
 		<td><input type="text" name="activistId"  value="${activist.id}" readonly></td>
 		<td>${activist.name}</td>
 		<td>${activist.password}</td>
 		<td><input type="text" name="major" value="${activist.major}"></td>
 	</tr>
 	
 	<tr>
 		<td colspan="4">
 			<input type="submit" value="����">
 			&nbsp;&nbsp;&nbsp;
 			<input type="reset" value="���">
 		</td>
 	</tr>
</table>
</form>

</center>
</body>
</html>