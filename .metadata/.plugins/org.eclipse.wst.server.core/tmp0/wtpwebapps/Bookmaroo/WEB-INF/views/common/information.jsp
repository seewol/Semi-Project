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
    #infoTable tr {
 		border-bottom: 1px solid black;
	}
	#infoTable {
 		margin: 0 auto;
 		padding: 10px;
	}
	#myCarousel {
  		height: 500px;
	}
	
	#libraryPicturer{
	  	width: 200px;
	 	height: 100px;
	}
	.carousel-item img {
	  margin: 0 auto;
	}
	#infoTable th, td {
		padding: 10px;
	}
</style>
</head>
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
				<h1 class="h1">책마루 안내</h1>
	        </div>
	      	<br>
			<div>
			    <table class="text-center table-bordered table-striped" id="infoTable">
			      <thead>
			      	<tr>
			      		<th class="bg-light">층별</th>
			      		<th class="bg-light">시설</th>
			      		<th class="bg-light">이용대상및 자료</th>
			      		<th class="bg-light">전화번호</th>
			      		<th class="bg-light">비고</th>
			      	</tr>
			      </thead>
			      <tbody>
			        <tr>
			          <td>1층</td>
			          <td>어린이자료실<br>안내데스크</td>
			          <td>어린이열람실, 체험코너, 시설 이용 문의</td>
			          <td>123-4567</td>
			          <td>장애인화장실</td>
			        </tr>
			        <tr>
			          <td>2층</td>
			          <td>일반자료실</td>
			          <td>일반도서 열람 및 대출, 회원증발급, 신문, 잡지, 참고도서</td>
			          <td>123-4567</td>
			          <td></td>
			        </tr>
			        <tr>
			          <td>3층</td>
			          <td>디지철자료실</td>
			          <td>DVD, 인터넷, 개인 노트북사용, 복사, 출력 및 스캐너 사용</td>
			          <td>123-4567</td>
			          <td>좌석수 22</td>
			        </tr>
			        <tr>
			          <td>4층</td>
			          <td>열람실<br>휴게실</td>
			          <td>일반열람실, 음료수, 커피 자동판매기 이용</td>
			          <td>123-4567</td>
			          <td>좌석수 54</td>
			        </tr>
			      </tbody>
			    </table>
			  </div>
			  <br>
		  	  <div id="libraryPicture" class="carousel carousel-dark slide" data-bs-ride="carousel">
				  <div class="carousel-indicators">
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
				  </div>
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="resources/image/libraryImage01.jpg" class="d-block" alt="libraryImage">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/image/libraryImage02.jpg" class="d-block" alt="libraryImage">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/image/libraryImage03.jpg" class="d-block" alt="libraryImage">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/image/libraryImage04.jpg" class="d-block" alt="libraryImage">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/image/libraryImage05.jpg" class="d-block" alt="libraryImage">
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#libraryPicture" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#libraryPicture" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
			</div>
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