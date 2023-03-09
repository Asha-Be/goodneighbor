<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" type="text/css"
	href="${ctxpath}/resources/css/member_main_CSs.css">
<style type="text/css">
table{
margin: auto;
}
</style>
</head>
<body>

<table align="center" class="buttons">
	<tr>
		<td>
			<input type="button" onclick="location='${ctxpath}/member/search_id.do'" value="아이디 찾기">
		</td>
		<td>
			<input type="button" onclick="location='${ctxpath}/member/search_pwd.do'" value="비밀번호 찾기">
		</td>
	</tr>
</table>

</body>
</html>