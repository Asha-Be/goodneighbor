<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../module/ctxpath.jsp" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="${ctxpath}/resources/css/loginForm_CSS_admin.css">
	

<script type="text/javascript">
function idpwCheck(){
	if(document.adminlogin.admin_id.value==''){
		alert("아이디를 입력하세요.");
		document.adminlogin.admin_id.focus();
		return false;
	}
	
	if(document.adminlogin.admin_pw.value==''){
		alert("비밀번호를 입력하세요.");
		document.adminlogin.admin_pw.focus();
		return false;
	}
}

</script>

</head>
<body>

	<c:remove var="member_id" scope="session"/>
	<c:remove var="member_name" scope="session"/>
	
<form action="${ctxpath}/admin/loginPro.do" method="post" name="adminlogin" onsubmit="return idpwCheck()">
	<h2 align="center" class="admin">관리자 로그인</h2>
	<table>
		<tr>
			<td>
				<input type="text" name="admin_id" id="admin_id" placeholder="아이디 입력" >
			</td>
			
			</tr>
			
			<tr>
			<td>
				<input type="password" name="admin_pw" id="admin_pw" placeholder="비밀번호 입력">
			</td>
		</tr>
		
		<tr>
			<td class="submit_id">
				<input type="submit" id="submit_button"  value="로그인">
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="관리자 회원가입" onClick="location='${ctxpath}/admin/insertForm.do'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>