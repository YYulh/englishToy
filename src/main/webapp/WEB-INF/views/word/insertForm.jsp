<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/layout/header.jsp"%>




<style>
.word_card{
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
}
.xbox{
float:right;
}
.xbox>input{
border:none;
background:none;
}
</style>

<div id = banner_back></div>




<div align="center">

	<div>
	<h4>낱말 카드</h4>
	</div>
	<c:forEach var = "list" items="${list }">
		<div class="word_card word_card${list.word_no}">
			<div class="ename">
				<p>${list.word_Ename }<span class = "xbox"><input type="button" value="x" onclick="delete_Word(${list.word_no});"></span></p>
			</div>
			<div class="kname">
				<p>${list.word_Kname }</p>
			</div>
			<div>
				<a onclick ="show_memo(${list.word_no});">></a>
			</div>
			<div class="memo" id="id${list.word_no}">
				<span class = "r${list.word_no}">${list.word_memo }</span>
				<span class = "update_memo u${list.word_no}"><input type = "text"  value ="${list.word_memo }" name = "word_memo" id ="update_memo" class="update${list.word_no}"></span>
<!-- 				저장, 수정버튼 -->
				<span><input type = "button" value="수정" onclick = "showInput(${list.word_no});" class="showInput${list.word_no}"></span>
				<span><input type = "button" value="저장" onclick = "updateMemo(${list.word_no});" class="updateMemo${list.word_no} updateMemo" ></span>
			</div>
		</div>
	</c:forEach>
	
</div>


<script>
$(document).ready(function(){
	
	$('.memo').hide();
	$('.update_memo').hide();
	$('.updateMemo').hide();

	
	
})
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
		$('#id'+ i).slideToggle();
	}
	 
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
	 

</script>






<%@ include file = "/WEB-INF/views/layout/footer.jsp"%>