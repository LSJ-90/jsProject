<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<form id="signInForm">
	<div class="modal fade" id="signInModal" tabindex="-1" aria-labelledby="signInModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="signInModalLabel">Sign In</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="alert alert-light" id="signInResultMessage">로그인하여 게시판을 이용해보세요!!</div>
				<div class="modal-body">
					<div class="form-floating mb-3">
					  <input type="text" class="form-control" id="signInUserId" placeholder="User Id" name="id" autocomplete="off">
					  <label for="signInUserId">User Id</label>
					</div>
					<div class="form-floating mb-3">
					  <input type="password" class="form-control" id="signInPassword" placeholder="Password" name="pwd">
					  <label for="signInPassword">Password</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-outline-dark" id="signInBtn">Sign In</button>
				</div>
			</div>
		</div>
	</div>
</form>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
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
					$('#signInModal').modal("hide");
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
</script>