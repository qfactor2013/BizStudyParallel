<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!doctype html>
<html lang="ko">
<script src="food.js"></script>
<head>
<meta charset="euc-kr">
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
			<h1>Food Gallery</h1>
		</header>

		<nav>
		<!--  -->
			<ul>
				<li><a href="food.jsp?command=cherries">체리</a></li>
				<br>
				<li><a href="food.jsp?command=wine">와인</a></li>
				<br>
				<li><a href="food.jsp?command=steak">스테이크</a></li>
			</ul>
		</nav>
		<script type="text/javascript" src=""></script>
		<article>
		<%--
			src = "img/${param.command}.jpg;
			상동
			${param.webQueryString명} = request.getParameter("command")
			- 서버는 client에게 html + css+ js는 순수 문자열로 그 형태 그대로 응답
				jsp tab + el 등은 실행 결과값만 응답
		 --%>
			<div id="view">
				<img id="food" src="img/${param.command }.jpg" width="30%" height="50%"
					style="float: left; border-radius: 30px;">

				<div style="margin-left: 40%; margin-right: 20%;">

					<div id="changeContent">
						<p id="foodDesc">


						</p>
					</div>

				</div>
			</div>

		</article>

		<footer>Copyright ...</footer>

	</div>
	<script type="text/javascript">
		/*
			메뉴 클릭시 사진과 데이터 변경
			개발관점
			1단계 : 어떤 메뉴가 선택?
			2단계 : 선택된 메뉴에 맞게 이미지와 데이터 선별해서 출력
		*/
		window.onload = function(){
			document.getElementById('foodDesc').innerText = food.cherries;
		}


		function changeFood(v) {
			if(v == "wine"){
				document.getElementById("food").src = "img/wine.jpg";
				//정보가 화면에 출력 <p id = "foodDesc></p>에 js 객체 내용값 출력 "
				document.getElementById('foodDesc').innerText = food.wine;
			}else if(v == "steak"){
				document.getElementById("food").src = "img/steak.jpg";
				document.getElementById('foodDesc').innerText = food.steak;
			}else if(v == "cherries"){
				document.getElementById("food").src = "img/cherries.jpg";
				document.getElementById('foodDesc').innerText = food.cherries;
			}
		}
	</script>
</body>
</html>
