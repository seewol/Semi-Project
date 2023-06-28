<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	#main {
	    position: relative;
	    top: 0;
	    left: 50%;
	    transform: translateX(-50%);
	    font-family: 'Inter', sans-serif;
	    width: 100%;
	    height: auto; /* footer의 높이를 고려하여 설정 */
	    overflow: auto;
	    margin-top: 70px;
	    margin-bottom: 60px;
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
		font-size: 11px;
		color: gray;
		margin-left: 11px;
	}
	#checkIdResult {
		font-size: 11px;
		color: gray;
		margin-left: 11px;
	}
	#checkPwdResult{
		font-size: 11px;
		color: gray;
		margin-left: 11px;
	}
</style>
</head>
<body>
	<%@ include file="../common/top3.jsp" %>
	<section>
		<div align="center" id="main">
			<h4><b>회원가입</b></h4><br>
			<form id="signUpForm" action="${ contextPath }/insertMember.me" method="post">
				<table>
					<tr>
						<td class="td_width">
							<input class="form-control" type="text" id="memId" name="memId" placeholder="아이디" aria-label="default input example" required/>
						</td>
						<td>
							<button type="button" id="checkId" class="btn btn-primary btn-default" style="background-color: #4373E6;">중복확인</button>
						</td>
					</tr>
					<tr>
						<td>
							<span id="checkIdResult">6~12자 영문 대소문자, 숫자 포함</span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="td_width">
							<input class="form-control" type="password" id="password" name="password" placeholder="비밀번호" aria-label="default input example" required/>
						</td>
						<td>
						</td>
					</tr>
					<tr>
						<td>
							<span id="checkPwdResult">8~16자 영문 대소문자, 숫자, 특수문자 포함</span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="td_width">
							<input class="form-control" type="password" id="checkPassword" name="checkPassword" placeholder="비밀번호 확인" aria-label="default input example" required/>
						</td>
						<td>
						</td>
					</tr>
					<tr>
						<td class="td_width">
							<input class="form-control" type="text" id="memName" name="memName" placeholder="이름" aria-label="default input example" required/>
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
				<br/>
				<button type="button" id="signUp" class="btn btn-primary" style="--bs-btn-padding-y: .55rem; --bs-btn-padding-x: 4.0rem; --bs-btn-font-size: 1.0rem; background-color: #4373E6;" disabled>회원가입</button>
			</form>
		</div>
	</section>
	<!-- 모달 3개 -->		
	<div class="modal fade" tabindex="-1" role="dialog" id="idModal">
      <div class="modal-dialog" role="document">
            <div class="modal-content rounded-3 shadow">
              <div class="modal-body p-4 text-center">
                 <h1>😶‍🌫️</h1>
                   <h5 class="mb-0">아이디를 입력해주세요.</h5>
              </div>
              <div class="modal-footer flex-nowrap p-0">
                   <button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal">확인</button>
              </div>
            </div>
       </div>
 	</div>
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
 	<div class="modal fade" tabindex="-1" role="dialog" id="signUpModal">
      <div class="modal-dialog" role="document">
            <div class="modal-content rounded-3 shadow">
              <div class="modal-body p-4 text-center">
                 <h1>💡</h1>
                   <h5 class="mb-0">회원가입이 완료되었습니다.</h5>
              </div>
              <div class="modal-footer flex-nowrap p-0">
                   <button type="button" id="modalSubmit" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal">확인</button>
              </div>
            </div>
       </div>
 	</div>
 	<%@ include file="../common/bottom.jsp" %>
	<script>
		window.onload = () =>{
			let flagId = false;
			let flagPhone = false;
			let flagPwd1 = false;
			let flagPwd2 = false;
			let flagPwd = false;
			let flagName = false;
			
			// ● ● ● 아이디 중복 확인 + 정규 표현식
			const checkIdBtn = document.getElementById('checkId');
			
			checkIdBtn.addEventListener('click', () => {
				const memId = document.getElementById('memId').value;
				const checkIdResult = document.getElementById('checkIdResult');
				const regExp = /^[A-Za-z]{1}[A-Za-z0-9]{5,11}$/g; // id 정규표현식 영문 + 숫자
				if(memId.trim() == ''){ // ID 입력란이 빈 경우
					checkIdResult.innerText = '아이디 중복확인이 필요합니다.💀';
					checkIdResult.style.color = 'gray';
					$('#idModal').modal('show');
				} else if(regExp.test(memId)){
					$.ajax({
						url: '${contextPath}/checkId.me',
						type: 'POST',
						data: {memId: memId.trim()},
						success: (data) =>{
// 							console.log(data);
							if(data == 'yes'){
								flagId = true;
								checkIdResult.innerText = '🍀사용 가능한 아이디입니다.';
								checkIdResult.style.color = '#4373E6';
								if(flagPhone == true && flagPwd == true && flagName == true){
									$('#signUp').attr('disabled', false);
								}
							} else if(data == 'no'){
								checkIdResult.innerText = '이미 존재하는 아이디입니다.';
								checkIdResult.style.color = '#DC6089';
							} 
						},
						error : (data) =>{
							console.log(data);
						}
					});
				} else {
					checkIdResult.innerText = '영문 대소문자, 숫자 포함 6~12자';
					checkIdResult.style.color = '#DC6089';
				}	
			});
			
			
			// ● ● ● 아이디 입력 안 했을 경우
			const memId = document.getElementById('memId');
			memId.addEventListener('focusout', function(){
				const checkIdResult = document.getElementById('checkIdResult');
				if(memId.value.trim() == ''){
					checkIdResult.innerText = '아이디를 입력해주세요.';
					checkIdResult.style.color = '#DC6089';
				}
			});
			
			
			// ● ● ● 이름 입력 안 했을 경우
			const memName = document.getElementById('memName');
			memName.addEventListener('focusout', function(){
				if(memName.value.trim() == ''){
					alert('이름을 입력해주세요.');
					$('#signUp').attr('disabled', true);
				} else {
					flagName = true;
					if(flagPhone == true && flagPwd == true && flagId == true){
						$('#signUp').attr('disabled', false);
					}
				}
			});
		
		
			// ● ● ● 비밀번호 정규 표현식
		
			const password = document.getElementById('password');  // 비밀번호 input
			const checkPwd = document.getElementById('checkPassword'); 
			const checkPwdResult = document.getElementById('checkPwdResult');
			password.addEventListener('focusout', function(){
				const reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
				
				console.log(password.value);
				console.log(checkPwd.value);
				if(this.value.trim() == ''){
					checkPwdResult.innerText = '비밀번호를 입력해주세요.';
					checkPwdResult.style.color = '#DC6089';
					flagPwd1 = false;
					$('#signUp').attr('disabled', true);
				} else if(!reg.test(this.value)){
					checkPwdResult.innerText = '비밀번호 형식에 맞게 입력해주세요.';
					checkPwdResult.style.color = '#DC6089';
					password.style.color = '#DC6089';
					checkPwd.style.color = '#DC6089';
					flagPwd1 = false;
					$('#signUp').attr('disabled', true);
				} else if(password.value != checkPwd.value) {
					password.style.color = '#DC6089';
					checkPwd.style.color = '#DC6089';
					checkPwdResult.style.color = '#DC6089';
					checkPwdResult.innerText = '비밀번호 확인이 일치하지 않습니다.';
					flagPwd1 = true;
					$('#signUp').attr('disabled', true);
				} else {
					checkPwdResult.innerText = '🍀사용 가능한 비밀번호입니다.';
					checkPwdResult.style.color = '#4373E6';
					password.style.color = '#4373E6';
					checkPwd.style.color = '#4373E6';
					flagPwd1 = true;
					if (flagPwd2 == true) {
						flagPwd = true;
					}
					if(flagId == true && flagPhone == true && flagPwd == true && flagName == true){
						$('#signUp').attr('disabled', false);
					}
				}
				console.log(flagId, flagName, flagPwd1, flagPwd2, flagPwd, flagPhone);
			});
			
			
			// 비밀번호 확인 정규 표현식
			checkPwd.addEventListener('focusout', function(){
				const reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
				
				console.log(password.value);
				console.log(checkPwd.value);				
				if(this.value.trim() == ''){
					checkPwdResult.innerText = '비밀번호를 입력해주세요.';
					checkPwdResult.style.color = '#DC6089';
					flagPwd2 = false;
					$('#signUp').attr('disabled', true);
				} else if(!reg.test(this.value)){
					checkPwdResult.innerText = '비밀번호 형식에 맞게 입력해주세요.';
					checkPwdResult.style.color = '#DC6089';
					password.style.color = '#DC6089';
					checkPwd.style.color = '#DC6089';
					flagPwd2 = false;
					$('#signUp').attr('disabled', true);
				} else if(password.value != checkPwd.value) {
					password.style.color = '#DC6089';
					checkPwd.style.color = '#DC6089';
					checkPwdResult.style.color = '#DC6089';
					checkPwdResult.innerText = '비밀번호 확인이 일치하지 않습니다.';
					flagPwd2 = false;
					$('#signUp').attr('disabled', true);
				} else {
					checkPwdResult.innerText = '🍀사용 가능한 비밀번호입니다.';
					checkPwdResult.style.color = '#4373E6';
					password.style.color = '#4373E6';
					checkPwd.style.color = '#4373E6';
					flagPwd2 = true;
					if (flagPwd1 == true) {
						flagPwd = true;
					}
					if(flagId == true && flagPhone == true && flagName == true && flagPwd == true){
						$('#signUp').attr('disabled', false);
					}
				}
			});
			
			
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
		 	            console.log('data : ' + data);
		 	            console.log('num : ' + num);
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
			const checkConfirmNum = document.getElementById('checkConfirmNum'); // 인증확인 버튼
			const checkCodeResult = document.getElementById('checkCodeResult');
			const code = document.getElementById('code');
			
			checkConfirmNum.addEventListener('click', ()=>{
				if(code.value.trim() == ''){
					checkCodeResult.innerText = '휴대폰 인증을 진행해주세요.';
					checkCodeResult.style.color = '#DC6089';
				} else{
					if(code.value.trim() == num){
						checkCodeResult.innerText = '🍀인증번호가 일치합니다.';
						checkCodeResult.style.color = '#4373E6';
						flagPhone = true
						if(flagId == true && flagPwd == true && flagName == true){
							$('#signUp').attr('disabled', false);
						}
						$('#code').attr('disabled', true);
					} else {
						checkCodeResult.innerText = '인증번호가 불일치합니다.';
						checkCodeResult.style.color = '#DC6089';
						$('#signUp').attr('disabled', true);
					}
				}
			});
			
			// 회원가입 버튼을 눌렀을 때,
			// 1. 폰 번호 넘길 수 있도록 하기, 2. 모달 보여주기
			const signUpBtn = document.getElementById('signUp');
			signUpBtn.addEventListener('click', ()=>{
				$('#phoneNumber').attr('disabled', false);
				$('#signUpModal').modal('show');
			});
			
			// 모달의 확인을 클릭했을 때 form이 서버로 제출되도록 만들기
			document.getElementById('modalSubmit').addEventListener('click', ()=>{
				document.getElementById('signUpForm').submit();
			});
			
		}
	</script>
</body>
</html>