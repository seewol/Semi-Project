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
	.bi-arrow-right-circle-fill{ color: rgb(67, 115, 230);}
</style>
</head>
<body>


	<!-- top.jsp -->
	<%@ include file="../../../WEB-INF/views/common/top3.jsp" %>
	
	  <div class="row" id="mid">
	  
	    <!-- 화면 중앙 왼쪽 -->
	    <div class="col-2">
	      <%@ include file="../../../WEB-INF/views/common/sideGui.jsp" %>
	    </div>
	    
	    <!-- 중앙 영역 -->
	    <div class="col-8" id="main">
	    <br>
	       <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
	        <h1 class="h1">운영 시간</h1>
	      </div>
	      <br>
		  	<strong><i class="bi bi-arrow-right-circle-fill"></i> 이용대상</strong>
		  	<br>
		  	<span>책마루도서관은 도서관 자료 열람을 원하는 누구나 이용이 가능합니다.</span>
			<br><br>
			<strong><i class="bi bi-arrow-right-circle-fill"></i> 이용시간 안내</strong>
			<br>
		    <table class="table">
		      <thead>
		        <tr>
		          <th scope="col">요일</th>
		          <th scope="col">운영시간</th>
		        </tr>
		      </thead>
		      <tbody>
		        <tr>
		          <th scope="row">월 ~ 금</th>
		          <td>09:00 ~ 20:00</td>
		        </tr>
		        <tr>
		          <th scope="row">토</th>
		          <td>09:00 ~ 17:00</td>
		        </tr>
		        <tr>
		          <th scope="row">일</th>
		          <td>휴관</td>
		        </tr>
		      </tbody>
		    </table>
	    	<br>
			<strong><i class="bi bi-arrow-right-circle-fill"></i> 휴관일 안내</strong>
			<br>
    		<span>
    			일요일을 포함한 법정공휴일 및 국가가 정한 임시 휴일<br>
    			기타 관장이 필요하다고 인정하는 날 미리 공지 후 휴관
    		</span>
    		<br>
    	
	    </div>
	    
	    <!-- 화면 중앙 오른쪽 여백 생성 -->
	    <div class="col-2">
	    </div>
	    
	  </div>
	  
	<!-- bottom.jsp -->
	<%@ include file="../../../WEB-INF/views/common/bottom.jsp" %>

</body>
</html>