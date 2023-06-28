<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책마루도서관</title>
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	#main{max-width: 1200px; min-height: 682px;}
	#mid{min-width: 1800px;}
	#searchButton{
		color: white; background-color: rgb(67, 115, 230);
		width: 90px;
	}
	.bookImage{
		height: 216px;
		width: 144px;
		cursor: zoom-in;
	}
</style>
</head>
<body>
	<!-- top.jsp -->
	<%@ include file="../../../WEB-INF/views/common/top3.jsp"%>

		<div class="row" id="mid">
		
			<div class="col-2">
				<%@ include file="../../../WEB-INF/views/common/sideLib.jsp"%>
			</div>
			
			<div class="col-8" id="main">
			<br>
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
					<h1 class="h1">도서 검색</h1>
				</div>
				<br>
					<div>
						<form method="get" class="search-form d-flex justify-content-center" action="${ contextPath }/searchBookResult.lib">
							<div class="input-group">
								<select class="bg-light" name="category">
									<option selected value="all">전체</option>
									<option value="b_name">제목</option>
									<option value="author">저자</option>
									<option value="publisher">출판사</option>
								</select> 
								&nbsp; &nbsp; &nbsp; 
								<input class="form-control mr-sm-2 w-50" type="search" placeholder="검색어 입력" id="searchBar" name="query">
								&nbsp; &nbsp; &nbsp;
								<button class="btn my-2 my-sm-0 rounded-start" id="searchButton"><i class="bi bi-search"></i> 검색</button>
							</div>
						</form>
					</div>
				<br><br><br><br>
				<div>
					<nav>
						<ul class="nav nav-tabs">
							<li class="nav-item"><button class="nav-link" id="category1Button">새로 출시된 책</button></li>
							<li class="nav-item"><button class="nav-link" id="category2Button">대출이 많은 책</button></li>
						</ul>
					</nav>
					<br>
					<div class="tab-pane" id="category1">
						<c:forEach items="${newList}" var="n" varStatus="status">
							<c:if test="${status.index < 3 }">
								<img src="${n.bookImage}" alt="새로 출시된 책" class="bookImage" id="bookImageN${status.count}">
								
									<div class="modal fade" tabindex="-1" role="dialog" id="modalIdN${status.count}">
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
							            			<img src="${n.bookImage}" alt="책 이미지" style="width: 259px" style="height: 172px">
							            		</div>
							            		<div class="col-6">
							            			도서관리번호 : ${n.bookNumber}
							            			<br><br>
							            			ISBN : ${n.bookISBN}
							            			<br><br>
							            			도서명 : ${n.bookName}
							            			<br><br>
							            			장르명 : ${n.gmName}
							            			<br><br>
							            			작가 : ${n.author}
							            			<br><br>
							            			출판사 : ${n.publisher}
							            			<br><br>
							            			발행일자 : ${n.publication}
							            			<br><br>
							            			소장도서수 : ${n.bookCount}
							            			<br><br>
							            			등록일 : ${n.resistDate}
							            			<br><br>
							            			대출여부 : ${n.isRental}
							            			<br><br>
							            			별점 평균 : ${n.stars / 2}
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
								            		<c:if test="${ !empty n.summary }">
									            		${n.summary}
								            		</c:if>
								            		<c:if test="${ empty n.summary }">
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
							 		var bookImagesN = document.getElementById("bookImageN" + ${status.count});
							 		bookImagesN.addEventListener('click', function(){
							 			$('#modalIdN' + ${status.count}).modal('show');
							 		})
							 	</script>
					 	
							</c:if>
						</c:forEach>
					</div>
					<div class="tab-pane" id="category2">
						<c:forEach items="${hotList}" var="h" varStatus="status">
							<c:if test="${status.index < 3 }">
								<img src="${h.bookImage}" alt="대출이 많은 책" class="bookImage" id="bookImageH${status.count}">
								
									<div class="modal fade" tabindex="-1" role="dialog" id="modalIdH${status.count}">
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
								            			<img src="${h.bookImage}" alt="책 이미지" style="width: 259px" style="height: 172px">
								            		</div>
								            		<div class="col-6">
								            			도서관리번호 : ${h.bookNumber}
								            			<br><br>
								            			ISBN : ${h.bookISBN}
								            			<br><br>
								            			도서명 : ${h.bookName}
								            			<br><br>
								            			장르명 : ${h.gmName}
								            			<br><br>
								            			작가 : ${h.author}
								            			<br><br>
								            			출판사 : ${h.publisher}
								            			<br><br>
								            			발행일자 : ${h.publication}
								            			<br><br>
								            			소장도서수 : ${h.bookCount}
								            			<br><br>
								            			등록일 : ${h.resistDate}
								            			<br><br>
								            			대출여부 : ${h.isRental}
								            			<br><br>
								            			별점 평균 : ${h.stars / 2}
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
									            		<c:if test="${ !empty h.summary }">
										            		${h.summary}
									            		</c:if>
									            		<c:if test="${ empty h.summary }">
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
								 		var bookImagesH = document.getElementById("bookImageH" + ${status.count});
								 		bookImagesH.addEventListener('click', function(){
								 			$('#modalIdH' + ${status.count}).modal('show');
								 		})
								 	</script>
								
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			
			<!-- 화면 중앙 오른쪽 여백 생성 -->
			<div class="col-2">
			</div>
			
		</div>
		
	<!-- bottom.jsp -->
	<%@ include file="../../../WEB-INF/views/common/bottom.jsp"%>
	
	<div class="modal fade" tabindex="-1" role="dialog" id="modalId">
      	<div class="modal-dialog" role="document">
            <div class="modal-content rounded-3 shadow">
              	<div class="modal-body p-4 text-center">
                 	<h1 id="modalIcon"><i class="bi bi-check-circle" style="color: green;"></i></h1>
                   	<h3 class="mb-0" id="modalText"></h3>
              	</div>
              	<div class="modal-footer flex-nowrap p-0">
                   	<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal" id="modalButton">확인</button>
              	</div>
            </div>
    	</div>
    </div>
	
	<script>
	
		window.onload = () =>{
		   	const contextPath = "${contextPath}";
			const successMessage = "${successMessage}";
		   	const modalText = document.getElementById("modalText");
		   	if (successMessage != "") {
		      	modalText.innerText = successMessage;
		   		$('#modalId').modal('show');
		   	}
		}		
	
	  	const category1B = document.getElementById("category1Button");
	  	const category2B = document.getElementById("category2Button");
	  	const category1 = document.getElementById("category1");
	  	const category2 = document.getElementById("category2");
	  
	  	category1.hidden = false;
	  	category2.hidden = true;
	  	category1B.style.background = 'rgb(67, 115, 230)';
		category1B.style.color = 'white';
		category2B.style.background = '#A9AABC';
		category2B.style.color = 'black';
	  
		category1B.addEventListener('click', ()=>{
			category1.hidden = false;
			category2.hidden = true;
			category1B.style.background = 'rgb(67, 115, 230)';
			category1B.style.color = 'white';
			category2B.style.background = '#A9AABC';
			category2B.style.color = 'black';
		})
		category2B.addEventListener('click', ()=>{
			category2.hidden = false;
			category1.hidden = true;
			category2B.style.background = 'rgb(67, 115, 230)';
			category2B.style.color = 'white';
			category1B.style.background = '#A9AABC';
			category1B.style.color = 'black';
		})
		
	  
	</script>
	
</body>
</html>