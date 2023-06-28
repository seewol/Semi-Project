<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책마루도서관</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter">
<style>
	#background {
	  background-image: url("resources/image/bg-masthead.jpg");
	  background-repeat: no-repeat;
	  background-size: cover;
	  height: auto;
	}
	body{min-height: 1500px;}
	#background-img {
	  position: relative;
	  z-index: -1;
	}
</style>
</head>
<body>

	<%@ include file="WEB-INF/views/common/top3.jsp" %>
<%-- 				<jsp:include page="WEB-INF/views/common/loginbar.jsp"/> --%>
<%-- 				<c:if test="${ !empty loginUser && loginUser.isAdmin == 'Y' }"> --%>
<%-- 				<c:redirect url="admin.me"></c:redirect> --%>
	
		  
	<section>
		<div id="background">
			<img id="background-img" src="resources/image/bg-masthead.jpg"/>
			<div id="quickmenu"></div>
		</div>	
	</section>
	
	<%@ include file="WEB-INF/views/common/bottom.jsp" %>
</body>
</html>