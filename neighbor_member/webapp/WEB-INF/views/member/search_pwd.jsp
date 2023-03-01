<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<script type="text/javascript">
function pwCheck(){
	
	
	if(document.pw_search.writeID_search_pw.value==''){
		alert("아이디를 입력해 주세요.");
		document.pw_search.writeID_search_pw.focus();
		return false;
	}
	
	
}

</script>

</head>
<body>
<!-- 암호 찾기 창 -->

<form name="pw_search" action ="${ctxpath}/member/search_pwd.do" method="POST" align = "center" onSubmit="return pwCheck()">

<div class="pw_search_checkbox">
	
	비밀번호를 찾고자 하는 아이디를 적어주세요.
	<br>	
	<input type="text" name="writeID_search_pw" id="writeID_search_pw" size="30">
	<br>	
	<input type="submit" name="search" value="다음">
	<!-- form >pro > form>pro로 controller이랑 왓다갓다 해야하는걸지도.... -->
<hr>
</div>
<div align="center">
	아이디가 기억나지 않는다면?<a href="search_id.do">아이디 찾기</a>
</div>


</form>

</body>
</html>