<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Content</title>
	<style type="text/css">
		h2{
		text-align: center;
		}
		
		table{
		margin: auto;
		width: 50%;
		}
	</style>	
</head>
<body>
	<h2>글내용 보기</h2>
	<table border="1">
	  <tr>
	    <td>글번호</td>
	    <td>${dto.qna_number}</td>
	    <td>조회수</td>
	    <td>${dto.qna_readcount}</td>
	  </tr>
	  <tr>
	    <td>작성자</td>
	    <td>${dto.qna_writer}</td>
	    
	    <td>작성일</td>
	    <td><fmt:formatDate value="${dto.qna_regdate}" pattern="yyyy-MM-dd"/></td>
	  </tr>
	  <tr>
	    <td>글제목</td>
	    <td colspan="3">
	    ${dto.qna_title}
	    </td>
	  </tr>
	  
	  <tr height="100">
	    <td>글내용</td>
	    <td colspan="3">
	    <pre>${dto.qna_content}</pre>
	    </td>
	  </tr>
	  
	  <tr>
	    <td colspan="4" align="right">
	    <input type="button" value="글수정" onClick="location='${ctxpath}/qna/editForm.do?qna_number=${dto.qna_number}&pageNum=${pageNum}'">
	    <input type="button" value="글삭제" onClick="location='${ctxpath}/qna/deleteForm.do?qna_number=${dto.qna_number}&pageNum=${pageNum}'">
	    <input type="button" value="새글쓰기" onClick="location='${ctxpath}/qna/insertForm.do'">
	    <input type="button" value="답글쓰기" onClick="location='${ctxpath}/qna/insertForm.do?qna_number=${dto.qna_number}&qna_ref=${dto.qna_ref}&qna_step=${dto.qna_step}&qna_level=${dto.qna_level}'">
	    <input type="button" value="리스트" onClick="location='${ctxpath}/qna/list.do?pageNum=${pageNum}'">
	    </td>
	  </tr>
	</table>
</body>
</html>