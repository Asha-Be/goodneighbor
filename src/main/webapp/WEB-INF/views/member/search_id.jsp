<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search_id</title>


<link rel="stylesheet" type="text/css"
	href="${ctxpath}/resources/css/searchTel_Name_CSS.css">


<script type="text/javascript">
function idpwCheck(){
	
	
	if(document.id_search.search_tel_name.value==''){
		alert("이름을 입력해 주세요.");
		document.id_search.search_tel_name.focus();
		return false;
	}
	
	 
	if(document.id_search.search_tel_number.value==''){
		alert("전화번호를 입력해 주세요.");
		document.id_search.search_tel_number.focus();
		return false;
	}
	
	if(confirm("아이디를 찾으시겠습니까?")) {
		 
		$("#id_search").submit();
		 
		return false;
		}
}

</script>


</head>
<body>

<!-- 아이디 찾기 창 -->

<form name="id_search" id="id_search" action="${ctxpath}/member/search_id_pro" method="POST" onSubmit="return idpwCheck()">
<h1 align ="center">아이디 찾기</h1>
<div class="id_search_checkbox"  id="search_pwd" >
	<input type="radio" name="for_search_id" id="search_tel" checked>회원정보에 등록한 휴대전화 번호로 찾기
	
	<div id="br">
	<br>회원 정보에 등록한 휴대전화 번호와 입력하신 휴대전화 번호가 같아야 아이디를 찾을 수 있습니다.
	</div>
	<br>
	<br>
	
	이름<input type="text" name="search_tel_name" id="search_tel_name" size="20">
	휴대전화 <input type="text" name="search_tel_number" id="search_tel_number" size="20">
	
	
	<hr>
	<input type="radio" name="for_search_id" id="search_email">이메일에 등록한 휴대전화 번호로 찾기
	
</div>

<div align = "center">
	<input type="submit" name="search" value="아이디 찾기">
</div>


</form>



</body>
</html>