<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP4_Action</title>
</head>
<body>

	<h2>jsp action tag �н�</h2>
	
	1. �� �����̳ʵ���� ������ ���ؼ� jsp ���� ������ tag���ַθ�
	�� java �ڵ�� �ּ�ȭ�� ���� ���� ���ε�� �Ļ��� tag
	
	2. ��� : ��ü �ڵ�����, web query ������ set XXX �޼ҵ� �ڵ� ȣ��,
				get XXX�� �ڵ� ȣ���ؼ� ���, page �̵��� tag
	
	<br><hr><br>
	1. ��ü ���� tag : useBean tag<br>
	<jsp:useBean id="p" class="model.domain.Person" scope="request"/>
	<!--  useBean�� ����ϸ� �ش� Ŭ������ ��ü�� �����ϰ� �ȴ�. Ǯ��Ű�������� �������-->
	<!--  ���� ������������ ���� ���ǰ� �������� ��ü�� -->
	<!--  model.domain.Person p = new model.domain.Person(); �� �����ϴ�.-->
	<!-- scope�� �߰��ϸ� request.setAttribute("p", p)�� �ѰͰ� �����ϴ�. -->
	
	2. client�� ������ ������(web query string, key = value&&key2=value2)�� 
	�� ��ü�� �����ϱ�(setXXX()) <br>
	<!-- jspAction.html : name/age �Է� ������ form --><br>
	<jsp:setProperty property="name" name="p"/><!-- set�޼ҵ� ��� -->
	<jsp:setProperty property="age" name="p"/>
	<%-- ������ �ڹ��ڵ�  
			p.setName(request.getParameter("name"));
			p.setAge(request.getParameter("age"));
	--%>
	
	<%-- forward ������� page �̵� --%>
	<jsp:forward page="JSP4_View.jsp"></jsp:forward>
	<%-- request.getRequestDispatcher("JSP4View.jsp").forward(request,response); --%>
	
</body>
</html>