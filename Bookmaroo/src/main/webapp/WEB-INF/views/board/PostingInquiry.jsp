<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의작성</title>
<style>
	* { font-family: 'Inter', sans-serif; }
	.minheight { min-height: 612px; }
	#board_area {margin-left: 1%; margin-top: 2%;}
	#board_area>p {color: black; text-decoration: none; font-weight: 900; font-size: 45px; margin-left: 5%;}
	#posting_area {margin-top: 1%; width: 1160px; min-height: 900px;}
	#postTitle {width: 100%; height: 60px; margin: 0 auto;}
	
	#board_Title {width: 80%; font-size: 20px; margin: 0 auto; height: 45px; border-radius: 5px; border-color: lightgray; margin-left: 10%;}
	#board_Content {width: 80%; font: 18px; margin: 0 auto; margin-top: 2%; resize: none; min-height: 400px; margin-left: 10%;}
</style>
</head>
<body>
	<jsp:include page="../common/top3.jsp"/>
	<div class="row minheight">
		<div class="col-2">
			<jsp:include page="../common/side.jsp"/>
		</div>
		<div class="col-8">
			<div id="board_area">
				<p>문의하기</p>
				<br>
					<form action="insertInquiry.bo" method="post" id="postingForm">
					<div id="content_area">
						<input type="text" id="board_Title" name="boardTitle" placeholder="제목을 입력하세요" required="required">
						<textarea id="board_Content" name="boardContent" placeholder="내용을 입력하세요"></textarea>	
					</div>
		<div style="text-align: right; margin-right: 10%;">
			<button class="btn btn-primary btn-default" style="background-color: #4373E6;">글쓰기</button>
			<button type="button" id="backBtn" class="btn btn-primary btn-default" style="background-color: #4373E6;">글목록</button>
		</div>
					</form>
			</div>
			<br>
		</div>
		<div class="col-2">></div>
	</div>
	<br><br>
	<jsp:include page="../common/bottom.jsp"/>
	
	
	
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<script>
		document.getElementById('backBtn').addEventListener('click',()=>{
			$('#modalChoice').modal('show');
		});
		
		document.getElementById('backToList').addEventListener('click',()=>{
			location.href = '${ contextPath }/Inquiry.bo';
		});
		
	</script>
</body>
</html>