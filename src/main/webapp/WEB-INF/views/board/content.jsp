<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/ctxpath.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content.jsp</title>

<link rel="stylesheet" type="text/css" href="../resources/css/contents_CS12.css">
<style type="text/css">
h2{
text-align: center;
}


table{
margin: auto;
margin-top : 50px;


}
</style>
</head>
<body>
	<h1 align="center">자유게시판</h1>
	<h3 align="center" color="DEDEDE">좋은 이웃과 함께하는 자원봉사는
	아이들의 행복한 삶을 응원하는 또 하나의 방법입니다.</h3>

	
	
	<table class="content"  id="content_table" width="1100px" >
	
		<tr class="id">
			
			<td colspan="7" id="content_subject"> &nbsp; &nbsp;${dto.board_subject}</td>
	
</tr>



<tr class="id">

			<td class="td_subject">작성일</td>
			<td><fmt:formatDate value="${dto.board_regdate}"
					pattern="yyyy-MM-dd" /></td>

			<td class="td_subject">작성자</td>
			<td colspan="2">${dto.board_writer}</td>
		
		<!-- 
			<td>글번호</td>
			<td>${dto.board_num}</td>
 -->
			<td class="td_subject">조회수 </td>
			<td >${dto.board_readcount}</td>
		</tr>


			<!-- <td>글내용</td> -->
		<tr id="subject" class="id">
			<td colspan="7" id="content" height="400px"><pre font-family="Pretendard-Regular">${dto.board_content}</pre></td>
		</tr>
	
		<tr class="id">
			<td colspan="8" align="right" id="buttons"><input type="button" value="글수정"
				onClick="location='${ctxpath}/board/updateForm.do?board_num=${dto.board_num}&pageNum=${pageNum}'">
				<input type="button" value="글삭제"
				onClick="location='${ctxpath}/board/deletePro.do?board_num=${dto.board_num}&pageNum=${pageNum}'">
				<input type="button" value="새글쓰기"
				onClick="location='${ctxpath}/board/writeForm.do'"> <input
				type="button" value="답글쓰기"
				onClick="location='${ctxpath}/board/writeForm.do?board_num=${dto.board_num}&board_ref=${dto.board_ref}&board_re_step=${dto.board_re_step}&board_re_level=${dto.board_re_level}'">
				<input type="button" value="리스트"
				onClick="location='${ctxpath}/board/list.do?pageNum=${pageNum}'">
			</td>
			</tr>
			
			
	</table>
</body>
</html>