<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>

	.common-color {
			background: #437326;
		}
		
</style>
</head>
<body>
	<c:set value="${pageContext.servletContext.contextPath}" var="contextPath" scope="application"/>
	
		<section class="container-fluid">
			<div>
				<nav class="navbar navbar-expand-md bg-primary bg-opacity-75 p-3 d-flex common-color" >
		  		<form class="flex-grow-1">
			    	<div class="row align-items-center">
<!-- 			    		<div class="col"> -->
<!-- 							<input class="form-control p-2" type="text" aria-label="Search" placeholder="검색어 입력"> -->
<!-- 						</div> -->
<!-- 						<div class="col"> -->
<!-- 							<button class="btn btn-secondary my-2 my-sm-0 shadow" type="button">통합검색</button> -->
<!-- 						</div> -->
					</div>
				</form>
				<ul class="navbar-nav mb-lg-0 ms-auto">
					<li class="nav-item me-3" style="margin-right: 110px;">
						<a class="nav-link active text-white" href="${ contextPath }/adminLogout.admin"><span class="material-symbols-outlined text-white">logout</span>로그아웃</a>
					</li>
					<li class="nav-item">
						<p class="nav-link active text-white" href="#"><span class="material-symbols-outlined text-white">person</span>관리자 시스템</p>
					</li>
				</ul>
				</nav>
		  	</div>
		</section>
</body>
</html>