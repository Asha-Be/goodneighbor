<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteForm</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${ctxpath}/resources/js/check.js"></script>
<style type="text/css">
table{
margin: auto;
}
</style>
</head>
<body>
	<form name="delForm" method="post" action="${ctxpath}/qna/deletePro.do" onSubmit="return pwcheck()">
	<table border="1">
		<tr>
		  <td>비밀번호 입력</td>
		</tr>
		<tr>
		  <td>
			<input type="password" name="qna_pw" id="pw" size="30">
			<input type="hidden" id="pw2" value="${dto.qna_pw}">
			<input type="hidden" name="qna_number" value="${dto.qna_number}">
			<input type="hidden" name="pageNum" value="${pageNum}">
		  </td>
		</tr>
		<tr>
		  <td align="center">
			<input type="submit" value="삭제">
			<input type="button" value="글목록" onClick="location='${ctxpath}/qna/list.do'">
		  </td>
		</tr>
	</table>
	</form>
</body>
</html>