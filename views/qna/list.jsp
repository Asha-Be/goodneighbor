<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/ctxpath.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
    <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript" src="../resources/js/check.js"></script>
    <style type="text/css">
	h2{
	text-align: center;
	}
	
	table{
	margin: auto;
	width: 50%;
	text-align: center;
	}
	</style>	
</head>
<body>
<h2>Q&A(${cnt})</h2>

<table>
	<tr>
	  <td align="right">
	  <a href="${ctxpath}/qna/insertForm.do">글쓰기</a>
	  </td>
	</tr>
</table>

  <c:if test="${pt.cnt==0}">
 	게시된 글이 없습니다
  </c:if>
  
  <c:if test="${pt.cnt>0 }">
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
  	  <c:set var="number" value="${number-1}"/> <!-- 글번호 역순 -->
  	  </td>	
  	  
  	  <!-- 글제목 -->
  	  <td>
  	  <!-- 답글 -->
  	  <c:if test="${dto.qna_level>0}">
  	  	<img src="../resources/imgs/level.gif" width="${5*dto.qna_level}" height="16">
  	  	<b>[답변]</b>
  	  </c:if>
  	  
  	  <!-- 원글 -->
  	  <c:if test="${dto.qna_level==0}">
  	  	<img src="../resources/imgs/level.gif" width="${5*dto.qna_level}" height="16">
  	  </c:if>
  	  <!-- 글 제목 클릭하면 글내용보기로 이동 -->
  	  <a href="${ctxpath}/qna/content.do?qna_number=${dto.qna_number}&pageNum=${pageNum}">
  	  <img src="${ctxpath}/resources/imgs/lock.png" width="25" height="25">비밀글입니다
  	  <input type="hidden" name="qna_title" value="${dto.qna_title}">
  	  </a>
  	  <!-- 조회수 10번 이상이면 hot.gif출력-->
  	  <c:if test="${dto.qna_readcount>=10}">
  	  	<img src="../resources/imgs/hot.gif">
  	  </c:if>
  	  </td>
  	
  	  <td>${dto.qna_writer}</td>
  	  <td>
  	  <fmt:formatDate value="${dto.qna_regdate}" pattern="yyyy-MM-dd"/>
  	  </td>
  	  <td>${dto.qna_readcount}</td>
  	  </tr>
  	</c:forEach>
  </table>
  </c:if>
	<!-- 글이 존재하면 -->
	
	<!-- 블럭 처리, 페이지 처리 -->
	<table>
		<tr>
		  <td>
		   <c:if test="${pt.cnt>0}">
		   	<!-- 이전 블럭 -->
		   	<c:if test="${pt.startPage>10}">
		   		[<a href="${ctxpath}/qna/list.do?pageNum=${pt.startPage-10}">이전블럭</a>]
		   	</c:if>
		   	<!-- 페이지 처리 -->
		   	<c:forEach var="i" begin="${pt.startPage}" end="${pt.endPage}">
		   	[<a href="${ctxpath}/qna/list.do?pageNum=${i}">
		   	${i}
		   	</a>]
		   	</c:forEach>
		   	<!-- 다음 블럭 -->
		   	<c:if test="${pt.endPage<pt.pageCnt}">
		   	[<a href="${ctxpath}/qna/list.do?pageNum=${pt.startPage+10}">다음블럭</a>]
		   	</c:if>
		   </c:if>
		  </td>
		</tr>
	</table> 
</body>
</html>