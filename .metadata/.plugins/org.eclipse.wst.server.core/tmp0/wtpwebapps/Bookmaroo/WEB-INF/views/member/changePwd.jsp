<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경</title>
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
        margin-top: 137px;
        min-height: 522px;
        margin-bottom: 173px;
    }
    hr{width: 500px;}
    td{padding: 5px; width: 260px;}
   	
   	::placeholder {
  		color: black;
 		font-size: .8em;
 		font-weight: 400;
	}
	a{text-decoration-line: none;}
	a:link{color: black;}
	a:visited{color: black;}
	a:hover{color: #4373E6;}
</style>
</head>
<body>
	<%@ include file="../common/top3.jsp" %>
	<div align="center" id="main">
		<h4><b>비밀번호 재설정</b></h4>
		<div style="margin: 10px;"><span style="font-size: 11px; color: gray;">책마루 회원 전용</span></div>
		<div style="margin: 10px;"><span style="font-size: 13px; font-weight: 500;">비밀번호를 변경해주세요.</span></div>
		<form id="changePwdForm" action="${ contextPath }/changePwd.me" method="post">
			<table>
				<tr>
					<td>
						<input class="form-control" type="password" id="password" name="password" placeholder="새 비밀번호" aria-label="default input example"/>
					</td>
				</tr>
				<tr>
					<td>
						<input class="form-control" type="password" id="checkPassword" name="check_pwd" placeholder="새 비밀번호 확인" aria-label="default input example"/>
					</td>
				</tr>
			</table>
			<div><span style="font-size: 11px; color: gray;" id="checkPwdResult">영문, 숫자, 특수문자 포함 (8자 이상 16자 이하)</span></div>
			<button type="button" id="complete" class="btn btn-primary" style="--bs-btn-padding-y: .55rem; --bs-btn-padding-x: 6.3rem; --bs-btn-font-size: 1.0rem; background-color: #4373E6; margin-top: 10px;" disabled>완료</button>
		</form>
		<br>
		<hr/>
	</div>
	<div class="modal fade" tabindex="-1" role="dialog" id="changePwdModal">
      <div class="modal-dialog" role="document">
            <div class="modal-content rounded-3 shadow">
              <div class="modal-body p-4 text-center">
                 <h1>💡</h1>
                   <h4 class="mb-0">비밀번호가 변경되었습니다.</h4>
                   <h6>새 비밀번호로 로그인하세요.</h6>
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
			// ● ● ● 비밀번호 정규 표현식
			const password = document.getElementById('password');  // 비밀번호 input
			const checkPwdResult = document.getElementById('checkPwdResult');
			const reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
			
			password.addEventListener('change', function(){
				if(this.value.trim() == ''){
					checkPwdResult.innerText = '비밀번호를 입력해주세요.';
					checkPwdResult.style.color = '#DC6089';
				} else if(!reg.test(this.value)){
					checkPwdResult.innerText = '비밀번호 형식에 맞게 입력해주세요.';
					checkPwdResult.style.color = '#DC6089';
				} else {
					checkPwdResult.innerText = '🍀사용 가능한 비밀번호입니다.';
					checkPwdResult.style.color = '#4373E6';
				}
			});
			
			// ● ● ● 비밀번호 일치하는지 확인
			const checkPwd = document.getElementById('checkPassword'); // 비밀번호 확인 input
			checkPwd.addEventListener('change', function(){
				const checkPassword = this.value;
				if(!(password.value.trim() == '' && checkPassword.trim() == '')){
					if(password.value == checkPassword){
						password.style.color = '#4373E6';
						checkPwd.style.color = '#4373E6';
						checkPwdResult.innerText = '🍀비밀번호 확인이 일치합니다.';
						checkPwdResult.style.color = '#4373E6';
						$('#complete').attr('disabled', false);
					} else if(password.value != checkPassword){
						password.style.color = '#DC6089';
						checkPwd.style.color = '#DC6089';
						checkPwdResult.innerText = '비밀번호 확인이 일치하지 않습니다.';
						checkPwdResult.style.color = '#DC6089';
						$('#complete').attr('disabled', true);
						this.select();
					}
				} 
			});
			
			// 완료 버튼을 눌렀을 때 모달이 보이도록 만들기
			const completeBtn = document.getElementById('complete');
			completeBtn.addEventListener('click', ()=>{
				$('#changePwdModal').modal('show');
			});
			
			// 모달의 확인을 클릭했을 때 form이 서버로 제출되도록 만들기
			document.getElementById('modalSubmit').addEventListener('click', ()=>{
				document.getElementById('changePwdForm').submit();
			});
		}
	</script>
</body>
</html>