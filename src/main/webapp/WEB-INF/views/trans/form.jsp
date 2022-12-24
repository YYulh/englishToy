
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
footer{
	bottom:0;
	position: absolute;
}
</style>
<script>

	function lenghtCheck(obj) {
		
		let length = obj.value.length;
		
		let lengthCheck = document.getElementById("count");
		lengthCheck.innerText = length;
		
		var max_length = 5000;
		if(length > max_length){
			alert( max_length +"자 이상 작성할 수 없습니다.");
			obj.setAttribute("maxlength",max_length);
		}
	}
	function langCheck() {
		const text = document.getElementById("text");
		
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
		httpRequest.onreadystatechange = checktrans;
		
		// 데이터를 보낸후 결과값을 받음
		// 결과값을 받을때 실행되는 메소드 -> resultCheckId
		httpRequest.send();
	}
	
	function checktrans() {

		if(httpRequest.readyState == 4 && httpRequest.status == 200){
			var data = httpRequest.responseText;
			
			const check = document.getElementById("check");
			check.innerText = "";
			
			const lang = document.getElementById("lang");
			lang.style.display = "none";
			
			if(data == "en"){
				check.innerText = "영어 감지";
			}else if(data == "ko"){
				check.innerText = "한글 감지";
			}else if(data == ""){
				lang.style.display = "block";
			}else{
				check.innerText = "준비중";
			}
			
		}
	}
	
	function trans() {
		const check = document.getElementById("check");
		
		var source = "";
		var target = "";
		if(check.innerText == '한글 감지'){
			source = "ko";
			target = "en";
		}else if(check.innerText == '영어 감지'){
			source = "en";
			target = "ko";
		}else{
			alert("번역할수 없는 문장입니다.");
			return;
		}
		
		const text = document.getElementById("text");
		
		httpRequest = new XMLHttpRequest();
		// ajax를 사용하기 위해선 xml객체를 생성해야한다
		if(!httpRequest){ // 생성되지 않았을 때 고려
			alert("인스턴스 생성 불가");
			return;
		}
		//ajax 보내는 방식은 get,post방식이 있다.
		// json으로 처리할때는 post방식을 사용한다 
		var httpMethod = "GET"; //방식
		var httpParam = "source=" + source + "&target=" + target + "&text="+ encodeURIComponent(text.value); // 파라미터 한글이면 깨지지 않게 인코딩해줌
		var httpURL = "${pageContext.request.contextPath}/trans/translate?"+ httpParam ;
		
		// 매개변수 2~3개 
		// 1.메소드 방식 2.url 3.동기화,비동기화(ajax는 비동기화) 디폴트 자체가 비동기(true)
		// 연결작업
		httpRequest.open(httpMethod,httpURL,true);
		
		// js함수
		// 콜백 메소드 지정
		// 현재 ajax를 실행한 후 결과값을 이용하는 메소드 
		httpRequest.onreadystatechange = translate;
		
		// 데이터를 보낸후 결과값을 받음
		// 결과값을 받을때 실행되는 메소드 -> resultCheckId
		httpRequest.send();
	}
	
	function translate() {
		if(httpRequest.readyState == 4 && httpRequest.status == 200){
			var data = httpRequest.responseText;
			
			const result = JSON.parse(data);
			
			var transText = document.getElementById("result");
			transText.innerText = result.transText;
			
			var transText = document.getElementById("transLang");
			
			if(result.transLang == 'en'){
				transText.innerText = '영어';
			}else if(result.transLang == 'ko'){
				transText.innerText = '한국어';
			}
		}
	}
	function reset() {
		var text = document.getElementById("text");
		text.value ="";
		document.getElementById("count").innerText = 0;
	}
	
	function resize(obj) {
		obj.style.height ='1px';
		obj.style.height = ( obj.scrollHeight) +'px';
		
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
						
						<div id="lang">
							<button type="button" class="trans-btn" >언어감지</button>
						</div>
						<div id="check"></div>
					</div>
					<div class="trans-card-body middle-body">
						<span class="count reset" onclick="reset()">x</span>
						<div><textarea id="text" placeholder="번역할 내용을 입력하세요" onkeyup="langCheck(),lenghtCheck(this),resize(this)"></textarea>
						<div class="count"><span id="count">0</span> <span>/ 5000</span></div> 
					</div>
					</div>
					<div class="trans-card-footer">
						<button type="button" class="trans-btn btn1"  onclick="trans()">번역하기</button>
					</div>
					
				</div>
				</form>
			</div>
				
			<div class="col-6 col-md-auto" ><!-- section -->
				<div class="trans-card ">
					<div class="trans-card-header"><!-- 언어감지 -->
						<div>
							<span id="transLang">한국어</span>
						</div>
					</div>
					<div class="trans-card-body"><div id="result"></div></div>
				</div>
			</div>
	
			
		</div>
	
	</div>




<%@ include file = "/WEB-INF/views/layout/footer.jsp"%>