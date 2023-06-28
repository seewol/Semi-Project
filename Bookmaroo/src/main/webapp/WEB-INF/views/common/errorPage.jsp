<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body class="d-flex h-100 text-center text-bg-dark">
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
		<header class="mb-auto"></header>
		<main class="px-3">
			<h1>☠️ 오류 발생 ☠️</h1>
    		<p class="lead">${ requestScope['javax.servlet.error.message'] }</p>
		    <p class="lead">
		    	<a href="${ contextPath }/semiHome.do" class="btn btn-lg fw-bold border-white bg-white">HOME😨</a>
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<a href="javascript:history.back()" class="btn btn-lg fw-bold border-white bg-white">BACK🐼</a>
		    </p>
		</main>
		<footer class="mt-auto text-white-50"></footer>
	</div>
</body>
</html>
