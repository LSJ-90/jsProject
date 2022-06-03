<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<div class="modal fade" id="updateBoardModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="updateBoardModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="updateBoardModalLabel">게시글 수정</h5>
				</div>
				<div class="modal-body">
					<form id="updateBoardForm" action="/projects/misostudy/insertBoard" method="post">
						<div class="row">
							<div class="col form-floating mb-3">
							  	<input type="text" class="form-control form-control-sm" id="updateBoardTitle" name="title" value="${board.title }" placeholder="TITLE" autocomplete="off">
							  	<label for="updateBoardTitle">TITLE</label>
							</div>
							<div class="col mb-3">
						  		<input type="file" class="form-control" id="updateformFileMultiple" name="uploadName" multiple>
							</div>
						</div>
						<div class="row">
							<div class="form-floating mb-3">
							  <textarea class="form-control" id="updateBoardContent" name="content" placeholder="CONTENT"></textarea>
							  <label for="updateBoardContent">CONTENT</label>
							</div>
						</div>
						<input type="hidden" name="writerNo" value="${LOGIN_USER.userNo }">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
					<c:if test="${!empty LOGIN_USER }">
						<button type="submit" id="insertBoardBtn" class="btn btn-outline-dark">수정</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>
