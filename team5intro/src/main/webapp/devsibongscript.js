window.onload = function() {
	checkUser();
};
let modalInstance = new bootstrap.Modal(document.getElementById('staticBackdrop'));

// 데이터가 없는 경우 모달 창 표시
function checkUser() {
	let userData = localStorage.getItem('userData');
	if (!userData) {
		modalInstance.show();
		handleImageEvent();
	} else {
		// locatstorage에서 userData 불러오기
		let parsedData = JSON.parse(userData);
		let loginUserName = document.getElementById('loginUserName');
		loginUserName.textContent = parsedData.name;

		// sidebar 펼치기
		let sidebar = document.getElementById('sidebar');
		sidebar.classList.add('show');

		// geolocation으로 현재 위치 가져오기
		getGeoLocation().then(function(location) {
			let lat = location.lat;
			let lon = location.lon;
			var locPosition = new kakao.maps.LatLng(lat, lon)
			displayMarker(locPosition);
			searchAddrFromCoords(locPosition, function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					// 주소 정보를 정상적으로 받아왔을 때 실행할 코드 작성
					console.log(result[0].address_name); // 주소 정보 중 첫 번째 결과의 행정동 주소 출력
					document.getElementById('userLocation').textContent = result[0].address_name;
				} else {
					// 주소 정보를 받아오지 못했을 때 실행할 코드 작성
					console.log('주소 정보를 가져오지 못했습니다.');
				}
			});
		}).catch(function(error) {
			console.error(error);
		});
	}
}



// kakapmap api 설정
let container = document.getElementById('map');
let options = {
	center: new kakao.maps.LatLng(33.450701, 126.570667),
	level: 3
};
let map = new kakao.maps.Map(container, options);
// 주소-좌표 변환 객체 생성
let geocoder = new kakao.maps.services.Geocoder();

// 좌표로 주소 받기
function searchAddrFromCoords(coords, callback) {
	// 좌표로 행정동 주소 정보를 요청합니다
	geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
}

// 모달에서 저장 버튼 클릭 시 실행되는 함수
document.getElementById('registerBtn').addEventListener('click', function() {
	let userName = document.getElementById('userName').value;
	let nameErrorMessage = document.getElementById('nameErrorMessage');

	if (validateName(userName)) {
		nameErrorMessage.classList.add('d-none');
		let data = {
			name: userName
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
					var lat = position.coords.latitude; // 위도
					var lon = position.coords.longitude; // 경도
					var location = {
						lat: lat,
						lon: lon
					};
					resolve(location); // Promise를 이행하여 위치 정보 객체를 반환
				},
				function(error) {
					reject(error); // Promise를 거부하여 에러를 반환
				}
			);
		} else {
			reject(new Error('현재 위치 정보를 가져올 수 없습니다.')); // Promise를 거부하여 에러를 반환
		}
	});
}


// 지도에 마커와 인포윈도우를 표시
function displayMarker(locPosition, message) {

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		map: map,
		position: locPosition
	});

	var iwContent = message, // 인포윈도우에 표시할 내용
		iwRemoveable = true;

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		content: iwContent,
		removable: iwRemoveable
	});

	// 인포윈도우를 마커위에 표시합니다 
	infowindow.open(map, marker);

	// 지도 중심좌표를 접속위치로 변경합니다
	map.setCenter(locPosition);
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
  const reader = new FileReader();
  reader.onload = function(event) {
    const imagePreview = document.getElementById('imagePreview');
    imagePreview.src = event.target.result;
    imagePreview.width = 200;
    imagePreview.height = 200;

    // 등록 버튼 클릭 시 파일 주소를 localStorage에 저장
    document.getElementById('registerBtn').addEventListener('click', function() {
      const data = {
        profileImagePath: event.target.result
      };
      localStorage.setItem('userData', JSON.stringify(data));
      // 모달 닫기 등 다른 동작 수행
      // ...
    });
  };                                      
  reader.readAsDataURL(file);
}


// 이름 유효성 검사 함수
function validateName(input) {
	const regex = /^[가-힣]{1,5}$/;
	return regex.test(input);
}


// sidebar drag and drop 처리
let boxes = document.querySelectorAll('[name="box"]');
let items = document.querySelectorAll('[name="item"]');

items.forEach(item => {
	item.addEventListener('dragstart', dragStartItem)
	item.addEventListener('dragend', dragEnd)
});

let dragItem = null;

function dragStartItem() {
	console.log('drag started');
	dragItem = this;
	setTimeout(() => this.classList.add('invisible'), 0);
}
function dragEnd() {
	console.log('drag ended');
	dragItem.classList.remove('invisible');
	dragItem = null;
}

boxes.forEach(box => {
	box.addEventListener('dragover', dragOver);
	box.addEventListener('dragenter', dragEnter);
	box.addEventListener('dragleave', dragLeave);
	box.addEventListener('drop', dragDrop);
});

function dragOver() {
	event.preventDefault();
}
function dragEnter() {
}
function dragLeave() {
}
function dragDrop() {
	this.append(dragItem);
}








