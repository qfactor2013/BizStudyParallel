<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP10JSTL</title>
</head>
<body>
	<h3>jstl�� �ݺ� tag</h3>
	<br>
		1. forEach tag - �ݺ� tag <br>
		2. begin �Ӽ� - �ݺ� ���� index <br>
		3. end �Ӽ� - �ݺ� �� ���� <br>
		4. step �Ӽ� - ����ġ <br>
		5. var �Ӽ�- �� �ݺ� tag ���ο��� ���� ���� ����, �ݵ�� el tag�� ���<br>
		6. varStatus - �ݺ� ���� �ľ� ������ �Ӽ�<br>
			6-1 count - ���� 
				index - �� �ݺ�����(step����)
	<br><hr><br>
	<c:forEach begin="1" end="5" step="2" var="data">
	<!-- ���۰��� 1�̰� ���� 5�̸� ������ 2�� data �μ��� �޾� �ݺ� -->
		${data }
	</c:forEach>
	<br><hr><br>
	<c:forEach begin="1" end="10" step="1" var="data" varStatus="kosa">
		${data } - ${kosa.count } - ${kosa.index }<br>
	</c:forEach>
	<br><hr><br>
	<c:forEach begin="1" end="10" step="2" var="data" varStatus="kosa">
		${data } - ${kosa.count } - ${kosa.index }<br>
	</c:forEach>
	<br><hr><br>
	<c:forEach begin="4" end="10" step="2" var="data" varStatus="kosa">
		${data } - ${kosa.count } - ${kosa.index }<br>
	</c:forEach>
	
	<br><hr size="3" color="blue"><br>
	<h4>�ڹ� ��ü�� forEach tag�� �����ϱ�</h4>
	<%
		String [] v = {"a", "b", "c", "d", "e"};
		pageContext.setAttribute("datas", v);
	%>
	<c:forEach var="vData" items="${pageScope.datas }">
	<!-- java foreach�� ����. ���տ� �ִ� ������ �����͸� vData�� Ī�ؼ� ��� -->
		${vData }
	</c:forEach>
	
	
</body>
</html>