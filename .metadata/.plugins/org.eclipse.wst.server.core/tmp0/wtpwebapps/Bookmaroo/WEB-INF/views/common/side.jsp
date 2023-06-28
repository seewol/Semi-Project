<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String currentUrl = request.getRequestURI(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter">
<style>
	body {font-family: 'Inter', sans-serif;}
	#subCategory{max-width: 250px; width: 300px;}
	#subCategory a{
		padding-bottom: 20px; padding-top: 20px; padding-right: 10px; padding-left: 10px;
		font-weight: bold;
	}
	.s1{
		background-color: rgb(67, 115, 230); 
		color: white;
		border: 1px solid rgb(67, 115, 230);
		box-shadow: 0 0 0 rgb(67, 115, 230), 0 0 0 1px rgb(67, 115, 230);
		height:8rem;
		font-size: 30px;
		display: flex;
 		align-items: center;
  		justify-content: center;
	}
	.s2{
		background-color: white; 
		color: black;
		border: 1px solid gray;
		box-shadow: 0 0 0 #fff, 0 0 0 1px #ddd;
		height:4rem;
		font-size: 20px;
		display: flex;
 		align-items: center;
  		justify-content: center;
	}
</style>
</head>
<body>
	<nav class="bg-white sidebar fixed-left" id="sideBar">
	      <div class="sidebar-sticky text-dark" id="subCategory">
	        <ul class="nav flex-column">
	          <li class="nav-item">
	            <a class="nav-link active s1" href="${ contextPath }/Announcement.bo">공지사항</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link s2" href="${ contextPath }/programme.bo">교육/문화프로그램</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link s2" href="${ contextPath }/Inquiry.bo">문의사항</a>
	          </li>
<!-- 	          <li class="nav-item"> -->
<%-- 	            <a class="nav-link s2" href="${ pageContext.servletContext.contextPath }/returnBook.lib">도서반납</a> --%>
<!-- 	          </li> -->
<!-- 	          <li class="nav-item"> -->
<%-- 	            <a class="nav-link s2" href="${ pageContext.servletContext.contextPath }/wishBook.lib">비치 희망 도서</a> --%>
<!-- 	          </li> -->
	        </ul>
	      </div>
	</nav>
</body>
</html>