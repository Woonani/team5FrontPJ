<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title> 🦭병국의 개인페이지 </title>
	
    <link	rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"    />
    <link	rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"    />
	
    <style type="text/css">
		
      body {
        font-family: Arial, sans-serif;
		overflow: scroll;
		background-color: #f0f0f0;
		margin: 50px;
        margin-top: 100px;
        margin-bottom: 30px;
		padding: 20px;
      }
      
      .function-box {
        background-color: rgba(145, 186, 255, 0.3);
        border-radius: 10px;
        float: left;
        height: 300px;
        margin: 25px;
        padding: 35px;
        width: 400px;
      }
      .function-box button {
        background-color: rgba(255, 255, 255, 0.7);
        border-radius: 10px;
        text-align: center;
        margin: 10px 0px;
      }
      
      .contents-main {
        text-align: center;
      	
      }
      
      .contents-main button {
        /* 부모클래스 contents-main 밑에 있는 자식 태그 button만 적용 (nav의 햄버거 버튼때문에!) */
        width: 100%;
      }

      .input {
        margin-bottom: 20px;
      }

      .input input {
        width: 300px;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
      }

      .button input {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #4caf50;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-right: 10px;
      }

      .button input:last-child {
        margin-right: 0;
      }

      #output {
        width: 1000px;
        height: 500px;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
        resize: vertical; /* Allow vertical resizing */
        overflow: auto; /* Show scrollbars when content exceeds height */
      }
    </style>
  </head>
  <body>
     
	<jsp:include page="/commonmodule/nav.jsp"></jsp:include>


    <!-- contents -->
    <div class="contents-main">
      
		<h1 style="font-size: 45px;">자기소개서 복사기 </h1><br>
		<form id="input">
		  <div class="input">
			<input id="inputname" type="text" placeholder="이름을 입력하세요" />
			<input id="inputage" type="text" placeholder="나이를 입력하세요" />
			<input id="inputlocation" type="text" placeholder="사는 지역을 입력하세요 " />
		  </div>
	  
		  <div class="button">
			<input type="button" value="저장" onclick="setData()" />
			<input id="getD" type="button" value="불러오기" onclick="getData()" />
			<input type="button" value="제거하기" onclick="removeData()" />
		  </div>
	  
		  <br>     
		  <textarea id="output" rows="4" cols="50"></textarea>
		  <br>
		  글자수 : <input type="text" id="txtcount"> <!--  //글자수를 담는 인풋 태그 -->

		</form>


	  

    </div>


    <!-- contents End -->


   
	<jsp:include page="/commonmodule/footer.jsp"></jsp:include>


  </body>
 		<script>
	  const key = "자기소개 양식";
	  let a = document.getElementById("input");
	  console.log(a[4]); //띄어 쓰기는 인식안함, 그냥 글자는 인식
  
	  addEventListener; // 모든 기능을 버튼한개로 수행할때 좋은거 같다.
  
	  function setData() {
		let Setsogae = {
		  //객체에 저장
		  name: document.getElementById("inputname").value,
		  age: document.getElementById("inputage").value,
		  location: document.getElementById("inputlocation").value,
		  exp: Date.now() + 86400000, // 현재로부터 24시간 후
		};
		localStorage.setItem(key, JSON.stringify(Setsogae)); //로컬 스토리지에 객체로 데이터 넣기
	  }
  
	  function getData() {
		// 데이터를 가져오면서 유효성 검사
		let Getsogae = localStorage.getItem(key); //로컬스토리지에 key vlaue로 저장
		if (JSON.parse(Getsogae).exp > Date.now()) { //JSON객체 이용하여 빼내기
		  // 유통기한 검사, 참일경우
		  document.getElementById("output").value =
			"안녕하세요. "  +  " 저는 "  + JSON.parse(Getsogae).location + "에 살고 있고 나이는 " +
			JSON.parse(Getsogae).age +
			"살 " +
			JSON.parse(Getsogae).name +
			"입니다." +
			" 제가 더존비즈온에 가야하는 이유는 3가지 입니다. 첫번째도 돈 두번째도 돈이죠 강촌은 너무 멉니다.";
		
			console.log(document.getElementById("output").value);

		} else {
		  // 유통기한이 지났을 경우 데이터삭제
		  removeData();
		}
		
		
	  }
  
	   
	  function removeData() {
		// 데이터 직접삭제
		localStorage.removeItem(key);
	  }

	  
	  document.getElementById("output").addEventListener("keydown",function(e) {
		document.getElementById("txtcount").value = document.getElementById("output").value.length	
	  });
	  
	  document.getElementById("getD").addEventListener("click",function(e) {
		document.getElementById("txtcount").value = document.getElementById("output").value.length	
	  });
	  
	  /*  
	  function countEvent(idValue) {
		  document.getElementById("idValue").addEventListener("click",function(e) {
				document.getElementById("txtcount").value = document.getElementById("output").value.length	
		  });
	  })
	  
	  function getData(){
		  // ...생략
		  
		  countEvent("getD");
		  이렇게 호출하면 동작하지 않음 
	  }
	  
	  */

	</script>
</html>
