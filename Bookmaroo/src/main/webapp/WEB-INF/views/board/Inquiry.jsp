<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<style>
	* { font-family: 'Inter', sans-serif; }
	.minheight {min-height: 612px;}
	#board_area {margin-left: 1%; margin-top: 2%;}
	#board_area>a {color: black; text-decoration: none; font-weight: 900; font-size: 45px;}
	
	/* 	검색CSS */
	#search_area {margin-top: 3%; margin-bottom: 3%; margin-left: 1%; border: 1px solid lightgrey; 
		    border-radius: 10px; display: flex; align-items: center;}
	#search_bar {height: 50px; width: 100%;}
	#search_bar input[type="text"] { border: none; font-size:20px; outline: none; width: 80%; margin-left: 2%; margin-right: 3%; }
	#search_bar button { background-color: white; border: none; margin-left: 10px; font-size: 20px; }
	#search_bar select {border:none; height: 100%; border-radius: 10px;
						  width: 10%; font-size: 20px; outline: none;}
						  
	#board_list {width: 99%; margin-left: 1%; font-size: 20px;}
	#board_list tr {border-bottom: 1px solid lightgray; height: 60px; text-align: center;}
	
	#page_area{ text-align: center; margin-top: 3%; }
	#page_area a { color: black; text-decoration: none; }
	.btn_page{border: none; background-color: white; font-size: 30px; margin-left: 3%; font-weight: bold;}
	tbody td:hover{cursor: pointer;}
	
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../common/top3.jsp"/>
	<div class="row minheight">
		<div class="col-2">
			<jsp:include page="../common/side.jsp"/>
		</div>
		<div class="col-8">
			<div id="board_area">
				<a href="${ contextPath }/Announcement.bo">문의사항</a>
				<br><br>
				<span>&nbsp;<i class="bi bi-house"></i></span>
				<span>&nbsp;게시판 > 문의사항</span>
				
				<!-- 검색바 -->
				<div id="search_area">
					<form action="searchBoard.bo" method="get" id="search_bar">
						<select name="searchType">
						  <option value="all" <c:if test="${ searchType eq 'all' }">selected</c:if>>&nbsp;&nbsp;통합검색</option>
						  <option value="title" <c:if test="${ searchType eq 'title' }">selected</c:if>>&nbsp;&nbsp;제목</option>
						  <option value="content" <c:if test="${ searchType eq 'content' }">selected</c:if>>&nbsp;&nbsp;내용</option>
						  <option value="writer" <c:if test="${ searchType eq 'writer' }">selected</c:if>>&nbsp;&nbsp;글쓴이</option>
						</select>
						<input type="text" placeholder="검색어를 입력하세요" id="searchtext" autocomplete="off" name="search" value="${ search }">
						<input type="hidden" name="boardType" value="2">
						<button><i class="bi bi-search"></i></button>
					</form>
				</div>
				
				<hr style="width: 99%; margin-left: 1%;">
				
				<table id="board_list">
					<thead>
						<tr>
							<th>글번호</th>
							<th></th>
							<th>글제목</th>
							<th></th>
							<th>작성자</th>
							<th>비밀글</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${ empty boardList }">
				   			<tr>
				   				<td colspan="6">작성된 문의사항이 없습니다</td>
				   			</tr>
				   		</c:if>
				   		<c:if test="${ !empty boardList }">
								<c:forEach items="${ boardList }" var="b">
									<tr>
										<td>${ b.boardNo }</td>
										<td style="color: lightgray;">|</td>
										<td class="board_title">${ b.boardTitle }</td>
										<td style="color: lightgray;">|</td>
										<td>${ b.writer }</td>
										<c:if test="${memberName == b.writer}"><td></td></c:if>
										<c:if test="${memberName != b.writer}"><td><i class="bi bi-lock"></i></td></c:if>
										<td>${ b.boardUpdateDate }</td>
									</tr>
								</c:forEach>
						</c:if>
					</tbody>
				</table>	
					
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
								<c:param name="boardType" value="${ boardType }"/>
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
									<c:param name="boardType" value="${ boardType }"/>
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
								<c:param name="boardType" value="${ boardType }"/>
							</c:if>
				        </c:url>
				        <a href="${goNext}" class="btn_page"><i class="bi bi-skip-end-fill"></i></a>
					</c:if>
				</div>
				<br><br>
				<c:if test="${ !empty loginUser }">
					<div style="text-align: right;">
						<button class="btn btn-primary btn-default" style="background-color: #4373E6;" onclick="hrefPostingInquiry()">문의하기</button>
					</div>
				</c:if>
				<c:if test="${ empty loginUser }">
					<div style="text-align: right;">
						<button class="btn btn-primary btn-default" style="background-color: #4373E6;" onclick="needLogin()">문의하기</button>
					</div>
				</c:if>
				<br><br>
			</div>
		</div>
		<div class="col-2">
		</div>
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
		
	<div class="modal fade" tabindex="-1" role="dialog" id="warning1">
		<div class="modal-dialog" role="document">
	   		<div class="modal-content rounded-3 shadow">
	     		<div class="modal-body p-4 text-center">
	     			<h1><i class="bi bi-exclamation-triangle-fill" style="color: red;"></i></h1>
		       		<h3 class="mb-0">비밀글입니다</h3>
	     		</div>
	     		<div class="modal-footer flex-nowrap p-0">
	       			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal" onclick="focusDropBox();">확인</button>
	     		</div>
	   		</div>
	 	</div>
	</div>	
		
		
		
		
		
	<script type="text/javascript">
		
// 		console.log('${memberName}');
		
// 		window.onload=()=>{
			
			const thead = document.querySelector('thead');
			const theadTr = thead.querySelector('tr');
			const theadTrTh = theadTr.querySelectorAll('th');
				theadTrTh[0].style.width = '7%';
				theadTrTh[1].style.width = '5%';
				theadTrTh[2].style.width = '60%';
				theadTrTh[3].style.width = '3%';
				theadTrTh[4].style.width = '8%';
				theadTrTh[5].style.width = '7%';
				theadTrTh[6].style.width = '10%';
			const title = document.getElementsByClassName('board_title');
			for(const t of title){
				t.style.textAlign = "left";
			}
			
			const tbody = document.querySelector('tbody');
			const tds = tbody.querySelectorAll('td');
			for(const td of tds){
				td.addEventListener('click',function(){
					const boardNo = this.parentElement.children[0].innerText;
					const writer = this.parentElement.children[4].innerText;
					if('${memberName}' == writer){
						location.href='${contextPath}/selectBoard.bo?boardNo=' + boardNo + '&writer=' + writer + '&page=' + ${pi.currentPage};
					}else{
						$('#warning1').modal('show');
					}
				})
			}
			
// 		}
		
		function hrefPostingInquiry(){
			location.href="${ contextPath }/postingInquiry.bo";
		}
		//<a href="postingInquiry.bo">.ref="${contextPath}/postingInquiry.bo";
		
		function needLogin(){
			$('#warning').modal('show');
		}
		
		function goforLogin(){
			location.href="${ contextPath }/loginView.me";
		}
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>