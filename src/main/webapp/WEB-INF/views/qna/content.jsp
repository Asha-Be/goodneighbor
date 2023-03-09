<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>



<link rel="stylesheet" type="text/css" href="../resources/css/contents_CS12.css">
<style type="text/css">

<meta charset="UTF-8">
<title>Content</title>
	<style type="text/css">
		h2{
		text-align: center;
		}
		
		table {
margin: auto;
margin-top : 50px;
}
	</style>	
</head>
<body>

	<h1 align="center">QNA</h1>
	  <h3 align="center" >Q&A 게시판을 통해 궁금증을 해결하세요</h3>
	
	<table class="content"  id="content_table" width="1100px" >
		
			<tr class="id">
						
				<td colspan="7" id="content_subject"> &nbsp; &nbsp;${dto.qna_title}</td>
				
			</tr>
		
	 <tr class="id">
	  <!-- 
	    <td>글번호</td>
	    <td>${dto.qna_number}</td>
	     -->
	  	  
	    <td class="td_subject">작성자</td>
	    <td>${dto.qna_writer}</td>
	    
	   <td class="td_subject">조회수</td>
	    <td>${dto.qna_readcount}</td>
	  <td class="td_subject">작성일</td>
	    <td><fmt:formatDate value="${dto.qna_regdate}" pattern="yyyy-MM-dd"/></td>
	  </tr>
	  <!-- 
	  <tr>
	    <td>글제목</td>
	    <td colspan="3">
	    ${dto.qna_title}
	    </td>
	  </tr>
	   -->
	 <tr id="subject" class="id">
	  <!-- 
	    <td align="center">글내용</td>
	     -->
	    <td colspan="6"  id="content" height="400px">
	    <pre>${dto.qna_content}</pre>
	    </td>
	  </tr>
	  
	  
	  <tr class="id">
	    <td colspan="6" align="right">
	    <c:if test="${member_id !=null}">
	    <input type="button" value="글수정" onClick="location='${ctxpath}/qna/editForm.do?qna_number=${dto.qna_number}&pageNum=${pageNum}'">
	    <input type="button" value="글삭제" onClick="location='${ctxpath}/qna/deleteForm.do?qna_number=${dto.qna_number}&pageNum=${pageNum}'">
	    </c:if>
	    <input type="button" value="새글쓰기" onClick="location='${ctxpath}/qna/insertForm.do'">
	    <c:if test="${admin_id != null }">
	    <input type="button" value="답변작성" onClick="location='${ctxpath}/qna/insertForm.do?qna_number=${dto.qna_number}&qna_ref=${dto.qna_ref}&qna_step=${dto.qna_step}&qna_level=${dto.qna_level}&qna_pw=${dto.qna_pw}'">
	    </c:if>
	    <input type="button" value="리스트" onClick="location='${ctxpath}/qna/list.do?pageNum=${pageNum}'">
	    </td>
	  </tr>
	</table>
</body>
</html>