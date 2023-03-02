<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/ctxpath.jsp" %>   
<%
   String keyField="";//키 필드 name,subject,content
   String keyWord="";//검색 단어 
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>list.jsp</title>
  
   <link rel="stylesheet" type="text/css" href="${ctxpath}/resources/css/style.css">
   
   <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>

   <script type="text/javascript" src="../resources/js/script.js"></script>
   
  <script type="text/javascript">
  function check(){
		//글검색
		if(!document.searchForm.keyWord.value){
			alert("검색어를 입력 하세요");
			document.searchForm.keyWord.focus();
			return false;
		}
		
		document.searchForm.submit();//list.do
   }//check()-둥
	
   function list(){
		document.listForm.action="list.do";
		document.listForm.submit();//list.jsp
	}
  </script>
</head>
<%
//검색
if(request.getParameter("keyWord") != null){
	keyField=request.getParameter("keyField");
	keyWord=request.getParameter("keyWord");
}

//전체 리스트,'리스트 처음으로'를 클릭할 때 
if(request.getParameter("reload") != null){
	if(request.getParameter("reload").equals("true")){
		keyWord="";
		keyField="";
	}//if-end
}//if-end
%>

<body>
  
   
  <h2>글목록(전체글:${pt.cnt})</h2>
  
  <table>
    <tr>
      <td align="right">
        <a href="${ctxpath}/board/writeForm.do">[글쓰기]</a>
        <a href="javaScript:list()">[리스트처음으로]</a>
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
         <th>조횟수</th>
         <th>ip</th>
       </tr>
       
       <c:forEach var="dto" items="${list}">
         <tr>
           <td>
             ${number}
             <c:set var="number" value="${number-1}"/>
           </td>
           
           <!-- 글제목 -->
           <td>
            <!-- 답글 -->
            <c:if test="${dto.board_re_level>0}">
              <img src="../resources/imgs/level.gif" width="${5*dto.board_re_level}" height="16">
              <img src="../resources/imgs/re.gif">
            </c:if>
           
            <!-- 원글 -->
            <!-- 
            <c:if test="${dto.board_re_level==0}">
              <img src="../resources/imgs/level.gif" width="${5*dto.board_re_level}" height="16">
            </c:if>
             -->
             
            <!-- 글제목을 클릭하면 글내용 보기로 가기  -->
            <a href="${ctxpath}/board/content.do?board_num=${dto.board_num}&pageNum=${pageNum}">
              ${dto.board_subject}
            </a>
            
            <!-- 조횟수가 10번 이상이면 hot.gif출력 -->
            <c:if test="${dto.board_readcount>=10}">
              <img src="../resources/imgs/hot.gif">
            </c:if>
           </td>
           <!-- 글제목 긑 -->
           
           
           <td>${dto.board_writer}</td>
           
           <td>
           <fmt:formatDate value="${dto.board_regdate}" pattern="yyyy/MM/dd"/>
           </td>
           
           <td>${dto.board_readcount}</td>
           <td>${dto.board_ip}</td>
         </tr>
       </c:forEach>
    </table>
  </c:if>
  <!-- 글이 존재 하면-end~~~  -->
  <%--글 검색 --%>
   <form name="searchForm" method="post" action="list.do">
     <table border="1">
       <tr>
         <td align="center" valign="bottom">
           <select name="keyField">
             <option value="board_subject">글제목</option>
             <option value="board_writer">이름</option>
             <option value="board_content">글내용</option>
           </select>
           
           <input type="text" name="keyWord" size="16">
           <input type="hidden" name="page" value="0">
           <input type="button" value="검색" onClick="javaScript:check()">
         </td>
       </tr>
     </table>
   </form>

  <%--listForm, 처음으로 가기, 전체 리스트 --%>
   <form name="listForm" method="post">
     <input type="hidden" name="reload" value="true">
     <input type="hidden" name="nowBlock" value="0">
   </form>
  <%--블럭 처리, 페이지 처리 --%>
  
  <table>
    <tr>
      <td align="center">
      
       <c:if test="${ppp.cnt>0}">
       
         <!-- 이전블럭 -->
         <c:if test="${ppp.startPage>10}">
           [<a href="${ctxpath}/board/list.do?pageNum=${ppp.startPage-10}">이전블럭</a>]
         </c:if>
           
           
         <!-- 페이지 처리 -->
         <c:forEach var="i" begin="${ppp.startPage}" end="${ppp.endPage}">
            [<a href="${ctxpath}/board/list.do?pageNum=${i}">
            ${i}
            </a>]
         </c:forEach>
  
          
         <!--  다음블럭 -->
         <c:if test="${ppp.endPage < ppp.pageCnt}">
          [<a href="${ctxpath}/board/list.do?pageNum=${ppp.startPage+10}">다음블럭</a>]
         </c:if>
       </c:if>
      </td>
    </tr>
  
  </table>
</body>
</html>
