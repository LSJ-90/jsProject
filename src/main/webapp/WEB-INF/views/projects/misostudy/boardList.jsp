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
	<link href="/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="wrap">
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
			      <td><c:out value="${board.writerId }"/></td>
			      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.createdDate }"/></td>
			      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedDate }"/></td>
			      <td>
			      	<c:if test="${board.uploadCnt != 0 }">
			      		<img class="attachmentImg" alt="첨부파일 없음" src="/resources/images/premium-icon-attachments-304884.png">
			      	</c:if>
			      </td>
			      <td>${board.viewCount }</td>
			    </tr>
			    <input type="hidden" name="boardNo" value="${board.boardNo }"/>
			  	</c:forEach>
			  </tbody>
			</table>
			<ul class="pagination my justify-content-center">
				<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
					<a class="page-link" data-page="${pagination.prevPage }" aria-label="Previous"> 
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
					<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
						<a class="page-link" data-page="${num }">${num }</a>
					</li>
				</c:forEach>
				<li class="page-item  ${pagination.existNext ? '' : 'disabled' }">
					<a class="page-link " data-page="${pagination.nextPage }" aria-label="Next">
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
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		// 수정 
		$(document).on('click', '#updateConfirmBtn', function(){
			const updateBoardForm = $('#updateBoardForm');
			const updateBoardFormData = new FormData(updateBoardForm[0]);
			$.ajax({
				type: 'post',
				url: '/projects/misostudy/boardUpdate',
				data: updateBoardFormData,
				contentType: false,
				processData: false,
				dataType: 'text',
				success: function(result) {
					 // alert("성공");
					 // console.log(result);
				 	$('#boardDetailResult').html(result);
				 	reloadPage();
				},
				error : function(request, status, error) {
					alert('실패');
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});
		});
		
		// delete board
		$(document).on('click', '#boardDeleteBtn', function(){
			const boardNo = $('#detailBoradNo').text();
			$.ajax({
				type: 'post',
				url: '/projects/misostudy/deleteBoard?boardNo=' + boardNo,
				dataType: 'text',
				success: function(result) {
					 alert(result);
					 reloadPage();
				},
				error : function(request, status, error) {
					alert('실패');
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});
		});
		
		// move updateForm
		$(document).on('click', '#boardUpdateBtn', function(){
			const boardNo = $('#detailBoradNo').text();
			console.log(boardNo);
			$.ajax({
				type: 'get',
				url: '/projects/misostudy/moveUpdateForm?boardNo=' + boardNo,
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
			const boardNo = $(e.currentTarget.nextElementSibling).val();
			$.ajax({
				type: 'get',
				url: '/projects/misostudy/boardDetail?boardNo=' + boardNo,
				dataType: 'text',
				success: function(result) {
					// alert("성공");
					// console.log(result);
					$('#boardDetailResult').html(result);
					$('#detailBoardModal').modal('show');
					reloadPage();
				},
				error : function(request, status, error) {
					alert('실패');
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});
		});
		
		// pagenation
		$(document).on('click', '.page-link', function(e){
			const page = e.currentTarget.dataset.page;
			console.log(e.currentTarget.dataset.page);
			$.ajax({
				type: 'get',
				url: '/projects/misostudy/boardListResult?page='+page,
				dataType: 'text',
				success: function(result) {
					// alert('성공');
					// console.log(result);
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
		
		function reloadPage() {
			const page = $('.page-item.active').children().eq(0).text();
			$.ajax({
				type: 'get',
				url: '/projects/misostudy/boardListResult?page='+page,
				dataType: 'text',
				success: function(result) {
					// alert('성공');
					// console.log(result);
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
		}
		
		// insert block
		$('#insertBoardModal').on('show.bs.modal', function (e) {
		  	if (${empty LOGIN_USER }) {
		  		e.preventDefault();
		  		alert('로그인 후 사용 가능합니다..:(');
				$('#signInModal').modal('show');
			}
		});
		  		
// 		$(document).on('click', '.xicon', function(e){
// 			$(this).parent().remove();
// 		});
	</script>
	<script src="/resources/js/common.js"></script>
</body>
</html>