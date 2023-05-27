<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Team5 Profile</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />

<noscript>
	<link rel="stylesheet" href="../assets/css/noscript.css" />
</noscript>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

</head>
<body>
	<jsp:include page="../commonmodule/nav.jsp"></jsp:include>


	<!DOCTYPE HTML>
	<!--
	Fractal by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
	<title>Fractal by HTML5 UP</title>
	<meta charset="utf-8" />
	<meta name="viewport"	content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../assets/css/main.css" />
	<link rel="stylesheet" href="../assets/css/noscript.css" />
	<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

</head>

<body class="is-preload">

	<!-- Header -->
	<header id="header" style="background-color: #313397;">
		<div class="content">
			<h1>
				<a href="#">KIM CHANG HYUN</a>
			</h1>
			<p>
				클린코드를 지향하는 김창현 입니다.<br />TEAM5의 클린코드를 맡고있습니다.
			</p>
			<ul class="actions">
				<li><a href="#one"
					class="button icon solid fa-chevron-down scrolly">저에 대해 궁금하신가요?</a></li>
				<li><a href="#three" class="button icon solid fa-camera-retro">제
						소셜 계정으로 놀러오세요</a></li>
			</ul>
		</div>
		<div class="image phone">
			<div class="inner">
				<img src="../images/screenCH.jpg" alt="" />
			</div>
		</div>
	</header>

	<!-- One -->
	<section id="one" class="wrapper style2 special">
		<header class="major">
			<h2>
				<i class="bi bi-person-hearts"></i><span style="margin-left: 10px;">인정받는
					개발자</span>
			</h2>
			<br />

		</header>
		<ul class="icons major">
			<li>#돈잘버는 #개발자</li>
			<li>#인정받는 #성장하는</li>

		</ul>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper">
		<div class="inner alt">

			<section class="spotlight">

				<div class="image">
					<img src="../images/pic02NE.jpg" alt="" />
				</div>
				<div class="content">

					<h3>
						<i class="bi bi-wrench-adjustable-circle"></i> SKILLS
					</h3>
					<br>
					<div style="display: grid; grid-template-columns: repeat(3, 2fr);">
						<ul style="list-style: none;">
							<h5>
								<i class="icon solid bi bi-braces"></i> JAVA
							</h5>
							<li><h6>Spring</h6></li>
							<li><h6>jsp</h6></li>
							<li><h6>jdbc</h6></li>

						</ul>
						<ul style="list-style: none;">
							<h5>
								<i class="icon solid bi bi-braces"></i> JavaScript
							</h5>
							<li><h6>JavaScript</h6></li>
						</ul>
						<ul style="list-style: none;">
							<h5>
								<i class="icon solid fa-code"></i> HTML/CSS
							</h5>
							<li><h6>HTML5</h6></li>
							<li><h6>BootStrap</h6></li>
						</ul>
					</div>
				</div>
			</section>
			<section class="spotlight">
				<div class="image">
					<img src="../images/pic01CH.jpg" alt="" />
				</div>

				<div class="content">
					<h3>
						<i class="bi bi-calendar-heart"></i> What do I do for fun
					</h3>
					<br>
					<p>운동하기</p>
				</div>

			</section>


			<section class="spotlight">
				<div class="image">
					<img src="../images/mbtiCH.gif" alt="" />
				</div>

				<div class="content">
					<h3>
						<i class="bi bi-universal-access"></i> MBTI
						<div class=""></div>
					</h3>
					<h5>
						재기발랄한 활동가 ENFP 입니다.
						<div class=""></div>
					</h5>
					<br>
					<p>"정열적이고 활기가 넘치며 상상력이 풍부합니다. 온정적이고 창의적이며 항상 새로운 가능성을 찾고 시도하는
						유형이지요. 문제 해결에 재빠르고 관심이 있는 일은 수행해내는 능력과 열성이 있습니다. 반복되는 일상적인 일을 참지
						못하고 열성이 나지 않아요. 또한 한 가지 일을 끝내기도 전에 몇 가지 다른 일을 또 벌이는 경향을 가지고 있습니다.
						통찰력과 창의력이 요구되지 않는 일에는 흥미를 느끼지 못하고 열성을 불러일으키지 못합니다."</p>
				</div>
			</section>

			<section id="three" class="spotlight">
				<div class="content">

					<h3>
						<i class="bi bi-wechat"></i> 비고
					</h3>
					<br>
					<!-- <p>뭐 아무거나</p> -->
				</div>
			</section>

		</div>
	</section>


	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.scrolly.min.js"></script>
	<script src="../assets/js/browser.min.js"></script>
	<script src="../assets/js/breakpoints.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>



	<jsp:include page="/commonmodule/footer.jsp"></jsp:include>

</body>
</html>


<!-- 

	<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
		style="background-color: #e6e2d2;">
		<div>
			<a class="navbar-brand mt-2 mt-lg-0" href="index.html">
				<h5 class="pt-1" style="color: #3d40e4;" href="index.html">TEAM5</h5>
			</a>

			<div id="navbarSupportedContent" style="display: inline-block;">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link"
						style="color: #3d40e4;" href="nylonmusk.html">#Drag&Drop</a></li>
					<li class="nav-item"><a class="nav-link"
						style="color: #3d40e4;" href="nylonmuskProfile.html">#profile</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>



<footer class=" text-center text-white fixed-bottom "
		style="background-color: rgba(0, 0, 0, 0);">

		<div class="text-center p-3"
			style="background-color: rgba(0, 0, 0, 0); margin-bottom: -5px">
			<a class="btn btn-outline-light btn-floating s-1"
				style="border-radius: 50%; color: #313397; background-color: #e6e2d2;"
				href="#" role="button"><i class="bi bi-chevron-double-up"></i></a>
		</div>
	</footer>
<footer id="footer">
		<ul class="icons">
			<li><a href="https://github.com/nylonmusk"
				class="icon brands fa-github"><span class="label">github</span></a></li>
			<li><a href="#" class="icon brands fa-instagram"><span
					class="label">Instagram</span></a></li>
			<li><a href="https://velog.io/@2912rla"
				class="icon solid fa-cloud"><span class="label">Notion or
						Velog</span></a></li>
		</ul>
		<p class="copyright">
			<a
				href="https://www.notion.so/5-5-70506e4b0e75428aa4d4db955709678e?pvs=4">&copy;
				더존5기5조</a>
		</p>
	</footer>

 -->
