<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>

	.container-lg {
		background: #A9AABC;
		transform: translate(450px, 35px);
	}

</style>
</head>
<body>



	<jsp:include page="../common/top4.jsp"/>
	<jsp:include page="../common/sideList.jsp"/>
	
	
	<!-- 게시글 상세보기 -->
	<!-- 페이지ㅡ 제목, 작성자, 내용 -->
	<!-- 일단 아이디와 글버 -->
	
	<div class="container-lg p-3 mt-3 position-absolute">
		<form action="${contextPath}/update.admin" method="post">
			<input type="hidden" value="${ noticePage }" name="noticePage">
			<div class="row g-3">
				<div class="col-12">
						<span class="badge rounded-pill bg-success text-bg-secondary bg-opacity-100 fs-3 mb-2 ms-3">공지사항 확인</span>
						<input type="hidden" value="${ b.boardContent }" name="boardContent">
						<input type="hidden" value="${ b.boardNo }" name="boardNo">
				</div>
					<div class="bg-white p-3">
						<div class="input-group py-2">
			  				<span class="input-group-text fs-4" id="inputGroup-sizing-default">제목</span>
			  				<input type="text" class="form-control" aria-label="Sizing example input" id="bTitle" value="${ b.boardTitle }" name="boardTitle" readonly>
						</div> 
						<div class="input-group py-2">
			  				<span class="input-group-text fs-4" id="inputGroup-sizing-default" >이름</span>
			  				<input type="text" class="form-control" value="${ b.writer }" name="writer" readonly>
						</div>
						<div class="input-group py-2">
							<span class="input-group-text fs-4">내용</span>
							<textarea class="form-control" rows="10" id="replyContent" style="resize: none;" readonly>${ b.boardContent }</textarea>
						</div>
		  			</div>
				<button type="button" class="ms-3 w-25 btn btn-dark btn-sm mt-3" onclick="location.href='noticeManage.admin?noticePage=${noticePage}'">목록 보기</button>	
				<button type="button" class="ms-3 w-25 btn btn-danger btn-sm" id="deleteModal">삭제</button>	
				<button class="ms-3 w-25 btn btn-success btn-sm">수정</button>
			</div>
		</form>
	</div>
	
	
	
	<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice" data-bs-backdrop="static">
			<div class="modal-dialog" role="document">
	    		<div class="modal-content rounded-3 shadow">
	      			<div class="modal-body p-4 text-center">
	        			<h3 class="mb-0">등록된 공지사항을 삭제할까요?</h3>
	        			<p class="mb-0">삭제 후 복구 할 수 없습니다.</p>
	      			</div>
	      			<div class="modal-footer flex-nowrap p-0">
	        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" onclick="location.href='${contextPath}/deleteNotice.admin?boardNo=${boardNo}&noticePage=${noticePage}'">
	        				<strong>네</strong>
	        			</button>
	        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
	      			</div>
	    		</div>
	  		</div>
		</div>
		
		
		
		<script>
			window.onload = () => {
				const deleteModal = document.getElementById('deleteModal');
				if(deleteModal != null) {
					deleteModal.addEventListener('click', () => {
						$('#modalChoice').modal('show');
					})
				}
			}
		</script>
	
	
</body>
</html>