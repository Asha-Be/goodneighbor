<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호찾기_전화번호입력창</title>

<script type="text/javascript">
function pwCheck(){
	
	
	if(document.search_pwd_next.search_tel_name.value==''){
		alert("이름을 입력해 주세요.");
		document.pw_search.writeID_search_pw.focus();
		return false;
	}
	
	if(document.search_pwd_next.search_tel_number.value==''){
		alert("전화번호를 입력해 주세요.");
		document.pw_search.search_tel_number.focus();
		return false;
	}
	
	if(confirm("비밀번호를 찾으시겠습니까?")) {
		 
		$("#search_pwd_next").submit();
		 
		return false;
		}
		
}
</script>
</head>
<body>

<form name="search_pwd_next" action="search_pwd_next" method="POST" onSubmit="return pwCheck()">
<h1>비밀번호</h1>
<div class="id_search_checkbox">
	<input type="radio" name="for_search_id" id="search_tel" checked>회원정보에 등록한 휴대전화 번호로 찾기
	
	<br>회원 정보에 등록한 휴대전화 번호와 입력하신 휴대전화 번호가 같아야 아이디를 찾을 수 있습니다.
	<br>
	<br>
	
	이름<input type="text" name="search_tel_name" id="search_tel_name" size="20">
	휴대전화 <input type="text" name="search_tel_number" id="search_tel_number" size="20">
	<input type="hidden" name="search_tel_id" value="${dto.member_id}">
	
	<hr>
	<input type="radio" name="for_search_id" id="search_email">이메일에 등록한 휴대전화 번호로 찾기
	
</div>

<div align = "center">
	<input type="submit" name="search" value="아이디 찾기">
</div>


</form>
</body>
</html>