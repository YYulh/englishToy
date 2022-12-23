
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
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

#game{
    box-sizing: border-box;
    display: flex;
    flex: 0 1 auto;
    flex-direction: column;
    height: 200px;
    align-items: center;
    justify-content: center;
    magin: 100px auto;
      
}
#gameForm{
	box-sizing: border-box;
    flex-direction: column;
    height: 200px;
    align-items: center;
    justify-content: center;
    magin: 100px auto;
    padding-top: 80px;
	padding-bottom: 80px;
      
}

table,tr,td,th{
	border-spacing : 0px;
	border:1px black solid;
}
footer {
	text-align: center;
	bottom:0;
	position:absolute;
}
</style>


<div id = banner_back></div>

<%@ include file = "/WEB-INF/views/layout/header.jsp"%>
	<c:if test="${param.mode=='egame'}">
		<div id="game">
			<form action="" id="gameForm">
				<table class="table">
					<tr>
						<th colspan="2" align="center">영한 단어 게임</th>
					</tr>
					<tr>
						<th>영어 단어</th>
						<td><span id="ediction_word"></span></td>
					</tr>
					<tr>
						<th>한글 단어</th>
						<td><input type="text" name="kdiction_word" id="kdiction_word" value="${kdiction_word}"></td>
					</tr>
					<tr>
						<td colspan ="2" align="right"><button id="gameSubmit" class="btn-transparent-prime" type="button" onclick="check();">제출하기</button></td>
					</tr>
				</table>
			</form>
		</div>
	</c:if>
	<c:if test="${param.mode=='kgame'}">
		<div id="game">
			<form action="" id="gameform">
				<table class="table">
					<tr>
						<th colspan="2" align="center">한영 단어 게임</th>
					</tr>
					<tr>
						<th>한글 단어</th>
						<td><input readonly type="text" name="kdiction_word" value="${kdiction_word}"></td>
					</tr>
					<tr>
						<th>영어 단어</th>
						<td><input  type="text" name="ediction_word" value="${ediction_word}"></td>
					</tr>
					<tr>
						<td colspan ="2" align="right"><button class="btn-transparent-prime" type="submit" onclick="check()">제출하기</button></td>
					</tr>
				</table>
			</form>		
		</div>
	</c:if>
	<div id="game">
		<div id="demo">
		</div>
		<button id="gameButton" class="btn btn-transparent-prime" onclick="gameSelect(); timer(this);">겜 시작!</button>
			<span id="answer">야옹</span>
	</div>
	<div>
		<div>
			<h3>목록</h3>
			<c:forEach var="list" items="${list}">
				<span id="answer"></span>
			</c:forEach>
		</div>
	</div>
	
<%@ include file = "/WEB-INF/views/layout/footer.jsp"%>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("gameSubmit").style.display='none';
}
var arr = new Array();
function timer(btn){
	
	var time = 20;
	var min = "";//분
	var sec = "";//초
	var gameButton = document.getElementById("gameButton");
	var gameSubmit = document.getElementById("gameSubmit");
	gameButton.style.display = 'none';
	gameSubmit.style.display = 'block';
	//setInterval(함수, 시간): 주기적인 실행
	
	var x = setInterval(function(){
		min = parseInt(time/60);//몫 계산
		sec = time%60;
		
		document.getElementById("demo").innerHTML = min+"분"+sec+"초";
		time--;
		
		if(time<0){
			clearInterval(x);
			alert("시간 초과");
			gameButton.style.display = 'block';
			gameSubmit.style.display = 'none';
			}
	},1000);
}

function gameSelect(){
	
	httpRequest = new XMLHttpRequest();
	
	if(!httpRequest){
		alert("인스턴스 생성 불가");
		return;
	}
	var httpURL = "${pageContext.request.contextPath}/game/gameSelect";
	
	httpRequest.open("GET",httpURL,true);
	httpRequest.onreadystatechange = function(){
		
		if(httpRequest.readyState == 4 && httpRequest.status == 200){
			var data = httpRequest.responseText;
			console.log("데이터=" + data)
			document.getElementById("ediction_word").innerHTML = data;

		}
	}
	httpRequest.send();
}
function check(){
	
	httpRequest = new XMLHttpRequest();
	
	if(!httpRequest){
		alert("인스턴스 생성 불가");
		return;
	}	
	var httpMethod = "GET";
	var httpParam = document.getElementById("kdiction_word").value;
	console.log("httpParam = "+httpParam);
	var httpURL = "${pageContext.request.contextPath}/game/gameUpdate?kdiction_word="+httpParam;
	
	httpRequest.open(httpMethod,httpURL,true);
	
	httpRequest.onreadystatechange = function(){
		
		if(httpRequest.readyState == 4 && httpRequest.status == 200){
			var info = httpRequest.responseText;
			console.log("info=" + info);
			var answer = document.getElementById("answer").innerHTML = info;
			if(info !=  ""){
				arr.push(info);
			}
			console.log(arr);
		}
	}
httpRequest.send();	
setTimeout(gameSelect,1000);
}


	

 

</script>


















