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
	#searchButton{
		color: white; 
		background-color: rgb(67, 115, 230);
		width: 90px;
	}
	.wishButton{
		color: rgb(67, 115, 230); 
		background-color: white;
		border: 1px solid rgb(67, 115, 230);
		width: 90px;
	}
	.rentalButton{
		color: white; 
		background-color: rgb(67, 115, 230); 
		border: 1px solid rgb(67, 115, 230);
		width: 90px;
	}
	.summaryButton{
		color: rgb(67, 115, 230); 
		background-color: white;
		border: 1px solid rgb(67, 115, 230);
		width: 100px;
	}
	.returnButton{
		color: white; 
		background-color: #DD3B57; 
		border: 1px solid #DD3B57;
		width: 90px;
	}
	.searchResult{
		display: flex;
		align-items: center; 
		justify-content: between;
		height: 236px;
	}
	.bookImage{
		height: 216px;
		width: 144px;
		cursor: zoom-in;
	}
	.rentalYes{color: green;}
	.rentalNo{color: red;}
	.rental{
		border: 1px solid rgb(67, 115, 230); 
		text-align: center;
		width: 135px;
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
      <%@ include file="../../../WEB-INF/views/common/sideLib.jsp" %>
    </div>
			    
    <!-- 중앙 영역 -->
    <div class="col-8" id="main">
	    <br>
    	<div class="d-flex flex-wrap flex-md-nowrap pb-2 mb-3 border-bottom justify-content-between align-items-center">
        	<h1 class="h1">도서 검색 결과</h1>
     	</div>
	    <br>
	      
      	<div style="display: flex; align-items: center; justify-content: flex-end;">
      		<form method="get" class="search-form d-flex" action="${ contextPath }/searchBookResult.lib">
		    	<select class="bg-light arr" style="width: fit-content;" name="category" id="categorySelect">
		      		<option value="b_name" selected>제목</option>
		      		<option value="author">저자</option>
		      		<option value="publisher">출판사</option>
		    	</select>
		    	&nbsp;
		    	<select class="bg-light arr" style="width: fit-content; margin-left: 5px;" name="order" id="orderBy">
		      		<option value="asc" selected>오름차순</option>
		      		<option value="desc">내림차순</option>
		      		<option value="bd_no">신규등록순</option>
		      		<option value="bd_nolow">이전등록순</option>
		      		<option value="stars">별점높은순</option>
		      		<option value="starslow">별점낮은순</option>
		    	</select>
		    	&nbsp;
      			<input class="form-control mr-sm-2 w-50" type="search" placeholder="검색어 입력" id="searchBar" name="query">
		    	&nbsp;
		    	<button class="btn my-2 my-sm-0 rounded-start" id="searchButton" type="submit" style="margin-left: 5px;">조회</button>
	 		</form>	
	  	</div>
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
			 		  	var remainStars = 5 - Math.round(starsCount/2);
			 		  	for (var j = 0; j < remainStars; j++) {
			 		    	starHtml += "<i class='bi bi-star'></i>";
			 		  	}
				 		starsContainer.innerHTML = starHtml;
				 	</script>
				 	<div class="col-3">
				 		<form class="wishForm" action="${contextPath }/searchBookResult.lib">
				 			<input name="category" value="${ category }" type="hidden">
				 			<input name="query" value="${ query }" type="hidden">
				 			<input name="order" value="${ order }" type="hidden">
				 			<input name="page" value="${ pi.currentPage }" type="hidden">
				 			<input class="bookISBN" name="bookISBN" value="${b.bookISBN}" type="hidden">
				 			<input class="heart" name="heart" value="heart" type="hidden">
				 			<button class="wishButton" onclick="return check()"><i class="bi bi-heart-fill"></i> 찜하기</button>
				 		</form>
				  		<br>
						<c:if test="${b.isRental == 'N'}">
							<div class="rental bg-light">책 번호 : ${ b.bookNumber }<br>상태 : <b class=" rentalYes">대출 가능</b></div>
							<br>
							<form action="${ contextPath }/rentalBook.lib" method="POST">
					  			<input name="bookNumber" value="${b.bookNumber}" type="hidden">
					  			<input name="bookImage" value="${b.bookImage}" type="hidden">
					  			<input name="bookName" value="${b.bookName}" type="hidden">
					  			<input name="publisher" value="${b.publisher}" type="hidden">
					  			<input name="author" value="${b.author}" type="hidden">
					  			<div><button class="rentalButton" onclick="return check()">대여하기</button></div>
					  		</form>
						</c:if>
						<c:if test="${b.isRental != 'N'}">
							<div class="rental bg-light">책 번호 : ${ b.bookNumber }<br>상태 : <b class=" rentalNo">대출 불가</b></div>
							<br>
							<c:if test="${ !empty rentalList }">
					  			<c:forEach items="${rentalList}" var="rl">
				  					<c:if test="${rl == b.bookNumber }">
										<form action="${ contextPath }/returnBook.lib" method="POST">
								  			<input name="bookNumber" value="${b.bookNumber}" type="hidden">
								  			<input name="bookImage" value="${b.bookImage}" type="hidden">
								  			<input name="bookName" value="${b.bookName}" type="hidden">
								  			<input name="publisher" value="${b.publisher}" type="hidden">
								  			<input name="author" value="${b.author}" type="hidden">
								  			<input name="place" value="searchBookResult" type="hidden">
								  			<div><button class="returnButton" onclick="return check()">반납하기</button></div>
								  		</form>
					  				</c:if>
					  			</c:forEach>
							</c:if>
						</c:if>
						<br>
						<c:if test="${ !empty b.summary }">
							<div><button class="summaryButton" id="summaryButton${status.count}"><i class="bi bi-caret-down-fill"></i> 설명보기</button></div>
						</c:if>
				  	</div>
				</div>
					<c:if test="${ !empty b.summary }">
					  	<div class="row summary">
					  		<div class="col-3"></div>
						  	<div class="col-6 text-center" id="summary${status.count}" style="display: none;">
						  		<b>${b.summary}</b>
						  	</div>
						  	<div class="col-3"></div>
					  	</div>
						<script>
						var summaryButton${status.count} = document.getElementById("summaryButton" + ${status.count});
						var summary${status.count} = document.getElementById("summary" + ${status.count});
						
						summaryButton${status.count}.addEventListener('click', function(){
							if(summary${status.count}.style.display === "none") {
								summary${status.count}.style.display = "block";
							   } else {
								   summary${status.count}.style.display = "none";
							   }
						})
						</script>
					</c:if>  	
				</c:forEach>
			</c:if>
			<c:if test="${ empty list }">
				<h3>검색 결과가 존재하지 않습니다.</h3>
			</c:if>
		</div>
		<br>
		
		<!-- 페이징 처리 -->
		<nav aria-label="Page navigation example">
	       	<ul class="pagination justify-content-center">
	       		<c:if test="${pi.currentPage > 1 }">
	       			<li class="page-item">
	       			<c:if test="${ !empty category }">
	       				<c:url value="${ loc }" var="goBack">
	            			<c:param name="category" value="${category }"/>
	            			<c:param name="query" value="${query}"/>
	            			<c:param name="order" value="${ order }"/>
	            			<c:param name="page" value="${ pi.currentPage - 1 }"/>
	            		</c:url>
	       			</c:if>
	       			<c:if test="${ empty category }">
	       				<c:url value="${ loc }" var="goBack">
	            			<c:param name="page" value="${ pi.currentPage - 1 }"/>
	            		</c:url>
	       			</c:if>
	            	<a class="page-link" href="${ goBack }" aria-label="Previous">
	            		<span aria-hidden="true">&laquo;</span>
	              	</a>
	            </li>
	       		</c:if>
	            
	            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	            	<c:if test="${ !empty category }">
	            		<c:url value="${ loc }" var="goNum">
	            			<c:param name="category" value="${ category }"/>
	            			<c:param name="query" value="${ query }"/>
	            			<c:param name="order" value="${ order }"/>
	            			<c:param name="page" value="${ p }"/>
	            		</c:url>
	            	</c:if>
	            	<c:if test="${ empty category }">
	            		<c:url value="${ loc }" var="goNum">
	            			<c:param name="page" value="${ p }"/>
	            		</c:url>
	            	</c:if>
	            	
	            	<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
	            </c:forEach>
	            
	            <c:if test="${pi.currentPage < pi.maxPage }">
	            	<li class="page-item">
	            		<c:if test="${ !empty category }">
	            			<c:url value="${ loc }" var="goNext">
			            		<c:param name="category" value="${ category }"/>
			            		<c:param name="query" value="${ query }"/>
			            		<c:param name="order" value="${ order }"/>
			            		<c:param name="page" value="${ pi.currentPage + 1 }"/>
			            	</c:url>
	            		</c:if>
	            		<c:if test="${ empty category }">
	            			<c:url value="${ loc }" var="goNext">
			            		<c:param name="page" value="${ pi.currentPage + 1 }"/>
			            	</c:url>
	            		</c:if>
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
                   	<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal" id="modalButton">확인</button>
                   	<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">취소</button>
              	</div>
            </div>
    	</div>
    </div>
	
	<c:forEach items="${heartList}" var="he">
		<input class="heartList" type="hidden" value="${he}">
	</c:forEach>
		  
	<script>	
	
		const sBar = document.getElementById("searchBar");
		sBar.value = "${query}";
		
		if('${category}' != 'all'){
			const cSel = document.getElementById("categorySelect");
			cSel.value = "${category}";
		}
		
		if('${order}' != ''){
			const oBy = document.getElementById("orderBy");
			oBy.value = "${order}";
		}
		
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
		
		const modalButton = document.getElementById("modalButton");
	   	const modalText = document.getElementById("modalText");
	   	const modalIcon = document.getElementById("modalIcon");
	   	const contextPath = "${contextPath}";
		const login = "${login}";
		const message = "${message}";
		
		const check = () => {
			if(login == "false"){
				modalIcon.innerHTML = "<i class='bi bi-exclamation-triangle-fill' style='color: red;'></i>";
				modalText.innerHTML = "로그인이 필요한 서비스입니다."
				modalButton.innerHTML = "<a href='" + contextPath + "/loginView.me'>확인</a>";
				$('#modalId').modal('show');
				return false;
			}else if(message == "대여 가능 권수를 초과했습니다."){
				modalIcon.innerHTML = "<i class='bi bi-exclamation-triangle-fill' style='color: red;'></i>";
				modalText.innerHTML = "대여 가능 권수를 초과했습니다."
				modalButton.innerHTML = "<a href='" + contextPath + "/myBooks.lib'>확인</a>";
				$('#modalId').modal('show');
				return false;
			}else{
		  		return true;
			}
	  	}	
		
		
	</script>	  
	  
</body>
</html>