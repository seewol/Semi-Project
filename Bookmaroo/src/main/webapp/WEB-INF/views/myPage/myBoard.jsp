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

table{margin-bottom: 0px;}
.pagination{display: flex; align-items: center; justify-content: flex-end;}
.viewallbtn {background-color: rgb(67, 115, 230, 0.9); border: none; color:white; height: 50px; font-size: 20px; font-weight: bold;} 


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
				<br><br><br>
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
						<c:forEach items="${ BoardList }" var="b">
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
					
					
										<br><br>
					<nav aria-label="Standard pagination example" style="float: right;" id="jjj">
        	<ul class="pagination">
				
				<!-- 이전 페이지 이동 -->        	
        		<c:if test="${ pi.currentPage <= 1 }"> <!-- 1페이지보다 작을 경우 disable  -->
		            <li class="page-item">
		            	<a class="page-link rP" aria-label="Previous" style="color: lightgray;">
		            		<span aria-hidden="true">&laquo;</span>
		              	</a>
		            </li>
	            </c:if>
	            
        		<c:if test="${ pi.currentPage > 1 }"> <!-- 1페이지보다 클 경우 이전페이지로이동  -->
        			<c:url value="${ loc }" var="blistBack">
        				<c:param name="page" value="${ pi.currentPage - 1 }"/>
			    	</c:url>        
		            <li class="page-item">
		            	<a class="page-link rP" href="${ blistBack }" aria-label="Previous">
		            		<span aria-hidden="true">&laquo;</span>
		              	</a>
		            </li>
	            </c:if>
	         
	            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	            <c:if test="${ p eq pi.currentPage }">
	            	<li class="page-item"><a class="page-link rP">${ p }</a></li>
	            </c:if>
	            <c:if test="${ p ne pi.currentPage }">
	            	<c:url var="goNum" value="${ loc }">
	            		<c:param name="page" value="${ p }"/>
	            	</c:url>
		            <li class="page-item"><a class="page-link rP" href="${ goNum }">${ p }</a></li>
		        </c:if>    
	            </c:forEach>
	            
	            <c:if test="${ pi.currentPage >= pi.maxPage }">
	            	<a class="page-link rP" aria-label="Next" style="color:red;">
	            		<span aria-hidden="true">&raquo;</span>
	            	</a>
	            </c:if>
	            <c:if test="${ pi.currentPage < pi.maxPage }">
	            <li class="page-item">
	            	<c:url value="${ loc }" var="goNext">
	            		<c:param name="page" value="${ pi.currentPage + 1 }"/>
	            	</c:url>
	            	<a class="page-link rP" href="${goNext}" aria-label="Next">
	            		<span aria-hidden="true">&raquo;</span>
	            	</a>
	            </li>
	            </c:if>
	    	</ul>
        </nav>
					
					
					
					
					
					
					
					
					
					
					</div>
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

	const thead3 = document.querySelector('.thead3');
	const theadTr3 = thead3.querySelector('.cata3');
	const theadTrTh3 = theadTr3.querySelectorAll('th');
		theadTrTh3[0].style.width = '12%';	
		theadTrTh3[1].style.width = '3%';	
		theadTrTh3[2].style.width = '65%';	
		theadTrTh3[3].style.width = '3%';	
		theadTrTh3[4].style.width = '17%';	

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

	function viewAllReviewBtn() {
		location.href = '${contextPath}/myReview.myPage';
	}
	
	function viewAllReplyBtn(){
		location.href = '${contextPath}/myReply.myPage';
	}
	
	
	
	
	
	</script>
</body>
</html>