
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
			<form action="" id="gameform" >
				<table class="table">
					<tr>
						<th colspan="2" align="center">영한 단어 게임</th>
					</tr>
					<tr>
						<th>영어 단어</th>
						<td><input readonly type="text" name="ediction_word" value="${ediction_word}"></td>
					</tr>
					<tr>
						<th>한글 단어</th>
						<td><input type="text" name="kdiction_word" value="${kdiction_word}"></td>
					</tr>
					<tr>
						<td colspan ="2" align="right"><button class="btn-transparent-prime" type="submit" onClick="check()">제출하기</button></td>
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
						<td colspan ="2" align="right"><button class="btn-transparent-prime" type="submit" onClick="check()">제출하기</button></td>
					</tr>
				</table>
			</form>		
		</div>
	</c:if>
	<div id="game">
		<div id="demo">
			<button class="btn-transparent-prime" onclick="timer(this)">겜 시작!</button>
		</div>
	</div>
<div class="modal fade " id="exampleModalCenter5" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">게임 결과!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      
      <div class="modal-body">
        	<div align="center" id = "section">
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
	
<%@ include file = "/WEB-INF/views/layout/footer.jsp"%>
<script type="text/javascript">
function timer(btn){
	
	var time = 180;
	var min = "";//분
	var sec = "";//초

	//setInterval(함수, 시간): 주기적인 실행
	
	var x = setInterval(function(){
		min = parseInt(time/60);//몫 계산
		sec = time%60;
		
		document.getElementById("demo").innerHTML = min+"분"+sec+"초";
		time--;
		
		if(time<0){
			document.document.getElementById("demo").innerHTML ="시간 초과";
			clearInterval(x);
		}
	},1000);
}


</script>

