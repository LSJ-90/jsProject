<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<div class="modal fade" id="signInModal" tabindex="-1" aria-labelledby="signInModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="signInModalLabel">Sign In</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="alert alert-light" id="signInResultMessage">로그인하여 게시판을 이용해보세요!!</div>
			<div class="modal-body">
				<form id="signInForm">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="signInUserId" placeholder="User Id" name="id" autocomplete="off"> 
						<label for="signInUserId">User Id</label>
					</div>
					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="signInPassword" placeholder="Password" name="pwd"> 
						<label for="signInPassword">Password</label>
					</div>
				</form>
				<a href="/projects/misostudy/findMyInfo">아이디찾기/비밀번호찾기</a>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-dark modalClose" data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-outline-dark" id="signInBtn">Sign In</button>
			</div>
		</div>
	</div>
</div>