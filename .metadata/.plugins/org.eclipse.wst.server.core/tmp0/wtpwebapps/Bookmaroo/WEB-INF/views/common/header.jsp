<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	header {
		font-family: 'Inter', sans-serif;
	}
	#menu {
		vertical-align: middle;
		text-align: center;
		border-top: 0.5px solid lightgray;
		border-bottom: 0.5px solid lightgray;
		height: 50px;
	}
	#menu2 {
		line-height: 50px;
		height: 50px;
	}
	#menu2>li {
		display: inline-block;
 		font-size: 15px;
 		font-weight: bold;
 		margin-right: 5%;
		margin-left: 5%;
 	}
	html, body {
		width: 100%;
		height: 100%;
		margin: 0;
		padding: 0;
	}
	header {
		margin: 0;
		padding: 0;
	}
	#login {
		display: flex;
		position: relative;
		align-items: center;
		justify-content: center;
		vertical-align: middle;
		text-align: center;
	}
	#login>ul {
		margin-right: 100px;
		display: flex;
		align-items: center;
		justify-content: center;
		height: 100%;
	} 	
	#login>ul>li {
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 13px;
		font-weight: bold;
		margin-right: 5%;
		margin-left: 5%;
		width: 75px;
	}
	#logo {
		height: 50px;
		width: 140px;
		margin-left: 100px;
	}
	#background {
		height: auto;
		width: 100%;
	}
	#background-img {
		display:block;
		height: auto;
		width: 100%;
	}
	#quickmenu {
		background: white;
		opacity: 0.5;
	}
	footer {
		display: flex;
		background: rgb(67, 115, 230);
		height: 180px;
		color: white;
		align-items: center;
		justify-content: space-between;
		vertical-align: middle;
		text-align: center;
	}
	#ftnav {
		text-align: left;
		margin-left: 30px;
		font-size: 13px;
	}
	#ftnav a {
		text-decoration: none;
		color: white;
	}
	#ftp {
		text-align: left;
		margin-left: 10px;
		font-size: 13px;
		line-height:170%;
	}
	#anker {
		margin-left: 50px;
		vertical-align: middle;
		text-align: right;
		margin-right: 30px;
	}
	#background2 {
		height: 200px;
		width: auto;
		background: white;
		opacity: 0.1;
	}
	a {
		text-decoration-line: none;
	}
	a:link {
		color: black;
	}
	a:visited {
		color: black;
	}
	a:hover {
		color: #4373E6;
	}
</style>
</head>
<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	<div id="anchorPoint"></div>
	<header>
		<div id="login" style="height: 80px;">
			<img id="logo" src="resources/image/logo.png"/>
			<ul id="login-menu">
				<li><a href="">로그인</a></li>
				<li style="font-size: 15px; color: gray;">|</li>
				<li><a href="">회원가입</a></li>
			</ul>
		</div>
		<div id="menu" class="menu">
			<ul id="menu2">
				<li><a class="nav-link" href="${ contextPath }/searchBook.lib">도서실</a></li>
<!-- 				<li>열람실</li> -->
				<li><a class="nav-link" href="${ contextPath }/Announcement.bo">게시판</a></li>
				<li><a class="nav-link" href="${ contextPath }/Review.bo">리뷰</a></li>
				<li><a class="nav-link" href="${ contextPath }/information.gui">이용안내</a></li>
				<li><a class="nav-link" href="${ contextPath }/myBooks.lib">마이페이지</a></li>
			</ul>
		</div>
	</header>
</body>
</html>