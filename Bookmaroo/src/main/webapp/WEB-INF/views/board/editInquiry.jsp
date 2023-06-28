<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 수정페이지</title>
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
					<form action="updateInquiry.bo" method="post" id="postingForm">
					<div id="content_area">
						<input type="hidden" name="boardNo" value="${b.boardNo}">
						<input type="text" id="board_Title" name="boardTitle" value="${b.boardTitle}" placeholder="제목을 입력하세요" required>
						<textarea id="board_Content" name="boardContent" placeholder="내용을 입력하세요">${b.boardContent}</textarea>	
					</div>
		<div style="text-align: right; margin-right: 10%;">
			<button class="btn btn-primary btn-default" style="background-color: #4373E6;">수정하기</button>
			<a href="#"><button class="btn btn-primary btn-default" style="background-color: #4373E6; ">글목록</button></a>
		</div>
					</form>
			</div>
			<br>
		</div>
		<div class="col-2">></div>
	</div>
	<br><br>
	<jsp:include page="../common/bottom.jsp"/>
	<script>
	
	</script>
</body>
</html>