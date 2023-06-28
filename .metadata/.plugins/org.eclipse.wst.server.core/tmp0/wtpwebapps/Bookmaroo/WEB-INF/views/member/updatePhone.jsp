<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>휴대폰 번호 변경</title>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	#main {
		padding: 35px;
 	    font-family: 'Inter', sans-serif;
 	}
	hr {
		width: 300px;
	}
	.td_width {
		width: 200px;
	}
	::placeholder {
  		color: black;
 		font-size: .8em;
 		font-weight: 400;
	}
	#checkCodeResult {
		font-size: 11px;
		color: gray;
		margin-left: 11px;
	}
</style>
</head>
<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	<section>
		<form id="updatePhoneForm" action="${ contextPath }/updatePhone.me" method="post">
			<div id="main" align="center">
				<h3>🕊️</h3>
				<h4><b>휴대폰 번호 변경</b></h4><br/>
				<table>
					<tr>
						<td class="td_width">
							<input class="form-control" type="tel" id="phoneNumber" name="phone" value="${ loginUser.phone }" aria-label="default input example" required/>
						</td>
						<td>
							<button type="button" id="sendConfirmNum" class="btn btn-primary btn-default" style="background-color: lightgray; border: 1px solid lightgray;">인증번호</button>
						</td>
					</tr>
					<tr>
						<td class="td_width">
							<input class="form-control" type="text" id="code" name="code" placeholder="인증번호" aria-label="default input example" disabled/>
						</td>
						<td>
							<button type="button" id="checkConfirmNum" class="btn btn-primary btn-default" style="background-color: lightgray; border: 1px solid lightgray;">인증확인</button>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<label id="checkCodeResult">휴대폰 번호 변경 시 인증을 진행해주세요.</label>
						</td>
					</tr>
				</table>
				<hr>
				<button type="button" id="update" class="btn btn-primary" style="--bs-btn-padding-y: .40rem; --bs-btn-padding-x: 4.0rem; --bs-btn-font-size: 1.0rem; background-color: #4373E6;" disabled>변경하기</button>
			</div>
		</form>
	</section>
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
</body>
<script>
	window.onload = () =>{
			
		let differentNum = false;
		let confirmPhone = false;
		
		const sendConfirmNum = document.getElementById('sendConfirmNum');
		document.querySelector('#phoneNumber').addEventListener('change', function() {
			if(this.value === '${loginUser.phone}') {
				sendConfirmNum.style.backgroundColor = 'lightgray';
				sendConfirmNum.style.border = '1px solid lightgray';
				differentNum = false;
				confirmPhone = true;
			} else {
				sendConfirmNum.style.backgroundColor = '#4373E6';
				sendConfirmNum.style.border = '1px solid #4373E6';
				differentNum = true;
				confirmPhone = false;
			}
		});
		
		// ● ● ● '인증번호' 버튼 클릭 시 서버로부터 인증번호 받아오기
		sendConfirmNum.addEventListener('click', ()=>{
			if(differentNum) {
				$('#code').attr('disabled', false);
				$('#checkConfirmNum').css("background-color","#4373E6");
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
			}
		});
		
		
		let num = "";
		
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
					confirmPhone = true;
					$('#update').attr('disabled', false);
					
				} else {
					checkCodeResult.innerText = '인증번호가 불일치합니다.';
					checkCodeResult.style.color = '#DC6089';
					confirmPhone = false;
				}
			}
		});
		
		const phoneNumber = document.getElementById('phoneNumber');
				
		document.getElementById('update').addEventListener('click', function(){
			$.ajax({
				url: '${contextPath}/updatePhone.me',
				type: 'POST',
				dataType: 'json',
				data: {phone: phoneNumber.value.trim()},
				success: (data) =>{
					if(data.result == 1){
						window.close();
					} else if(data.result == 0){
						alert("휴대폰 번호 변경에 실패하였습니다.");
					}
				},
				error : (data) =>{
					console.log(data);
				}
			});
		});
		
	}
</script>
</html>