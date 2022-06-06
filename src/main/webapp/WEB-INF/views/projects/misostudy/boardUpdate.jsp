<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
			  <textarea class="form-control" id="updateBoardContent" name="content" placeholder="CONTENT"><c:out value="${board.content }"/></textarea>
			  <label for="updateBoardContent">CONTENT</label>
			</div>
		</div>
		<input type="hidden" name="boardNo" value="${board.boardNo }">
	</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-dark" data-bs-target="#detailBoardModal" data-bs-toggle="modal">취소</button>
	<c:if test="${!empty LOGIN_USER }">
		<button type="submit" id="updateConfirmBtn" class="btn btn-outline-dark"  data-bs-target="#detailBoardModal" data-bs-toggle="modal">수정</button>
	</c:if>
</div>
<script type="text/javascript">
	
</script>