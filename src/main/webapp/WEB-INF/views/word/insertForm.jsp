<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/layout/header.jsp"%>




<style>
.word_card{
margin-left:15px;
margin-right:15px;
border:1px solid black;
width:20%;
margin-top:15px;
border-radius:10px;
}
#banner_back {
    background: #7b4397;
    background: -webkit-linear-gradient(120deg, #7b4397 , #dc2430);
    background: linear-gradient(120deg, #7b4397 , #dc2430);
    padding: 0.75em 0;
    position: fixed;
    z-index: 0;
    top: 0;
    width: 100%;
    height:71px;
    overflow: hidden;
    position: relative;
}
.ename{
font-size:24px;
font-weight:bolder;
display:block;
 background-color:pink;
 border-radius:10px 10px 0 0;
 height:40px;
 text-shadow:1px 1px 1px grey;
}
.kname{
text-shadow:1px 1px 1px grey;
font-weight:bolder;
}
.xbox{
float:right;
}
.xbox>input{
border:none;
background:none;
}
#word_section{
display:flex;
flex-flow:wrap;
justify-content: center;
margin-bottom:150px;
}
#word_all{
margin-top:100px;

}
h4{
font-size:25px;
font-weight:bolder;
}
a:hover{
cursor:pointer;
}
footer{
bottom:0;
position:absolute;
}
#exampleModalCenter2{
margin-top:200px;
}
.like{
color:yellow;
background:none;
border:none;
float:left;
text-shadow:1px 1px 1px #000;
}
#insert_card{
background-color:pink;
width:700px;
height:80px;
border-radius:10px;
color:black;
font-size:40px;
font-weight:bolder;
}
#insert_card:hover{
opacity:0.5;
}
.wordInput{
width:400px;
height:50px;
border-radius:5px;
margin-top:10px;
}
</style>

<div id = banner_back></div>



<!-- 등록된 단어카드 목록 -->
<div align="center" id="word_all"> 
	<div>
		<h4>My Card</h4>
	</div>
<div align="center" id = "word_section">

	<c:forEach var = "list" items="${list }">
		<div class="word_card word_card${list.word_no}">
		<input type="hidden" value = "${list.word_like}" name = "word_like">
			<div class="ename">
				<p>
				<c:if test="${list.word_like==0}">
					<span><input type="button" value ="☆" class="like like${list.word_no}" onclick="changeLike(${list.word_no});" ></span>
				</c:if>
				<c:if test="${list.word_like==1}">
					<span><input type="button" value ="★" class="like like${list.word_no}" onclick="changeLike(${list.word_no});" ></span>
				</c:if>
				${list.word_Ename }
				<span class = "xbox"><input type="button" value="x" onclick="delete_Word(${list.word_no});"></span>
				</p>
			</div>
			<div class="kname">
				<p>${list.word_Kname }</p>
			</div>
			<div>
				<a onclick ="show_memo(${list.word_no});">memo▽</a>
			</div>
			<div class="memo memo${list.word_no}" >
				<span class = "r${list.word_no}">${list.word_memo }</span>
				<span class = "update_memo u${list.word_no}"><input type = "text"  value ="${list.word_memo }" name = "word_memo" id ="update_memo" class="update${list.word_no}"></span>

<!-- 				저장, 수정버튼 -->
				<span><input type = "button" value="수정" onclick = "showInput(${list.word_no});" class="showInput${list.word_no}"></span>
				<span><input type = "button" value="저장" onclick = "updateMemo(${list.word_no});" class="updateMemo${list.word_no} updateMemo" ></span>
			</div>
		</div>
	</c:forEach>
</div>

<!-- 단어 등록 모달박스 -->
<div>
		<a data-toggle="modal" data-target="#exampleModalCenter2"><input type="button" value = "New Card" id="insert_card"></a>
	</div>
	
	<div class="modal fade " id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">New card</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      
      <div class="modal-body">
        	<div align="center" id = "section">
		<h2 id="head">Card</h2>
		<br><br>
		<form action="#" id="insertWord">
			<table>
				<tr>
					<th><input type = "text" placeholder="please insert word" size="30" id ="searchWord" name="searchWord" class="wordInput"></th>
				</tr>
				
				<tr>
					<th><input type = "text" readonly size="30" placeholder="please push search"id ="answerWord" name="answerWord" class="wordInput"></th>					
				</tr>
			 	<tr>
					<th><input type = "text" placeholder="your memo" size="30" name = "memo" class="wordInput"></th>					
				</tr>
			</table>
		</form>
			</div>
      </div>
      <div class="modal-footer">
     	 <button type="button"  class="btn btn-primary"  id ="searchWord_btn">검색</button>
        <button type="button" class="btn btn-primary" id="insert">등록</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</div>	

<script>
$(document).ready(function(){
// 	시작시 숨길 부분
	$('.memo').hide();
	$('.update_memo').hide();
	$('.updateMemo').hide();
	
	if($('.like').val()==0){
		$($('.like').val()==0).attr("value","☆");
	}
	if($('.like').val()==1){
		$(this).attr("value","★");
	}
	
	
})

// 	메모 수정 ajax i는 수정할 word의 word_no
	function updateMemo(i){
	
		var no = i;
		httpRequest = new XMLHttpRequest();
	
		if(!httpRequest){
			alert("인스턴스 생성 불가!");
			return;
		}

		var httpMethod = "GET";
		var httpParam = (i, $('.update'+i).val());
		var httpURL = "${pageContext.request.contextPath}/word/update?word_no="+ i + "&word_memo=" + $('.update'+i).val();
	
		httpRequest.open(httpMethod,httpURL,true);

		httpRequest.onreadystatechange = function(){
			
				if(httpRequest.readyState == 4 && httpRequest.status == 200){
					var data = httpRequest.responseText;
					console.log("데이터=" + data)
					$('.r'+i).text(data);
					
					$('.u'+i).hide();
					$('.r'+i).show();	
					$('.showInput'+i).show();
					$('.updateMemo'+i).hide();
				}
			}
		httpRequest.send();	
	}
	

	function showInput(i){
	$('.showInput'+i).hide();
	$('.updateMemo'+i).show();
	$('.r'+i).hide();
	$('.u'+i).show();		
	}
			
	 function show_memo(i){
		$('.memo'+ i).slideToggle();
	}
//	 	카드 삭제 ajax
	 function delete_Word(i){
		 if(confirm("해당 카드를 삭제하시겠습니까?")){
			 httpRequest = new XMLHttpRequest();
				
				if(!httpRequest){
					alert("인스턴스 생성 불가!");
					return;
				}

				var httpMethod = "GET";
				var httpParam = i;
				var httpURL = "${pageContext.request.contextPath}/word/delete?word_no="+ i;
			
				httpRequest.open(httpMethod,httpURL,true);

				httpRequest.onreadystatechange = function(){
					
						if(httpRequest.readyState == 4 && httpRequest.status == 200){
							var data = httpRequest.responseText;
							if(data == "성공"){
								$('.word_card'+i).hide(1000);
							}else{
								alert("삭제에 실패하였습니다. 관리자에게 문의주십시오.");
							}
						}
					}
				httpRequest.send();	
				return;
			}
		 }
	 
//	 	등록할 단어 뜻 불러오는 ajax , 모달에서는 click function이 아닌 on(click)해줘야 정상실행됨
		 $(document).on("click","#searchWord_btn",function(event){
			 if($('#searchWord').val()==''){
				 alert("등록할 단어를 입력해주십시오.");
				 return;
			 }
			
			 httpRequest = new XMLHttpRequest();
				
				if(!httpRequest){
					alert("인스턴스 생성 불가!");
					return;
				}
				
				var httpMethod = "GET";
				var httpParam = $('#searchWord').val();
				var httpURL = "${pageContext.request.contextPath}/word/search?word_name="+ $('#searchWord').val();
			
				httpRequest.open(httpMethod,httpURL,true);
				
				//callback method 지정
				httpRequest.onreadystatechange = resultSearchWord;
				httpRequest.send();
			
			})
			
			function resultSearchWord(){
				if(httpRequest.readyState == 4 && httpRequest.status == 200){
					
					var data = httpRequest.responseText;
					console.log(data);
					if(data == "검색된 결과가 없습니다."){
						alert(data);
						return;
					}else{						
						$('#answerWord').attr("value",data);
					return;
					}
				}
			}
			
//		 	카드 등록 ajax
		 $(document).on("click","#insert",function(){
			 httpRequest = new XMLHttpRequest();
				 if($('#answerWord').val()==''){
					 alert("단어를 검색 해주십시오.");
					 return;
				 }
				if(!httpRequest){
					alert("인스턴스 생성 불가!");
					return;
				}

				
				var httpMethod = "GET";
				var httpParam = $('#insertWord').serialize();
				var httpURL = "${pageContext.request.contextPath}/word/insert?" + $('#insertWord').serialize();
			
				httpRequest.open(httpMethod,httpURL,true);

				httpRequest.onreadystatechange = function(){
					
						if(httpRequest.readyState == 4 && httpRequest.status == 200){
							var data = httpRequest.responseText;
							if(data == "성공"){
								location.href="${pageContext.request.contextPath}/word/insertForm";
								return;
							}else{
								alert("등록에 실패하였습니다. 관리자에게 문의해주십시오.");
								return;
							}
						}
					}
				httpRequest.send();	
				return;
		 })
		 
		  function changeLike(i){
		console.log($('.like'+i).val());
		
			if($('.like'+i).val() == "☆"){
				$('.like'+i).attr("value","★");
				location.href="${pageContext.request.contextPath}/word/updateLike?word_no="+i+"&word_like=1";
				return;
			}else{
				$('.like'+i).attr("value","☆");
				location.href="${pageContext.request.contextPath}/word/updateLike?word_no="+i+"&word_like=0";
				return;
			}
			
		}
		
</script>






<%@ include file = "/WEB-INF/views/layout/footer.jsp"%>