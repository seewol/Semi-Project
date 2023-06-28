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
	#summernotes{
		margin: 0 auto;
	}
	#summernotes2{
		margin: 0 auto;
	}
	.container-lg {
		background: #A9AABC;
		transform: translate(450px, 35px);
	}
	tr:hover {
		cursor: pointer;
	}
	.disable {
		cursor: no-drop;
		user-select: none;
	}
</style>
</head>
<body>
	<jsp:include page="../common/top4.jsp"/>
 	<jsp:include page="../common/sideList.jsp"/>
	
		<!-- 게시글 누르면 글번호,제목,작성일 뜨게 하기. -->
		<section class="container-lg p-3 mt-3 position-absolute" id="container-lg2">
			<div class="row p-2">
				<div class="col-12 g-3">
					<span class="badge rounded-pill ms-4 mb-2 bg-success bg-opacity-100 fs-3">교육문화 프로그램 목록</span>
					<div class="col-12 bg-white">
						<table class="table table-hover text-center">
						  <thead>
						    <tr>
						      <th scope="col">번호</th>
						      <th scope="col">작성자</th>
						      <th scope="col">제목</th>
						    </tr>
						  </thead>
						  <tbody class="table-group-divider">
						    <tr>
						      <th scope="row"><input class="form-check-input me-1" type="checkbox" value="boardNum" id="">56</th>
						      <td>1022</td>
						      <td>TEST1</td>
						    </tr>
						    <tr>
						      <th scope="row"><input class="form-check-input me-1" type="checkbox" value="boardNum" id="">57</th>
						      <td>1022</td>
						      <td>TEST2</td>
						    </tr>
						    <tr>
						      <th scope="row"><input class="form-check-input me-1" type="checkbox" value="boardNum" id="">58</th>
						      <td>1022</td>
						      <td>TEST3</td>
						    <tr>
						  </tbody>
						</table>
						
						<div class="col-12 d-flex justify-content-center">
						  <ul class="pagination">
						    <li class="page-item">
						    	<a class="page-link" href="#">&lt;</a>
						    </li>
						    <li class="page-item"><a class="page-link" href="#">1</a></li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item">
						    	<a class="page-link" href="#">&gt;</a>
						    </li>
						  </ul>
						</div>
					</div>
					<div class="text-end">
	                	<button type="button" class="btn btn-outline-primary mt-2 ps-3 pe-3 fs-5  shadow" onclick="location.href='${contextPath}/popupList.adminAttm'">첨부파일 목록보기</button>
	                	<button type="button" class="btn btn-danger mt-2 ps-3 pe-3 fs-5 rounded-pill shadow">삭제</button>
           			</div>
				</div>

				<div class="col-12 mt-5">
				<span class="badge rounded-pill ms-4 mb-2 bg-success bg-opacity-100 fs-3">교육문화 프로그램 등록</span>
					<div class="row">
						<!-- 첨부파일 등록 -->
						<form action='${contextPath}/insertPopup.adminAttm' method="post" enctype="multipart/form-data" id="attmForm">
							<div class="col-6">	                        			          
							  	<input class="form-control form-control-lg mt-3" placeholder="등록할 팝업 제목 입력" name="popTitle" type="text" required>
							  	<button type="button" class="btn btn-outline-success mt-2 mb-2 p-2 fs-5 shadow" id="addFile">+ 파일 추가</button>
	<!-- 							  <input class="form-control form-control-lg" id="formFileLg" type="file" name="file"> -->
								<div id="fileArea">
									<div class="mb-3">
										<input type="file" class="form-control form-control-lg" name="file" accept=".gif, .jpg, .png"/>
									</div>
								</div>
							</div>
							<div class="col-6">
								<div class="text-end mt-2">
				                	<button id="submitAttm" class="btn btn-primary mt-2 p-2 fs-5 rounded-pill shadow">등록</button>
				                </div>
							</div>
						</form>
						<!-- 여기까지가 첨부파일 등록 form -->
					</div>
				</div>
			</div>

		</section>
		
		<!-- 컨트롤러에서 리퀘스트 파람으로 HttpServletRequest request애 있는 아이디 받아서 보내게끔
		그렇게 해서 DB내 M_N이 적용 되도록 -->
					
			
			<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
			<div class="modal-dialog" role="document">
	    		<div class="modal-content rounded-3 shadow">
	      			<div class="modal-body p-4 text-center">
	        			<h3 class="mb-0">등록 시 첨부파일을 삽입해 주세요.(JPG, PNG, GIF만 가능합니다.)</h3>
	      			</div>
	      			<div class="modal-footer p-0">
	        		<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none m-0 rounded-0" data-bs-dismiss="close">바탕화면 클릭하여 나가기</button> 
	      			</div>
	    		</div>
	  		</div>
		</div>
			
		
		
		
		
		
		
		
		
		<script>
		
// 			const nQuery = document.getElementById("noticeQuery");
// 			nQuery.value = "${noticeQuery}";
			
			
// 			const nCategory = document.getElementById("noticeCategory");
// 			nCategory.value = "${noticeCategory}";
			
						
		</script>
		
		<script>
		//게시글 상세조회.
	  	// 게시글 눌렀을 때 이용자의 정보 가져오기
// 	  	const tbody = document.querySelector('tbody');
// 	  	const tds = tbody.querySelectorAll('td');
// 	  	for(const td of tds) {
// 	  		td.addEventListener('click', function() {
// 	  			const trTds = td.parentElement.children
	  			
// 	  			//공지사항 번호
// 	  			const boardNum = trTds[0].innerText;
// 	  			//게시글 제목
// 	  			const boardTitle = trTds[1].innerText;
// 	  			//작성자 이름
// 	  			const boardWriter = trTds[3].innerText;
// 	  			//게시글 내용
// 	  			const boardContent = trTds[2].innerText;
	  			
// 	  			console.log(this);
	  			
// 	  			//notice.adminBoard로 데이터 담아서 url에 전송
// 	 	  			location.href='${contextPath}/notice.adminBoard?bNo=' + boardNum 
// 	 			  											+ '&bWriter=' + boardWriter
// 	 			  											+ '&page=' + ${ pi.currentPage };
// 	  		})
// 	  	}
	  	
	  	
// 	  	//공지사항 제목과 내용에 아무것도 안적었다면 제줄 못하게 막음.
// 	  	const title = document.getElementById('title');
// 	  	const content = document.getElementById('content');
// 	  	const submitBtn = document.getElementById('noticeSubmit');

// 		 submitBtn.addEventListener('click', e => {
// 			 if(title.value.trim() == '') {
// 			  		alert("제목을 입력해 주세요.")
// 			  		title.focus();
// 			  		e.preventDefault();
// 			  	} else if(content.value.trim() == '') {
// 			  		alert("내용을 입력해 주세요.")
// 			  		content.focus();
// 			  		e.preventDefault();
// 			  	}
// 			}) 	
	
	//파일요소 추가하기
	window.onload = () => {
		const fileArea = document.querySelector('#fileArea');
		document.getElementById('addFile').addEventListener('click', () => {
			const newDiv = document.createElement('div');
			const newSpan = document.createElement('span');
// 			const newTitleInput = document.createElement('input');
			
			newDiv.classList.add('mb-3');
			newDiv.innerHTML = '<input type="file" class="form-control form-control-lg" name="file" accept=".gif, .jpg, .png">';
			newSpan.innerHTML = '<span class="removal btn btn-danger mb-3 px-3 fs-5">삭제</span>';
// 			newTitleInput.innerHTML = '<input class="form-control form-control-lg mt-3" placeholder="등록할 팝업 제목 입력" name="popTitle" type="text" required>';
			
			fileArea.append(newDiv);
			fileArea.append(newSpan);
// 			fileArea.append(newTitleInput);
		});
		
		const form = document.getElementById('attmForm')
		document.getElementById('submitAttm').addEventListener('click', () => {
			const files = document.getElementsByName('file');
			let isEmpty = true;
			for(const f of files) {
				if(f.value != '') {
					isEmpty = false;
				}
			}
			
			if(isEmpty) {
				$('#modalChoice').modal('show');
			} else {
				form.submit();
			}
		})
		
	}
	
	
	

	//첨부삭제
	$(document).on('click', '.removal', function() {
		$(this).parent().prev().remove();
		$(this).remove();
	})
	
	
	
	
	

	</script>
	
	
	
	
	
	
	
	
</body>
</html>