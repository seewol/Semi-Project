<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<style>
	/* 공통 CSS 속성 */
	* { font-family: 'Inter', sans-serif; }
/* 	.row { min-height: 612px; } */
	.col-8 { padding: 2% 0; min-height: 1500px;}
	#contentArea>a { color: black; text-decoration: none; font-weight: 900; font-size: 45px;}
	#contentArea>.row-cols-3{width: 100%; margin-left: 1%; height: 1300px;}
	.reviewBox {}
	.eachReview {background-color: yellow; height: 540px; width: 351px; margin: 0 auto; position: relative;}
	.reviewInfo {height: 100px; margin: 0 auto; width: 351px; margin-top: 10px;}
	#book_title {font-weight: bold; font-size: 20px;}
	#reviewer {}
	.titleAndStar{display: flex; justify-content: space-between;}
	/* 공지사항/문의사항/프로그램 게시판 공통 CSS 속성 */
	#search_area {margin-top: 3%; margin-bottom: 3%; margin-left: 1%; border: 1px solid lightgrey; 
		    border-radius: 10px; display: flex; align-items: center;}
	#search_bar {height: 50px; width: 100%;}
	#search_bar input[type="text"] { border: none; font-size:20px; outline: none; width: 80%; margin-left: 2%; margin-right: 3%; }
	#search_bar button { background-color: white; border: none; margin-left: 10px; font-size: 20px; }
	#search_bar select {border:none; height: 100%; border-radius: 10px;
						  width: 10%; font-size: 20px; outline: none;}
						  
	.album .col{cursor: pointer;}
	.bd-placeholder-img {font-size: 1.125rem; text-anchor: middle;}
	.card *:hover{cursor: pointer;}
	#ss5 { color: red; }
	.post_area { height: auto;}
	.thumb{margin: 0 auto;}
/* 	.bbox{display: flex; align-items: center;}					   */

	#page_area{ text-align: center; margin-top: 3%; }
	#page_area a { color: black; text-decoration: none; }
	.btn_page{border: none; background-color: white; font-size: 30px; margin-left: 3%; font-weight: bold;}
	
						  
</style>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
	<div id="anchorPoint"></div>
	<jsp:include page="../common/top3.jsp"/>
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8"">
			<div id="contentArea">
				<a href="${ contextPath }/Review.bo">도서리뷰</a>
				<br><br>
				<div id="search_area">
					<form action="searchReview.bo" method="get" id="search_bar">
						<select name="searchType">
						  <option value="all" <c:if test="${ searchType eq 'all' }">selected</c:if>>&nbsp;&nbsp;통합검색</option>
						  <option value="booktitle" <c:if test="${ searchType eq 'booktitle' }">selected</c:if>>&nbsp;&nbsp;도서명</option>
						  <option value="title" <c:if test="${ searchType eq 'title' }">selected</c:if>>&nbsp;&nbsp;리뷰제목</option>
						  <option value="content" <c:if test="${ searchType eq 'content' }">selected</c:if>>&nbsp;&nbsp;리뷰내용</option>
						</select>
						<input type="text" placeholder="검색어를 입력하세요" id="searchtext" autocomplete="off" name="search" value="${ search }">
						<button><i class="bi bi-search"></i></button>
					</form>
				</div>
				<br><br>
				<!-- --------------------------------------------------------------------------------------------------------------- -->
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-5 post_area bbox">
					<c:forEach items="${ revList }" var="rev">
						<div class="col bbox">
<%-- 							<div class="card shadow-sm" style="width: 201.6px; margin: 0 auto;" onclick="hrefReviewDetail(${ rev.reviewNo })"> --%>
							<div class="card shadow-sm" style="width: 201.6px; margin: 0 auto;" onclick="hrefReviewDetail(this)">
												<img src="${ rev.bookImage }" alt="ㅇㅇ" width="100%" height="300.24px;" class="thumb">
								<div class="card-body">
									<p class="card-text">
										<label class="bId"><strong>${ rev.bookName }</strong></label>
										<hr>
<%-- 										<label class="writer">${ rev.reviewTitle }</label><br><hr> --%>
										<label class="writer">${ rev.reviewerName }</label><br>
										<label class="writer"><i class="bi bi-star-fill" style="color:#F9BC28;"></i>  ${ rev.starRating/2 }</label>
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<small class="text-muted">${ rev.reviewViews } Views</small>
										<input type="hidden" name="reviewNo" value="${ rev.reviewNo }" class="reviewNo">
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<br><br>
				<!-- --------------------------------------------------------------------------------------------------------------- -->
				<div id="page_area">
					<c:if test="${ pi.currentPage <= 1 }">
						<a class="btn_page"><i class="bi bi-skip-start-fill" style="color: rgb(67, 115, 230);"></i></a>
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url value="${ loc }" var="blistBack">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
							<c:if test="${ searchType != null }">
								<c:param name="searchType" value="${ searchType }"/>
								<c:param name="search" value="${ search }"/>
<%-- 								<c:param name="boardType" value="${ boardType }"/> --%>
							</c:if>
						</c:url>
						<a href="${ blistBack }" class="btn_page"><i class="bi bi-skip-start-fill"></i></a>
					</c:if>
				
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:if test="${ p eq pi.currentPage }">
							<a class="btn_page" style="color: rgb(67, 115, 230);">${ p }</a>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="goNum" value="${ loc }">
				            	<c:param name="page" value="${ p }"/>
				            	<c:if test="${ searchType != null }">
									<c:param name="searchType" value="${ searchType }"/>
									<c:param name="search" value="${ search }"/>
<%-- 									<c:param name="boardType" value="${ boardType }"/> --%>
								</c:if>
				            </c:url>
				            <a href="${ goNum }" class="btn_page">${ p }</a>
						</c:if>
					</c:forEach>	
				
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<a class="btn_page"><i class="bi bi-skip-end-fill" style="color: rgb(67, 115, 230);"></i></a>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url value="${ loc }" var="goNext">
				            <c:param name="page" value="${ pi.currentPage + 1 }"/>
				            <c:if test="${ searchType != null }">
								<c:param name="searchType" value="${ searchType }"/>
								<c:param name="search" value="${ search }"/>
<%-- 								<c:param name="boardType" value="${ boardType }"/> --%>
							</c:if>
				        </c:url>
				        <a href="${goNext}" class="btn_page"><i class="bi bi-skip-end-fill"></i></a>
					</c:if>
				</div>
				<!-- --------------------------------------------------------------------------------------------------------------- -->
				<div style="display: flex; justify-content: flex-end;">
					<button class="btn btn-primary btn-default" style="background-color: #4373E6;">
						<c:if test="${ !empty loginUser }">
							<a href="${contextPath}/PostingReview.bo" style="color:white; text-decoration: none;">글쓰기</a>
						</c:if>	
						<c:if test="${ empty loginUser }">
							<astyle="color:white; text-decoration: none;" onclick="needLogin()">글쓰기</a>
						</c:if>	
					</button>
				</div>
<!-- 				<form action="reviewDetail.bo" method="get" id="revewContentForm"> -->
<!-- 					<input type="hidden" name="reviewNo" id="reviewNo"> -->
<!-- 					<input type="hidden" name="reviewerName" id="reviewerName"> -->
<%-- 					<input type="hidden" name="page" value="${ pi.currentPage }"> --%>
<!-- 				</form> -->
			</div>
		</div>
		<div class="col-2"></div>
	</div>
	<jsp:include page="../common/bottom.jsp"/>
	
	
	<div class="modal fade" tabindex="-1" role="dialog" id="warning">
	<div class="modal-dialog" role="document">
   		<div class="modal-content rounded-3 shadow">
     			<div class="modal-body p-4 text-center">
					<h1><i class="bi bi-exclamation-triangle-fill" style="color: red;"></i></h1>
		       		<h3 class="mb-0">로그인이 필요한 서비스입니다</h3>
     			</div>
     			<div class="modal-footer flex-nowrap p-0">
       			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" onclick="goforLogin()">
       				로그인
       			</button>
       			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">취소</button>
     			</div>
   		</div>
 	</div>
	</div>	
	
	
	
	
	
	<script>
	
	function hrefReviewDetail(me) {
		console.log(me);
		const reviewerName = me.querySelector('.writer').innerText;
		const reviewNo = me.querySelector('.reviewNo').value;
		console.log(123);
		location.href='${contextPath}/reviewDetail.bo?reviewNo=' + reviewNo + '&reviewerName=' + reviewerName + '&page=' + ${pi.currentPage};
	}
	
	function needLogin(){
		$('#warning').modal('show');
	}
	
	function goforLogin(){
		location.href="${ contextPath }/loginView.me";
	}
	
	
	
	
	
	
	
		
	</script>
</body>
</html>