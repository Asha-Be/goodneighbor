<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/ctxpath.jsp" %>
<% 
 String keyword="";
 String keyfield="";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
 function check(){
	 if(!document.searchForm.keyword.value){
		 alert("검색어를 입력하세요");
		 document.searchForm.keyword.focus();
		 return false
	 } 
	 document.searchForm.submit();
 }
</script>
</head>
<%
if(request.getParameter("keyword")!=null){
  	keyfield=request.getParameter("keyfield");
  	keyword=request.getParameter("keyword");
}
%>
<body>
<h2>공지사항</h2>
	<form name="searchForm" method="post" action="${ctxpath}/notice/search.do">
		<table align="center" valign="bottom">
			  <tr>
			    <td align="center">
			      <select name="keyfield">
			        <option value="notice_title">글제목</option>
			        <option value="notice_content">글내용</option>
			      </select>
			      <input type="text" name="keyword" size="16">
			      <input type="hidden" name="pageNum" value="${pageNum}">
			      <input type="button" value="search" onClick="javaScript:check()">
			    </td>
			  </tr>
		</table>
	</form>
	<table>
	 	<tr>
	 	  <td align="right">
	 	  <a href="${ctxpath}/notice/insertForm.do">새글쓰기</a>
	 	  </td>
	 	</tr>
	</table>
	
	<c:if test="${pt.cnt==0}">
		게시된 글이 없습니다
	</c:if>
	
	<c:if test="${pt.cnt>0}">
	
	<table border="1">
	  <tr>
	    <th>글번호</th>
	    <th>글제목</th>
	    <th>작성자</th>
	    <th>작성일</th>
	    <th>조회수</th>
	  </tr>
	
	  <c:forEach var="dto" items="${list}">
	  	<tr>
	  	  <td>
	  	  ${number}
	  	  <c:set var="number" value="${number-1}"/>
	  	  </td>
	  	
	  	  <td>
	  	  <a href="${ctxpath}/notice/content.do?notice_number=${dto.notice_number}&pageNum=${pageNum}">
	  	  ${dto.notice_title}
	  	  </a>
	  	  </td>
	  	  
	  	  <td>
	  	  ${dto.notice_writer}
	  	  </td>
	  	  
	  	  <td>
	  	  <fmt:formatDate value="${dto.notice_regdate}" pattern="yyyy/MM/dd"/>
	  	  </td>
	  	  
	  	  <td>
	  	  ${dto.notice_readcount}
	  	  </td>
	  	  
	  	</tr>
	  </c:forEach>
	</table>
	</c:if>
	
	<table>
	  <tr align="center">
	    <td>
	      <c:if test="${pt.cnt>0 }">
	        <!-- 이전블럭 -->
	        <c:if test="${pt.startPage>10 }">
	          [<a href="${ctxpath}/notice/search.do?pageNum=${pt.startPage-10}">이전블럭</a>]
	        </c:if>
	       
	        <!-- 페이지 -->
	       
	        <c:forEach var="i" begin="${pt.startPage	}" end="${pt.pageCnt}">
	          [<a href="${ctxpath}/notice/search.do?pageNum=${i}&keyword=${keyword}&keyfield=${keyfield}">
	          ${i}
	          </a>]
	          
	        </c:forEach>
	        	       
	        <c:if test="${pt.endPage<pt.pageCnt}">
	          [<a href="${ctxpath}/notice/search.do?pageNum=${pt.startPage+10}">다음블럭</a>]
	        </c:if>
	     
	      </c:if>
	    </td>
	  </tr>
	</table>
</body>
</html>