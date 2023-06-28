<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성글 확인</title>
<style>
.minheight {min-height: 612px;}
#info_area {margin-left: 1%; margin-top: 2%;}
#info_area>a {color: black; text-decoration: none; font-weight: 900; font-size: 45px;}
#review_table_area {width: 80%; margin: 0 auto; border: 1px solid lightgray; border-radius: 5px;}
/* #table {width: 100%;} */
/* tbody {line-height: 20px;} */
.review_bookName {text-overflow: ellipsis; white-space: nowrap; max-width: 160px; overflow: hidden;}
.review {text-overflow: ellipsis; white-space: nowrap; max-width: 320px; overflow: hidden;}
/* table th {text-align: center;} */


#board_list {width: 100%; font-size: 20px;}
#board_list2 {width: 100%; font-size: 20px;}
#board_list3 {width: 100%; font-size: 20px;}
#board_list tr {border-bottom: 1px solid lightgray; height: 60px; text-align: center;}
#board_list2 tr {border-bottom: 1px solid lightgray; height: 60px; text-align: center;}
#board_list3 tr {border-bottom: 1px solid lightgray; height: 60px; text-align: center;}
.which_table {background: rgb(67, 115, 230, 0.9); color: white;}
* td:hover{cursor: pointer;}

table{margin-bottom: 20px;}
.pagination{display: flex; align-items: center; justify-content: flex-end;} 


</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	<div class="row minheight">
		<div class="col-2">
			<jsp:include page="../common/myPageSide.jsp"/>
		</div>
		<div class="col-8">
			<!-- 작성 리뷰 -->
			<div id="info_area">
				<a href="${ contextPath }/writingHistory.myPage">작성글 확인</a>
				<br><br>
				<div id="review_table_area" class="row">	
					<table id="board_list">
						<thead class="thead">
							<tr>
								<th colspan="8" class="which_table">내 리뷰</th>
							</tr>
							<tr class="cata">
								<th>글번호</th>
								<th></th>
								<th>리뷰도서</th>
								<th></th>
								<th>글제목</th>
								<th></th>
								<th></th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody class="tbody">
						<c:forEach items="${ myReviewList }" var="rev">
							<tr>
								<td>${rev.reviewNo}</td>
								<td style="color: lightgray;">|</td>
								<td class="review_bookName">${rev.bookName}</td>
								<td></td>
								<td class="review">${rev.reviewTitle}</td>
								<td></td>
								<td style="color: lightgray;">|</td>
								<td>${rev.reviewUpdateDate}</td>
							</tr>
							<input type="hidden" name="reviewerName" value="${rev.reviewerName}">
						</c:forEach>
						</tbody>
					</table>
					<!-- 페이징 -->
					
        <nav aria-label="Standard pagination example" style="float: right;">
        	<ul class="pagination">
				
				<!-- 이전 페이지 이동 -->        	
        		<c:if test="${ reviewPi.currentPage <= 1 }"> <!-- 1페이지보다 작을 경우 disable  -->
		            <li class="page-item">
		            	<a class="page-link rP" aria-label="Previous" style="color: lightgray;">
		            		<span aria-hidden="true">&laquo;</span>
		              	</a>
		            </li>
	            </c:if>
	            
        		<c:if test="${ reviewPi.currentPage > 1 }"> <!-- 1페이지보다 클 경우 이전페이지로이동  -->
        			<c:url value="${ loc }" var="blistBack">
        				<c:param name="replyPage" value="${ reviewPi.currentPage - 1 }"/>
			    	</c:url>        
		            <li class="page-item">
		            	<a class="page-link rP" aria-label="Previous">
		            		<span aria-hidden="true">&laquo;</span>
		              	</a>
		            </li>
	            </c:if>
	         
	            <c:forEach begin="${ reviewPi.startPage }" end="${ reviewPi.endPage }" var="p">
	            <c:if test="${ p eq reviewPi.currentPage }">
	            	<li class="page-item"><a class="page-link rP">${ p }</a></li>
	            </c:if>
	            <c:if test="${ p ne reviewPi.currentPage }">
	            	<c:url var="goNum" value="${ loc }">
	            		<c:param name="replyPage" value="${ p }"/>
	            	</c:url>
		            <li class="page-item"><a class="page-link rP">${ p }</a></li>
		        </c:if>    
	            </c:forEach>
	            
	            <c:if test="${ reviewPi.currentPage >= reviewPi.maxPage }">
	            	<a class="page-link rP" aria-label="Next" style="color:red;">
	            		<span aria-hidden="true">&raquo;</span>
	            	</a>
	            </c:if>
	            <c:if test="${ reviewPi.currentPage < reviewPi.maxPage }">
	            <li class="page-item">
	            	<c:url value="${ loc }" var="goNext">
	            		<c:param name="replyPage" value="${ reviewPi.currentPage + 1 }"/>
	            	</c:url>
	            	<a class="page-link rP" aria-label="Next">
	            		<span aria-hidden="true">&raquo;</span>
	            	</a>
	            </li>
	            </c:if>
	    	</ul>
        </nav>
					
					
		</div>
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<!-- 페이징 -->
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
						
				
				<br><br>
				<div id="review_table_area" class="row">	
					<table id="board_list2">
						<thead class="thead2">
							<tr>
								<th colspan="8" class="which_table">내 댓글</th>
							</tr>
							<tr class="cata2">
								<th>댓글번호</th>
								<th></th>
								<th>댓글 내용</th>
								<th></th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody class="tbody2">
						<c:forEach items="${ myReplyList }" var="rep">
							<tr>
								<td>${rep.replyNo}</td>
								<td style="color: lightgray;">|</td>
								<td class="review_bookName">${rep.replyContent}</td>
								<td style="color: lightgray;">|</td>
								<td>${rep.replyUpdateDate}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>	
				</div>
				<br><br>
				<div id="review_table_area" class="row">	
					<table id="board_list3">
						<thead class="thead3">
							<tr>
								<th colspan="8" class="which_table">내 문의사항</th>
							</tr>
							<tr class="cata3">
								<th>글번호</th>
								<th></th>
								<th>글제목</th>
								<th></th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody class="tbody3">
						<c:forEach items="${ myBoardList }" var="b">
							<tr>
								<td>${b.boardNo}</td>
								<td style="color: lightgray;">|</td>
								<td class="review_bookName">${b.boardTitle}</td>
								<td style="color: lightgray;">|</td>
								<td>${b.boardUpdateDate}</td>
							</tr>
							<input type="hidden" name="writer" value="${b.writer}">
						</c:forEach>
						</tbody>
					</table>
					
					
					
					
					<!-- 페이징 -->
					
        <nav aria-label="Standard pagination example" style="float: right;">
        	<ul class="pagination">
        	
        		<c:if test="${ replyPi.currentPage <= 1 }"> <!-- 1페이지보다 작을 경우 disable  -->
		            <li class="page-item">
		            	<a class="page-link" aria-label="Previous" style="color: red;">
		            		<span aria-hidden="true">&laquo;</span>
		              	</a>
		            </li>
	            </c:if>
        		<c:if test="${ replyPi.currentPage > 1 }"> <!-- 1페이지보다 클 경우 이전페이지로이동  -->
        			<c:url value="${ loc }" var="blistBack">
        				<c:param name="reviewPage" value="${ replyPi.currentPage - 1 }"/>
			    	</c:url>        
		            <li class="page-item">
		            	<a class="page-link" href="${ blistBack }" aria-label="Previous">
		            		<span aria-hidden="true">&laquo;</span>
		              	</a>
		            </li>
	            </c:if>
	         
	            <c:forEach begin="${ replyPi.startPage }" end="${ replyPi.endPage }" var="p">
	            <c:if test="${ p eq replyPi.currentPage }">
	            	<li class="page-item"><a class="page-link" id="color-change">${ p }</a></li>
	            </c:if>
	            <c:if test="${ p ne replyPi.currentPage }">
	            	<c:url var="goNum" value="${ loc }">
	            		<c:param name="reviewPage" value="${ p }"/>
	            	</c:url>
		            <li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
		        </c:if>    
	            </c:forEach>
	            
	            <c:if test="${ replyPi.currentPage >= replyPi.maxPage }">
	            	<a class="page-link" aria-label="Next" style="color:red;">
	            		<span aria-hidden="true">&raquo;</span>
	            	</a>
	            </c:if>
	            <c:if test="${ replyPi.currentPage < replyPi.maxPage }">
	            <li class="page-item">
	            	<c:url value="${ loc }" var="goNext">
	            		<c:param name="reviewPage" value="${ replyPi.currentPage + 1 }"/>
	            	</c:url>
	            	<a class="page-link" href="${goNext}" aria-label="Next">
	            		<span aria-hidden="true">&raquo;</span>
	            	</a>
	            </li>
	            </c:if>
	    	</ul>
        </nav>
					
					
					</div>
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<!-- 페이징 -->
					
					
					
					
					
					
					
					
					
					
					
					
						
				</div>
				<br><br>
				<form action="replyHref.myPage" id="replyHrefForm">
					<input type="hidden" name="replyNo" id="replyHref">
				</form>
			
			
			
			
			
			
			
			
			
			
			
			
			</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		</div>
		<div class="col-2"></div>
	<jsp:include page="../common/bottom.jsp"/>
	<script>
	
	const thead = document.querySelector('.thead');
	const theadTr = thead.querySelector('.cata');
	const theadTrTh = theadTr.querySelectorAll('th');
		theadTrTh[0].style.width = '7%';
		theadTrTh[1].style.width = '3%';
		theadTrTh[2].style.width = '20%';
		theadTrTh[3].style.width = '3%';
		theadTrTh[4].style.width = '27%';
		theadTrTh[5].style.width = '3%';
		theadTrTh[6].style.width = '3%';
		theadTrTh[7].style.width = '14%';
	const title = document.getElementsByClassName('review_bookName');
	for(const t of title){
		t.style.textAlign = "left";
	}
	const review = document.getElementsByClassName('review');
	for(const t of review){
		t.style.textAlign = "left";
	}
	
	
	const thead2 = document.querySelector('.thead2');
	const theadTr2 = thead2.querySelector('.cata2');
	const theadTrTh2 = theadTr2.querySelectorAll('th');
		theadTrTh2[0].style.width = '12%';	
		theadTrTh2[1].style.width = '3%';	
		theadTrTh2[2].style.width = '65%';	
		theadTrTh2[3].style.width = '3%';	
		theadTrTh2[4].style.width = '17%';	
	
	const thead3 = document.querySelector('.thead3');
	const theadTr3 = thead3.querySelector('.cata3');
	const theadTrTh3 = theadTr3.querySelectorAll('th');
		theadTrTh3[0].style.width = '12%';	
		theadTrTh3[1].style.width = '3%';	
		theadTrTh3[2].style.width = '65%';	
		theadTrTh3[3].style.width = '3%';	
		theadTrTh3[4].style.width = '17%';	
	
	const tbody = document.querySelector('.tbody');
	const tds = tbody.querySelectorAll('td');
	for(const td of tds){
		td.addEventListener('click',function(){
			console.log('리뷰');
			const reviewNo = this.parentElement.children[0].innerText;
			console.log(reviewNo);
			const reviewerName = this.parentElement.nextElementSibling.value;
			console.log(reviewerName);
			location.href='${contextPath}/reviewDetail.bo?reviewNo='+reviewNo+'&reviewerName='+reviewerName+'&page=1';
		})
	}
	
	const tbody2 = document.querySelector('.tbody2');
	const tds2 = tbody2.querySelectorAll('td');
	for(const td of tds2){
		td.addEventListener('click',function(){
			console.log('댓글');
			const replyNo = this.parentElement.children[0].innerText;
			console.log(replyNo);
			const replyHref = document.getElementById('replyHref').value = replyNo;
			console.log(replyHref);
			
			console.log("DB REF_BOARD_NO -- B_NO 외래키 제약조건 설정해야함")
// 			document.getElementById('replyHrefForm').submit();
		})
	}
	
	const tbody3 = document.querySelector('.tbody3');
	const tds3 = tbody3.querySelectorAll('td');
	for(const td of tds3){
		td.addEventListener('click',function(){
			console.log('문의');
			const boardNo = this.parentElement.children[0].innerText;
			console.log(boardNo);
			const writer = this.parentElement.nextElementSibling.value;
			console.log(writer);
			
			location.href='${contextPath}/selectBoard.bo?boardNo='+boardNo+'&writer='+writer+'&page=1';
			
		})
	}
	
	
	/* ajax를 통한 페이징 처리 */
	
	let rPcP = '${reviewPi.currentPage}';
	let rP = document.getElementsByClassName('rP');
	
	console.log('현재페이지' + rPcP);
	console.log(rP);
	
	for(let rPi of rP){
		rPi.addEventListener('click',()=>{
			$.ajax({
				url: "${contextPath}/reviewPage.myPage",
				type: "post",
				dataType: "json",
				data: { reviewPage:rPi.innerText,
						currentPage:rPcP },
				success: data=>{
					console.log(data);
					for(const rP of data){
						console.log(rP.reviewNo);
						
						if(rPi.innerText == '1' || rPi.innerText == '2' || rPi.innerText == '3' || rPi.innerText == '4' || rPi.innerText == '5'){
							console.log('나참');
							rPcP = rPi.innerText;
						} else
						if(rPi.innerText == '«'){
							rPcP = rPcP - 1;
						} else if (rPi.innerText == '»'){
							console.log('슈발')
							rPcP = rPcP + 1;
						}
						console.log('클릭 후 현재페이지' + rPcP);
					}
				},
				error: data=>{
					console.log(data);
				}
			}); // rPi에대한 ajax끝
		}); // rPi에 대한 클릭 이벤트 종료
	}
	
	
	
	
	
	</script>
</body>
</html>