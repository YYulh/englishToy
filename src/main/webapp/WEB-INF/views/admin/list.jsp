<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
</head>
<script>
	function deleteWord(){
		if(("input[name='delete_List']:checked").length==0){
			alert("선택된 항목이 존재하지 않습니다.");
			return;
		}else{
			document.list.submit();
		}
	}
</script>
<body>

		<div align = "center" id = "section">
		<h2>단어 관리</h2>
		<div>
		<span><input type = "button" value = "검색"> : <input type="text" name="search" size="15"></span>
		</div>
		<br><br>
			<form action="${pageContext.request.contextPath}/word/delete" method= "get" name = "list">
				<table>
					<c:choose>
						<c:when test="${empty list}"> 
							<tr align="center">
								<th>
									<span style="font-weight: bold;">등록된 단어가 없습니다.</span>
								</th>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th>번호</th>
								<th>영어 단어</th>
								<th>한글 단어</th>	
								<th><input type="checkbox" id="eng_all"></th>		
							</tr>
						<c:forEach var = "list" items="${list }">
							<tr>
								<th>${list.eDiction_no }</th>
								<th>${list.eDiction_word}</th>
								<th>${list.kDiction_word }</th>	
								<th><input type="checkbox" value = "${list.eDiction_no }" name="delete_List"></th>		
							</tr>				
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr align="right">		
					<th colspan="4"><input type = "button" value = "삭제" onclick="deleteWord();"></th>
				</tr>
			</table>
			
		</form>
	</div>
















</body>
</html>