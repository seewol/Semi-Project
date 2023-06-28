<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#subCategory{max-width: 250px;}
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
	            <a class="nav-link active s1" href="${ pageContext.servletContext.contextPath }/information.gui">이용안내</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link s2" href="${ pageContext.servletContext.contextPath }/information.gui">책마루 안내</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link s2" href="${ pageContext.servletContext.contextPath }/location.gui">책마루 위치</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link s2" href="${ pageContext.servletContext.contextPath }/operationTime.gui">운영 시간</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link s2" href="${ pageContext.servletContext.contextPath }/libraryFAQ.gui">자주 묻는 질문</a>
	          </li>
	        </ul>
	      </div>
	</nav>

</body>
</html>