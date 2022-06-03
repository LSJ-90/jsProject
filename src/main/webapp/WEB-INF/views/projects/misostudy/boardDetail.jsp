<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<form id="detailBoardForm">
	<div class="modal fade" id="detailBoardModal" tabindex="-1" aria-labelledby="detailBoardModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="detailBoardModalLabel">게시글 작성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">첨부파일</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>3</td>
								<td>컨텐츠제목</td>
								<td>이승준</td>
								<td>2022-06-02</td>
								<td>아이콘설정</td>
								<td>0</td>
							</tr>
							<tr>
								<td colspan="6" style="border-bottom: none;">컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용컨텐츠내용내용</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<th colspan="6">댓글</th>
							</tr>
							<tr>
								<td>이승준</td>
								<td colspan="4" style="text-align:left;">이건 너무 멋진일이야!!</td>
								<td>2022-06-02</td>
							</tr>
							<tr>
								<td>이승우</td>
								<td colspan="4" style="text-align:left;">그닥...</td>
								<td>2022-06-02</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
					<button type="button" id="" class="btn btn-outline-dark">수정</button>
					<button type="button" id="" class="btn btn-outline-dark">삭제</button>
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
