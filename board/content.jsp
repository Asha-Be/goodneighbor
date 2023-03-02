<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/ctxpath.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>content.jsp</title>
		 <link rel="stylesheet" type="text/css" href="../resources/css/style.css">

</head>
<body>
	<h2>^.^ 글내용 보기 ^.^</h2>
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>${dto.board_num}</td>
			
			<td>조회수</td>
			<td>${dto.board_readcount}</td>
		</tr>
		
		<tr>
			<td>작성자</td>
			<td>${dto.board_writer}</td>
		
			<td>작성일</td>
			<td><fmt:formatDate value="${dto.board_regdate}" pattern="yyyy-MM=dd"/></td>
		</tr>
		
		<tr>
			<td>글제목</td>
			<td colspan="3">
			${dto.board_subject}
			</td>
		</tr>	
		
		<tr>
			<td>글내용</td>
			<td colspan="3">
				<pre>${dto.board_content}</pre>
			</td>
		</tr>
			
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="글수정" onClick="location='${ctxpath}/board/updateForm.do?board_num=${dto.board_num}&pageNum=${pageNum}'">
				<input type="button" value="글삭제" onClick="location='${ctxpath}/board/deletePro.do?board_num=${dto.board_num}&pageNum=${pageNum}'">
				<input type="button" value="새글쓰기" onClick="location='${ctxpath}/board/writeForm.do'">
				<input type="button" value="답글쓰기" onClick="location='${ctxpath}/board/writeForm.do?board_num=${dto.board_num}&board_ref=${dto.board_ref}&board_re_step=${dto.board_re_step}&board_re_level=${dto.board_re_level}'">		
				<input type="button" value="리스트"	onClick="location='${ctxpath}/board/list.do?pageNum=${pageNum}'">
			</td>
	</table>
</body>
</html>