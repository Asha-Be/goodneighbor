<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../module/ctxpath.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${ctxpath}/resources/js/check.js"></script>
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
  <c:if test="${qna_number==0}">
	<h2>QnA게시글 작성</h2>
	</c:if>
	<c:if test="${qna_number!=0}">
	<h2>QnA 답변</h2>
	</c:if>
	  <form method="post" action="${ctxpath}/qna/insertPro.do" onSubmit="return check()">
	  <input type="hidden" name="qna_number" value="${qna_number}">
	  <input type="hidden" name="qna_step" value="${qna_step}">
	  <input type="hidden" name="qna_level" value="${qna_level}">
	  <input type="hidden" name="qna_ref" value="${qna_ref}">
		<table border="1">
		  <tr>
		    <td>글쓴이</td>
		  
		    <td>
		    <c:if test="${member_id != null }">
		    <input type="text" name="qna_writer" id="writer" size="30">
		    </c:if>
		    
		    <c:if test="${admin_id != null }">
		    <input type="text" name="qna_writer" id="writer" size="30" value="관리자">
		    </c:if>
		    </td>
		    
		  </tr>
		  
		  <tr>
		    <td>글제목</td>
		    <td>
		    <input type="text" name="qna_title" id="title" size="30">
		    </td>
		  </tr>
		  
		  <tr>
		    <td>내용</td>
		    <td>
		    <textarea name="qna_content" rows="10" cols="50"></textarea>
		    </td>
		  </tr>
		  
		  <tr>
		    <td>게시글 암호</td>
		     <td>
		  	<c:if test="${member_id !=null }">
		  		<input type="password" name="qna_pw" id="pw" size="30">
		    </c:if>
		    
		    <c:if test="${qna_number != 0}">
		    <c:if test="${admin_id !=null }">
		    	<input type="password" name="qna_pw" id="pw" size="30" value="${qna_pw}">
		    </c:if>
		    </c:if>
		    </td>
		  </tr>
		  <tr>
		    <td colspan="2" align="center">
		    <c:if test="${qna_number==0}">
		      <input type="submit" value="글쓰기">
		      </c:if>
		    <c:if test="${qna_number != 0}">
		      <input type="submit" value="답변작성">
		    </c:if>
		      <input type="button" value="취소" onClick="location='${ctxpath}/qna/list.do'">
		    </td>
		    
		  </tr>
		</table> 
	  </form>
</body>
</html>