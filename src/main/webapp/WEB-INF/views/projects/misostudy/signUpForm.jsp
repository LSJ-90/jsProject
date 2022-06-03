<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<form id="signUpForm" action="/projects/misostudy/signUpForm" method="post" accept-charset="utf-8">
	<div class="modal fade" id="signUpModal" tabindex="-1" aria-labelledby="signUpModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="signUpModalLabel">Sign Up</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="form-floating mb-3">
					  <input type="text" class="form-control" id="signUpUserId" placeholder="User Id" name="id" autocomplete="off">
					  <label for="signUpUserId">User Id</label>
					   <div class="warning" id="check_id"></div>
					</div>
					<div class="form-floating mb-3">
					  <input type="password" class="form-control" id="signUpPwd" placeholder="Password" name="pwd">
					  <label for="signUpPassword">Password</label>	
					  <div class="warning" id="check_pwd"></div>
					</div>
					<div class="form-floating mb-3">
					  <input type="password" class="form-control" id="signUpPwdConfirm" placeholder="Password Confirm" name="pwdConfirm">
					  <label for="floatingPasswordConfirm">Password Confirm</label>
					  <div class="warning" id="check_pwdConfirm"></div>
					</div>	
					<div class="form-floating mb-3">
					  <input type="text" class="form-control" id="signUpName" placeholder="Name" name="name">
					  <label for="signUpName">Name</label>
					  <div class="warning" id="check_name"></div>
					</div>	
					<div class="form-floating mb-3">
					  <input type="email" class="form-control" id="signUpEmail" placeholder="Email" name="email">
					  <label for="signUpEmail">Email</label>
					  <div class="warning" id="check_email"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Close</button>
					<button type="button" id="signUpBtn" class="btn btn-outline-dark">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
</form>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	/**
	 * 회원가입 페이지 유효성검사 스크립트
	 */
	
	// 아이디 정규표현식: 아이디는 영문으로 시작하여, 소문자와 숫자를 사용해 6~12자리만 가능
	const idRegexp = /^[a-z][a-z0-9]{5,12}$/;
	
	// 비밀번호 정규표현식: 8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합
	const pwdRegexp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/; 
	
	// 이름 정규표현식: 두 자 이상, 한글만 가능
	const nameRegexp = /^[가-힣]{2,}$/;
	
	const emailRegexp = /^[A-Za-z0-9.\-_]+@([A-Za-z0-9-]+\.)+[A-Za-z]{2,6}$/;
	
	let isTrue;
	
	$('#signUpBtn').click(function(){
		const signUpForm = $('#signUpForm').serialize();
		if (signUpForm_check() == false) return;
		$.ajax({
			url: '/projects/misostudy/signUpForm',
			type: 'post',
			data: signUpForm,
			dataType: 'text',
			success: function(result) {
				console.log('성공: ' + result);
				if (result === 'success') {
					alert("회원가입 성공");
					$('#signUpModal').modal("hide");
					$('.modal-backdrop').remove();
					$('#loginUl').empty();
					$('#loginUl').append('<li class="nav-item"><a class="nav-link" href="/projects/misostudy/signOut" role="button">Sign out</a></li>');
				} else {
					$('#signInResultMessage').text(result);
				}
			},
			error:function(request,status,error){
		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	});

	function signUpForm_check() {
	    if (check_id() != true) { // 아이디 검사
	        alert('[아이디 입력 오류] 올바른 아이디를 입력해 주세요.');
	        $('#signUpUserId').focus();
	        return false;
	    }
	 	if (check_pwd() != true) { // 비밀번호 검사
	        alert('[비밀번호 입력 오류] 올바른 비밀번호를 입력해 주세요.');
	        $('#signUpPwd').focus();
	        return false;
	    }
		if (check_pwdConfirm() != true) { // 비밀번호 일치검사
	        alert('[비밀번호 확인 오류] 비밀번호가 일치하지 않습니다. 확인해주세요.');
	        $('#signUpPwdConfirm').focus();
	        return false;
	    }
		if (check_name() != true) { // 이름 검사
	        alert('[이름 입력 오류] 올바른 이름을 입력해 주세요.');
	        $('#signUpName').focus();
	        return false;
	    }
		if (check_email() != true) { // 이메일 검사
	        alert('[이메일 입력 오류] 올바른 이메일을 입력해 주세요.');
	        $('#signUpEmail').focus();
	        return false;
	    }
	}

	function check_id() {
		const id = $('#signUpUserId').val();
		$.ajax({
			url : '/projects/misostudy/signUpForm/checkId',
			type : 'post',
			data : {'id' : id},
			async: false, // 동기식으로 변경, 응답을 모두 완료한 후 
			success : function(result) {
				// console.log('1=중복 // 0=정상 : '+ result);							
				// 1 : 중복
				if (result === 1) {
					$('#check_id').text('사용중인 아이디입니다!!  :(').css('color', 'red');
					$('.form-control:focus').css('box-shadow','0 0 0 0.25rem rgb(255 0 0 / 25%)');
					$('.form-control:focus').css('border-color','rgb(255 0 0)');
					isTrue = false;
				} else {
					// 0 : 정상, 형식검사 시작
					if (!(idRegexp.test(id))) {
						$('#check_id').text('아이디는 영문으로 시작하여, 소문자와 숫자를 사용해 6~12자리까지만 가능합니다!! :(').css('color', 'rgb(255 0 0)');
						$('.form-control:focus').css('box-shadow','0 0 0 0.25rem rgb(255 0 0 / 25%)');
						$('.form-control:focus').css('border-color','rgb(255 0 0 / 25%)');
						isTrue = false;
					}
					if (idRegexp.test(id)) {
						$('#check_id').text('올~드디어~ 이건 가능하지 :)').css('color', 'rgb(54 150 105)');
						$('.form-control:focus').css('box-shadow','0 0 0 0.25rem rgb(54 150 105 / 25%)');
						$('.form-control:focus').css('border-color','rgb(54 150 105)');
						isTrue = true;
					}
					if (id == '') {
						$('#check_id').text('아이디를 입력해주세요!!  :(').css('color', 'rgb(255 0 0)');
						$('.form-control:focus').css('box-shadow','0 0 0 0.25rem rgb(255 0 0 / 25%)');
						$('.form-control:focus').css('border-color','rgb(255 0 0)');
						isTrue = false;
					}
				}
			}, 
			error : function(request, status, error) {
				alert('실패');
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
		return isTrue;						
	}
	function check_pwd() {
		const pwd = $('#signUpPwd').val();
		const pwdConfirm = $('#signUpPwdConfirm').val();
		check_pwdConfirm();
		if (!(pwdRegexp.test(pwd))) {
			$('#check_pwd').text('8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합하여 8~16자리까지만 가능합니다!!  :(').css('color', 'rgb(255 0 0)');
			$('.form-control:focus').css('box-shadow','0 0 0 0.25rem rgb(255 0 0 / 25%)');
			$('.form-control:focus').css('border-color','rgb(255 0 0)');
			isTrue = false;
		} 
		if (pwdRegexp.test(pwd)) {
			$('#check_pwd').text('사용가능한 비밀번호 입니다!!  :)').css('color', 'rgb(54 150 105)');
			$('.form-control:focus').css('box-shadow','0 0 0 0.25rem rgb(54 150 105 / 25%)');
			$('.form-control:focus').css('border-color','rgb(54 150 105)');
			isTrue = true;
		}
		if (pwd === '') {
			$('#check_pwd').text('비밀번호를 입력해주세요!!  :(').css('color', 'rgb(255 0 0)');
			$('.form-control:focus').css('box-shadow','0 0 0 0.25rem rgb(255 0 0 / 25%)');
			$('.form-control:focus').css('border-color','rgb(255 0 0)');
			isTrue = false;
		}
		
		return isTrue;
	}

	function check_pwdConfirm() {
		const pwd = $('#signUpPwd').val();
		const pwdConfirm = $('#signUpPwdConfirm').val();
		if (pwd != pwdConfirm || pwd === '') {
	 		$('#check_pwdConfirm').text('불일치!! :(').css('color', 'rgb(255 0 0)');
	 		$('#signUpPwdConfirm').css('box-shadow','0 0 0 0.25rem rgb(255 0 0 / 25%)');
			$('#signUpPwdConfirm').css('border-color','rgb(255 0 0)');
			isTrue = false;
		} else {
			$('#check_pwdConfirm').text('일치!! :)').css('color', 'rgb(54 150 105)');
			$('#signUpPwdConfirm').css('box-shadow','0 0 0 0.25rem rgb(54 150 105 / 25%)');
			$('#signUpPwdConfirm').css('border-color','rgb(54 150 105)');
			isTrue = true;
		}
		return isTrue;
	}

	function check_name() {
		const name = $('#signUpName').val();
		if (!(nameRegexp.test(name))) {
			$('#check_name').text('한글로 입력해주세요!!  :(').css('color', 'rgb(255 0 0)');
			$('.form-control:focus').css('box-shadow','0 0 0 0.25rem rgb(255 0 0 / 25%)');
			$('.form-control:focus').css('border-color','rgb(255 0 0)');
			isTrue = false;
		} 
		if (nameRegexp.test(name)) {
			$('#check_name').text('안녕하세요!! [' + name + ']님  :)').css('color', 'rgb(54 150 105)');
			$('.form-control:focus').css('box-shadow','0 0 0 0.25rem rgb(54 150 105 / 25%)');
			$('.form-control:focus').css('border-color','rgb(54 150 105)');
			isTrue = true;
		}
		if (name === '') {
			$('#check_name').text('이름을 입력해주세요!!  :(').css('color', 'rgb(255 0 0)');
			$('.form-control:focus').css('box-shadow','0 0 0 0.25rem rgb(255 0 0 / 25%)');
			$('.form-control:focus').css('border-color','rgb(255 0 0)');
			isTrue = false;
		}
		return isTrue;
	}

	function check_email() {
		const email = $('#signUpEmail').val();
		$.ajax({
			url : '/projects/misostudy/signUpForm/checkEmail',
			type : 'post',
			data : {'email' : email},
			async: false, // 동기식으로 변경, 응답을 모두 완료한 후 
			success : function(result) {
				console.log('1=중복 // 0=정상 : '+ result);							
				// 1 : 중복
				if (result == 1) {
					$('#check_email').text('사용중인 이메일입니다!!  :(').css('color', 'rgb(255 0 0)');
					$('.form-control:focus').css('box-shadow','0 0 0 0.25rem rgb(255 0 0 / 25%)');
					$('.form-control:focus').css('border-color','rgb(255 0 0)');
					isTrue = false;
				} else {
					// 0 : 정상, 형식검사 시작
					if (!(emailRegexp.test(email))) {
						$('#check_email').text('올바른 이메일 형식이 아닙니다!! :(').css('color', 'rgb(255 0 0)');
						$('.form-control:focus').css('box-shadow','0 0 0 0.25rem rgb(255 0 0 / 25%)');
						$('.form-control:focus').css('border-color','rgb(255 0 0)');
						isTrue = false;
					}
					if (emailRegexp.test(email)) {
						$('#check_email').text('사용가능한 이메일 입니다!!  :)').css('color', 'rgb(54 150 105)');
						$('.form-control:focus').css('box-shadow','0 0 0 0.25rem rgb(54 150 105 / 25%)');
						$('.form-control:focus').css('border-color','rgb(54 150 105)');
						isTrue = true;
					}
					if (email == '') {
						$('#check_email').text('이메일을 입력해주세요!!  :(').css('color', 'rgb(255 0 0)');
						$('.form-control:focus').css('box-shadow','0 0 0 0.25rem rgb(255 0 0 / 25%)');
						$('.form-control:focus').css('border-color','rgb(255 0 0)');
						isTrue = false;
					}
				}
			}, 
			error : function(request, status, error) {
				alert('실패');
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
		return isTrue;						
	}

	$(function(){
		// 아이디 유효성 체크
		$('#signUpUserId').on('keyup', function() {
			check_id();
			console.log('아이디체크:' + check_id());
		});
		
		// 비밀번호 유효성 체크
		$('#signUpPwd').on('keyup',function() {
			check_pwd();
			console.log('비번체크:' + check_pwd());
		});
		
		// 비밀번호 일치 확인
		$('#signUpPwdConfirm').on('keyup', function () {
			check_pwdConfirm();
			console.log('비번확인:' + check_pwdConfirm());
		});

		// 이름 유효성 체크
		$('#signUpName').on('keyup', function () {
			check_name();
			console.log('이름체크:' + check_name());
		});

		// 이메일 유효성 체크
		$('#signUpEmail').on('keyup', function () {
			check_email();
			console.log('이메일체크:' + check_email());
		});
	});
</script>
</body>
</html>
