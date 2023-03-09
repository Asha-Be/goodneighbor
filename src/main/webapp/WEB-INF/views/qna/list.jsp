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
	
	  
  <link rel="stylesheet" type="text/css"
	href="${ctxpath}/resources/css/border_list_CSS.css">
  
  
</head>
<body>
<h2>Q&A 게시판</h2>
  <h3 align="center" >Q&A 게시판을 통해 궁금증을 해결하세요</h3>

<c:if test="${member_id != null || admin_id !=null }">
	<table id="list_s">
	<tr>
	  <td align="right">
	  <a href="${ctxpath}/qna/insertForm.do">글쓰기</a>
	  </td>
	</tr>
</table>
</c:if>
  <c:if test="${pt.cnt==0}">
 	게시된 글이 없습니다
  </c:if>
  
  <c:if test="${pt.cnt>0 }">
  <table  id="board1">
  	<tr id="head">
  	  <th id="board_num">글번호</th>
  	  <th id="board_subject1">글제목</th>
  	  <th id="board_writer">작성자</th>
  	  <th id="board_day">작성일</th>
  	  <th id="board_count">조회수</th>
  	</tr>
  	
  	<c:forEach var="dto" items="${list}">
  	<tr>
  	  <td>
  	  ${number}
  	  <c:set var="number" value="${number-1}"/> <!-- 글번호 역순 -->
  	  </td>	
  	  
  	  <!-- 글제목 -->
  	  <td id="board_subject">
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
  	 
  	  <c:if test="${admin_id != null}">
  	   <a href="${ctxpath}/qna/content.do?qna_number=${dto.qna_number}&qna_pw=${dto.qna_pw}&pageNum=${pageNum}" id="none_color">
  	  	${dto.qna_title}
  	   </a>
 	  </c:if>
 	  <c:if test="${admin_id == null }">
 	  <a href="${ctxpath}/qna/secretForm.do?qna_number=${dto.qna_number}&qna_pw=${dto.qna_pw}&pageNum=${pageNum}">
  	  <img src="${ctxpath}/resources/imgs/lock.png" width="25" height="25" id="none_color">비밀글입니다
  	  <input type="hidden" name="qna_title" value="${dto.qna_title}">
  	  </a>
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