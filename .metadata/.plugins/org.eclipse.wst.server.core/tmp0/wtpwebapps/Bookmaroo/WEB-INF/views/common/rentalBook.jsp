<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책마루도서관</title>
<style>
	#main{max-width: 1200px; min-height: 682px;}
	#mid{min-width: 1800px;}
	#rentalButton{
		color: white; background-color: rgb(67, 115, 230); 
		border: 1px solid rgb(67, 115, 230);
		width: 92px;
	}
	.bookImage{
		height: 216px;
		width: 144px;
	}
</style>
</head>
<body>
	<!-- top.jsp -->
	<%@ include file="../../../WEB-INF/views/common/top3.jsp" %>
	
	  <div class="row" id="mid">
	  
	    <!-- 화면 중앙 왼쪽 -->
	    <div class="col-2">
	      <%@ include file="../../../WEB-INF/views/common/sideLib.jsp" %>
	    </div>
	    
	    <!-- 중앙 영역 -->
	    <div class="col-8" id="main">
	    <br>
	       <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
	        <h1 class="h1">도서 대여</h1>
	      </div>
	      <br>
				<div>
				  <table class="table table-bordered align-middle text-center">
				    <thead class="table-light">
				      <tr>
				        <th scope="col">번호</th>
				        <th scope="col">이미지</th>
				        <th scope="col">제목</th>
				        <th scope="col">출판사</th>
				        <th scope="col">저자</th>
				        <th scope="col">대출일자</th>
				        <th scope="col">반납예정일</th>
				        <th scope="col">대여/반납</th>
				      </tr>
				    </thead>
				    <tbody class="table-group-divider">
				      <tr>
				        <td scope="row">${bookNumber}</td>
				        <td><img src="${bookImage}" class="bookImage"></td>
				        <td>${bookName}</td>
				        <td>${publisher}</td>
				        <td>${author}</td>
				        <td>${rentalDate }</td>
				        <td>${returnDate }</td>
				       	<form action="${contextPath }/rentalResult.lib" method="POST">
				       		<input name="bookNumber" value="${bookNumber}"type="hidden">
				        	<td><button class="btn" id="rentalButton">대여하기</button></td>
				       	</form>
				      </tr>
				    </tbody>
				  </table>
				</div>
				
	    </div>
	    
	    <!-- 화면 중앙 오른쪽 여백 생성 -->
	    <div class="col-2">
	    </div>
	    
	  </div>
	  
	<!-- bottom.jsp -->
	<%@ include file="../../../WEB-INF/views/common/bottom.jsp" %>
	
</body>
</html>