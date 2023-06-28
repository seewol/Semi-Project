<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책마루도서관</title>
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
	#main{max-width: 1200px; min-height: 682px;}
	#mid{min-width: 1800px;}
	.wishButton{
		color: rgb(67, 115, 230); 
		background-color: white;
		border: 1px solid rgb(67, 115, 230);
		width: 90px;
	}
	.bookImage{
		height: 216px;
		width: 144px;
		cursor: zoom-in;
	}
	.stars{
		color: orange;
		font-size: 20px;
	}	
</style>
</head>
<body>
	<!-- top.jsp -->
	<%@ include file="../../../WEB-INF/views/common/top3.jsp" %>
	<div class="row" id="mid">
			  
    <!-- 화면 중앙 왼쪽 -->
    <div class="col-2">
      <%@ include file="../../../WEB-INF/views/common/myPageSide.jsp" %>
    </div>
			    
    <!-- 중앙 영역 -->
    <div class="col-8" id="main">
	    <br>
    	<div class="d-flex flex-wrap flex-md-nowrap pb-2 mb-3 border-bottom justify-content-between align-items-center">
        	<h1 class="h1">찜 한 도서</h1>
     	</div>
	    <br>
	      
		<br><br>
	    <div>
	    	<c:if test="${!empty list }">
		    	<c:forEach items="${list}" var="b" varStatus="status">
		    		<div class="row border-bottom border-top result searchResult">
						<div class="col-1 text-center">${status.count}</div>
					  	<div class="col-2 text-center"><img src="${b.bookImage}" alt="책 이미지" class="bookImage" id="bookImage${status.count}"></div>
					 	
					 	<div class="modal fade" tabindex="-1" role="dialog" id="modalId${status.count}">
						      	<div class="modal-dialog modal-lg" role="document">
						            <div class="modal-content rounded-3 shadow">
						            	<div class="row">
						            		<div class="col-12 text-center">
						            			<h3> 도서 상세 정보 </h3>
						            		</div>
						            	</div>
						            	<div class="row">
						            		<div class="col-1"></div>
						            		<div class="col-5">
						            			<br><br><br>
						            			<img src="${b.bookImage}" alt="책 이미지" style="width: 259px" style="height: 172px">
						            		</div>
						            		<div class="col-6">
						            			도서관리번호 : ${b.bookNumber}
						            			<br><br>
						            			ISBN : ${b.bookISBN}
						            			<br><br>
						            			도서명 : ${b.bookName}
						            			<br><br>
						            			장르명 : ${b.gmName}
						            			<br><br>
						            			작가 : ${b.author}
						            			<br><br>
						            			출판사 : ${b.publisher}
						            			<br><br>
						            			발행일자 : ${b.publication}
						            			<br><br>
						            			소장도서수 : ${b.bookCount}
						            			<br><br>
						            			등록일 : ${b.resistDate}
						            			<br><br>
						            			대출여부 : ${b.isRental}
						            			<br><br>
						            			별점 평균 : ${b.stars / 2}
						  						<br><br>
						            		</div>
						            	</div>
						            	<div class="row">
						            		<div class="col-12 text-center">
						            			<h5> 책 소개 </h5>
						            		</div>
						            	</div>
						            	<div class="row">
						            		<div class="col-12">
							            		<c:if test="${ !empty b.summary }">
								            		${b.summary}
							            		</c:if>
							            		<c:if test="${ empty b.summary }">
								            		소개문구가 없는 책입니다.
							            		</c:if>
						            		</div>
						            	</div>
						              	<div class="modal-footer flex-nowrap p-0">
						                   	<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal">닫기</button>
						              	</div>
						            </div>
						    	</div>
						    </div>
						 	
					 	<script>
					 		var bookImages = document.getElementById("bookImage" + ${status.count});
					 		bookImages.addEventListener('click', function(){
					 			$('#modalId' + ${status.count}).modal('show');
					 		})
					 	</script>
					 	
					 	<div class="col-6">
						 	<b>
							 	${b.bookName}
							 	<br><br>
							 	${b.author}
							 	<br><br>
							 	${b.publisher}
							 	<br><br>
							 	<div id="stars${status.count}" class="stars"></div>
						 	</b>
					 	</div>
					 	<script>
					 		var starsCount = ${b.stars};
					 		var starsContainer = document.querySelector("#stars" + ${status.count} + "");
					 		var starHtml = '';
					 		var fullStars = Math.floor(starsCount/2); 
				 		  	for (var i = 0; i < fullStars; i++) {
				 		    	starHtml += "<i class='bi bi-star-fill'></i>";
				 		  	}
				 		  	if(starsCount/2 % 1 >= 0.5){
					 			starHtml += "<i class='bi bi-star-half'></i>";
					 		}
				 		  	var remainStars = 5 - Math.ceil(starsCount/2);
				 		  	for (var j = 0; j < remainStars; j++) {
				 		    	starHtml += "<i class='bi bi-star'></i>";
				 		  	}
					 		starsContainer.innerHTML = starHtml;
					 	</script>
					 	<div class="col-3" style="display: flex; align-items: center;">
					 		<form class="wishForm" action="${contextPath }/myHeartBooks.lib">
					 			<input name="page" value="${ pi.currentPage }" type="hidden">
					 			<input class="bookISBN" name="bookISBN" value="${b.bookISBN}" type="hidden">
					 			<input class="heart" name="heart" value="heart" type="hidden">
					 			<button class="wishButton" onclick="return check()"><i class="bi bi-heart-fill"></i> 찜하기</button>
					 		</form>
					  		<br>
					  	</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${ empty list }">
				<h3>찜한 도서가 존재하지 않습니다.</h3>
			</c:if>
		</div>
		<br>
		
		<!-- 페이징 처리 -->
		<nav aria-label="Page navigation example">
	       	<ul class="pagination justify-content-center">
	       		<c:if test="${pi.currentPage > 1 }">
	       			<li class="page-item">
       				<c:url value="${ loc }" var="goBack">
            			<c:param name="page" value="${ pi.currentPage - 1 }"/>
            		</c:url>
	            	<a class="page-link" href="${ goBack }" aria-label="Previous">
	            		<span aria-hidden="true">&laquo;</span>
	              	</a>
	            </li>
	       		</c:if>
	            
	            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
            		<c:url value="${ loc }" var="goNum">
            			<c:param name="page" value="${ p }"/>
            		</c:url>
	            	<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
	            </c:forEach>
	            
	            <c:if test="${pi.currentPage < pi.maxPage }">
	            	<li class="page-item">
            			<c:url value="${ loc }" var="goNext">
		            		<c:param name="page" value="${ pi.currentPage + 1 }"/>
		            	</c:url>
		            	<a class="page-link" href="${ goNext }" aria-label="Next">
		            		<span aria-hidden="true">&raquo;</span>
		            	</a>
	           		</li>
	            </c:if>
	    	</ul>
	    </nav>
	    
		<br>
   	</div>
			    
	    <!-- 화면 중앙 오른쪽 여백 생성 -->
	    <div class="col-2">
	    </div>
  	</div>
	  
  	<%@ include file="../../../WEB-INF/views/common/bottom.jsp" %>
	
	<div class="modal fade" tabindex="-1" role="dialog" id="modalId">
      	<div class="modal-dialog" role="document">
            <div class="modal-content rounded-3 shadow">
              	<div class="modal-body p-4 text-center">
                 	<h1 id="modalIcon"><i class="bi bi-exclamation-triangle-fill" style="color: red;"></i></h1>
                   	<h3 class="mb-0" id="modalText"></h3>
              	</div>
              	<div class="modal-footer flex-nowrap p-0">
                   	<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal" id="modalButton">확인</button>
              	</div>
            </div>
    	</div>
    </div>
	
	<c:forEach items="${heartList}" var="he">
		<input class="heartList" type="hidden" value="${he}">
	</c:forEach>
		  
	<script>	
		
		const wishForms = document.querySelectorAll('.wishForm');
		
		const hel = document.getElementsByClassName("heartList")
		
		for(const w of wishForms){
			const bookISBN = w.querySelector('.bookISBN');
			const heart = w.querySelector('.heart');
			const wishButton = w.querySelector('.wishButton');
			
			if(hel.length != 0){
				for(const h of hel){
					if(h.value == bookISBN.value){
						heart.value = "brokenHeart";
						wishButton.innerHTML = "<i class='bi bi-heartbreak-fill'></i> 찜취소";
					}
				}
			}
			
// 			if (${heartList}.length != 0) {
// 				for(const h of ${heartList}){
// 					if(h == bookISBN.value){
// 						heart.value = "brokenHeart";
// 						wishButton.innerHTML = "<i class='bi bi-heartbreak-fill'></i> 찜취소";
// 					}
// 				}
// 			}
		}
		
	</script>	  
	  
</body>
</html>