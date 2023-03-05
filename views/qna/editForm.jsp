<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editForm</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${ctxpath}/resources/js/check.js"></script>
</head>
<body>
	<h2>글 수정 폼</h2>
	<form name="writeFrom" method="post" action="${ctxpath}/qna/editPro.do" onSubmit="return check()">
	  <table border="1">
	    <tr>
	      <td>글쓴이</td>
	      <td>
	      <input type="text" name="qna_writer" id="writer" value="${dto.qna_writer}" size="30">
	      <input type="hidden" name="qna_number" value="${dto.qna_number}">
	      <input type="hidden" name="pageNum" value="${pageNum}">
	      </td>
	     
	    </tr>
	    <tr>
	      <td>글제목</td>
	      <td>
	      <input type="text" name="qna_title" id="title" value="${dto.qna_title}" size="50">
	      </td>
	    </tr>
	    <tr>
	      <td>글내용</td>
	      <td>
	      <textarea name="qna_content" id="content" rows="10" cols="47">${dto.qna_content}</textarea>
	      </td>
	    </tr>
	    <tr>
	      <td>암호</td>
	      <td>
	      <input type="password" name="qna_pw" id="pw" size="20">
	      <input type="hidden" id="pw2" value="${dto.qna_pw}">
	      </td>
	    </tr>
	    <tr>
	      <td colspan="2" align="center">
	      <input type="submit" value="글수정" onClick="return pwcheck()">
	      <input type="button" value="취소" onClick="location='${ctxpath}/qna/list.do'">
	      </td>
	    </tr>
	  </table>
	</form>
</body>
</html>