<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search_result_id</title>
</head>
<body>
	<c:choose>                                                                          
            <c:when test="${empty dto}">                                                 
                <p>조회결과가 없습니다.</p>                                        
            </c:when>                                                                         
            <c:otherwise>                                                                     
                <p>${dto.member_name}님의 아이디는 ${dto.member_id} 입니다.</p>                                              
            </c:otherwise>                                                                    
        </c:choose>             
        
	<div>
		<input type="button" value="로그인" onClick="location='${ctxpath}/member/loginForm.do'">
	</div>
	

	<div>
		<input type="button" value="메인화면으로" onClick="location='${ctxpath}'">
	</div>
</body>
</html>