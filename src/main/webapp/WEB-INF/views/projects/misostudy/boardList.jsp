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
		#insertBoardContent {
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
		<div class="row">
			<table id="selectTable" class="table table table-dark table-striped table-hover">
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
			      <td>${board.title }</td>
			      <td>${board.writerName }</td>
			      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.createdDate }"/></td>
			      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedDate }"/></td>
			      <td>아이콘설정</td>
			      <td>${board.viewCount }</td>
			    </tr>
			    <input type="hidden" name="boardNo" value="${board.boardNo }"/>
			  	</c:forEach>
			  </tbody>
			</table>
		</div>
		
		<div class="row">
			<div class="col">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Previous"> 
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
			</div>
		<button type="button" id="insertBoardBtn" class="btn btn-outline-light btn-dark" data-bs-toggle="modal" data-bs-target="#insertBoardModal">작성</button>
		</div>
		
		<!-- boardInsert Start -->
		<%@include file="boardInsert.jsp" %>
		<!-- boardInsert End -->
		
		<%@include file="boardUpdate.jsp" %>
		
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
		$('.boardVo').click(function(e) {
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
	</script>
</body>
</html>