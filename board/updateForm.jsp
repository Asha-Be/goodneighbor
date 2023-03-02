<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>updateForm.jsp</title>
	<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
   
   <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>

   <script type="text/javascript" src="../resources/js/script.js"></script>
	
	<script type="text/javascript">
	/*
function pwCheck(){
	
	if(document.delForm.member_pw.value==''){
		alert("암호는 필수 입력입니다.");
		document.delForm.member_pw.focus();
		return false;
	}
	return true;
}
	*/
</script>
	
	
</head>
<body>
    <h2>글 수정 폼</h2>
    <form name="updateForm" method="post" action="${ctxpath}/board/updatePro.do" onSubmit="return writeSave()">
    	<input type="hidden" name="board_pw1" id="board_pw1" value="${dto.board_pw }">
    	<table border="1">
    		<tr>
    			<td>글쓴이</td>
    			<td>
    				<input type="text" name="board_writer" id="board_writer" value="${dto.board_writer }" size="30">
    				<input type="hidden" name="board_num" value="${dto.board_num}">
    				<input type="hidden" name="pageNum" value="${pageNum}">
    			</td>
    		</tr>


			<tr>
    			<td>글제목</td>
    			<td>
    				<input type="text" name="board_subject" id="board_subject" value="${dto.board_subject}" size="50">
    			</td>
    		</tr>
			
			<tr>
    			<td>글내용</td>
    			<td>
    				<textarea name="board_content" id="board_content" rows="10" cols="47">${dto.board_content}</textarea>
    			</td>
    		</tr>
			
			<tr>
    			<td>암호</td>
    			<td>
    				<input type="password" name="board_pw" id="board_pw" size="20">
    				<font color="red">*암호는 필수 입력</font>
    			</td>
    		</tr>
			
			
			<tr>
				<td colspan="2" align="center">
				<c:if test="${board_num==0}">
				<input type="submit" value="글쓰기">	
			</c:if>
	
			<c:if test="${board_num!=0}">
				<input type="submit" value="답글쓰기">	
			</c:if>
				<input type="submit" value="글수정">
				<input type="button" value="글목록" onClick="location='${ctxpath}/board/list.do'">
				</td>
				</tr>
    	</table>
    </form>
</body>
</html>