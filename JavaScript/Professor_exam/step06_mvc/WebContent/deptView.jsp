<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>deptView.jsp</title>

<style>
div.container {
    width: 90%;
   	margin-left: 5%;
    margin-right: 5%;
    margin-top: 5%;
}

header, footer {
    padding: 1em;
    color: white;
    background-color: #631414;
    clear: left;
    text-align: center;
}

nav {
    float: left;
    max-width: 160px;
    margin: 0;
    padding: 1em;
}

nav ul {
    list-style-type: none;
    padding: 0;
}
   
nav ul a {
    text-decoration: none;
}

article {
    margin-left: 170px;
    border-left: 1px solid gray;
    padding: 1em;
    overflow: hidden;
}

</style>
</head>
<body>

<div class="container">

<header>
   <h1>�μ� Gallery</h1>
</header>
  
<nav>
  <ul>
    <li><a href="controller?command=deptno">�μ���ȣ</a></li>
    <br>
    <li><a href="controller?command=dname">�μ���</a></li>
    <br>
    <li><a href="controller?command=dept">��� �μ� ����</a></li>
  </ul>
</nav>
<article>
  <div id="view">
	  	<img id="dept" width="30%" height="50%" style="  float: left; border-radius: 30px;">
	  	<div  style="margin-left: 40%; margin-right: 20%;" >
	  		<div id="changeContent">
				<p id="deptDesc">
					
					<table border="1">
						<c:choose>
							<c:when test="${requestScope.msg == 'all'}">
								<tr><td>�μ���ȣ</td><td>�μ���</td><td>�μ���ġ</td></tr>
								<c:forEach items="${requestScope.dept}" var="data">
									<tr>
										<td>${data.deptno}</td><td>${data.dname}</td><td>${data.loc}</td>
									</tr>						
								</c:forEach>
							</c:when>
							
							<c:when test="${requestScope.msg == 'deptno'}">
								<tr><td>�μ���ȣ</td></tr>
								<c:forEach items="${requestScope.data}" var="data">
									<tr>
										<td>${data}</td>
									</tr>						
								</c:forEach>
							</c:when>
							
							<c:when test="${requestScope.msg == 'dname'}">
								<tr><td>�μ���</td></tr>
								<c:forEach items="${requestScope.data}" var="data">
									<tr>
										<td>${data}</td>
									</tr>						
								</c:forEach>
							</c:when>
						</c:choose>
						
					</table>
					
				</p>
			</div>
		</div>
  </div>
</article>

<footer>Copyright ...</footer>
</div>
	
</body>
</html>

