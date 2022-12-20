
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
footer{
	bottom:0;
	position: absolute;
}
</style>
<script>
	function transCheck() {
		console.log("!!");
		const text = document.getElementById("text");
		console.log(text.value);
		
		httpRequest = new XMLHttpRequest();
		// ajax를 사용하기 위해선 xml객체를 생성해야한다
		if(!httpRequest){ // 생성되지 않았을 때 고려
			alert("인스턴스 생성 불가");
			return;
		}
		//ajax 보내는 방식은 get,post방식이 있다.
		// json으로 처리할때는 post방식을 사용한다 
		var httpMethod = "GET"; //방식
		var httpParam = "text="+ encodeURIComponent(text.value); // 파라미터 한글이면 깨지지 않게 인코딩해줌
		var httpURL = "${pageContext.request.contextPath}/trans/checkLang?"+ httpParam ;
		
		// 매개변수 2~3개 
		// 1.메소드 방식 2.url 3.동기화,비동기화(ajax는 비동기화) 디폴트 자체가 비동기(true)
		// 연결작업
		httpRequest.open(httpMethod,httpURL,true);
		
		// js함수
		// 콜백 메소드 지정
		// 현재 ajax를 실행한 후 결과값을 이용하는 메소드 
// 		httpRequest.onreadystatechange = checktrans;
		
		// 데이터를 보낸후 결과값을 받음
		// 결과값을 받을때 실행되는 메소드 -> resultCheckId
		httpRequest.send();
	}
	
	function checktrans() {

		if(httpRequest.readyState == 4 && httpRequest.status == 200){
			var data = httpRequest.responseText;
			const check = document.getElementById("check");
			
			check.innerText = "";
			
// 			const lang = document.getElementById("lang");
// 			console.log(lang);
// 			lang.style.display = "none";
			
			// 결과값을 받는 변수
 			// 서버에서 처리한 후 담김 
			if(data == '사용 가능한 ID입니다.'){
				check.style.cssText="color: blue; font-size: 12px;";
			}else{
				check.style.cssText="color: red; font-size: 12px;";				
			}
			
			check.innerText = data;
		}
	}

</script>

<%@ include file = "/WEB-INF/views/layout/header.jsp"%>
	<div id = banner_back></div>
	<div class="container bg-light" >
		<div class="py-5 text-center header">
		      <h2>Translate</h2>
		</div>
		<div class="trans-row">
			<div class="col-6 col-md-auto" ><!-- section -->
				<form action="">
				<div class="trans-card ">
					<div class="trans-card-header"><!-- 언어감지 -->
						<div id="lang"><button type="button" class="trans-btn" >언어감지 ▽</button></div>
						<div id="check">check</div>
					</div>
					<div class="trans-card-body">
					<div><textarea id="text" placeholder="번역할 내용을 입력하세요" onkeyup="transCheck()"></textarea> </div>
					</div>
					<div class="trans-card-footer"><button type="submit">번역하기</button></div>
					
				</div>
				</form>
			</div>
				
			<div class="col-6 col-md-auto" ><!-- section -->
				<div class="trans-card ">
					<div class="trans-card-header"><!-- 언어감지 -->
						<div><button>언어감지 </button></div>
						<div><button>▽</button> </div>
					</div>
					<div class="trans-card-body"><textarea></textarea> </div>
				</div>
			</div>
	
			
		</div>
	
	</div>




<%@ include file = "/WEB-INF/views/layout/footer.jsp"%>