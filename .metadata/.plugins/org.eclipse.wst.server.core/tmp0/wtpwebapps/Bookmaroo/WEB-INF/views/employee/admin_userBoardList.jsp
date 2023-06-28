<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	.container-lg {
		padding: 30px;
		transform: translate(450px, 35px);
		background: #A9AABC;
	}
	.plus-transform {
		transform: translate(450px, 480px);
	}
	.userList {
/* 		height:1000px; */
		background: white;
	}
/* 	.userInfo { */
/* 		height: 400px; */
/* 	} */
	.userList,
	.userInfo {
		border: 1px solid lightgray;
	}
	.disable {
		cursor: no-drop;
		user-select: none;
	}
	tr:hover {
		cursor: pointer;
	}
</style>
</head>
<body>
	
	<jsp:include page="../common/top4.jsp"/>
	<jsp:include page="../common/sideList.jsp"/>
	
	<section class="container-lg mt-4 position-absolute">
		<div class="row g-3">
			<div class="col-md-6 mb-2 userInfo userList d-flex flex-column border-3 shadow fw-bold">
			<span class="badge rounded-pill bg-primary text-bg-secondary bg-opacity-100 fs-5 w-25 m-2">상세정보</span>
				<label for="formGroupExampleInput" class="form-label mt-2">회원번호</label>
				<input type="text" class="form-control" id="memNo" name="memNo" value="${ m.memNo }" readonly>
				<label for="formGroupExampleInput" class="form-label mt-2">아이디</label>
				<input type="text" class="form-control" id="memId" name="memId" value="${ m.memId }" readonly>
				<label for="formGroupExampleInput" class="form-label mt-2">이름</label>
				<input type="text" class="form-control" id="memName" name="memName" value="${ m.memName }" readonly>
				<label for="formGroupExampleInput" class="form-label mt-2">전화번호</label>
				<input type="text" class="form-control" id="phone" name="phone" value="${ m.phone }" readonly>
				<label for="formGroupExampleInput" class="form-label mt-2">가입일</label>
				<input type="text" class="form-control" id="enrollDate" name="enrollDate" value="${ m.enrollDate }" readonly>
				<label for="formGroupExampleInput" class="form-label mt-2">대출가능여부</label>
				
				<!-- 대출가능 여부 -->
				<input type="text" class="form-control" id="isRental" name="isRental" value="${ m.isRental == -1 ? '불가능' : '가능' }" readonly>
				
<!-- 				<label for="formGroupExampleInput" class="form-label mt-2">카카오ID</label> -->
<%-- 				<input type="number" class="form-control" id="kakaoId" name="kakaoId" value="${ m.kakaoId }" readonly> --%>
				<div class="mx-auto mt-2 pb-2">
					<c:if test="${ m.memStatus eq 'Y' }">
						<c:if test="${ returnResult != 0 }">
							<button type="button" class="btn btn-danger btn-lg rounded-pill shadow p-2 text-white">현재 대출 도서가 있는 사용자 입니다.</button>
						</c:if>
						<c:if test="${ returnResult == 0 }">
							<button type="button" id="updateUser" class="btn btn-danger btn-lg rounded-pill shadow p-2 text-white">이용자 비활성화</button>
						</c:if>
					</c:if>
					<c:if test="${ m.memStatus eq 'N' }">
							<button type="button" id="updateUser" class="btn btn-success btn-lg rounded-pill shadow p-2 text-white">이용자 활성화</button>
					</c:if>
					<button type="button" class="btn btn-dark btn-lg rounded-pill shadow p-2 text-white" onclick="location.href='${contextPath}/userManage.admin?page='+${page}">목록보기</button>
				</div>
			</div>
			
			
			
			<!-- 이용자 대출 도서 상황 -->
			<div class="col-lg-6 d-flex flex-column">
				
				<div class="border border-1 p-3 bg-white shadow fw-bold">
				<!-- 방법 1 -->
					<span class="badge rounded-pill bg-primary text-bg-secondary bg-opacity-100 fs-5 mb-3">이용자 도서대출 현황</span>
					
						<c:forEach items="${ bList }" var="b">
							<img src="${ b.bookImage }" class="rounded mt-3 mx-auto d-block" alt="도서 사진">
							<label for="formGroupExampleInput" class="form-label mt-2">대출번호</label>
							<input type="text" class="form-control bg-secondary bg-opacity-50" value="${ b.rentNo }" id="rentNo" readonly>
							<label for="formGroupExampleInput" class="form-label mt-2">ISBN</label>
							<input type="text" class="form-control bg-secondary bg-opacity-50" value="${ b.bookISBN }" id="bookISBN" readonly>
							<label for="formGroupExampleInput" class="form-label mt-2">대출 도서 명</label>
							<input type="text" class="form-control bg-secondary bg-opacity-50" value="${ b.bookName }" id="bookName" readonly>
							<label for="formGroupExampleInput" class="form-label mt-2">대출 일자</label>
							<input type="text" class="form-control bg-secondary bg-opacity-50" value="${ b.rentDate }" id="rentDate" readonly>
							<label for="formGroupExampleInput" class="form-label mt-2">반납 예정일</label>
							<input type="text" class="form-control bg-secondary bg-opacity-50" value="${ b.dueDate }" id="ueDate" readonly>
<!-- 							<label for="formGroupExampleInput" class="form-label mt-2">반납일</label> -->
<%-- 							<input type="text" class="form-control bg-secondary bg-opacity-50" value="${ b.returnDate }" id="returnDate" readonly> --%>
						</c:forEach>
<%-- 						<c:forEach items="${ empty bList }" > --%>
<!-- 							<h2>대출한 도서가 없습니다.</h2> -->
<%-- 						</c:forEach> --%>
				</div>
				
			
			
			<!-- 페이지 네이션 수정용 -->
<%-- 		<input type="hidden" value="${ bookPage }" name="bookPage"/> --%>
			<div class="col-12 d-flex bg-white justify-content-center">
			  <ul class="pagination">

				
			    <li class="page-item">
			    	<!-- 페이지 처리 막기 -->
			    	<c:if test="${ bookPage.currentPage <= 1 }">
			    		<a class="page-link bg-secondary bg-opacity-50 disable">&lt;</a>
			    	</c:if>
			    	<!-- 페이징 처리 현재 페이지가 1보다 클 때 -->
			    	<c:if test="${ bookPage.currentPage > 1 }">
			    		<c:url value="${ loc }" var="bListBack">
				    		<c:param name="userNo" value="${ m.memNo }"/>
				    		<c:param name="page" value="${ page }"/>
				    		<c:param name="bookPage" value="${ bookPage.currentPage - 1 }"/>
			    		</c:url>
			    		<a class="page-link" href="${ bListBack }">&lt;</a>
			    	</c:if>
			    </li>
			    
			    
			    
			    <!-- number -->
			    <c:forEach begin="${ bookPage.startPage }" end="${ bookPage.endPage }" var="bp">
			    	<c:url var="goNum" value="${ loc }">
			    		<c:param name="userNo" value="${ m.memNo }"/>
			    		<c:param name="page" value="${ page }"/>
			    		<c:param name="bookPage" value="${ bp }"/>
			    	</c:url>
			    	<li class="page-item"><a class="page-link" href="${ goNum }">${ bp }</a></li>
			    </c:forEach>
			    <!-- number -->
			    
			    
			    
			    <li class="page-item">
			    	<c:url value="${ loc }" var="goNext">
			    		<c:param name="userNo" value="${ m.memNo }"/>
			    		<c:param name="page" value="${ page }"/>
			    		<c:param name="bookPage" value="${ bookPage.currentPage + 1 }"/>
			    	</c:url>
			    	<c:if test="${ bookPage.currentPage == bookPage.maxPage }">
			    		<a class="page-link bg-secondary bg-opacity-50 disable">&gt;</a>
			    	</c:if>
			    	<c:if test="${ bookPage.currentPage < bookPage.maxPage }">
			    		<a class="page-link" href="${ goNext }">&gt;</a>
			    	</c:if>
			    </li>
			  </ul>
			</div>
		
			</div>
		</div>
	</section>
	
	
		<!-- 이용자 계정 비활성화 하기(모달 창) -->
		<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice" data-bs-backdrop="static">
			<div class="modal-dialog" role="document">
	    		<div class="modal-content rounded-3 shadow">
	      			<div class="modal-body p-4 text-center">
	        			<h3 class="mb-0">계정 상태를 변경하십니까?</h3>
	      			</div>
	      			<div class="modal-footer flex-nowrap p-0">
	        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" onclick="location.href='${contextPath}/updateUser.admin?userNo=${m.memNo}&page=${page}'">
	        				<strong>네</strong>
	        			</button>
	        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
	      			</div>
	    		</div>
	  		</div>
		</div>
		
		
		
		<script>
			window.onload = () => {
				const updateUser = document.getElementById('updateUser');
				if(updateUser != null) {
					updateUser.addEventListener('click', () => {
						$('#modalChoice').modal('show');
					})
				}
			}
		</script>
		
</body>
</html>