<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<title>Fractal by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="devsibongProfileNavbar.jsp"%>
	<!-- Header -->
	<header id="header" style="background-color: #df9637;">
		<div class="content">
			<h1>
				<a href="#">CHOI HYUN DONG</a>
			</h1>
			<p>
				도지보유자 최현동입니다.<br />TEAM5의 기술팀을 맡고있습니다.
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
				<img src="images/screenHD.jpg" alt="" />
			</div>
		</div>
	</header>

	<!-- One -->
	<section id="one" class="wrapper style2 special">
		<header class="major">
			<h2>
				<i class="bi bi-person-hearts"></i><span style="margin-left: 10px;">꾸준히
					성장하는 개발자</span>
			</h2>
			<br />
			<p></p>

		</header>
		<ul class="icons major">
			<li>#조용히 #일 #잘하는사람</li>
			<li>#즐겁게 #일하고 #돈도 버는</li>

			<!-- <li><span class="icon solid fa-camera-retro"><span class="label">Shoot</span></span></li>
					<li><span class="icon solid fa-sync"><span class="label">Process</span></span></li>
					<li><span class="icon solid fa-cloud"><span class="label">Upload</span></span></li> -->

		</ul>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper">
		<div class="inner alt">

			<section class="spotlight">

				<div class="image">
					<img src="images/pic02NE.jpg" alt="" />
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
							<li><h6>Spring boot</h6></li>
							<li><h6>jsp</h6></li>
							<li><h6>sevlet</h6></li>
							<li><h6>jdbc</h6></li>
							<li><h6>Thymeleaf</h6></li>
						</ul>
						<ul style="list-style: none;">
							<h5>
								<i class="icon solid bi bi-braces"></i> JavaScript
							</h5>
							<li><h6>vanilla javascript</h6></li>
							<li><h6>jQuery</h6></li>
						</ul>
						<ul style="list-style: none;">
							<h5>
								<i class="icon solid fa-code"></i> HTML/CSS
							</h5>
							<li><h6>HTML5</h6></li>
							<li><h6>CSS</h6></li>
							<li><h6>BootStrap</h6></li>
						</ul>
					</div>
				</div>
			</section>
			<section class="spotlight">
				<div class="image">
					<img src="images/pic02HD.jpg" alt="" />
				</div>

				<div class="content">
					<h3>
						<i class="bi bi-calendar-heart"></i> What do I do for fun
					</h3>
					<br>
					<p>
						바다 구경하기 <br>
					</p>
				</div>

			</section>
			<section class="spotlight">
				<div class="image">
					<img src="images/pic01HD.jpg" alt="" />
				</div>

				<div class="content">
					<h3>
						<i class="bi bi-calendar-heart"></i> What do I do for fun
					</h3>
					<br>
					<p>누워서 귤먹기</p>
				</div>

			</section>

			<section class="spotlight">
				<div class="image">
					<img src="images/mbtiHD.gif" alt="" />
				</div>

				<div class="content">
					<h3>
						<i class="bi bi-universal-access"></i> MBTI
						<div class=""></div>
					</h3>
					<h5>
						청렴결백한 논리+현실주의자 ISTJ 입니다.
						<div class=""></div>
					</h5>
					<br>
					<p>"ISTJ는 실제 사실에 대하여 정확하고 체계적으로 기억하며 일 처리에 있어서도 신중하고 책임감이 있습니다.
						집중력이 강한 현실 감각을 지녔으며 조직적이고 침착합니다. 보수적인 경향이 있으며, 문제를 해결하는데 과거의 경험을 잘
						적용하며, 반복되는 일상적인 일에 대한 인내력이 강합니다. 정확성과 조직력을 발휘하는 분야의 일을 선호합니다."</p>
				</div>
			</section>

			<section id="three" class="spotlight">
				<div class="content">

					<h3>
						<i class="bi bi-wechat"></i> 비고
					</h3>
					<br>
					<p>Contact : seohae7785@gmail.com</p>
				</div>
			</section>


		</div>
	</section>


	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>

<!-- Header -->
<header id="header" style="background-color: #df9637;">
	<div class="content">
		<h1>
			<a href="#">CHOI HYUN DONG</a>
		</h1>
		<p>
			도지보유자 최현동입니다.<br />TEAM5의 기술팀을 맡고있습니다.
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
			<img src="images/screenHD.jpg" alt="" />
		</div>
	</div>
</header>

<!-- One -->
<section id="one" class="wrapper style2 special">
	<header class="major">
		<h2>
			<i class="bi bi-person-hearts"></i><span style="margin-left: 10px;">꾸준히
				성장하는 개발자</span>
		</h2>
		<br />
		<p></p>

	</header>
	<ul class="icons major">
		<li>#조용히 #일 #잘하는사람</li>
		<li>#즐겁게 #일하고 #돈도 버는</li>

		<!-- <li><span class="icon solid fa-camera-retro"><span class="label">Shoot</span></span></li>
					<li><span class="icon solid fa-sync"><span class="label">Process</span></span></li>
					<li><span class="icon solid fa-cloud"><span class="label">Upload</span></span></li> -->

	</ul>
</section>

<!-- Two -->
<section id="two" class="wrapper">
	<div class="inner alt">

		<section class="spotlight">

			<div class="image">
				<img src="images/pic02NE.jpg" alt="" />
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
						<li><h6>Spring boot</h6></li>
						<li><h6>jsp</h6></li>
						<li><h6>sevlet</h6></li>
						<li><h6>jdbc</h6></li>
						<li><h6>Thymeleaf</h6></li>
					</ul>
					<ul style="list-style: none;">
						<h5>
							<i class="icon solid bi bi-braces"></i> JavaScript
						</h5>
						<li><h6>vanilla javascript</h6></li>
						<li><h6>jQuery</h6></li>
					</ul>
					<ul style="list-style: none;">
						<h5>
							<i class="icon solid fa-code"></i> HTML/CSS
						</h5>
						<li><h6>HTML5</h6></li>
						<li><h6>CSS</h6></li>
						<li><h6>BootStrap</h6></li>
					</ul>
				</div>
			</div>
		</section>
		<section class="spotlight">
			<div class="image">
				<img src="images/pic02HD.jpg" alt="" />
			</div>

			<div class="content">
				<h3>
					<i class="bi bi-calendar-heart"></i> What do I do for fun
				</h3>
				<br>
				<p>
					바다 구경하기 <br>
				</p>
			</div>

		</section>
		<section class="spotlight">
			<div class="image">
				<img src="images/pic01HD.jpg" alt="" />
			</div>

			<div class="content">
				<h3>
					<i class="bi bi-calendar-heart"></i> What do I do for fun
				</h3>
				<br>
				<p>누워서 귤먹기</p>
			</div>

		</section>

		<section class="spotlight">
			<div class="image">
				<img src="images/mbtiHD.gif" alt="" />
			</div>

			<div class="content">
				<h3>
					<i class="bi bi-universal-access"></i> MBTI
					<div class=""></div>
				</h3>
				<h5>
					청렴결백한 논리+현실주의자 ISTJ 입니다.
					<div class=""></div>
				</h5>
				<br>
				<p>"ISTJ는 실제 사실에 대하여 정확하고 체계적으로 기억하며 일 처리에 있어서도 신중하고 책임감이 있습니다.
					집중력이 강한 현실 감각을 지녔으며 조직적이고 침착합니다. 보수적인 경향이 있으며, 문제를 해결하는데 과거의 경험을 잘
					적용하며, 반복되는 일상적인 일에 대한 인내력이 강합니다. 정확성과 조직력을 발휘하는 분야의 일을 선호합니다."</p>
			</div>
		</section>

		<section id="three" class="spotlight">
			<div class="content">

				<h3>
					<i class="bi bi-wechat"></i> 비고
				</h3>
				<br>
				<p>Contact : seohae7785@gmail.com</p>
			</div>
		</section>


	</div>
</section>
<%@ include file="devsibongProfileFooter.jsp"%>


<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
