<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책마루도서관</title>
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	#main{max-width: 1200px; min-height: 682px;}
	#mid{min-width: 1800px;}
	#submitButton{
		color: white; background-color: rgb(67, 115, 230); 
		border: 1px solid rgb(67, 115, 230);
		width: 92px;
	}
	#removeButton{
		color: rgb(67, 115, 230); background-color: white;
		border: 1px solid rgb(67, 115, 230);
		width: 92px;
	}
</style>
</head>
<body>	
	<%@ include file="../../../WEB-INF/views/common/top3.jsp" %>
	
	  <div class="row" id="mid">
	  
	    <!-- 화면 중앙 왼쪽 -->
	    <div class="col-2">
	      <%@ include file="../../../WEB-INF/views/common/sideLib.jsp" %>
	    </div>
	    
	    <!-- 중앙 영역 -->
	    <div class="col-8" id="main">
	    <br>
	       <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
	        <h1 class="h1">비치 희망 도서</h1>
	      </div>
	      <br>
	      <div class="text-center">
		      <form method="post" action="wishBookInsert.lib">
		      	<input type="text" placeholder="*제목" name="bookName" id="bookName">
		      	<br><br>
		      	<input type="text" placeholder="*저자" name="author" id="author">
		      	<br><br>
		      	<input type="text" placeholder="*출판사" name="publisher" id="publisher">
		      	<br><br>
		      	<input type="text" placeholder="*발행년도(숫자 4자리)" name="date" id="date">
		      	<br><br>
		      	<input type="text" placeholder="가격" name="price" id="price">
		      	<br><br>
		      	<input type="text" placeholder="비고" name="etc" id="etc">
		   			<br><br>
		      	<button class="btn my-2 my-sm-0 rounded-start" id="submitButton" onclick="return check()">신청하기</button> &nbsp;&nbsp;
		      	<button class="btn my-2 my-sm-0 rounded-start" id="removeButton" type="button" onclick="clean()">다시쓰기</button>
		      </form>
		  	</div>
	    </div>
	    <!-- 화면 중앙 오른쪽 여백 생성 -->
	    <div class="col-2">
	    </div>
	</div>
		  
	<%@ include file="../../../WEB-INF/views/common/bottom.jsp" %>
	  
	<div class="modal fade" tabindex="-1" role="dialog" id="modalId">
      	<div class="modal-dialog" role="document">
            <div class="modal-content rounded-3 shadow">
              	<div class="modal-body p-4 text-center">
                 	<h1 id="modalIcon"><i class="bi bi-exclamation-triangle-fill" style="color: red;"></i></h1>
                   	<h3 class="mb-0" id="modalText"></h3>
              	</div>
              	<div class="modal-footer flex-nowrap p-0">
                   	<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" data-bs-dismiss="modal" id="modalButton">확인</button>
                   	<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" data-bs-dismiss="modal">취소</button>
              	</div>
            </div>
    	</div>
    </div>
		
	<script>
		window.onload = () =>{
	   		const modalButton = document.getElementById("modalButton");
		   	const contextPath = "${contextPath}";
			const loginMessage = "${loginMessage}";
			const successMessage = "${successMessage}";
		   	const modalText = document.getElementById("modalText");
		   	const modalIcon = document.getElementById("modalIcon");
		   	if (loginMessage != "") {
		   		modalButton.innerHTML = "<a href='" + contextPath + "/loginView.me'>확인</a>";
		   		modalText.innerText = loginMessage;
		   		$('#modalId').modal('show');
		   	}
		   	if (successMessage != "") {
		   		modalButton.innerHTML = "<a href='" + contextPath + "'>확인</a>";
		      	modalIcon.innerHTML = "<i class='bi bi-check-circle' style='color: green;'></i>";
		      	modalText.innerText = successMessage;
		   		$('#modalId').modal('show');
		   	}
		}
		
		const bTitle = document.getElementById("bookName");
  		const bAuthor = document.getElementById("author");
  		const bPublisher = document.getElementById("publisher");
  		const bDate = document.getElementById("date");
  		const bPrice = document.getElementById("price");
  		const bEtc = document.getElementById("etc");
		
	  	const check = () => {
	  		const regExp = /^\d{4}$/;
	  		const regExp2 = /^\d+$/;
	  		
	  		modalIcon.innerHTML = "<i class='bi bi-exclamation-triangle-fill' style='color: red;'></i>";
	  		modalButton.innerHTML = "확인";
	  		
	  		if(bTitle.value == ""){
	  			modalText.innerText = "제목은 필수입력 사항입니다."; 
	  			$('#modalId').modal('show');
	  			return false
	  		}
	  		
	  		if(bAuthor.value == ""){
	  			modalText.innerText = "저자는 필수입력 사항입니다."; 
	  			$('#modalId').modal('show');
	  			return false
	  		}
	  		
	  		if(bPublisher.value == ""){
	  			modalText.innerText = "출판사는 필수입력 사항입니다."; 
	  			$('#modalId').modal('show');
	  			return false
	  		}
	  		
	  		if(bDate.value == ""){
	  			modalText.innerText = "발행년도는 필수입력 사항입니다."; 
	  			$('#modalId').modal('show');
	  			return false
	  		}
	  		
	  		if(!regExp.test(bDate.value)){
	  			modalText.innerText = "네자리 숫자를 입력하세요"; 
	  			$('#modalId').modal('show');
	  			bDate.value = "";
	  			return false;
	  		}
	  		
	  		if(bPrice.value == ""){
	  			return true;
	  		}else{
	  			if(!regExp2.test(bPrice.value)){
	  				modalText.innerText = "숫자만 입력할 수 있습니다."; 
		  			$('#modalId').modal('show');
		  			bPrice.value = "";
		  			return false;
		  		}else{
		  			return true;
		  		}
	  		}
	  		
	  	}	
	  	
	  	const clean = () =>{
			bTitle.value = "";
			bAuthor.value = "";
			bPublisher.value = "";
			bDate.value = "";
			bPrice.value = "";
			bEtc.value = "";
		}
	  	
	  </script>
		
</body>
</html>