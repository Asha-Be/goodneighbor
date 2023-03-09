<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


 <link rel="stylesheet" type="text/css"
	href="${ctxpath}/resources/css/search_result_CSS.css">

<title>Insert title here</title>
</head>
<body>
	<div id="result" align="center">
	
			<c:choose>                                                                          
            <c:when test="${empty dto}">                                                 
                <p>조회결과가 없습니다.</p>                                        
            </c:when>                                                                         
            <c:otherwise>                                                                     
                <p>${dto.member_name}님이 설정하신 비밀번호는 ${dto.member_pw} 입니다.</p>                                              
            </c:otherwise>                                                                    
        </c:choose>             
    </div>    
	<div align="center">
		<input type="button" class="Bu" value="로그인" onClick="location='${ctxpath}/member/loginForm.do'">
		<input type="button" class="else_B" value="다시 검색" onClick="location='${ctxpath}/member/search_main.do'">
		<input type="button" class="else_B" value="메인화면으로" onClick="location='${ctxpath}'">
	</div>
</body>
</html>