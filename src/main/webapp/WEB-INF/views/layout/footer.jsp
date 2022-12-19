
<footer>
    
        <div class="container">
            <div class="row">
               Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>

            </div>
        
        </div>
    
    </footer>

		
   <script src="/engToy/resources/js/jquery.js"></script>
	<script src="/engToy/resources/js/bootstrap.min.js"></script>
	<script src="/engToy/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/engToy/resources/js/jquery.backstretch.min.js"></script>
	<script src="/engToy/resources/js/isotope.js"></script>
	<script src="/engToy/resources/js/imagesloaded.min.js"></script>
	<script src="/engToy/resources/js/nivo-lightbox.min.js"></script>
	<script src="/engToy/resources/js/jquery.parallax.js"></script>
	<script src="/engToy/resources/js/smoothscroll.js"></script>
	<script src="/engToy/resources/js/wow.min.js"></script>
	<script src="/engToy/resources/js/core.js"></script>
	
	<!-- ------추가 -->
	<script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <script src="form-validation.js"></script>
    
    <script>
    
    $( document ).ready(function() {
		
		history.replaceState({}, null, location.pathname);
	    
	});

	Kakao.init('4cedde0d0218e258e6a052a37a9a449f'); 
	console.log(Kakao.isInitialized()); 

	//카카오로그인 
	function kakaoLogin() { 
	    Kakao.Auth.login({ 
	    scope:'profile_nickname, account_email',
	      success: function (response) { 
	    	 console.log(response);
	        Kakao.API.request({ 
	          url: '/v2/user/me', 	       
	          success: function (response) { 
	        	  console.log(response);
	        	  console.log(user_id);
	        	  var user_id = response.id;
	        	  var user_nik = response.properties.nickname;
	        	  var user_email = response.kakao_account.email;

	        	  return location.href= "${cpath}/login/login?user_name=" + user_nik + "&user_email="+ user_email + "&user_id="+user_id+"&mode=kakao";
	//2583866623
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


</body>
</html>