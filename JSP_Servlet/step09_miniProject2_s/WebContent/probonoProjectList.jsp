<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String url = application.getContextPath() + "/"; %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>모든 Probono Project list 화면</title>
</head>
<body>
<br><br><br>
<center>
<h3>재능 기부 프로젝트 list</h3>
<hr><p>

<table border="1">
	<tr>
		<th>프로젝트 id</th><th>프로젝트명</th><th>재능기부자 id</th>
		<th>재능 수혜자  id</th><th>재능기부 내용</th>
	</tr>
	
	<!-- ???
		1. 모든 재능 기부 프로젝트 list 출력하기
		2. 재능 기부자 id 클릭하면 상세 보기 화면으로 이동
		3. 재능 수혜자 id 클릭하면 미완성 로직이기 때문에 blank 화면 
	 -->
	<c:choose>
		<c:when test="${not empty requestScope.probonoProjectAll 
						|| fn:length(requestScope.probonoProjectAll) == 0 }">
			<c:forEach items="${requestScope.probonoProjectAll }" var="data">			
			<tr>
				<td>${data.probonoProjectId}</td>
				<td>${data.probonoProjectName}</td>
				<td><a href="probono?command=probonoProjectDetail&probonoId=${data.probonoId}">
				${data.activistId}</a></td>
				<td><a href="probono?command=probonoProjectDetail&probonoProjectId=${data.probonoId}">
				${data.receiveId}</a></td>
				<td>${data.projectContent}</td>
			</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
	
		</c:otherwise>
	</c:choose>
	
</table>
<br><br><br>
<font color="blue">재능 기부자 id 및 재능 수혜자 id를 클릭하면 상세 정보 확인이 가능합니다</font>

</center>
</body>
</html>