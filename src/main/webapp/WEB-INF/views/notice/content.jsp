<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/ctxpath.jsp"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../resources/css/contents_CS12.css">
<style type="text/css">

<style type="text/css">
h2 {
	text-align: center;
}

table {
margin: auto;
margin-top : 50px;
}
hr{
margin:auto;
}

</style>
</head>
<body>
	<h1 align="center">공지사항</h1>
	  <h3 align="center" >이웃을 위해 행복한 변화를 만들어갑니다.</h3>
		<table>
			<tr id="id" >
						
			<td colspan="7"  id="content_subject" color="#C8E6C9"> &nbsp; &nbsp;${dto.notice_title}</td>
				
			</tr>
		
		
		
		<!-- 
				<tr>
				
					<td >${dto.notice_number}</td>
				</tr>
		 -->
				<tr class="id">
					<td class="td_subject" align="center">작성자</td>
						<td colspan="2" width="700" >${dto.notice_writer}</td>
		
		
					<td colspan="3" align="right" class="td_subject">조회수 &nbsp;&nbsp;&nbsp; </td>
					<td width="200">${dto.notice_readcount}</td>
				</tr>
				
	
		

		<tr id="subject" class="id">
		<!-- 
			<td align="center">글내용</td>
		 -->
			<td colspan="7" id="content" height="400px"><pre>${dto.notice_content}</pre></td>
		</tr>
		</table>
		
		<hr width="1250px;">
		<table>

			<tr id="buttons">
			<td colspan="8" align="right"><c:if test="${admin_id !=null }"> 
	    [<a
						href="${ctxpath}/notice/editForm.do?notice_number=${dto.notice_number}&pageNum=${pageNum}">글수정</a>]&nbsp;
	    <c:if test="${dto.notice_fix==false}">
	    [<a
							href="${ctxpath}/notice/deletePro.do?notice_number=${dto.notice_number}&pageNum=${pageNum}">글삭제</a>]&nbsp;
	    </c:if>
					<c:if test="${dto.notice_fix==true}">
	    [<a
							href="${ctxpath}/notice/deletePro.do?notice_number=${dto.notice_number}">글삭제</a>]&nbsp;
	    </c:if>
	    [<a href="${ctxpath}/notice/insertForm.do">글쓰기</a>]&nbsp;
	    </c:if> [<a href="${ctxpath}/notice/list.do">리스트</a>]&nbsp;</td>
		</tr>
	</table>
</body>
</html>