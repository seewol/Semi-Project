<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	#main{
		top: 50%;
        left: 50%;
		margin-top: 130px;
        font-family: 'Inter', sans-serif;
        width:100%;
        height: auto; 
        min-height: 420px;
		margin-bottom: 80px;
    }
    hr{width: 500px;}
    td{padding: 5px;}
   	
   	::placeholder {
  		color: black;
 		font-size: .8em;
 		font-weight: 400;
	}
	.td_width{width: 250px;}
	#checkCodeResult {
		font-size: 11px;
		color: gray;
		margin-left: 11px;
	}
</style>
</head>
<body>
	<%@ include file="../common/top3.jsp" %>
	<div align="center" id="main">
		<h4><b>아이디 찾기</b></h4>
		<div style="margin: 10px;"><span style="font-size: 11px; color: gray;">책마루 회원 전용</span></div>
		<div style="margin: 10px;"><span style="font-size: 13px; font-weight: 500;">회원정보에 등록한 휴대폰 번호로 조회</span></div>
		<form action="${ contextPath }/findId.me" method="post">
			<table style="margin-left: 95px;">
				<tr>
					<td class="td_width">
						<input class="form-control" type="text" id="name" name="memName" placeholder="이름" aria-label="default input example" required/>
					</td>
					<td>
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
						<input class="form-control" type="text" id="code" name="code" placeholder="인증번호" aria-label="default input example" required/>
					</td>
					<td>
						<button type="button" id="checkConfirmNum" class="btn btn-primary btn-default" style="background-color: #4373E6;">인증확인</button>
					</td>
				</tr>
				<tr>
					<td>
						<label id="checkCodeResult">★ 인증번호를 입력해주세요.</label>
					</td>
					<td></td>
				</tr>
			</table>
			<hr/>
			<button type="submit" id="next" class="btn btn-primary" style="--bs-btn-padding-y: .55rem; --bs-btn-padding-x: 6.5rem; --bs-btn-font-size: 1.0rem; background-color: #4373E6;" disabled>다음</button>
		</form>
	</div>
	<!-- 모달 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="smsModal">
      <div class="modal-dialog" role="document">
            <div class="modal-content rounded-3 shadow">
              <div class="modal-body p-4 text-center">
                 <h1>💌</h1>
                   <h5 class="mb-0">인증번호가 전송되었습니다.</h5>
              </div>
              <div class="modal-footer flex-nowrap p-0">
                   <button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal">확인</button>
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
		window.onload = () =>{
			
			// ● ● ● '인증번호' 버튼 클릭 시 서버로부터 인증번호 받아오기
			let num = "";
			const sendConfirmNum = document.getElementById('sendConfirmNum');
			sendConfirmNum.addEventListener('click', ()=>{
				$.ajax({
			          type: "POST",
			          dataType: 'json',
			          url: "sms/send",
			          async: false,
			          data: {
			            "phone": $("input[name=phone]").val() // 입력된 휴대폰번호 가져오기
			          },
			          success: function(data) {
			            num = data.smsConfirmNum; // 받아온 인증번호를 저장 
// 		 	            console.log('data : ' + data);
// 		 	            console.log('num : ' + num);
			            $('#smsModal').modal('show');
			          },
			          error: function(error) {
			            console.log("인증번호 받아오기 실패...");
			            console.log(error);
			          }
				});
				$('#phoneNumber').attr('disabled', true); // 수정 불가
			});			
			
			// ● ● ● '인증확인' 버튼 클릭 시 입력한 인증번호와의 일치 여부 확인
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
		      
		      // ● ● ● 회원가입 버튼 누를 시, 입력한 휴대폰번호 값에 접근할 수 있도록 허용
		      $("#next").on("click", function() {
		    	  $('#phoneNumber').attr('disabled', false); 
		    	  // disabled가 true면 데이터 접근 불가 (@ModelAttribute에 값 안 담김!!!)        	
			  });
		}
	</script>
</body>
</html>