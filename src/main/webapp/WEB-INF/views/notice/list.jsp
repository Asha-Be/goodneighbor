<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/ctxpath.jsp"%>

<%
 String keyword="";
 String keyfield="";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>

 
  <link rel="stylesheet" type="text/css"
	href="${ctxpath}/resources/css/border_list_CSS.css">
  
  


<style type="text/css">
h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 50%;
}
</style>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
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
	  <h3 align="center" >이웃을 위해 행복한 변화를 만들어갑니다.</h3>
	<c:if test="${admin_id !=null }">
		<table id="list_s">
			<tr>
				<td align="right"><a href="${ctxpath}/notice/insertForm.do">새글쓰기</a>
				</td>
			</tr>
		</table>
	</c:if>
	<div id="no_search">
		<c:if test="${pt.cnt==0}"  >
			게시된 글이 없습니다
		</c:if>
	</div>
	<c:if test="${pt.cnt>0}">
		 <table  id="board">
			<tr id="head">
				  <th id="board_num">글번호</th>
		         <th id="board_subject1">글제목</th>
		         <th id="board_writer">작성자</th>
		         <th id="board_day">작성일</th>
		         <th id="board_count">조횟수</th>
			</tr>

			<c:forEach var="dto" items="${fixlist}">
				<c:if test="${dto.notice_fix ==true}">
					<tr>
						<td align="center"  height="100px"><img alt="공지"
							src="${ctxpath}/resources/imgs/notice_icon.png" width="120" height="80">
						</td>

						<td align="left"  height="100px" id="board_subject"><a
							href="${ctxpath}/notice/content.do?notice_number=${dto.notice_number}">
								${dto.notice_title} </a></td>

						<td align="center">${dto.notice_writer}</td>

						<td align="center"><fmt:formatDate value="${dto.notice_regdate}"
								pattern="yyyy/MM/dd" /></td>

						<td align="center">${dto.notice_readcount}</td>
					</tr>
				</c:if>
			</c:forEach>

			<c:forEach var="dto" items="${list}">
				<c:if test="${dto.notice_fix==false}">
					<tr>
						<td align="center"  height="100px">${number} <c:set var="number" value="${number-1}" />
						</td>

						<td id="board_subject"  align="left"><a
							href="${ctxpath}/notice/content.do?notice_number=${dto.notice_number}&pageNum=${pageNum}">
								${dto.notice_title} </a></td>

						<td align="center">${dto.notice_writer}</td>

						<td align="center"><fmt:formatDate value="${dto.notice_regdate}"
								pattern="yyyy/MM/dd" /></td>

						<td align="center">${dto.notice_readcount}</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</c:if>
	<form name="searchForm" method="post"
		action="${ctxpath}/notice/list.do">
		<table border="1"   id="search" height ="70px">
			<tr>
				<td align="center" valign="bottom"><select name="keyfield"  id="select_option">
						<option value="notice_title">글제목</option>
						<option value="notice_content">글내용</option>
				</select> <input class="search__input" type="text" name="keyword" size="16"> <input
					type="hidden" name="pageNum" value="1"> <input
					type="button" value="search" onClick="javaScript:check()">
				</td>
			</tr>
		</table>
	</form>
	<table>
		<tr align="center">
			<td><c:if test="${pt.cnt>0}">
					<!-- 이전블럭 -->
					<c:if test="${pt.startPage>10 }">
	          [<a
							href="${ctxpath}/notice/list.do?pageNum=${pt.startPage-10}">이전블럭</a>]
	        </c:if>

					<!-- 페이지 -->

					<c:forEach var="i" begin="${pt.startPage}" end="${pt.endPage}">
	          [<a
							href="${ctxpath}/notice/list.do?pageNum=${i}&keyfield=${keyfield}&keyword=${keyword}">
							${i} </a>]
	        </c:forEach>

					<c:if test="${pt.endPage<pt.pageCnt}">
	          [<a
							href="${ctxpath}/notice/list.do?pageNum=${pt.startPage+10}">다음블럭</a>]
	        </c:if>
				</c:if></td>
		</tr>
	</table>
</body>
</html>