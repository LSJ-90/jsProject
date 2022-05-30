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
				<div class="alert alert-warning" id="signInResultMessage"></div>
				<div class="modal-body">
					<div class="form-floating mb-3">
					  <input type="text" class="form-control" id="signInUserId" placeholder="User Id" name="id">
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
				$('#signInResultMessage').text(result)
				if (result == 0) {
					alert("로그인 성공");
					$('#signInModal').modal("hide");
					$('#loginUl').empty();
					$('#loginUl').append('<li class="nav-item"><a class="nav-link" href="/projects/misostudy/signOut" role="button">Sign out</a></li>');
				}
			},
			error : function(request, status, error) {
				alert(request + ' ' + status + '실패사유: ' + error);
			}
		}); 
		
		
	});
	
	console.log("${LOGIN_USER.id}");

</script>