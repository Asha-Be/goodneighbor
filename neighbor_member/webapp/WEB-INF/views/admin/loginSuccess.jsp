<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin loginSuccess</title>
</head>
<body>
	 <c:set var="admin_id" value="${dto.admin_id}" scope="session"/>
	 <c:set var="admin_name" value="${dto.admin_name}" scope="session"/>
	<meta http-equiv="Refresh" content="0;url=${ctxpath}">
</body>
</html>