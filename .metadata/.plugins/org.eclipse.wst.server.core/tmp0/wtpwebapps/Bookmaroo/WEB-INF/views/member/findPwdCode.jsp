<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	#main{
/* 		position: absolute; */
		top: 50%;
        left: 50%;
/*         transform: translate(-50%, -50%); */
        font-family: 'Inter', sans-serif;
        margin-top: 112px;
        min-height: 548px;
/*         margin-bottom: 140px; */
    }
    hr{width: 600px;}
    td{padding: 5px;}
   	
   	::placeholder {
  		color: black;
 		font-size: .8em;
 		font-weight: 400;
	}
	.td_width{width: 250px;}
</style>
</head>
<body>
	<%@ include file="../common/top3.jsp" %>
	<section>
		<div align="center" id="main">
			<h4><b>비밀번호 찾기</b></h4>
			<div style="margin: 10px;"><span style="font-size: 11px; color: gray;">책마루 회원 전용</span></div>
			<div style="margin: 10px;"><span style="font-size: 13px; font-weight: 500;">회원정보에 등록한 휴대전화로 인증</span></div>
			<form action="${ contextPath }/findPwdCode.me" method="post">
				<table style="margin-left: 95px;">
					<tr>
						<td class="td_width">
							<input class="form-control" type="text" id="name" name="memName" placeholder="이름" aria-label="default input example" required/>
						</td>
						<td>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<span style="font-size: 11px; color: gray;">회원정보에 등록된 번호와 일치해야 인증번호를 받을 수 있습니다</span>
						</td>
					</tr>
					<tr>
						<td class="td_width">
							<input class="form-control" type="tel" id="phoneNumber" name="phone" placeholder="휴대폰 번호 (- 제외)" aria-label="default input example" required/>
						</td>
						<td>
							<button type="button" id="sendConfirmNum" class="btn btn-primary btn-default" style="background-color: #4373E6;">인증번호</button>
						</td>
					</tr>
					<tr>
						<td class="td_width">
							<input class="form-control" type="text" name="code" placeholder="인증번호" aria-label="default input example" required/>
						</td>
						<td>
							<button type="button" class="btn btn-primary btn-default" style="background-color: #4373E6;" id="checkConfirmNum">인증확인</button>
						</td>
				</table>
				<br>
				<button type="submit" class="btn btn-primary" id="next" style="--bs-btn-padding-y: .55rem; --bs-btn-padding-x: 6.5rem; --bs-btn-font-size: 1.0rem; background-color: #4373E6;" disabled>다음</button>
				<hr/>
			</form>
		</div>
	</section>
	<!-- 모달 4개 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="smsModal">
      <div class="modal-dialog" role="document">
            <div class="modal-content rounded-3 shadow">
              <div class="modal-body p-4 text-center">
                 <h1>💌</h1>
                   <h5 class="mb-0">인증번호가 전송되었습니다.</h5>
              </div>
              <div class="modal-footer flex-nowrap p-0">
                   <button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal" onclick="focusDropBox();">확인</button>
              </div>
            </div>
       </div>
 	</div>
 	<div class="modal fade" tabindex="-1" role="dialog" id="smsModal2">
      <div class="modal-dialog" role="document">
            <div class="modal-content rounded-3 shadow">
              <div class="modal-body p-4 text-center">
                 <h1>😶‍🌫️</h1>
                   <h5 class="mb-0">휴대폰 인증을 진행해주세요.</h5>
              </div>
              <div class="modal-footer flex-nowrap p-0">
                   <button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal" onclick="focusDropBox();">확인</button>
              </div>
            </div>
       </div>
 	</div>
 	<div class="modal fade" tabindex="-1" role="dialog" id="smsModal3">
      <div class="modal-dialog" role="document">
            <div class="modal-content rounded-3 shadow">
              <div class="modal-body p-4 text-center">
                 <h1>🍀</h1>
                   <h5 class="mb-0">인증번호가 확인되었습니다.</h5>
              </div>
              <div class="modal-footer flex-nowrap p-0">
                   <button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal" onclick="focusDropBox();">확인</button>
              </div>
            </div>
       </div>
 	</div>
 	<div class="modal fade" tabindex="-1" role="dialog" id="smsModal4">
      <div class="modal-dialog" role="document">
            <div class="modal-content rounded-3 shadow">
              <div class="modal-body p-4 text-center">
                 <h1>💀</h1>
                   <h5 class="mb-0">인증번호를 정확히 입력해주세요.</h5>
              </div>
              <div class="modal-footer flex-nowrap p-0">
                   <button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal" onclick="focusDropBox();">확인</button>
              </div>
            </div>
       </div>
 	</div>
	<%@ include file="../common/bottom.jsp" %>
	<script>
	 	var num = "";
	 	$(document).ready(function() {
	      // '인증번호' 버튼 클릭 시 서버로부터 인증번호 받아오기
	      $("#sendConfirmNum").on("click", function() {
	    	  // ★ 세션에 넣어둔 멤버 객체 휴대폰 번호랑, 입력된 휴대폰 번호랑 비교하기,
	    	  // 그래서 조건식이 true일 경우에만 ajax 실행
	    	  const name = document.getElementById('name');
	    	  const phone = document.getElementById('phoneNumber');
	    	  
	    	  if("${checkId.memName}" == name.value.trim() && "${checkId.phone}" == phone.value.trim()){
			      $.ajax({
			          type: "POST",
			          dataType: 'json',
			          url: "sms/send",
			          async: false,
			          data: {
			            "phone": $("input[name=phone]").val() // 입력된 휴대폰번호 가져오기
			          },
			          success: function(data) {
		// 	            console.log(data);
		// 	            console.log(num);
			            num = data.smsConfirmNum;
			            // 받아온 인증번호를 저장 
			            $('#smsModal').modal('show');
			          },
			          error: function(error) {
			            console.log("인증번호 받아오기 실패...");
			            console.log(error);
			          }
			      });
			      $('#phoneNumber').attr('disabled', true); // 수정 불가
	    	  } else {
	    		  alert('이름과 휴대폰 번호를 다시 확인해주세요.');
	    	  }
	      });
	      console.log(num);
	      
	      
	      // '인증확인' 버튼 클릭 시 입력한 인증번호와의 일치 여부 확인
	      $("#checkConfirmNum").on("click", function() {
        	const checkCodeResult = document.getElementById("checkCodeResult");
	        if($("input[name=code]").val() == ''){
	        	$('#smsModal2').modal('show');
	        } else{
		        if($("input[name=code]").val() == num){
		        	// 1) 인증번호 누르면 #phoneNumber의 disabled : true
		        	// 2) 인증확인 누르면 안내 문구 출력 (같을 경우 / 틀린 경우)
		        	// 3) 인증번호 일치한 경우 회원가입 버튼 활성화
		        	$('#smsModal3').modal('show');
		        	$('#next').attr('disabled', false);
		        } else {
		        	$('#smsModal4').modal('show');
		        	$('#next').attr('disabled', true);
		        }
	        }
	      });
	      
	      // 다음 버튼 누를 시, 입력한 휴대폰번호 값에 접근할 수 있도록 허용
	      $("#next").on("click", function() {
	    	  $('#phoneNumber').attr('disabled', false); 
	    	  // disabled가 true면 데이터 접근 불가 (@ModelAttribute에 값 안 담김!!!)        	
		  });
	 	});
 	</script>
</body>
</html>