<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>secretForm</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${ctxpath}/resources/js/pwcheck/check.js"></script>
<style type="text/css">
table{
margin: auto;
}
</style>
</head>
<body>
	<form method="post" action="${ctxpath}/qna/content.do" onSubmit="return pwcheck()">
	<table>
	  <tr>
	    <td>게시물 비밀번호를 입력해주세요</td>
	  </tr>
	  <tr>
	    <td>
	    <input type="password" name="qna_pw" id="pw" size="30">
	    <input type="hidden" name="qna_number" value="${dto.qna_number}">
	    <input type="hidden" id="pw2" value="${dto.qna_pw}">
	    <input type="hidden" name="pageNum" value="${pageNum}">
	    </td>
	  </tr>
	  <tr>
	    <td align="center">
	    <input type="submit" value="입력">
	    <input type="button" value="취소" onClick="location='${ctxpath}/qna/list.do?pageNum=${pageNum}'">
	    </td>
	  </tr>
	</table>
	</form>
</body>
</html>