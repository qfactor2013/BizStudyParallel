<%@page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList" isELIgnored="false"%>
<%-- isELIgnored="false"
	- EL tag �����Ұ���? false �ƴ϶�� �ǹ�
	- jsp�� �� �Ӽ��� ������ �Ǿ��ְ� false �� �⺻���̳�
	��쿡 ���� ���� ���� --%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP5EL.jsp</title>
</head>
<body>

	<h2> �ڹ��� ��ü�� �������� ���� �� ����ϴ� tag �н� : EL tag</h2>
	1. EL tag�� ��Ģ����, ������� �� ���� �� ���� ����<br>
	2. EL tag�� �ڹ��� ������ ���� �� ���<br>
	<br>
	<table border="1" bgcolor="yellow"  width="50%">
		<tr><td>2+3</td><td>${2+3}</td></tr>
		<tr><td>2*3</td><td>${2*3}</td></tr>
		<tr><td>2>3</td><td>${2>3}</td></tr>
		<tr><td>'a' == 'a'</td><td>${'a' == 'a'}</td></tr>
		<tr><td>'a' == 'b'</td><td>${'a' == 'b'}</td></tr>
	</table>
	
	<br><hr color="blue"><br>
	<%
		//ArrayList�� ������ EL�� �����ϱ� 
		ArrayList<String> d1 = new ArrayList<String>();
		d1.add("kosa");  //0��° ����� ������
		d1.add("���н�����"); //1	""
		d1.add("java");
		//��û ��ü�� ����
		request.setAttribute("d1", d1);		
	
	/* 	ArrayList<String> d2 = (ArrayList<String>)request.getAttribute("d1");	
		String s = d2.get(0);
		out.println(s);  */
	%>
	<%-- *Scope ������ EL tag����� �ڵ� ���� --%>
	${requestScope.d1[0]} - ${d1[0]}
	<br><hr><br>
	<%
		//HashMap : key�� value ���ε� ����
		HashMap<String, String> m = new HashMap<String, String>();
		m.put("a1", "������1");
		m.put("a2", "������2");
		m.put("a3", "������3");
		session.setAttribute("m", m);
	%>
	${sessionScope.m.a2}  - ${m.a2}
	
	<br><hr><br>
	<%
		String msg = "���ڿ�";
		request.setAttribute("data", msg);
	%>
	${requestScope.data} - ${data}
	
</body>
</html>










