<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>프로젝트 상세보기</title>
</head>
<body>
	<h2>프로젝트 상세보기</h2>
	<br><hr><br>
	
	<table border="1">
		<tr>
			<th>프로젝트 ID</th>
			<th>프로젝트 이름</th>
			<th>프로젝트 설명</th>
		</tr>
		<c:choose>
		<c:when test="${not empty requestScope.probonoProject || fn:length(requestScope.probonoProject) != 0 }">
		<tr>
			<td>${requestScope.probonoProject.probonoId }</td>
			<td>${requestScope.probonoProject.probonoName }</td>
			<td>${requestScope.probonoProject.probonoPurpose }</td>
		</tr>
		</c:when>
		<c:otherwise>
			정보가 없습니다.
		</c:otherwise>
		</c:choose>
	</table>
	
</body>
</html>