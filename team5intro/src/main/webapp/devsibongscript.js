window.onload = function() {
	checkUser();
};
let personalMarkers = [];
let cafeMarkers = [];
let restMarkers = [];
const toastLive = document.getElementById('liveToast');
const toast = new bootstrap.Toast(toastLive);


// kakapmap api 설정
let container = document.getElementById('map');
let options = {
	center: new kakao.maps.LatLng(33.450701, 126.570667),
	level: 3
};
let map = new kakao.maps.Map(container, options);


let geocoder = new kakao.maps.services.Geocoder();
function getAddressFromCoords(locPosition) {
	geocoder.coord2RegionCode(locPosition.getLng(), locPosition.getLat(), function(result) {
		console.log(result);
		document.getElementById('userLocation').textContent = result[0].address_name;
	});
}


// 모달창
let modalInstance = new bootstrap.Modal(document.getElementById('staticBackdrop'));

// 로컬 스토리지에 데이터가 없는 경우 모달 창 표시
function checkUser() {
	let userData = localStorage.getItem('userData');

	if (!userData) {
		modalInstance.show();
		handleImageEvent();
	} else {
		// locatstorage에서 userData 불러오기
		let parsedData = JSON.parse(userData);
		document.getElementById('loginUserName').textContent = parsedData.name;
		let userProfileImage = parsedData.profileImagePath;
		if (userProfileImage != "") {
			document.getElementById('userImage').src = userProfileImage;
		} else {
			document.getElementById('userImage').src = "image/defaultUserImage.png";
		}

		// sidebar 펼치기
		document.getElementById('sidebar').classList.add('show');

		// geolocation으로 현재 위치 가져오기
		getGeoLocation().then(function(location) {
			let lat = location.lat;
			let lon = location.lon;
			let locPosition = new kakao.maps.LatLng(lat, lon);
			displayMarker(locPosition, 'personal');
			map.panTo(locPosition);
			getAddressFromCoords(locPosition);
		}).catch(function(error) {
			console.error(error);
		});
	}
}


// + 버튼을 누르면 지도에 마커를 표시할 수 있는 상태가 되고, 클릭시 마커를 표시한다.
let addMarkerBtns = document.querySelectorAll('[name="addMarkerBtn"]');
let mapClickHandler = null;
addMarkerBtns.forEach(btx => {
	let placeType = btx.previousElementSibling.id;
	if (placeType == "personal") {
		btx.addEventListener('click', function() {
			if (mapClickHandler != null) {
				kakao.maps.event.removeListener(map, 'click', mapClickHandler)
			};
			mapClickHandler = function(mouseEvent) {
				// 클릭한 위치에 마커를 표시합니다 
				displayMarker(mouseEvent.latLng, 'personal');
			};
			kakao.maps.event.addListener(map, 'click', mapClickHandler);
			toast.show();
		});

	} else if (placeType == "cafe") {
		btx.addEventListener('click', function() {
			if (mapClickHandler != null) {
				kakao.maps.event.removeListener(map, 'click', mapClickHandler)
			};
			mapClickHandler = function(mouseEvent) {
				// 클릭한 위치에 마커를 표시합니다 
				displayMarker(mouseEvent.latLng, 'cafe');
			};
			kakao.maps.event.addListener(map, 'click', mapClickHandler);
			toast.show();
		});
	} else {
		btx.addEventListener('click', function() {
			if (mapClickHandler != null) {
				kakao.maps.event.removeListener(map, 'click', mapClickHandler)
			};
			mapClickHandler = function(mouseEvent) {
				// 클릭한 위치에 마커를 표시합니다 
				displayMarker(mouseEvent.latLng, 'restaurant');
			};
			kakao.maps.event.addListener(map, 'click', mapClickHandler);
			toast.show();
		});
	}
});


// 닫기 버튼을 누르면 더이상 지도에 마커를 추가하지 않는다.
document.getElementById("stopMarker").addEventListener('click', function() {
	kakao.maps.event.removeListener(map, 'click', mapClickHandler);
})

//show, hide, deletemarker
//show
document.getElementsByName("showMarkers").forEach(btn => {
	if (btn.parentElement.parentElement.id == "personalBox") {
		btn.addEventListener('click', function() {
			showMarkers(personalMarkers);
		})
	} else if (btn.parentElement.parentElement.id == "caffeBox") {
		btn.addEventListener('click', function() {
			showMarkers(cafeMarkers);
		})
	} else if (btn.parentElement.parentElement.id == "restBox") {
		btn.addEventListener('click', function() {
			showMarkers(restMarkers);
		})
	}
}
)
//hide
document.getElementsByName("hideMarkers").forEach(btn => {
	if (btn.parentElement.parentElement.id == "personalBox") {
		btn.addEventListener('click', function() {
			hideMarkers(personalMarkers);
		})
	} else if (btn.parentElement.parentElement.id == "caffeBox") {
		btn.addEventListener('click', function() {
			hideMarkers(cafeMarkers);
		})
	} else if (btn.parentElement.parentElement.id == "restBox") {
		btn.addEventListener('click', function() {
			hideMarkers(restMarkers);
		})
	}
}
)
//delete
document.getElementsByName("deleteMarkers").forEach(btn => {
	if (btn.parentElement.parentElement.id == "personalBox") {
		btn.addEventListener('click', function() {
			hideMarkers(personalMarkers);
			personalMarkers.length = 0;
		})
	} else if (btn.parentElement.parentElement.id == "caffeBox") {
		btn.addEventListener('click', function() {
			hideMarkers(cafeMarkers);
			cafeMarkers.length = 0;
		})
	} else if (btn.parentElement.parentElement.id == "restBox") {
		btn.addEventListener('click', function() {
			hideMarkers(restMarkers);
			restMarkers.length = 0;
		})
	}
}
)

// 등록 버튼
document.getElementById('registerBtn').addEventListener('click', function() {
	let userName = document.getElementById('userName').value;
	let nameErrorMessage = document.getElementById('nameErrorMessage');
	let userImage = document.getElementById('imagePreview').src;

	if (validateName(userName)) {
		nameErrorMessage.classList.add('d-none');
		let data = {
			name: userName,
			profileImagePath: userImage
		};
		localStorage.setItem('userData', JSON.stringify(data));
		modalInstance.hide();
		checkUser();
	} else {
		nameErrorMessage.classList.remove('d-none');
	}
});


// Promise
function getGeoLocation() {
	return new Promise((resolve, reject) => {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(
				function(position) {
					console.log(position);
					let lat = position.coords.latitude;
					let lon = position.coords.longitude;
					let location = {
						lat: lat,
						lon: lon
					};
					resolve(location);
				}
			);
		} else {
			reject(new Error('현재 위치 정보를 가져올 수 없습니다.')); // Promise를 거부하여 에러를 반환
		}
	});
}

// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map, markers) {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(map);
	}
}

// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
function showMarkers(markers) {
	setMarkers(map, markers)
}

// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
function hideMarkers(markers) {
	setMarkers(null, markers);
}


// 지도에 마커와 이미지를 표시
function displayMarker(locPosition, type) {
	let imageSrc = null; // 마커이미지의 주소입니다    
	if (type == 'personal') {
		imageSrc = document.getElementById('userImage').src;
	} else if (type == 'cafe') {
		imageSrc = "image/cafe.png";
	} else {
		imageSrc = "image/restaurant.png";
	}
	let imageSize = new kakao.maps.Size(69, 69); // 마커이미지의 크기입니다
	let imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

	// 마커를 생성합니다
	let marker = new kakao.maps.Marker({
		map: map,
		position: locPosition,
		image: markerImage
	});
	if (type == 'personal') {
		personalMarkers.push(marker);
	} else if (type == 'cafe') {
		cafeMarkers.push(marker);
	} else {
		restMarkers.push(marker);
	}

}

// 이미지 드랍 영역 처리
function handleImageEvent() {
	let imageDropArea = document.getElementById("imageDropArea");
	let imageInput = document.getElementById('imageInput');

	// 파일 첨부 이벤트 처리
	imageDropArea.addEventListener('click', () => {
		imageInput.click();
	});

	imageInput.addEventListener('change', (event) => {
		let file = event.target.files[0];
		handleImageFile(file);
	});

	// 드래그 앤 드롭 이벤트 처리
	imageDropArea.addEventListener('dragover', (event) => {
		event.preventDefault();
		imageDropArea.classList.add('border-primary');
	});

	imageDropArea.addEventListener('dragleave', (event) => {
		event.preventDefault();
		imageDropArea.classList.remove('border-primary');
	});

	imageDropArea.addEventListener('drop', (event) => {
		event.preventDefault();
		imageDropArea.classList.remove('border-primary');
		let file = event.dataTransfer.files[0];
		handleImageFile(file);
	});
}

function handleImageFile(file) {
	const allowedExtensions = ['.png', '.jpg', '.gif'];
	const fileName = file.name;
	const fileExtension = fileName.substring(fileName.lastIndexOf('.')).toLowerCase();

	if (!allowedExtensions.includes(fileExtension)) {
		document.getElementById('imageErrorMessage').classList.remove('d-none');
		return;
	}

	// 파일 처리 로직
	let reader = new FileReader();
	reader.onload = function(event) {
		document.getElementById('imageNone').setAttribute('style', 'display: none;');
		let imagePreview = document.getElementById('imagePreview');
		imagePreview.src = event.target.result;
		imagePreview.width = 200;
		imagePreview.height = 200;

	};
	reader.readAsDataURL(file);
}

// 이름 유효성 검사 함수
function validateName(input) {
	const regex = /^[가-힣]{1,5}$/;
	return regex.test(input);
}







