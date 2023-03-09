<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../module/ctxpath.jsp" %>
<c:set var="proPath" value="${pageContext.request.contextPath}"/>
<c:set var="resPath" value="${pageContext.request.contextPath}/resources"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources/product/jungho"/>


<!-- Html ----------------------------------------------------------------------------------------->
<!doctype html>
<html lang="en, ko">

  <!-- Head --------------------------------------------------------------------------------------->
  <head>
     <!-- meta -->
    <title> productInsert </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- link -->
    <!--  
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@400;500&display=swap"/>-->
    <link rel="shortcut icon" href="${srcPath}/imgs/etc/fav.jpg"/>
    <link rel="stylesheet" href="${srcPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${srcPath}/css/all.min.css"/>
    <link rel="stylesheet" href="${srcPath}/css/animate.css"/>
    <link rel="stylesheet" href="${srcPath}/plugins/slider/css/owl.carousel.min.css"/>
    <link rel="stylesheet" href="${srcPath}/plugins/slider/css/owl.theme.default.css"/>
    <link rel="stylesheet" href="${srcPath}/css/style.css"/>
    <!-- script --><!-- 
    <script defer src="${srcPath}/js/jquery-3.2.1.min.js"></script> 
    <script defer src="${srcPath}/js/popper.min.js"></script>
    <script defer src="${srcPath}/js/bootstrap.min.js"></script>
    <script defer src="${srcPath}/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>-->
    <script defer src="${srcPath}/plugins/slider/js/owl.carousel.min.js"></script>
    <script defer src="${srcPath}/js/daum.js" ></script>
    <script defer src="${srcPath}/js/product.js"></script>
    <script>
    function updateMember(){
      document.updateMember.action="${pageContext.request.contextPath}/member/updateMember.do";
      document.updateMember.submit();
    }
    function deleteMember(){
      document.delForm.action="${pageContext.request.contextPath}/member/deleteForm.do";
      document.delForm.submit();
    }
    </script>
  </head>
  <!-- /Head -->

  <!-- Body --------------------------------------------------------------------------------------->
  <body>

    <!-- Header ----------------------------------------------------------------------------------->
    <header class="container-fluid">
      <div class="header-top">
        <div class="container">
          <div class="row col-det">
            <div class="col-lg-6 d-none d-lg-block">
              <ul class="ulleft">
                <li>
                  <i class="far fa-envelope"></i> www.goodneighbor.com <span>|</span>
                </li>
                <li>
                  <i class="fas fa-phone-volume"></i> 010-1234-5678
                </li>
              </ul>
            </div>
            <div class="col-lg-3 col-md-6 follows">
              <ul class="ulright">
                <form name="updateMember" method="post">
                  <input type="hidden" name="member_id" value="${member_id}">
                </form>
                <li> <i class="fab fa-facebook-square" onClick="location.href='https://ko-kr.facebook.com'"></i> </li>
                <li> <i class="fab fa-twitter-square" onClick="location.href='https://twitter.com/?lang=ko'"></i> </li>
                <li> <i class="fab fa-instagram" onClick="location.href='https://www.instagram.com/'"></i> </li>
                <li> <i class="fab fa-linkedin"></i> </li>
              </ul>
            </div>
            <!-- 로그인 x -->
            <c:if test="${member_id==null && admin_id==null}">
              <div class="col-lg-3 d-none d-md-block col-md-6 btn-bhed">
                <button class="btn btn-sm btn-success" onClick="location.href='${ctxpath}/member/loginForm.do'">
                  로그인
                </button>
                <button class="btn btn-sm btn-default" onClick="location.href='${ctxpath}/member/insertForm.do'">
                  회원가입
                </button>
              </div>
            </c:if>
            <!-- 로그인 o -->
            <c:if test="${member_id!=null}">
              <div class="col-lg-3 d-none d-md-block col-md-6 btn-bhed">
              ${member_name}님 어서오세요&nbsp;
                <button class="btn btn-sm btn-success" onClick="location.href='${ctxpath}/member/logOut.do'">
                  로그아웃
                </button>
                <button class="btn btn-sm btn-default" onClick="location.href='javaScript:updateMember()'">
                  내정보 변경
                </button>
              </div>
            </c:if>
            <!-- 관리자 로그인 o -->
            <c:if test="${admin_id!=null}">
              <div class="col-lg-3 d-none d-md-block col-md-6 btn-bhed">
               ${admin_name}님 어서오세요&nbsp;
                <button class="btn btn-sm btn-success" onClick="location.href='${ctxpath}/admin/logOut.do'">
                  로그아웃
                </button>
                <button class="btn btn-sm btn-default" onClick="location.href='${ctxpath}/product/listProduct'">
                  상품관리
                </button>
              </div>
            </c:if>
          </div>
        </div>
      </div>
      <div id="menu-jk" class="header-bottom">
        <div class="container">
          <div class="row nav-row">
            <div class="col-lg-3 col-md-12 logo">
              <a href="${ctxpath}">
                <img src="${ctxpath}/resources/imgs/main2.png" height="60">
                <a data-toggle="collapse" data-target="#menu" href="#menu">
                <i class="fas d-block d-lg-none  small-menu fa-bars"></i>
                </a>
              </a>
            </div>
            <div id="menu" class="col-lg-9 col-md-12 d-none d-lg-block nav-col">
              <ul class="navbad">
                <li class="nav-item">
                  <a class="nav-link" href="${pageContext.request.contextPath}">
                    홈
                  </a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="${pageContext.request.contextPath}/notice/list.do">
                    공지사항
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="${pageContext.request.contextPath}/board/list.do">
                    About us
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="${pageContext.request.contextPath}/product/listProduct.do">
                    후원하기
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="${pageContext.request.contextPath}/qna/list.do">
                    Q&A
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="${ctxpath}">
                    Contact us
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </header>


	</body>
</html>