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
	#main {
		top: 50%;
        left: 50%;
        min-height: 522px;
        margin-top: 107px;
        font-family: 'Inter', sans-serif;
    }
    hr {
    	width: 500px;
    }
    td {
    	padding: 5px;
    }
   	
   	::placeholder {
  		color: black;
 		font-size: .8em;
 		font-weight: 400;
	}
	.td_width {
		width: 250px;
	}
	#checkCodeResult {
		font-size: 12px;
		color: gray;
		margin-left: 11px;
	}
</style>
</head>
<body>
	<%@ include file="../common/top3.jsp" %>
	<section>
		<div align="center" id="main">
			<h4><b>추가 정보 입력</b></h4><br>
			<form action="${ contextPath }/kakaoInsert.me" method="post">
				<table>
					<tr>
						<td class="td_width">
							<input class="form-control" type="text" name="memName" placeholder="이름" aria-label="default input example"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="td_width">
							<input class="form-control" type="tel" name="phone" placeholder="휴대폰 번호 (- 제외)" aria-label="default input example" id="phoneNumber"/>
						</td>
						<td>
							<button type="button" class="btn btn-primary btn-default" style="background-color: #4373E6;" id="sendConfirmNum">인증번호</button>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="td_width">
							<input class="form-control" type="text" name="code" placeholder="인증번호" aria-label="default input example"/>
						</td>
						<td>
							<button type="button" class="btn btn-primary btn-default" style="background-color: #4373E6;" id="checkConfirmNum">인증확인</button>
						</td>
					</tr>
					<tr>
						<td>
							<label id="checkCodeResult">★ 인증번호를 입력해주세요.</label>
						</td>
						<td></td>
					</tr>
				</table>
				<label ></label>
				<hr/>
				<br/>
				<button type="submit" class="btn btn-primary" style="--bs-btn-padding-y: .55rem; --bs-btn-padding-x: 4.0rem; --bs-btn-font-size: 1.0rem; background-color: #4373E6;" id="kakaoSignUp" disabled>가입완료</button>
			</form>
		</div>
	</section>
	<!-- 모달 -->
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
	<%@ include file="../common/bottom.jsp" %>
	 <script>
	 	var num = "";
	 	$(document).ready(function() {
	      // '인증번호' 버튼 클릭 시 서버로부터 인증번호 받아오기
	      $("#sendConfirmNum").on("click", function() {
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
	      });
	      console.log(num);
	      
	      
	      // '인증확인' 버튼 클릭 시 입력한 인증번호와의 일치 여부 확인
	      $("#checkConfirmNum").on("click", function() {
        	const checkCodeResult = document.getElementById("checkCodeResult");
	        if($("input[name=code]").val() == ''){
	        	checkCodeResult.innerText = '휴대폰 인증을 진행해주세요.';
	        	checkCodeResult.style.color = '#DC6089';
	        } else{
		        if($("input[name=code]").val() == num){
		        	// 1) 인증번호 누르면 #phoneNumber의 disabled : true
		        	// 2) 인증확인 누르면 안내 문구 출력 (같을 경우 / 틀린 경우)
		        	// 3) 인증번호 일치한 경우 회원가입 버튼 활성화
		        	checkCodeResult.innerText = '인증번호가 일치합니다.';
		        	checkCodeResult.style.color = '#4373E6';
		        	$('#kakaoSignUp').attr('disabled', false);
		        } else {
		        	checkCodeResult.innerText = '인증번호가 불일치합니다.';
		        	checkCodeResult.style.color = '#DC6089';
		        	$('#kakaoSignUp').attr('disabled', true);
		        }
	        }
	      });
	      
	      // 회원가입 버튼 누를 시, 입력한 휴대폰번호 값에 접근할 수 있도록 허용
	      $("#kakaoSignUp").on("click", function() {
	    	  $('#phoneNumber').attr('disabled', false); 
	    	  // disabled가 true면 데이터 접근 불가 (@ModelAttribute에 값 안 담김!!!)        	
		  });
	 	});
 	</script>
</body>
</html>