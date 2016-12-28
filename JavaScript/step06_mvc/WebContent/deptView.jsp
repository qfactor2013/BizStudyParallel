<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8">
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
   <h1>부서정보</h1>
</header>
  
<nav>
  <ul>
    <li><a href="controller?command=deptno">부서번호</a></li>
    <br>
    <li><a href="controller?command=dname">부서명</a></li>
    <br>
    <li><a href="controller?command=dept">모든부서정보																</a></li>
  </ul>
</nav>
<script type="text/javascript" src="food.js"></script>
<article>
  <div id="view">
	  	<img id="foot" src="img/cherries.jpg" width="30%" height="50%" style="  float: left; border-radius: 30px;">
	  	
	  	<div  style="margin-left: 40%; margin-right: 20%;" >
	 
	  		<div id="changeContent">
				<p id="deptDesc">
				
					<table border = "1">
						<c:forEach items="${requestScope.data }" var="data">
							<tr>
							<td>${data.deptno }</td>
							<td>${data.dname }</td>
							<td>${data.loc }</td>
							</tr>
						</c:forEach>
					</table>
					
					<table border = "1">
						<c:forEach items="${requestScope.deptJson }" var="data">
							<tr>
							<td>${data.deptno }</td>
							<td>${data.dname }</td>
							<td>${data.loc }</td>
							</tr>
						</c:forEach>
					</table>								
				</p>
			</div>
		</div>
  </div>
</article>
<footer>Copyright ...</footer>
</div>

<script>
</script>


</body>
</html>

