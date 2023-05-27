<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="/your-path-to-fontawesome/css/custom-icons.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9047e07256638156761978f1352355b5&libraries=services"></script>

<style type="text/css">
</style>

</head>
<body>

		<jsp:include page="/commonmodule/nav.jsp"></jsp:include>


	<div class="contents-main">
		<div class="offcanvas offcanvas-start p-3" data-bs-scroll="true"
			data-bs-backdrop="false" tabindex="-1" id="sidebar"
			aria-labelledby="offcanvasScrollingLabel" style="margin-top: 70px;">
			<div class="offcanvas-header">
				<div class="offcanvas-title">
					<div class="d-flex align-items-center">
						<img src="image/defaultUserImage.png" alt="userImg" width="64px"
							height="64px" class="me-2 rounded-circle" id="userImage">
						<div>
							<div class="fs-4">
								<span class="fw-bold" id="loginUserName"></span>님, 안녕하세요!
							</div>
							<div class="text-muted">
								<i class="bi bi-geo-alt-fill me-2"></i><span id="userLocation">위치
									조회 불가</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="offcanvas-body">
				<div class="card mb-2" name="box" id="personalBox">
					<div class="card-header fw-bold d-flex justify-content-between">
						<div class="fs-5" id="personal">내 장소</div>
						<a class="text-dark" href=# name="addMarkerBtn"><i
							class="bi bi-plus-circle text-black fs-5"></i></a>
					</div>
					<div class="btn-group m-2" role="group">
						<button type="button" class="btn btn-outline-secondary" name="showMarkers">보이기</button>
						<button type="button" class="btn btn-outline-secondary" name="hideMarkers">숨기기</button>
						<button type="button" class="btn btn-outline-secondary" name="deleteMarkers">전체 삭제</button>
					</div>
				</div>
				<div class="card mb-2" name="box" id="caffeBox">
					<div
						class="card-header fw-bold d-flex justify-content-between bg-warning">
						<div class="fs-5" id="cafe">카페</div>
						<a class="text-dark" href=# name="addMarkerBtn"><i
							class="bi bi-plus-circle text-black fs-5"></i></a>
					</div>
					<div class="btn-group m-2" role="group">
						<button type="button" class="btn btn-outline-warning" name="showMarkers">보이기</button>
						<button type="button" class="btn btn-outline-warning" name="hideMarkers">숨기기</button>
						<button type="button" class="btn btn-outline-warning" name="deleteMarkers">전체 삭제</button>
					</div>
				</div>
				<div class="card mb-2" name="box" id="restBox">
					<div
						class="card-header fw-bold d-flex justify-content-between bg-danger text-white">
						<div class="fs-5" id="restaurant">식당</div>
						<a class="text-dark" href=# name="addMarkerBtn"><i
							class="bi bi-plus-circle text-white fs-5"></i></a>
					</div>
					<div class="btn-group m-2" role="group">
						<button type="button" class="btn btn-outline-danger" name="showMarkers">보이기</button>
						<button type="button" class="btn btn-outline-danger" name="hideMarkers">숨기기</button>
						<button type="button" class="btn btn-outline-danger" name="deleteMarkers">전체 삭제</button>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- contents -->



	<!-- modal -->
	<div class="modal fade py-5" id="staticBackdrop" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content p-4">
				<div class="modal-header border-bottom-0">
					<h1 class="fw-bold mb-0 fs-2">반갑습니다!</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row pb-3">
						<label for="userName" class="col-3 text-end">이름</label>
						<div class="col-9">
							<input type="text" class="form-control" id="userName"
								placeholder="1~5자 사이의 한글로 입력하세요." />
							<div class="text-danger d-none" id="nameErrorMessage">1~5자
								사이의 한글로 입력하세요.</div>
						</div>
					</div>
					<div class="row">
						<div class="col-3 text-end">프로필 사진</div>
						<div class="col-9">
							<div id="imageDropArea"
								class="border border-1 rounded p-3 d-flex align-items-center justify-content-center text-secondary text-center"
								style="height: 200px; user-select: none;">
								<div id="imageNone">
									여기를 클릭하거나<br> 이미지를 드랍하세요.<br> .png(200*200)
								</div>
								<img id="imagePreview"></img>
							</div>
							<div class="text-danger d-none" id="imageErrorMessage">.png파일만
								등록할 수 있습니다.</div>
							<input type="file" id="imageInput" style="display: none;">
						</div>
					</div>
				</div>
				<div class="modal-footer border-top-0">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="cancelBtn">건너뛰기</button>
					<button type="button" class="btn btn-primary" id="registerBtn">등록하기</button>
				</div>
			</div>
		</div>
	</div>



	<div id="map" class="vh-100">
		<div class="toast-container top-0 start-50 translate-middle-x mt-5">
			<div class="toast align-items-center text-bg-primary border-0 mt-5"
				role="alert" aria-live="assertive" aria-atomic="true" id="liveToast"
				data-bs-autohide="false">
				<div class="d-flex">
					<div class="toast-body">마커를 그만 찍으려면 이 창을 닫으세요.</div>
					<button type="button" class="btn-close btn-close-white me-2 m-auto"
						data-bs-dismiss="toast" aria-label="Close" id="stopMarker"></button>
				</div>
			</div>
		</div>
	</div>







	<!-- contents End -->



		<jsp:include page="/commonmodule/footer.jsp"></jsp:include>


</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9047e07256638156761978f1352355b5"></script>
<script defer type="text/javascript" src="devsibongscript.js"></script>
</html>