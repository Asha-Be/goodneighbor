<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_logOut</title>
</head>
<body>

	
	<c:remove var="admin_id" scope="session"/>
	<c:remove var="admin_name" scope="session"/>
	<meta http-equiv="Refresh" content="0;url=${ctxpath}">

</body>
</html>