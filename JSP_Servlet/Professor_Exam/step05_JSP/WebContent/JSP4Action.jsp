<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP4Action.jsp</title>
</head>
<body>
	<h2>jsp action tag �н�</h2>
	1. �������̳ʵ���� ������ ���ؼ� jsp���� ������ tag���ַθ� 
	�� java �ڵ�� �ּ�ȭ�� ���� ���� ���ε�� �Ļ��� tag<br>
	2. ��� : ��ü �ڵ� ����, web query string������ setXxx�޼ҵ� �ڵ� ȣ��, 
		getXxx�� �ڵ� ȣ���ؼ� ���, page�̵��� tag<br>
	
	
	<br><hr><br>
	
	1. ��ü ���� tag : useBean tag<br>
	<jsp:useBean id="p" class="model.domain.Person" scope="request"/>
	<%-- scope="page"
	 	 ������Ų Person ��ü�� �� JSP4Action.jsp������ ���ǰ� �������� ��ü �ǹ�
	 	 
	 	 ������ �ڹ� �ڵ�
	 	 model.domain.Person p = new model.domain.Person();
	 	 request.setAttribute("p", p);
	  --%>
	
	2. client�� ������ ������(web query string, key=value&key2=value2)�� 
		�� ��ü�� �����ϱ�(setXxx())<br>
	<!-- jspAction.html : name/age�Է� ������ form -->
	<jsp:setProperty property="name" name="p"/>
	<jsp:setProperty property="age" name="p"/>
	<%-- ������ �ڹ� �ڵ� 
		p.setName(request.getParameter("name"));
		p.setAge(request.getParameter("age"));
	 --%>
	
	<%-- forward ������� page�̵� --%>
	<jsp:forward page="JSP4View.jsp" />
	<%-- ������ �ڹ� �ڵ� 
		request.getRequestDispatcher("JSP4View.jsp").forward(request, response);
	--%>

</body>
</html>





