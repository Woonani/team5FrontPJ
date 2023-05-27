<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- <link  rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"> -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	 -->

	<style type="text/css">

	body {
		overflow:scroll;
		margin-top:100px;
		margin-bottom: 30px;
		text-align: center;		
	}
	.sections{
		padding: 30px 0px;		
		clear: both;
	}
	.contents-titles{
		margin: 100px 0px 50px 0px;
	}

	/* .contents-2 {
		background-color: rgb(255, 197, 0, 0.7);
		text-align: left;
		width: 100vw;
		height: 500px;
		justify-content: center;
		padding: 50px 200px;
		display: grid;
		grid-template-rows: repeat(2, 1fr);
	} */

	.contents-1  {
		margin: 30px 0px;
		width: 100vw;
		display: flex;	
		justify-content: center; 
	}

	
	.member-box {
		background-color: rgba(145, 186, 255, 0.3);
		border-radius: 10px;
		height : 400px;
		margin: 25px;
		padding: 35px;
		width: 300px;
		display: grid;
	}
	
	.member-box > :nth-child(2) > li {
		text-align: left;
	}
	
	.member-box button {
		background-color: rgba(255, 255, 255, 0.4);
		border-radius: 10px;
		text-align: center;
		margin: 10px 0px;
	}	
	
	#teamimg {
		width : 120px;
		height : 120px;
		border-radius: 50%;
	}
	#teamimg:hover {
		width : 130px;
		border-radius: 50%;
		box-shadow: 1px 1px 10px 5px rgba(30, 30, 30, 0.7);
	}
	</style>
</head>
<body>

   	<jsp:include page="/commonmodule/nav.jsp"></jsp:include>
	 
	
	<!-- contents -->
	<div class="contents-main" ></div>		
		<h1 class="contents-titles"> Team 5 Members </h1>
		<section class="contents-1" id="top">
			<div class="member-box" id="member-box1">
				<div>
					<a href="${pageContext.request.contextPath}/profiles/WoonaniProfile.jsp"><img src="images/wne2.jpg" alt="우나사진" id="teamimg" ></a>
				</div>
				<div>
					<h4>우나은</h4><br>
					<li>5조 조장</li>
					<li>닮은동물 : 올빼미</li>
					<li>소울푸드 : 햄버거</li>
				</div>
				<br>
			</div>
			
			<div class="member-box" id="member-box2">
				<div>
					<a href="${pageContext.request.contextPath}/profiles/tbggProfile.jsp"><img src="images/jbk2.jpg" alt="병국사진" id="teamimg"></a>
				</div>
				<div>
					<h4>조병국</h4><br>
					<li>5조 조원</li>
					<li>닮은동물 : 물범</li>
					<li>소울푸드 : 소고기, 돼지고기</li>
				</div>
				<br>
			</div>
			
			<div class="member-box" id="member-box3">
				<div>
					<a href="${pageContext.request.contextPath}/profiles/devsibongProfile.jsp"><img src="images/chd2.jpg" alt="현동사진" id="teamimg"></a>
				</div>
				<div>
					<h4>최현동</h4><br>
					<li>5조 조원</li>
					<li>닮은동물 : 도지</li>
					<li>소울푸드 : 귤</li>
				</div>
				<br>
			</div>
			
			<div class="member-box" id="member-box4">
				<div>
					<a href="${pageContext.request.contextPath}/profiles/nylonmuskProfile.jsp"><img src="images/kch2.jpg" alt="창현사진" id="teamimg"></a>
				</div>
				<div>
					<h4>김창현</h4><br>
					<li>5조 조원</li>
					<li>닮은동물 : 표범</li>
					<li>소울푸드 : 닭가슴살</li>
				</div>				
				<br>
			</div>	
		</section>
		
	<!-- contents End -->	
	
	<jsp:include page="/commonmodule/footer.jsp"></jsp:include>
</body>
</html>