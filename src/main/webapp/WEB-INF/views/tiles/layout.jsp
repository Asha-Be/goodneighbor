<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="proPath" value="${pageContext.request.contextPath}"/>
<c:set var="resPath" value="${pageContext.request.contextPath}/resources"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources/product/jungho"/>

<!-- Html ----------------------------------------------------------------------------------------->
<!doctype html>
<html lang="en, ko">

  <body>
   <table border="1" style="width: 100%; min: 400px;">
    <tr>
     <td>
      <tiles:insertAttribute name="header"/>
     </td>
    </tr>
    <tr>
      <td valign="top"  height="800">
        <tiles:insertAttribute name="content"/>
      </td>
    </tr>
    
    <tr>
     <td colspan="2" height="100">
      <tiles:insertAttribute name="footer"/>
     </td>
    </tr>
   </table> 
  </body>


</html>