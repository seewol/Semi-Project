<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	html, body{width: 100%; height: 100%; margin: 0; padding: 0;}
	body {font-family: 'Inter', sans-serif; min-width: 1920px;}
	header{margin: 0; padding: 0;}
	#login{display: flex; position: relative; align-items: center; justify-content: space-between; vertical-align: middle; text-align: center;}
	#login>ul{margin-right: 100px;}
	#login>ul>li{
		display: inline-block; 
		font-size: 13px; font-weight: bold; 
		margin-right: 5%; margin-left: 5%; 
		width: 75px;
	}
	#login>ul>li>a{text-decoration: none; color: black;}
	#logo{height: 50px; width: 140px; margin-left: 100px;}
	#mainCategory a{
		margin-bottom: 10px; margin-top: 10px; margin-right: 25px; margin-left: 25px;
		font-size: 17px; font-weight: bold;
	}
</style>
</head>
<body>
		<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"></c:set>


		
<!-- 			<div id="login" style="height: 80px;"> -->
<%-- 				<a href="${ contextPath }"><img id="logo" src="resources/image/logo.png"/></a> --%>
<!-- 				<ul id="login"> -->
<!-- 					<li><a href="#">로그인</a></li> -->
<!-- 					<li style="font-size: 15px; color: gray;">|</li> -->
<!-- 					<li><a href="#">회원가입</a></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->

	
	<div id="login" style="height: 80px;">
		<a href="${ contextPath }"><img id="logo" src="resources/image/logo.png"/></a>
		<ul id="login">
			<c:if test="${ empty loginUser }">
				<li><a href="${ contextPath }/loginView.me">로그인</a></li>
				<li style="font-size: 15px; color: gray;">|</li>
				<li><a href="${ contextPath }/signUp.me">회원가입</a></li>
			</c:if>
			<c:if test="${ !empty loginUser }">
				<c:if test="${ empty loginUser.kakaoId }">
					<a href="${ contextPath }/logout.me" style="text-decoration: none; color:black; font-size: 13px; font-weight: bold;">로그아웃</a>
				</c:if>
				<c:if test="${ !empty loginUser.kakaoId }">
					<a href="https://kauth.kakao.com/oauth/logout?client_id=3820ee86989bf11805e157a18f4e15b1&logout_redirect_uri=http://localhost:8099/bookmaroo/logout.me" style="text-decoration: none; color:black; font-size: 13px; font-weight: bold;">로그아웃</a>
				</c:if>
			</c:if>
		</ul>
	</div>
	


			
	<nav class="navbar navbar-expand-sm navbar-light bg-white border-bottom border-top">
   <div class="collapse navbar-collapse justify-content-center" id="mainCategory">
     	<ul class="navbar-nav">
       	<li class="nav-item active">
           <a class="nav-link" href="${ contextPath }/searchBook.lib">도서실</a>
	      </li>
	      <li class="nav-item">
	         <a class="nav-link" href="${ contextPath }/Announcement.bo">게시판</a>
	      </li>
	      <li class="nav-item">
	         <a class="nav-link" href="${ contextPath }/Review.bo">리뷰</a>
	      </li>
	      <li class="nav-item">
	         <a class="nav-link" href="${ contextPath }/information.gui">이용안내</a>
	      </li>
	      <li class="nav-item">
	      		<c:if test="${ !empty loginUser }">
		         	<a class="nav-link" href="${ contextPath }/myInfoForm.me">마이페이지</a>
	      		</c:if>
	      		<c:if test="${ empty loginUser }">
		         	<a class="nav-link" onclick="needLogin()" style="cursor: pointer;">마이페이지</a>
	      		</c:if>
		    </li>
     	</ul>
   	</div>
	</nav>
	
	
	<div class="modal fade" tabindex="-1" role="dialog" id="warning">
	<div class="modal-dialog" role="document">
   		<div class="modal-content rounded-3 shadow">
     			<div class="modal-body p-4 text-center">
					<h1><i class="bi bi-exclamation-triangle-fill" style="color: red;"></i></h1>
		       		<h3 class="mb-0">로그인이 필요한 서비스입니다</h3>
     			</div>
     			<div class="modal-footer flex-nowrap p-0">
       			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" onclick="goforLogin()">
       				로그인
       			</button>
       			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">취소</button>
     			</div>
   		</div>
 	</div>
	</div>	
	
	<script>
	
	function needLogin(){
		$('#warning').modal('show');
	}
	
	function goforLogin(){
		location.href="${ contextPath }/loginView.me";
	}
	</script>
</body>
</html>