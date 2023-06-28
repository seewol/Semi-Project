<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육문화 프로그램</title>


<style>
 	html,body{width: 100%;} 
	#row{width: 1920px;} 
	#ss2{margin-top: 30px; margin-bottom: 30px; align-items: center;}
/* css넣는곳 */

	.row{min-height: 1100px;}
	#board_area{height: 100%; margin: 1%;}
	#board_title{font-weight: 900; font-size: 45px; margin-bottom: 1%;}
	#search_area{margin-top: 3%; margin-bottom: 3%; margin-left: 1%; border: 1px solid lightgrey; 
		    border-radius: 10px; display: flex; align-items: center;}
	#search_bar{height: 50px; width: 100%;}
	#select_search_option{border:none; height: 100%; border-radius: 10px;
						  width: 10%; font-size: 20px; outline: none;}
	#searchtext{font-size:20px; outline: none; width: 80%; margin-left: 2%; margin-right: 3%;}
	#board_contents{margin-left: 1%; margin-top: 1%; font-size: 20px; width: 100%;}
	table{border-collapse : collapse}
	tr{height: 50px;}
	#board_contents th{border-bottom: 1px solid black;}
	#board_contents td{border-bottom: 1px solid black; border-color: lightgrey; text-align: center; height: 60px;}
	#btn{text-align: right;}
	.btn_post{height: 50px; background-color: #4373E6; color:white; border: none; border-radius: 10px; width: 5%; font-size: 15px;}
	#page_bar{text-align: center; margin-top: 3%;}
	.btn_page{border: none; background-color: white; font-size: 30px; margin-left: 3%; font-weight: bold;}
	#btn a{text-decoration: none; color:white;}
	#board_area a{text-decoration: none; color:black;}
	.notice{background-color: lightblue;}
	#board_contents th{text-align: center;}
  	#search_btn{margin-left: 10px;}  

	#notice{height: 200px; margin-left: 1%;}
	.notice1{display: inline-block; height: 100%; width: 15%;}
	.notice2{display: inline-block; height: 100%; width: 80%;}
	#poster_img{height: 500px; width: 400px; margin-top: 5%; margin-bottom: 5%; box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
cursor: pointer; background-image: url("poster.jpg");
  background-size: cover;}
	

	
	#poster_img.enlarge {
  position: fixed;
  top: 40%;
  left: 50%;
  transform: translate(-50%, -50%) scale(1.5);
  z-index: 9999;
  width: 600px;
  height: 750px;
  box-shadow: none;
}
	
	
	
	
	
	
	
	
	
	
/* css넣는곳 */
</style>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>


</head>
<body>

	<div id="anchorPoint"></div>
	<jsp:include page="../common/top3.jsp"/>
	
	
<!-- <div class="container">	 -->
	<div class="row">
		<div class="col-2">
			<jsp:include page="../common/side.jsp"/>
		</div>
		<div class="col-9">
			<div id="ss2">
				
				<!-- 컨텐츠 넣는 곳 -->
				
				
				
	<div id="board_area">
	<div id="board_title"><a href="#">교육 / 문화 프로그램</a></div>
<!-- 	<span>&nbsp;<img alt="#" src="../resources/image/home.png"></span> -->
	<span>&nbsp;<i class="bi bi-house"></i></span>
	<span>&nbsp;게시판 > 교육 / 문화 프로그램</span>
	<div id="search_area">
		<form action="#" method="get" id="search_bar">
			<select id="select_search_option">
			  <option selected>&nbsp;&nbsp;통합검색</option>
			  <option value="title">&nbsp;&nbsp;제목</option>
			  <option value="content">&nbsp;&nbsp;내용</option>
			  <option value="writer">&nbsp;&nbsp;글쓴이</option>
			</select>
			<input type="text" style="border: none;" placeholder="검색어를 입력하세요" id="searchtext" autocomplete="off" name="검색어">
<!-- 			<input type="image" src="../resources/image/home.png" id="searchbtn"> -->
			<i class="bi bi-search" id="search_btn"></i>
		</form>
	</div>
<!-- 	<hr style="margin-left: 1%; border: 1px solid black;"> -->
	<div id="notice">
		<div class="notice1">11</div>
			<div class="notice2">
				<br><br>
				<h3 style="margin-left: 3%;">유의사항</h6>
				<ul>
					<li>1. 책마루는 각 프로그램과 무관하며 예약 또한 지원하지 않습니다.</li>
					<li>2. 표기된 내용과 사이할 수 있으며 자세한 내용은 해당 프로그램 담당자에 문의 바랍니다</li>
					<li>3. 사진 클릭 시 더 큰 화면으로 보실 수 있습니다.</li>
				</ul>
		</div>
	</div>
	<hr style="margin-left: 1%; border: 1px solid black;">
	
	<!-- 11 -->
	
	<div style="width: 100%; height: auto;">
	  		<div id="poster" style="display: inline-block; height: 100%; width: 35%;">
				<div id="poster_area" style="display: flex; justify-content: center; align-items: center; height: auto;">
					<div id="poster_img" >
						<img src="resources/image/default_book_cover_2015.jpg" id="poster_img">
					</div>
				</div>	  			
	  		</div>
	  		<div style="display: inline-block; height: 100%; width: 40%; margin-left: 20%;">
	    		<h3 style="margin-left: 5%;">[인문학]과거를 읽는 낯선 통찰(온라인 ZOOM)</h3>
	    		<br>
	    		<table style="margin-left: 5%;">
	    			<tr>
	    				<th>대상</th>
	    				<td>누구나</td>
	    			</tr>
	    			<tr>
	    				<th>장소</th>
	    				<td>온라인 ZOOM</td>
	    			</tr>
	    			<tr>
	    				<th>교육기간</th>
	    				<td>2023/04/26~2023/05/31 </td>
	    			</tr>
	    			<tr>
	    				<th>요일/시간</th>
	    				<td>매주 수요일 14:00~16:00</td>
	    			</tr>
	    			<tr>
	    				<th>접수기간</th>
	    				<td>2023/04/06~2023/04/23</td>
	    			</tr>
	    			<tr>
	    				<th>모집정원</th>
	    				<td>100명</td>
	    			</tr>
	    		</table>
	    		<br><br>
	  		</div>
		</div>	
	
	
	
	
	<!-- 11 -->
	
	<hr style="margin-left: 1%; border: 1px solid black;">
	<div style="width: 100%; height: auto;">
	  		<div id="poster" style="display: inline-block; height: 100%; width: 35%;">
				<div id="poster_area" style="display: flex; justify-content: center; align-items: center; height: auto;">
					<div id="poster_img"></div>
				</div>	  			
	  		</div>
	  		<div style="display: inline-block; height: 100%; width: 40%; margin-left: 20%;">
	    		<h3 style="margin-left: 5%;">[인문학]과거를 읽는 낯선 통찰(온라인 ZOOM)</h3>
	    		<br>
	    		<table style="margin-left: 5%;">
	    			<tr>
	    				<th>대상</th>
	    				<td>누구나</td>
	    			</tr>
	    			<tr>
	    				<th>장소</th>
	    				<td>온라인 ZOOM</td>
	    			</tr>
	    			<tr>
	    				<th>교육기간</th>
	    				<td>2023/04/26~2023/05/31 </td>
	    			</tr>
	    			<tr>
	    				<th>요일/시간</th>
	    				<td>매주 수요일 14:00~16:00</td>
	    			</tr>
	    			<tr>
	    				<th>접수기간</th>
	    				<td>2023/04/06~2023/04/23</td>
	    			</tr>
	    			<tr>
	    				<th>모집정원</th>
	    				<td>100명</td>
	    			</tr>
	    		</table>
	    		<br><br>
	  		</div>
		</div>	
	
	
	
	
	<!-- 11 -->
	
	<hr style="margin-left: 1%; border: 1px solid black;">
	
	<br>
<!-- 공지사항의 글쓰기 글수정 글삭제는 관리자 페이지에서 관리 -->
<!-- 	<div id="btn"> -->
<!-- 		<button class="btn_post"><a href="#">글 수정</a></button> -->
<!-- 		<button class="btn_post"><a href="#">글 삭제</a></button> -->
<!-- 		<button class="btn_post"><a href="#">글 쓰기</a></button> -->
<!-- 	</div> -->
	<div id="page_bar">
		<button class="btn_page"><i class="bi bi-skip-start-fill"></i></button>
		<button class="btn_page">1</button>
		<button class="btn_page">2</button>
		<button class="btn_page">3</button>
		<button class="btn_page"><i class="bi bi-skip-end-fill"></i></button>
	</div>
	<br>
</div>		
				
			
				
				
				
				
				
				
				
				
				<!-- 컨텐츠 넣는 곳 -->
			
			</div>
		</div>
		<div class="col-1">
			<div id="ss3"></div>
		</div>
	</div>
<!-- </div>	 -->
	<jsp:include page="../common/bottom.jsp"/>
	
	
	<script>
	
	
	
	
	
	
/*컨텐츠 스크립트*/ 

const posterImg = document.getElementById("poster_img");

posterImg.addEventListener("click", function() {
  if (posterImg.classList.contains("enlarge")) {
    posterImg.classList.remove("enlarge");
  } else {
    posterImg.classList.add("enlarge");
  }
});


/*컨텐츠 스크립트*/ 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

	
	</script>
	
</body>
</html>