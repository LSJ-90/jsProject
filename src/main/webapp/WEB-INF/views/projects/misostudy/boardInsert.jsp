<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<form id="insertBoardForm" action="/projects/misostudy/insertBoard" method="post">
	<div class="modal fade" id="insertBoardModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="insertBoardModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="insertBoardModalLabel">게시글 작성</h5>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col form-floating mb-3">
						  	<input type="text" class="form-control form-control-sm" id="insertBoardTitle" name="title" placeholder="TITLE" autocomplete="off">
						  	<label for="insertBoardTitle">TITLE</label>
						</div>
						<div class="col mb-3">
					  		<input type="file" class="form-control" id="formFileMultiple" name="uploadName" multiple>
						</div>
					</div>
					<div class="row">
						<div class="form-floating mb-3">
						  <textarea class="form-control" id="insertBoardContent" name="content" placeholder="CONTENT"></textarea>
						  <label for="insertBoardContent">CONTENT</label>
						</div>
					</div>
					<input type="hidden" name="writerNo" value="${LOGIN_USER.userNo }">
					<input type="hidden" name="writerName" value="${LOGIN_USER.name }">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
					<c:if test="${!empty LOGIN_USER }">
						<button type="submit" id="insertBoardBtn" class="btn btn-outline-dark">등록</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</form>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>
