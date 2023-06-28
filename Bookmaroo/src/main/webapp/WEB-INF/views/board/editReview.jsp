<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정페이지</title>
<style>
/* 	* { font-family: 'Inter', sans-serif; } */
	.minheight { min-height: 612px; }
	#book_info_area {margin-top: 2%; margin-bottom: 2%;;width: 100%; height: 364px;}
	#book_cover_area {display: flex; align-items: center;}
	#book_cover_area>img {margin: 0 auto;}
	.detail {display: flex; align-items: center;}
	#review_title {width: 98%; font-size: 20px; margin: 0 auto; height: 45px; border-radius: 5px; border-color: lightgray;}
	#review_content {width: 98%; font: 18px; margin: 0 auto; margin-top: 2%; resize: none; min-height: 400px;}
	#btn_area {text-align: right; margin-right: 2%; margin-top: 1%; margin-bottom: 2%;}
	#btn_area button {border: none; background-color: rgb(67, 115, 230); border-radius: 5px; height: 40px; width: 80px; color: white;}
	#btn_area button>a {text-decoration: none; color: white; font-size: 18px;}
	#select_book_area {margin-top: 2%;}
	#fs {width: 96%; font-size: 20px; margin: 0 auto;}
	
	@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
	.rate { display: inline-block;border: 0;margin-right: 15px;}
	.rate > input {display: none;}
	.rate > label {float: right;color: #ddd}
	.rate > label:before {display: inline-block;font-size: 5rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
	.rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
	.rate input:checked ~ label, 
	.rate label:hover,.rate label:hover ~ label { color: #FFE302 !important;  } 
	.rate input:checked + .rate label:hover,
	.rate input input:checked ~ label:hover,
	.rate input:checked ~ .rate label:hover ~ label,  
	.rate label:hover ~ input:checked ~ label { color: #FFE302 !important;  } 
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>    
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../common/top3.jsp"/>
	<div class="row minheight">
		<div class="col-3"></div>
		<div class="col-6">
			<form id="review_form" action="reviewUpdate.bo" method="get">
				<div id="select_book_area">
					<select class="form-select" id="fs" aria-label="Default select example" onchange="selectFunc()" required>
					  <option value="" selected>리뷰 도서를 선택하세요</option>
						  <c:forEach items="${ bookList }" var="b">
						  	<option value="${ b.bookName }"<c:if test="${ rev.bookName eq b.bookName }">selected</c:if>>${ b.bookName }</option>
						  </c:forEach>
					</select>
				</div>
				<div id="book_info_area" class="row">
					<div class="col-6" id="book_cover_area">
						<img src="${ rev.bookImage }" alt="클릭해서 이미지를 삽입해주세요" height="324px" width="216px" id="book_img">
					</div>
					<div class="col-6 row row-cols-1">
						<div class="col detail"></div>
						<div class="col detail" id="ISBN">ISBN : ${ rev.reviewBookISBN }</div>
						<div class="col detail" id="bookName">제목 : ${ rev.bookName }</div>
						<div class="col detail" id="bookautor">저자 : ${ reviewBook.author }</div>
						<div class="col detail" id="bookGenre">장르 : ${ reviewBook.gmName }/${ reviewBook.gsName }</div>
						<div class="col detail" id="bookPublisher">출판사 : ${ reviewBook.publisher }</div>
						<div class="col detail"></div>
						<div class="col detail"></div>
					</div>
				</div>
				<div id="content_area">
					<input type="text" id="review_title" name="reviewTitle" placeholder="제목을 입력하세요" value="${ rev.reviewTitle }" required>
					<textarea id="review_content" name="reviewContent" placeholder="내용을 입력하세요">${ rev.reviewContent }</textarea>	
					<input type="hidden" name="starRating" id="starRating">
					<input type="hidden" name="bookName" id="booktitle">
					<input type="hidden" name="reviewBookISBN" id="reviewBookISBN" value="${rev.reviewBookISBN}">
					<input type="hidden" name="reviewNo" id="reviewNo" value="${rev.reviewNo}">
				</div>
				<div id="btn_area">
					<button type="button" id="submitForm">수정하기</button>
					<button type="button" id="goBack">취소</button>
				</div>
			</form>
		</div>
		<div class="col-3"></div>
	</div>
	<jsp:include page="../common/bottom.jsp"/>
	
	<!-- 모달 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
	<div class="modal-dialog" role="document">
   		<div class="modal-content rounded-3 shadow">
     			<div class="modal-body p-4 text-center">
	       			<h3 class="mb-0">작성한 내용은 저장되지 않습니다</h3>
	       			<p class="mb-0">정말로 목록으로 돌아가실건가요?</p>
     			</div>
     			<div class="modal-footer flex-nowrap p-0">
       			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id="backToList" onclick="#">
       				네
       			</button>
       			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
     			</div>
   		</div>
 	</div>
	</div>
	
	<!-- 평점 모달 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="submitModal">
	<div class="modal-dialog" role="document">
   		<div class="modal-content rounded-3 shadow">
     			<div class="modal-body p-4 text-center">
	       			<p class="mb-0">책은 어떠셨나요?</p>
	       			<p class="mb-0">책에 대한 별점을 주세요</p>
	       			<br>
	       			<h3 class="mb-0">
						<fieldset class="rate">
							<input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
							<input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5점"></label>
							<input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
							<input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5점"></label>
							<input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
							<input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5점"></label>
							<input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
							<input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5점"></label>
							<input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
							<input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="0.5점"></label>
						</fieldset>
	       			</h3>
     			</div>
     			<div class="modal-footer flex-nowrap p-0">
       			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id="backToList" onclick="posting();">
       				네
       			</button>
       			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
     			</div>
   		</div>
 	</div>
	</div>
	
	<!-- 경고 모달 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="warning1">
		<div class="modal-dialog" role="document">
	   		<div class="modal-content rounded-3 shadow">
	     		<div class="modal-body p-4 text-center">
	     			<h1><i class="bi bi-exclamation-triangle-fill" style="color: red;"></i></h1>
		       		<h3 class="mb-0">리뷰 도서를 선택해주세요</h3>
	     		</div>
	     		<div class="modal-footer flex-nowrap p-0">
	       			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal" onclick="focusDropBox();">확인</button>
	     		</div>
	   		</div>
	 	</div>
	</div>
	
	<!-- 경고 모달 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="warning2">
		<div class="modal-dialog" role="document">
	   		<div class="modal-content rounded-3 shadow">
	     		<div class="modal-body p-4 text-center">
	     			<h1><i class="bi bi-exclamation-triangle-fill" style="color: red;"></i></h1>
		       		<h3 class="mb-0">리뷰 제목을 입력해주세요</h3>
	     		</div>
	     		<div class="modal-footer flex-nowrap p-0">
	       			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal" onclick="focusTitle();">확인</button>
	     		</div>
	   		</div>
	 	</div>
	</div>
	
	
	<script>
	window.onload = () =>{
		
		document.getElementById('goBack').addEventListener('click',()=>{
			$('#modalChoice').modal('show');
		});
		
		document.getElementById('backToList').addEventListener('click',()=>{
			location.href = '${ contextPath }/Review.bo';
		});
		
		document.getElementById('submitForm').addEventListener('click',()=>{
			if(document.getElementById('fs').value != '' && document.getElementById('review_title').value.trim() != '') {
				$('#submitModal').modal('show');
			}else if(document.getElementById('fs').value == '') {
				$('#warning1').modal('show');
			}else if(document.getElementById('fs').value != '' && document.getElementById('review_title').value.trim() == '') {
				$('#warning2').modal('show');
			}
		});
		
	}
	
		function selectFunc() {
		  let selected = document.getElementById('fs');
		  console.log(selected.value);
		  $.ajax({
			 url: '${contextPath}/selectBook.bo',
			 data: {
				 	bookName:selected.value
			 },
			 success: data =>{
				 console.log(data); 
				 document.getElementById('ISBN').innerText = 'ISBN : ' + data.bookISBN;
				 document.getElementById('bookName').innerText = '제목 : ' + data.bookName;
				 document.getElementById('bookautor').innerText = '저자 : ' + data.author;
				 document.getElementById('bookGenre').innerText = '장르 : ' + data.gmName + "/" + data.gsName;
				 document.getElementById('bookPublisher').innerText = '출판사 : ' + data.publisher;
				 document.getElementById('book_img').src = data.bookImage;
				 document.getElementById('reviewBookISBN').value = data.bookISBN;
			 },
			 error: data =>{
				 console.log(data);
			 }
		  });
		};
		
		function focusDropBox(){
			document.getElementById('fs').focus();
		}
		
		function focusTitle(){
			document.getElementById('review_title').focus();
		}
		
		function posting(){
			const ratingButtons = document.querySelectorAll('input[name="rating"]');
			let starValue;

			ratingButtons.forEach((button) => {
			  if (button.checked) {
			    starValue = button.value;
			  }
			});
			
			if (starValue === undefined) {
			    starValue = 0;
			}
			
			const starRating = document.getElementById('starRating')
			starRating.value = starValue;
			
			document.getElementById('booktitle').value = document.getElementById('fs').value;
			
			document.getElementById('review_form').submit();
		}
	
	</script>
</html>