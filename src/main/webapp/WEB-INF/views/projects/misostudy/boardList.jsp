<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="description" content="Web tutorials">
	<meta name="keywords" content="HTML">
	<meta name="author" content="AlpacaJoon">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Study Site 화로 정리 해보기</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<style>
		/* Defalut */
		* {
			margin: 0;
			padding: 0;
		}

		ul li {
			list-style: none;
		}

		a, a:link {
			color: #000;
			text-decoration: none;
		}
		
		html {
			height: 100%;
		}
		
		body {
			text-align: center;
			position: relative;
			z-index: 1;
			height: 100%;
		}
		
		body::after {
			width: 100%;
			height: 100%;
			content: "";
			background: url("../../resources/images/test.jpg");
			background-size: cover;
			position: absolute;
			top: 0;
			left: 0;
			z-index: -1;
			opacity: 0.7;
		}
		
		.container {
			width: 90%;
			margin-top: 2vh;
		}
		
		/* SignIn */
		#signInResultMessage {
			text-align: center;
		}
		
		/* BoardList */
		#insertBoardContent, #updateBoardContent {
			height: 340px;
			resize: none;
		}
		
		/* Footer */
		footer {
			color: white;
			background-color: #212529;
			position: fixed;
			bottom: 0;
			width: 100%;
		}
		.company {
		  	font-size: 12px;
		}
		.company__address {
		  	font-style: normal;
		  	line-height: 1.8;
		}
		.company__address span {
		  	margin-right: 15px;
		}
	</style>
</head>
<body>
	<header>
		<%@include file="navbar.jsp" %>
		<%@include file="signInForm.jsp" %>
		<%@include file="signUpForm.jsp" %>
	</header>
	<div class="container">
		<div id="selectTable" class="row">
			<table class="table table table-dark table-striped table-hover">
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">제목</th>
			      <th scope="col">작성자</th>
			      <th scope="col">작성일</th>
			      <th scope="col">수정일</th>
			      <th scope="col">첨부파일</th>
			      <th scope="col">조회수</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach items="${boardList }" var="board">
			    <tr class="boardVo">
			      <th scope="row"><c:out value="${board.boardNo }"/></th>
			      <td><c:out value="${board.title }"/></td>
			      <td><c:out value="${board.writerName }"/></td>
			      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.createdDate }"/></td>
			      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedDate }"/></td>
			      <td>아이콘설정</td>
			      <td>${board.viewCount }</td>
			    </tr>
			    <input type="hidden" name="boardNo" value="${board.boardNo }"/>
			  	</c:forEach>
			  </tbody>
			</table>
			<ul class="pagination justify-content-center">
				<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
					<a class="page-link" data-page="${pagination.prevPage }" aria-label="Previous"> 
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
					<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
						<a class="page-link">${num }</a>
					</li>
				</c:forEach>
				<li class="page-item  ${pagination.existNext ? '' : 'disabled' }">
					<a class="page-link" data-page="${pagination.nextPage }" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>
		</div>
		<div class="row">
			<button type="button" id="insertBoardBtn" class="btn btn-outline-light btn-dark" data-bs-toggle="modal" data-bs-target="#insertBoardModal">작성</button>
		</div>
		
		<!-- boardInsert Start -->
		<%@include file="boardInsert.jsp" %>
		<!-- boardInsert End -->
		
		<div class="modal fade" id="updateBoardModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="updateBoardModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl modal-dialog-scrollable">
				<div id="boardUpdateResult" class="modal-content">
					<%@include file="boardUpdate.jsp" %>
				</div>
			</div>
		</div>
		
		<!-- boardDetail Start -->
		<div class="modal fade" id="detailBoardModal" tabindex="-1" aria-labelledby="detailBoardModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl modal-dialog-scrollable">
				<div id="boardDetailResult" class="modal-content">
					<!-- boardDetailTable Result -->
					<%@include file="boardDetailTable.jsp" %>
				</div>
			</div>
		</div>
		<!-- boardDetail End -->
	</div>
	<footer>
		<%@include file="footer.jsp" %>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		// 수정 
		$(document).on('click', '#updateConfirmBtn', function(){
			const updateBoardForm = $('#updateBoardForm').serialize();
			console.log($('.page-item.active').children().eq(0).text());
			$.ajax({
				type: 'post',
				url: '/projects/misostudy/boardUpdate',
				data: updateBoardForm,
				dataType: 'text',
				success: function(result) {
					 // alert("성공");
					 console.log(result);
					 $('#boardDetailResult').html(result);
					 const page = $('.page-item.active').children().eq(0).text();
						$.ajax({
							type: 'get',
							url: '/projects/misostudy/boardListResult?page='+page,
							dataType: 'text',
							success: function(result) {
								// alert('성공');
								console.log(result);
								$('#selectTable').empty();
								$('#selectTable').html(result);
							},
							error : function(request, status, error) {
								alert('실패');
								console.log(request);
								console.log(status);
								console.log(error);
							}
						});
				},
				error : function(request, status, error) {
					alert('실패');
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});
		});
	
		// 수정폼 이동
		$(document).on('click', '#boardUpdateBtn', function(){
			const boardNo = $('#updateBoradNo').val();
			console.log(boardNo);
			$.ajax({
				type: 'get',
				url: '/projects/misostudy/boardUpdate',
				data: {'boardNo' : boardNo},
				contentType: 'application/json; charset=utf-8', 
				dataType: 'text',
				success: function(result) {
					 // alert("성공");
					 // console.log(result);
					$('#boardUpdateResult').html(result);
				},
				error : function(request, status, error) {
					alert('실패');
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});
		});	
	
		// Detail Init
		$(document).on('click', '.boardVo', function(e){
			console.log($(e.currentTarget.nextElementSibling).val());
			console.log(typeof $(e.currentTarget.nextElementSibling).val());
			const boardNo = $(e.currentTarget.nextElementSibling).val();
			$.ajax({
				type: 'get',
				url: '/projects/misostudy/boardDetail',
				data: {'boardNo': boardNo},
				contentType: 'application/json; charset=utf-8', 
				dataType: 'text',
				success: function(result) {
					// alert("성공");
					// console.log(result);
					$('#boardDetailResult').html(result);
					$('#detailBoardModal').modal('show');
				},
				error : function(request, status, error) {
					alert('실패');
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});
		});
		
		// 페이지네이션
		$(document).on('click', '.page-link', function(e){
			console.log($(e.target).text());
			const page = $(e.target).text();
			$.ajax({
				type: 'get',
				url: '/projects/misostudy/boardListResult?page='+page,
				dataType: 'text',
				success: function(result) {
					// alert('성공');
					console.log(result);
					$('#selectTable').empty();
					$('#selectTable').html(result);
				},
				error : function(request, status, error) {
					alert('실패');
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});
		});
		
		$('#insertBoardModal').on('show.bs.modal', function (e) {
		  	if (${empty LOGIN_USER }) {
		  		e.preventDefault();
				alert('로그인 후 사용 가능합니다..:(');
				$('#signInModal').modal('show');
			} 
		});
		
		// Modal reset Controller
		$('.modal').on('hidden.bs.modal', function(e) {
			$(this).find('form')[0].reset();
			
			//SignIn
			$('#signInResultMessage').removeClass('alert-danger');
			$('#signInResultMessage').addClass('alert-light');
			$('#signInResultMessage').text('로그인하여 게시판을 이용해보세요!!');
			
			//SignUp
			$('.warning').text('');
			$('.form-control').css('box-shadow','none');
			$('.form-control').css('border-color','');
		});
		
		$('#signInBtn').click(function() {
			const signInForm = $('#signInForm').serialize();
			$.ajax({
				type:'post', 
				url:'/projects/misostudy/signIn', 
				data: signInForm,
				contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				dataType: 'text',
				success : function(result) {
					if (result === 'success') {
						alert("로그인 성공");
						$('#signInModal').modal('hide');
						$('.modal-backdrop').remove();
						$('#loginUl').empty();
						$('#loginUl').append('<li class="nav-item"><a class="nav-link" href="/projects/misostudy/signOut" role="button">Sign out</a></li>');
					} else {
						$('#signInResultMessage').removeClass('alert-light');
						$('#signInResultMessage').addClass('alert-danger');
						$('#signInResultMessage').text(result);
					}
				},
				error : function(request, status, error) {
					alert('실패');
					console.log(request);
					console.log(status);
					console.log(error);
				}
			}); 
		});
		
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