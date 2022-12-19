<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
footer{
	bottom:0;
	position: absolute;
}
</style>

<script>
	function checkId() {
		const id = document.getElementById("id");
		
		if(id.value == ""){
			alert("아이디를 입력해주세요.");
			id.focus();
			return;
		}
		
		httpRequest = new XMLHttpRequest();
		// ajax를 사용하기 위해선 xml객체를 생성해야한다
		if(!httpRequest){ // 생성되지 않았을 때 고려
			alert("인스턴스 생성 불가");
			return;
		}
		//ajax 보내는 방식은 get,post방식이 있다.
		// json으로 처리할때는 post방식을 사용한다 
		var httpMethod = "GET"; //방식
		var httpParam = "id="+ encodeURIComponent(id.value); // 파라미터 한글이면 깨지지 않게 인코딩해줌
		var httpURL = "${pageContext.request.contextPath}/join/checkid?"+ httpParam ;
		// ?id=id형식으로 url지정
		
		// 매개변수 2~3개 
		// 1.메소드 방식 2.url 3.동기화,비동기화(ajax는 비동기화) 디폴트 자체가 비동기(true)
		// 연결작업
		httpRequest.open(httpMethod,httpURL,true);
		
		// js함수
		// 콜백 메소드 지정
		// 현재 ajax를 실행한 후 결과값을 이용하는 메소드 
		httpRequest.onreadystatechange = resultCheckId;
		
		// 데이터를 보낸후 결과값을 받음
		// 결과값을 받을때 실행되는 메소드 -> resultCheckId
		httpRequest.send();
	
	}
	
	function resultCheckId() {

		if(httpRequest.readyState == 4 && httpRequest.status == 200){
			var data = httpRequest.responseText;
			const check = document.getElementById("check");
			
			check.innerText = "";
			
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
	
	function check() {
		const check = document.getElementById("check");
		console.log(check);
		if(check.innerText == ""){
			alert("ID중복검사는 필수입니다.");
			return false;
		}else if(check.innerText == "이미 사용중인 ID입니다."){
			alert("중복된 ID는 사용할 수 없습니다.");
			return false;
		}else{
			return true;
		}
	}

	function remove() {
		console.log("!!");
		document.getElementById("check").innerText = "";
	}

</script>


<%@ include file = "/WEB-INF/views/layout/header.jsp"%>
	<div id = banner_back></div>
	
	<!-- 로그인 모달 박스 -->
<div class="modal fade " id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">로그인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      
      <div class="modal-body">
        <div align="center" id = "section">
		<h2 id="head">LOGIN</h2>
		<br><br><br>
		<form action="${cpath}/login/login?mode=nomal" method="post">
			<table>
				<tr class="loginInput">
					<th><input type="text" name="id" value="${id }" placeholder="아이디" required="required"></th>
				</tr>
				<tr class="loginInput">
					<th><input type="password" name="pw" placeholder="비밀번호" required="required"></th>
				</tr>
				<tr>
					<th colspan="2" align="right">
						<span class="ckid">
							<c:choose>
								<c:when test="${check}">
									<input type="checkbox" name="ckid" value="true" checked="checked">
								</c:when>
								<c:otherwise>
									<input type="checkbox" name="ckid" value="true">
								</c:otherwise>
							</c:choose>
							<font class="ckid_text">아이디 기억하기</font>
						</span>
						<span id="find">
							<a href="${ pageContext.request.contextPath }/member/login/findForm?mode=id">ID찾기</a> | 
							<a href="${ pageContext.request.contextPath }/member/login/findForm?mode=pw">PW찾기</a> 
						</span>
						</th>
					</tr>
					<tr>
					<th>
						<input type="submit" value="Login" id ="login_Btn">
					</th>
				</tr>
			 <tr> 
			 	<th onclick="kakaoLogin();"> 
			       <a href="javascript:void(0)"> 
			           <span><img src="${pageContext.request.contextPath}/resources/img/kakao_login_large_wide.png" width="400px;"></span> 
			       </a> 
			 	</th> 		 	
			 </tr> 
				</table>
				</form>
			</div>
      </div>
    </div>
  </div>
</div>
		
	<div class="container bg-light" >
	  <main>
	    <div class="py-5 text-center">
	      <h2>Join</h2>
	    </div>
	
	    <div class="row g-5">
	      <div class="col-md-7 col-lg-8">
	        <h4 class="mb-3">Billing address</h4>
	        
	        <form class="needs-validation" action="${cpath}/join/join" method="post" onsubmit="return check()">
				<input type="hidden" name="mode" value="${mode}">
	            <div class="col-12">
	              <label for="id" class="form-label">ID</label>
	              
	              
	              <div class="input-group has-validation mb-3">
	              	<c:choose>
	              		<c:when test="${mode =='kakao'}">
			                <input type="text" class="form-control" id="id"  name="user_id" value="${id}" readonly="readonly" >
	              		</c:when>
	              		
	              		<c:otherwise>
						
			                <input type="text" class="form-control" id="id" placeholder="ID" name="user_id" required onkeyup="remove()">
			                <span class="btn btn-outline-secondary" id="button-addon2" onclick="checkId()" >check</span>
			                <span id="check"></span>
	              		</c:otherwise>
	              		
	              	</c:choose>
	              	
	              </div>
	            </div>
	            
	            <c:if test="${mode !='kakao'}">
	            
		            <div class="col-12">
		              <label for="password" class="form-label">Password</label>
		              <div class="input-group ">
		                <input type="password" class="form-control" id="password" placeholder="Password"  name="user_pw" required>
		              </div>
		            </div>
		            
	            </c:if>
	
	            <div class="col-12">
	              <label for="email" class="form-label">Email</label>
	              <c:choose>
	              	<c:when test="${mode =='kakao'}">
		              <input type="email" class="form-control" id="email" name="user_email" value="${email}" readonly="readonly" >
	              	</c:when>
	              	
	              	<c:otherwise>
		              <input type="email" class="form-control" id="email" placeholder="you@example.com" name="user_email" required>
	              	</c:otherwise>
	              </c:choose>
	            </div>
	
	          <hr class="my-4">
	
	          <button class="btn btn-capsul btn-lg " type="submit">join</button>
	          
	        </form>
	      </div>
	    </div>
	  </main>
	
	
	</div>





<%@ include file = "/WEB-INF/views/layout/footer.jsp"%>