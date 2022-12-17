<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/layout/header.jsp"%>
    
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


 
    
<style>
.loginInput{
	font-size: 16px;
    padding: 0;
    height: 54px;
    line-height: 54px;
    background: #ffffff;
}
.loginInput>th>input{
width:390px;
height:55px;
border: 1px solid #d4d4d4;
}

#login_Btn{
 background: #000000;
 border: none;
 text-align: center;
 width: 400px;
 color: #fff;
 height: 61px;
 line-height: 61px;
 font-size: 18px;
 letter-spacing: -1px;
 border-radius:5px;
 margin-top:40px;
 margin-bottom:10px;
 }
#find>a{
 padding: 0 8px 0 0;
 color: #000000;
 font-size: 14px;
 text-decoration:none;
 font-weight:bolder;
 }
 #find{
 margin-left:120px;
 }
 .admin{
 float:left;
 width:200px;
 height:200px;
 display:flex;
 border:none;
 background:none;
 }
 
 
</style>





  
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
		<form action="${ pageContext.request.contextPath }/member/login/check" onsubmit="return check(this)">
			<table>
				<tr class="loginInput">
					<th><input type="text" name="id" value="${id }" placeholder="아이디"></th>
				</tr>
				<tr class="loginInput">
					<th><input type="password" name="pw" placeholder="비밀번호"></th>
				</tr>
				<tr>
					<th colspan="2" align="right">
						<span class="ckid">
							<c:choose>
								<c:when test="${check }">
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
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">로그인</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
    

<!------------ Home Banner ------------>
<section id="banner" class="parallax">
  <div class="gradient-overlay"></div>
    <div class="container">
      <div class="row">

          <div class="col-md-offset-2 col-md-8 col-sm-12">
              <h1 class="wow fadeInUp" data-wow-delay="1s">SimpleWord</h1>
              <p class="wow fadeInUp" data-wow-delay="1s">
              <small>매일 새로운 단어를 학습하고 나만의 단어장에 추가하세요!<br>
              실력을 테스트하고 유저들과 경쟁하세요!</small>
                  </p>
              <a href="#todo" class="wow fadeInUp btn btn-transparent-white btn-capsul btn-lg smoothScroll" data-wow-delay="1.3s">Go Study</a>
          </div>

      </div>
    </div>
</section>

<!--     관리자 터치박스 -->

	<input type = "button" id = "admin1" class = "admin">
	<input type = "button" id = "admin2" class = "admin">
	<input type = "button" id = "admin3" class = "admin">
	<input type = "button" id = "admin4" class = "admin">

<!------------ todo Section ------------>
<section id="todo" class="parallax">
  <div class="container">
    <div class="row">

      <div class="col-md-offset-2 col-md-8 col-sm-offset-1 col-sm-10 text-center">
          <div class="wow fadeInUp section-title" data-wow-delay="0.6s">
            <h2>Study<small>원하는 메뉴를 선택하세요!</small></h2>
          </div>
      </div>

      <div class="clearfix"></div>

      <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
        <div class="feature-thumb">
<!--           <div class="feature-icon"> -->
<!--              <span><img class="img-responsive" src="images/todo-icon-01.png" /></span> -->
<!--           </div> -->
          <h3>New Word</h3>
          <p><a href= "${pageContext.request.contextPath}/word/insertForm">새로운 단어를 단어장에 등록하세요!</a></p>
        </div>
      </div>

      <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.6s">
        <div class="feature-thumb">
<!--           <div class="feature-icon"> -->
<!--             <span><img class="img-responsive" src="images/todo-icon-02.png" /></span> -->
<!--           </div> -->
          <h3>Today's Word</h3>
          <p>오늘의 공부할 단어를 추천드려요!</p>
        </div>
      </div>

      <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.9s">
        <div class="feature-thumb">
<!--           <div class="feature-icon"> -->
<!--             <span><img class="img-responsive" src="images/todo-icon-03.png" /></span> -->
<!--           </div> -->
           <h3>My Word</h3>
           <p>내가 저장한 단어들을 확인해보세요!</p>
        </div>
      </div>
        
        <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
        <div class="feature-thumb">
<!--           <div class="feature-icon"> -->
<!--              <span><img class="img-responsive" src="images/todo-icon-04.png" /></span> -->
<!--           </div> -->
          <h3>Self Test</h3>
          <p>단어장에 등록된 단어들을 얼마나 <br>기억했는지 테스트해볼까요?</p>
        </div>
      </div>

      <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.6s">
        <div class="feature-thumb">
<!--           <div class="feature-icon"> -->
<!--             <span><img class="img-responsive" src="images/todo-icon-05.png" /></span> -->
<!--           </div> -->
          <h3>Word Game</h3>
          <p>단어를 맞히고 다른 유저들과 <br>점수를 비교해보세요!</p>
        </div>
      </div>

      <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.9s">
        <div class="feature-thumb">
<!--           <div class="feature-icon"> -->
<!--             <span><img class="img-responsive" src="images/todo-icon-06.png" /></span> -->
<!--           </div> -->
           <h3>Translation</h3>
           <p>모르는 단어가 생겼나요?<br>제가 알려드릴게요!</p>
        </div>
      </div>

    </div>
  </div>
</section>



<!------------ Menu section ------------>
<section id="location" class="parallax">
  <div class="container">
    <div class="row">

      <div class="col-md-offset-2 col-md-8 col-sm-offset-1 col-sm-10">
         <div class="wow fadeInUp section-title" data-wow-delay="1s">
            <h2>Game Rank <small>획득한 게임점수의 순위를 보여드립니다!</small></h2>
        </div>
      </div>

      <div class="col-md-6 col-sm-12">
          	
        <div class="media wow fadeInUp" data-wow-delay="0.5s">
          <div class="media-object pull-left">
            <img src="images/location-01.jpg" class="img-responsive" alt="Food Menu">
          </div>
          <div class="media-body">
            <h3 class="media-heading">1st.쉽네ㅋ</h3>
            <p>At its centre stand the imposing Houses of Parliament, the iconic ‘Big Ben’ clock tower and Westminster Abbey, site of British monarch coronations.</p>
              <a href="#" class="btn btn-capsul btn-transparent-prime">Explore Now</a>
          </div>
        </div>
		
        <div class="media wow fadeInUp" data-wow-delay="0.9s">
          <div class="media-object pull-left">
            <img src="images/location-02.jpg" class="img-responsive" alt="Food Menu">
          </div>
          <div class="media-body">
            <h3 class="media-heading">3st.비둘기구구</h3>
            <p>Eiffel Tower and Gothic Notre-Dame cathedral, the city is known for its cafe culture and designer boutiques along the Rue du Faubourg Saint-Honoré</p>
             <a href="#" class="btn btn-capsul btn-transparent-prime">Explore Now</a>
          </div>
        </div>

      </div>

      <div class="col-md-6 col-sm-12">
      
        <div class="media wow fadeInUp" data-wow-delay="0.5s">
          <div class="media-object pull-left">
            <img src="images/location-03.jpg" class="img-responsive" alt="Food Menu">
           </div>
          <div class="media-body">
            <h3 class="media-heading">2st.영어최강자</h3>
            <p>At its core is Manhattan, a densely populated borough that’s among the world’s major commercial, financial and cultural centers</p>
              <a href="#" class="btn btn-capsul btn-transparent-prime">Explore Now</a>
          </div>
        </div>
		
        <div class="media wow fadeInUp" data-wow-delay="0.9s">
          <div class="media-object pull-left">
            <img src="images/location-04.jpg" class="img-responsive" alt="Food Menu">
          </div>
          <div class="media-body">
            <h3 class="media-heading">4st.도라에몽</h3>
            <p> Hong Kong is also a major shopping destination, famed for bespoke tailors and Temple Street Night Market.</p>
              <a href="#" class="btn btn-capsul btn-transparent-prime">Explore Now</a>
          </div>
        </div>

      </div>

    </div>
  </div>
</section>

<!------------ Contact section ------------>
<section id="contact-sec" class=" content">
  <div class="overlay"></div>
	<div class="container form-block">
                <div class="row">
                <div class="col-lg-12 text-center"><h2>Get in Touch<small>Stay in touch for more information</small></h2></div>
				<div class="col-lg-4 col-md-4 col-sm-12">
                <span class="input input-hoshi">
					<input class="input_field input_field-hoshi" type="text" id="input-4" />
					<label class="input_label input_label-hoshi input_label-hoshi-color-1" for="input-4">
						<span class="input_label-content input_label-content-hoshi">Name</span>
					</label>
				</span>
                </div>
				<div class="col-lg-4 col-md-4 col-sm-12">
                <span class="input input-hoshi">
					<input class="input_field input_field-hoshi" type="text" id="input-4" />
					<label class="input_label input_label-hoshi input_label-hoshi-color-1" for="input-4">
						<span class="input_label-content input_label-content-hoshi">Phone</span>
					</label>
				</span>
                </div>
				<div class="col-lg-4 col-md-4 col-sm-12">
                <span class="input input-hoshi">
					<input class="input_field input_field-hoshi" type="text" id="input-4" />
					<label class="input_label input_label-hoshi input_label-hoshi-color-1" for="input-4">
						<span class="input_label-content input_label-content-hoshi">Email</span>
					</label>
				</span>
                </div>
                
                <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <span class="t-area input-hoshi">
                <textarea class="input_field input_field-hoshi" rows="1"></textarea>
						<label class="input_label input_label-hoshi input_label-hoshi-color-1" for="input-4">
						<span class="input_label-content input_label-content-hoshi">Email</span>
					</label>
				</span>
                <a href="#" class="btn btn-capsul btn-transparent-white">Submit</a>
                </div>
                
                </div>
                </div>
</section>

<!------------ Footer section ------------>


<script>

 	Kakao.init('7999c18bab0dd2defb181eabfe8d7611'); 
 	console.log(Kakao.isInitialized()); 

 	//카카오로그인 
 	function kakaoLogin() { 
 	    Kakao.Auth.login({ 
 	    scope:'profile_nickname',
 	      success: function (response) { 
 	        Kakao.API.request({ 
 	          url: '/v2/user/me', 	       
 	          success: function (response) { 
 	        	  console.log(response)
 	        	  var user_nik = response.properties.nickname;
 	        	  return "ㅎㅇ";
 	        	  	          }, 
 	          fail: function (error) { 
 	            console.log(error) 
 	          }, 
 	        }) 
 	      }, 
 	      fail: function (error) { 
 	        console.log(error) 
 	      }, 
 	    }) 
 	  } 
 	

 		var pw = "";
 		
	 	$('#admin1').click(function(){
 	 			pw = pw + "1";
 	 			console.log(pw);
	 		})
	 	$('#admin2').click(function(){
 	 			pw = pw + "2";
 	 			console.log(pw);
	 		})
	 	$('#admin3').click(function(){
 	 			pw = pw + "3";	
 	 			console.log(pw);
	 		})
	 	$('#admin4').click(function(){
 	 			pw = pw + "4";	
 	 			console.log(pw);
	 		if(pw == '11234'){
	 	 		location.href="${pageContext.request.contextPath}/admin/list";
	 		}
	 	})
	 	

	 	
	 	
 	
 	
 	
</script>
 
<%@ include file = "/WEB-INF/views/layout/footer.jsp"%>