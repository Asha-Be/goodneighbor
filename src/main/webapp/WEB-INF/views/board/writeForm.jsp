<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/ctxpath.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeForm.jsp</title>

<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript" src="../resources/js/script.js"></script>
<style type="text/css">
h2{
text-align: center;
}
table{
margin: auto;
}
</style>

</head>
<body>
	<c:if test="${board_num==0}">
		<h2>글쓰기</h2>
	</c:if>

	<c:if test="${board_num!=0}">
		<h2>답글쓰기</h2>
	</c:if>

	<form method="post" name="writeForm"
		action="${ctxpath}/board/writePro.do" onSubmit="return writeSave()">
		<input type="hidden" name="board_num" value="${board_num}"> <input
			type="hidden" name="board_ref" value="${board_ref}"> <input
			type="hidden" name="board_re_step" value="${board_re_step}">
		<input type="hidden" name="board_re_level" value="${board_re_level}">

		<table border="1">
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="board_writer" id="board_writer"
					size="30"></td>
			</tr>


			<tr>
				<td>글제목</td>
				<td>
					<!-- 원글 --> <c:if test="${board_num==0}">
						<input type="text" name="board_subject" id="board_subject"
							size="40">
					</c:if> <!--  답글 --> <c:if test="${board_num!=0 }">
						<input type="text" name="board_subject" id="board_subject"
							size="40" value="[답변]">
					</c:if>

				</td>
			</tr>

			<tr>
				<td>글내용</td>
				<td><textarea name="board_content" id="board_content" rows="10"
						cols="40"></textarea></td>
			</tr>

			<tr>
				<td>암호</td>
				<td><input type="password" name="board_pw" id="board_pw"
					size="20"> <font color="red">*암호는 필수 입력</font></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="글쓰기">
					<input type="button" value="글목록"
					onClick="location='${ctxpath}/board/list.do'"></td>
			</tr>
		</table>
	</form>
</body>
</html>