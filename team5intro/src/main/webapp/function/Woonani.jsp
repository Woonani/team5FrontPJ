<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	
	<style type="text/css">
	body {
		overflow:scroll;
		margin-top:100px;
		margin-bottom: 30px;
		/* text-align: center; */
	}
	.contents-1  {
		margin: 100px;
		clear: both;
	}
	.function-box { /* = empty */
		 background-color: rgba(145, 186, 255, 0.3);
		 border-radius: 10px;
		 float: left;
		 /* height : 300px; */
		 margin: 50px;
		 padding: 35px;
		 text-align: center;
		 width: 400px;
	}
	.function-box button {
		 background-color: rgba(255, 255, 255, 0.7);
		 border-radius: 10px;
		 text-align: center;
		 margin: 10px 0px;
	}
	.function-box p {
		 background-color: rgba(255, 200, 234, 0.795);
		 border-radius: 10px;
		 text-align: center;
		 margin: 10px 15px 10px 10px;
		 padding: 5px;
		 width: 300px;
		 position: relative;
		 cursor: pointer;
	}
	
	.contents-main button { /* 부모클래스 contents-main 밑에 있는 자식 태그 button만 적용 (nav의 햄버거 버튼때문에!) */
	  width: 100%;
	}

	
	.hold {
		border: dotted rgb(94, 13, 148) 3px;
	}

	.hovered {
		border-style: solid rgb(13, 148, 107) 3px;
	}

	.invisible{
		display: none;
	}
	</style>

</head>
<body>

		<jsp:include page="/commonmodule/nav.jsp"></jsp:include>

	
	
	<!-- contents -->
	<div class="contents-main" >
	
		<div class="contents-1">
			<h1 id="shownick"></h1>
			<br>
			<input type="text" id="nickname" name="nickname" placeholder="닉네임을 입력해주세요" >			
			<input type="button" id="nickbtn" name="nickbtn" value="닉네임 바꾸기" onclick="setNick()">		
			<input type="button" id="nick-remove-btn" value="저장된닉삭제" onclick="removeNick()" >	
		</div>
		
		

		<div class="contents-1">
			<h1>칸반보드 (Drag&Drop + LocalStorage) </h1> <br>
			<input id="inputToDo" type="text" placeholder="할일을 적어주세요"> 
			<input id="btnToDo" type="button" value="등록"><br>		
			
			<div class="function-box" id="function-box1">
				<div class="toDoDropBox" id="dropdiv">
					<h4>To Do List</h4><br><br>
				</div>
				
			</div>
			
			<div class="function-box" id="function-box2">
				<div class="progressDropBox" id="dropdiv">
					<h4>In Progress</h4><br><br>
				</div>
			</div>
			
			<div class="function-box" id="function-box3">
				<div class="doneDropBox" id="dropdiv">
					<h4>Done</h4><br> 
				</div>				
			</div>
		</div>

		<div class="contents-1">
			<h1>지금 내 위치는 ? </h1><br>
			<button style="width: 300px;" onclick="getLocation()">Get Location</button>
			<br><br>
			<p id="latitudeValue"> </p>
			<p id="longitudeValue"> </p> 
		</div>

	</div>
	<!-- contents End -->
	
	
	
		<jsp:include page="/commonmodule/footer.jsp"></jsp:include>

 
</body>

<script type="text/javascript">
	// 닉네임 불러오기
	window.onload = getNick();

	function getNick () {
		let nick = JSON.parse(localStorage.getItem('nickname'));
		//console.log(nick);
		document.getElementById("shownick").innerHTML = (nick == null) ? ("반가워요 닉네임을 입력해주세요!") : ( nick +" 님 좋은하루 되세요~!");
	}
	// 닉네임 추가 함수
	function setNick(){
		let nick = document.getElementById("nickname").value;
		localStorage.setItem("nickname", JSON.stringify(nick));
		getNick();
	}
	// 닉네임 삭제 함수
	function removeNick(){
		localStorage.removeItem("nickname");
		getNick();
	}

	let toDoList =[];
	let progressList =[];
	let doneList =[];

	window.onload = ()=> {
		setToDoTags( "toDoList", ".toDoDropBox" );
		setToDoTags( "progressList", ".progressDropBox" );
		setToDoTags( "doneList", ".doneDropBox" );			
	}

	// To Do List 할일 추가 이벤트함수
	document.getElementById("btnToDo").addEventListener("click", ()=>{
		let inputValue = document.getElementById("inputToDo").value;
		if(inputValue.trim().length <1){
			window.alert("빈내용은 제출 안됨^^");
		}else{
			let newToDo = document.getElementById("inputToDo").value;
			let newToDoTag = document.createElement("p");
			newToDoTag.innerHTML = newToDo;
			document.querySelector(".toDoDropBox").appendChild(newToDoTag);

			// toDoList 배열에 추가하고 LocalStorage에 담는다.					
			toDoList=JSON.parse(localStorage.getItem("toDoList")); // toDoList.push(newToDo); // X!! 전역변수 toDoList에 LocalStorage정보가 저장되어있지 않다.
			toDoList.push(newToDo);
			localStorage.setItem("toDoList", JSON.stringify(toDoList));	
			document.getElementById("inputToDo").value = "";
		}
	})	
	
	// toDoList 추가 시 enter키로 제출하는 함수
	document.getElementById("inputToDo").addEventListener("keyup", (e)=>{
		if(e.keyCode === 13){
			event.preventDefault();
			document.getElementById("btnToDo").click();
		}
	})

	// LocalStorage에서 자료를 꺼내와 ListBox에 태그생성하는 함수
	function setToDoTags( listName, boxClassName ) {
		let tempArr = [];
		if(localStorage.getItem(listName) == null){ // 없으면
			//초기화
			if( listName == "toDoList"){
				tempArr = ["(기본)물마시기", "(기본)칸반만들기"];
			}
			// else{
			// 	tempArr = [];
			// }
			localStorage.setItem(listName, JSON.stringify(tempArr));
		}else{ //있으면
			tempArr = JSON.parse(localStorage.getItem(listName));	
		}
		tempArr.forEach((v)=>{
			makeToDoTag (v, boxClassName);
		})
	}
	


	// to Do 태그 생성 함수 
	function makeToDoTag (toDoTxt, boxClassName){
		let toDoTag = document.createElement("p"); 
		toDoTag.setAttribute("class", ".function-box p");
		toDoTag.setAttribute("id", "dragP");
		toDoTag.setAttribute("draggable", "true");
		console.log(toDoTag);
		toDoTag.innerHTML = toDoTxt;
		document.querySelector(boxClassName).appendChild(toDoTag);
		toDoTag.addEventListener("dragstart", dragStart);
		toDoTag.addEventListener("dragend", dragEnd);
	}

    let targetTag;
	let leavingBox;
	// dragStart()함수
	function dragStart(e){
		console.log("drag start - targetTag : ", e.target)
		targetTag = e.target;
		leavingBox = targetTag.parentNode;
		this.className += ' hold';
		setTimeout(()=> (this.className='invisible'),0)
	}

	// box들에 이벤트 추가
	const toDoDropBox = document.querySelector(".toDoDropBox");
	const progressDropBox = document.querySelector(".progressDropBox");
	const doneDropBox = document.querySelector(".doneDropBox");

	addEventToBox(toDoDropBox);
	addEventToBox(progressDropBox);
	addEventToBox(doneDropBox);

	function addEventToBox(box){
		box.addEventListener('dragover', dragOver);
		box.addEventListener('dragenter', dragEnter);
		box.addEventListener('dragleave', dragLeave);
		box.addEventListener('drop', drapDrop);
	}

	// dragEnd()함수
	function dragEnd(){
		console.log("dragEnd");
		this.className = 'function-box p';
	}

	//1 dragOver()함수
	function dragOver(e){
		e.preventDefault(); // 해주는 이유
		// 하기 전 : dragOver > dragleave > dragEnd
		// 하고난 후 : drop 함수를 호출
		//console.log("dragOver");
	}
	
	let enterBox;
	//2  drdragEnterop()함수
	function dragEnter(e){
		e.preventDefault();
		//this.className += ' hovered';
		enterBox = e.target;
		//console.log("나롱dragEnter-enterBox : ", e.target); // >> BOX

	}

	//3  dragLeave()함수
	function dragLeave(){ // e가 없음
		//console.log("dragLeave");
		//document.removeChild(leavingBox);
	}

	function getClassName(boxName){
		if(boxName.className == "progressDropBox"){
			return "progressList";
		}else if(boxName.className == "doneDropBox"){
			return "doneList";
		}else {
			return "toDoList";
		}
	}

	//4  drop()함수
	function drapDrop(){
		//console.log("drop");
		//console.log("drop > targetTag: ",targetTag);
		this.append(targetTag);

		//enterBox의 배열에 추가후, leavingBox의 배열에서 삭제, 
		//console.log("4 leavingBox",leavingBox.className);
		//console.log("4 enterBox",enterBox.className);

		let leavingBoxName = getClassName(leavingBox);
		let leavingBoxList = JSON.parse(localStorage.getItem(leavingBoxName));
		let enterBoxName = getClassName(enterBox);
		let enterBoxList = JSON.parse(localStorage.getItem(enterBoxName));
		// console.log(leavingBoxName);

		//targetP 추가
		enterBoxList.push(targetTag.innerHTML)
		console.log(enterBoxList);
		localStorage.setItem(enterBoxName, JSON.stringify(enterBoxList));
		
		//targetP 삭제
		let dropIndex = leavingBoxList.indexOf(targetTag.innerHTML);
		// console.log(dropIndex);
		leavingBoxList.splice(dropIndex,1)
		localStorage.setItem(leavingBoxName, JSON.stringify(leavingBoxList));
		
		//변수초기화
		targetTag = null;
		leavingBox = null; 
		enterBox = null;
		dropIndex = -1;
	}

	// allowDrop() 함수
	function allowDrop(){
		//console.log("allowDrop");

	}

	function getLocation () {
		if("geolocation" in navigator){
			navigator.geolocation.getCurrentPosition((position) => {
				showLocation(position.coords.latitude, position.coords.longitude);
			});
		}else{
			alert("위치정보를 사용할 수 없습니다.");
		}
	}

	function showLocation(latitude, longitude){
		document.getElementById("latitudeValue").innerHTML = "latitude : " + latitude;
		document.getElementById("longitudeValue").innerHTML = "longitude : " + longitude;
	}

</script>
</html>

