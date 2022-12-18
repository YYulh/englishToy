
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
}

table,tr,td,th{
	border-spacing : 0px;
	border:1px black solid;
}

footer{
bottom:0;
position:absolute;
}
</style>


<div id = banner_back></div>

<%@ include file = "/WEB-INF/views/layout/header.jsp"%>
	<div id="game" align="center">
		<a class="btn-transparent-prime" href="${ pageContext.request.contextPath}/game/gameStart?mode=egame">영한 단어게임</a>
		<a class="btn-transparent-prime" href="${ pageContext.request.contextPath}/game/gameStart?mode=kgame">한영 단어게임</a>
	</div>

<%@ include file = "/WEB-INF/views/layout/footer.jsp"%>
<script type="text/javascript">





</script>

