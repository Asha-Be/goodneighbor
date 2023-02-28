<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="../module/ctxpath.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertForm_admin</title>

 <script type="text/javascript" src="${ctxpath}/resources/js/admin_insertForm/checkAll.js"></script>
 <script src="//t1.daumcdn.net/tistory_admin/lib/jquery/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
 
 
	<style type="text/css">
	table{
	text-align : center;
	}
	</style>

   
   <script>
 


   </script>

</head>
<body>
<h1>관리자 회원가입</h1>

	<form  method="POST" action="${ctxpath}/admin/insertPro.do" onsubmit="return adminCheck()">
	
		<table align="center">
			<tr>
				<td>
					아이디
				</td>
				<td>
					<input type="text" name="admin_id" id="admin_id" size="20" placeholder="6-12자의 영문 대소문자, 숫자">
					<input type="button" value="ID중복 체크" onclick="confirmIdCheck();return false;">
				</td>
				<td>
					<span id="olmessage"></span>
				</td>
			</tr>
			
			<tr>
				<td>
					비밀번호
				</td>
				<td>
				<input type="text" name="admin_pw" id="admin_pw" size="20" placeholder="8~15자리의 영문 대소문자, 숫자, 특수문자">
				</td>
				<br>
				
				<td>
					<span id="password-error" style="color:red;"></span>
				</td>
			</tr>
			
			<tr>
				<td>
					비밀번호 재입력
				</td>
				<td>
				<input type="text" name="admin_pw2" id="admin_pw2" size="20" onblur="confirmPwCheck();return false;">	
				
				</td>
			</tr>
			
			<tr>
				<td>
					이름
				</td>
				<td>
				<input type="text" name="admin_name" id="admin_name" size="20" value="관리자" readonly>
				
				</td>
			</tr>
			
			<tr>
				<td>
					전화번호
				</td>
				<td>
				<input type="text" name="admin_tel" id="admin_tel" size="20"size="30" placeholder="휴대폰 번호 입력('-'제외)" onblur="confirTelCheck(); return false;">
				
				</td>
			</tr>
			
			  <tr>
				   	<td colspan="2">
					
						<input type="submit" value="가입하기" >
					
					</td>
					
				</tr>
			
			
		</table>
	</form>


</body>
</html>