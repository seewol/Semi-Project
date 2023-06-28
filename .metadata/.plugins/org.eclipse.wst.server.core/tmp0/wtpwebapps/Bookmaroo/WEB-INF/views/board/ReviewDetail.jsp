<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<style>

	* { font-family: 'Inter', sans-serif; }
	.minheight {min-height: 612px;}
	#board_area {margin-left: 1%; margin-top: 2%;}
	#board_title{font-weight: 900; font-size: 45px; margin-bottom: 1%;}
	#board_title a{ color:black; text-decoration: none;}
	#post_title{display: inline-block; font-weight: 900; font-size: 30px; margin-top: 1%;}
	#posting_time{display: inline-block; float: right; font-weight: bold; margin-top: 25px;}
	#boardContent{width: 98%; margin-left: 1%; resize: none; box-sizing: border-box; border: none; background-color: white;}
	#reply_box{display: flex; width: 100%; border-radius: 15px; background-color: #FBFBFB;
			   border: 1px solid black; align-items: flex-end;}
	#reply_text{resize: none; width: 96%; background-color: #FBFBFB;  flex: 1; border:none;
				margin: 1%; outline: none; font-size:15px; overflow: hidden; font-size: 18px;}
	#reply_btn{margin-bottom: 1%; margin-right: 1%; background-color: #4373E6; color:white; border:none;
			   border-radius: 3px; width: 7%; height: 40px;}
	#reply_btn_noneLogin{margin-bottom: 1%; margin-right: 1%; background-color: #4373E6; color:white; border:none;
			   border-radius: 3px; width: 7%; height: 40px;}		   
	table{width: 100%;}		
	#btn{text-align: right;}   
	#btn a{text-decoration: none; color:white;}			
	span a{text-decoration: none; color:black;}   
	.btn_post{height: 50px; background-color: #4373E6; color:white; border: none; border-radius: 10px; width: 5%; font-size: 15px;}		   
	#page_area{ text-align: center; margin-top: 3%; }
	#page_area a { color: black; text-decoration: none; }
	.btn_page{border: none; background-color: white; font-size: 30px; margin-left: 3%; font-weight: bold;}
	.deleteReply{background-color: white; border: none; font-weight: bold;}
	#review_book_info {}
	.deleteReply{background-color: white; border: none; font-weight: bold; cursor: pointer;}



</style>
</head>
<body>
<%-- 	<h1>제목 : ${ rev.reviewTitle }</h1> --%>
<%-- 	<h1>내용 : ${ rev.reviewContent }</h1> --%>
<%-- 	<h1>날짜 : ${ rev.reviewUpdateDate }</h1> --%>
<%-- 	<h1>조회수 : ${ rev.reviewViews }</h1> --%>
<%-- 	<h1>별점 : ${ rev.starRating/2 }</h1> --%>
<%-- 	<h1>ISBN : ${ rev.reviewBookISBN }</h1> --%>
<%-- 	<h1>글쓴이 : ${ rev.reviewerName }</h1> --%>
<%-- 	<h1>책명 : ${ rev.bookName }</h1> --%>
<%-- 	<h1>책 이미지 : ${ rev.bookImage }</h1> --%>

	<jsp:include page="../common/top3.jsp"/>
	<div class="row minheight">
		<div class="col-2"></div>
			<div class="col-8"">
			<div id="board_area">
				<div id="board_title">
					${ rev. reviewTitle }
				</div>
				<div>
					<div id="post_title">${ board.boardTitle }</div>
					<div id="posting_time">
						<span>${ rev.reviewUpdateDate }</span>
					</div>
				</div>
				<br><br>
				<span style="font-weight: bold; font-size: 18px;">${ rev.reviewerName }</span>
				<span style="font-weight: bold; float: right;">조회수 ${ rev.reviewViews }</span>
				<hr><br>
				<textarea id="boardContent" disabled>${ rev.reviewContent }</textarea>
				<br><br>
				
				
				
				
				<div id="review_book_info" class="row">
					<div class="col-10"></div>
					<div class="col-2" style="display: flex; justify-content: center;">
						<img src="${ rev.bookImage }" height="200" width="133px">
					</div>
					<div class="col-10"></div>
					<div class="col-2" style="display: flex; justify-content: center; font-size: 24px; margin-top: 10px;">
						<strong><i class="bi bi-star-fill" style="color:#F9BC28;"></i>  ${ rev.starRating/2 }</strong>
					</div>
				</div>
				
				
				
				<hr>
				<span style="font-weight: bold;">댓글</span>
				<br><br>
				<div id="reply_box" class="row">
					<div class="col-11">
						<textarea rows="5" id="reply_text" placeholder="댓글을 입력하세요" maxlength="200" name="replyContent"></textarea>
					</div>
					<div class="col-1" id="btnAlimit" style="height: 160px">
						<div class="row row-cols-1" style="height: 100%;">
							<div class="col" style="height: 65%;">
								<div style="margin-left: 20px;">
									<span id="textCount" class="textCountInfo">0</span>
								 	<span class="textCountInfo">/200</span>
								</div>
							</div>
							<div class="col" style="height: 35%; width: 100%;">
								<c:if test="${ !empty loginUser }">
									<button id="reply_btn" style="width: 100%;">댓글등록</button>
								</c:if>	
								<c:if test="${ empty loginUser }">
									<button id="reply_btn_noneLogin" style="width: 100%;" onclick="needLogin()">댓글등록</button>
								</c:if>	
							</div>
						</div>
					</div>
				</div>
				<br>
				<hr id="scrollpoint">
				<table>
					<tbody>
						<c:if test="${ empty replyList }">
							<tr>
								<td style="text-align: center;">작성된 댓글이 없습니다</td>
							</tr>
						</c:if>
						<c:if test="${ !empty replyList }">
							<c:forEach items="${ replyList }" var="r">
								<form action="deleteReviewReply.bo" method="get">
									<tr>
										<td>
											<span style="font-weight: bold;">${ r.replyWriter }</span>
											<span>${ r.replyUpdateDate }</span>
											<span style="font-weight:bold;">
												<c:if test="${r.replyWriter eq loginUser.memName }">
													<button class="deleteReply" >삭제</button>
												</c:if>	
												<input type="hidden" value="${ r.replyNo }" name="rNo">
												<input type="hidden" value="${ page }" name="page">
												<input type="hidden" value="${ rev.reviewerName }" name="reviewerName">
											</span>
											<div style="margin-top:10px;">${ r.replyContent }</div>
											<hr>
										</td>
									</tr>
								</form>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				<br>
				<c:if test="${pi != null}">
					<div id="page_area">
						<c:if test="${ pi.currentPage <= 1 }">
							<a class="btn_page"><i class="bi bi-skip-start-fill" style="color: rgb(67, 115, 230);"></i></a>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url value="${ loc }" var="blistBack">
								<c:param name="replyPage" value="${ pi.currentPage - 1 }"/>
								<c:if test="${ searchType != null }">
									<c:param name="searchType" value="${ searchType }"/>
									<c:param name="search" value="${ search }"/>
								</c:if>
							</c:url>
							<a href="${contextPath}/reviewDetail.bo?reviewNo=${rev.reviewNo}&reviewerName=${rev.reviewerName}&page=${page}&replyPage=${pi.currentPage - 1}" class="btn_page"><i class="bi bi-skip-start-fill"></i></a>
						</c:if>
						
						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:if test="${ p eq pi.currentPage }">
								<a class="btn_page" style="color: rgb(67, 115, 230);">${ p }</a>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="goNum" value="${ loc }">
									<c:param name="replyPage" value="${ p }"/>
									<c:if test="${ searchType != null }">
										<c:param name="searchType" value="${ searchType }"/>
										<c:param name="search" value="${ search }"/>
									</c:if>
								</c:url>
								<a href="${contextPath}/reviewDetail.bo?reviewNo=${rev.reviewNo}&reviewerName=${rev.reviewerName}&page=${page}&replyPage=${p}" class="btn_page">${ p }</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<a class="btn_page"><i class="bi bi-skip-end-fill" style="color: rgb(67, 115, 230);"></i></a>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url value="${ loc }" var="goNext">
								<c:param name="replyPage" value="${ pi.currentPage + 1 }"/>
								<c:if test="${ searchType != null }">
									<c:param name="searchType" value="${ searchType }"/>
									<c:param name="search" value="${ search }"/>
								</c:if>
							</c:url>
							<a href="${contextPath}/reviewDetail.bo?reviewNo=${rev.reviewNo}&reviewerName=${rev.reviewerName}&page=${page}&replyPage=${pi.currentPage + 1}" class="btn_page"><i class="bi bi-skip-end-fill"></i></a>
						</c:if>
					</div>
				</c:if>
				<div id="btn">
				<c:if test="${rev.reviewerName == mName}">
						<button class="btn_post"><a href="updateReview.bo?reviewNo=${rev.reviewNo}">글수정</a></button>
						<button class="btn_post" onclick="deleteRev()">글삭제</a></button>
				</c:if>		
						<button class="btn_post">
							<a onclick="back()">글목록</a>
						</button>
				</div>
				<br><br>
			</div>
		</div>
		<div class="col-2"></div>
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
	
	<div class="modal fade" tabindex="-1" role="dialog" id="deleteWarning">
	<div class="modal-dialog" role="document">
   		<div class="modal-content rounded-3 shadow">
     			<div class="modal-body p-4 text-center">
					<h1><i class="bi bi-exclamation-triangle-fill" style="color: red;"></i></h1>
		       		<h3 class="mb-0">정말로 삭제하시겠습니까?</h3>
     			</div>
     			<div class="modal-footer flex-nowrap p-0">
       			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" onclick="goDelete()">
       				삭제
       			</button>
       			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">취소</button>
     			</div>
   		</div>
 	</div>
	</div>	

<script>
	
	/* TextArea 크기 자동 조절 */
	function resize(){
		let textarea = document.getElementById('boardContent');
		textarea.style.height = "0px";
		
		let scrollHeight = textarea.scrollHeight;
		let style = window.getComputedStyle(textarea);
		let borderTop = parseInt(style.borderTop);
	    let borderBottom = parseInt(style.borderBottom);
	    
	    textarea.style.height = (scrollHeight + borderTop + borderBottom)+"px";
	}
	
	window.addEventListener("load", resize);
	window.onresize = resize;
	
	const scrollpoint = document.getElementById('scrollpoint');
    
	if (window.location.href.indexOf('replyPage=') !== -1) {
	  window.scrollTo({
	    top: document.getElementById('scrollpoint').offsetTop + 200,
	    behavior: 'instant'
	  });
	}

	/* 글자수세기 */
	const ShowTextCount = document.getElementById('textCount');
	const textArea = document.getElementById('reply_text');
	const textCountInfo = document.getElementsByClassName('textCountInfo');
	let saveText;
	
	textArea.addEventListener('keyup',()=>{
	let textCount = textArea.value.length;
	ShowTextCount.innerText = textCount;
	
		if(textCount==200){
			for(const i of textCountInfo){
				i.style.color = 'red';
				saveText = textArea.value;
			}
		} else if (textCount<200){
			for(const i of textCountInfo){
				i.style.color = 'black';
			}
		} else if (textCount > 200){
			for(const i of textCountInfo){
				textArea.value = saveText;
				ShowTextCount.innerText = 200;
			}
		}
	})
	
	
		/* 댓글 등록 */
		document.getElementById('reply_btn').addEventListener('click',()=>{
			document.getElementById('textCount').innerText = 0;
			console.log(123);
			console.log(${memberNo});
			$.ajax({
				url: '${contextPath}/insertReply.bo',
				data: {
 						replyContent:document.getElementById('reply_text').value,
						memberNo:'${memberNo}',
						refBoardNo:'${rev.reviewNo}',
						replyPage: '${pi.currentPage}'
				},
				success: data =>{
					console.log(data);
					console.log("성공");
					const tbody = document.querySelector('tbody');
					tbody.innerHTML = '';
					
					for(const r of data){
						
						const tr = document.createElement('tr');
						const td = document.createElement('td');
						
						const writerSpan = document.createElement('span');
						writerSpan.innerText = r.replyWriter;
						writerSpan.style.fontWeight = 'bold';
						
						const dateSpan = document.createElement('span');
						dateSpan.innerText = ' ' + r.replyUpdateDate + ' ';
						
						const thirdSpan = document.createElement('span');
						
						const deleteA = document.createElement('span');
						if(r.replyWriter == '${loginUser.memName}'){
							deleteA.innerText = '삭제';
							deleteA.style.fontWeight = 'bold';
							deleteA.classList.add("deleteReply");
							deleteA.addEventListener('click',()=>{
								console.log(777);	
								location.href='${contextPath}/deleteRevReply.bo?rNo='+r.replyNo+'&page='+${page};
							});
						};
						
						const HinputRno = document.createElement('input');
						HinputRno.type = 'hidden';
						HinputRno.name = 'rNo';
						HinputRno.value = r.replyNo;
						
						const HinputPage = document.createElement('input');
						HinputPage.type = 'hidden';
						HinputPage.name = 'page';
						HinputPage.value = ${page};
						
						const contentDiv = document.createElement('div');
						contentDiv.innerText = r.replyContent;
						contentDiv.style.marginTop = '10px';
						
						const hr = document.createElement('hr');
						
						tr.append(td);
						td.append(writerSpan);
						td.append(dateSpan);
						td.append(thirdSpan);
						thirdSpan.append(deleteA);
						thirdSpan.append(HinputRno);
						thirdSpan.append(HinputPage);
						td.append(contentDiv);
						td.append(hr);
						
						tbody.append(tr);
					}
					document.getElementById('reply_text').value = '';
				},
				error: data =>{
					console.log(data);
				}
			});
		});

	function back() {
		location.href='${contextPath}/Review.bo?page='+${page};
	}

	
	function needLogin(){
		$('#warning').modal('show');
	}
	
	function goforLogin(){
		location.href="${ contextPath }/loginView.me";
	}
	
	
	function deleteRev(){
		$('#deleteWarning').modal('show');
	}
	
	function goDelete(){
		location.href="deleteReview.bo?reviewNo=${rev.reviewNo}";
	}
	
	
	
</script>


















</body>
</html>