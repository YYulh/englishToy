
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
</style>

<div id = banner_back></div>

<%@ include file = "/WEB-INF/views/layout/header.jsp"%>
	<div id="game">
		<table>
			<tr>
				<th>영단어</th>
				<td><input type="text" name="word_name" value="${word_name}"></td>
			</tr>
			<tr>
				<th>한글단어</th>
				<td><input type="text" name="word_mean" value="${word_mean}"></td>
			</tr>
			<tr>
				<td><button type="submit" ></button></td>
			</tr>
		</table>
	</div>
<%@ include file = "/WEB-INF/views/layout/footer.jsp"%>