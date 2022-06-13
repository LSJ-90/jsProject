<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate pattern="yyyy-MM-dd" value="${now}" var="today"/>
<div class="modal-header">
	<h5 class="modal-title" id="detailBoardModalLabel"><c:out value="${board.title }"/></h5>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">
<form action="/projects/misostudy/downloadFile" method="post">
	<table class="table">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">수정일</th>
				<th scope="col">첨부파일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td id="detailBoradNo"><c:out value="${board.boardNo }"/></td>
				<td><c:out value="${board.writerId }"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.createdDate }"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedDate }"/></td>
				<td>
					<c:if test="${!empty uploadFileInfos }">
						<select name="uploadNo" id="downloadBox">
							<c:forEach items="${uploadFileInfos }" var="uploadFile">
								<option value="${uploadFile.uploadNo }">${uploadFile.uploadName }</option>
							</c:forEach>
						</select>
						<button type="submit" id="downloadFileBtn">DOWN</button>
						
					</c:if>
				</td>
				<td><c:out value="${board.viewCount }"/></td>
			</tr>
			
			<tr style="border-top: 3px solid black;">
				<td colspan="6" style="border-bottom: none; height: 200px; text-align: justify;"><c:out value="${board.content }"/></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="6">댓글</th>
			</tr>
			<c:forEach items="${comments }" var="comment">
				<tr>
					<td colspan="1"><c:out value="${comment.writerName }"/></td>
					<td colspan="4" style="text-align:justify;"><c:out value="${comment.content }"/></td>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${comment.createdDate }" var="createdDate"/>
					<c:choose>
						<c:when test="${createdDate eq today }">
							<td colspan="1" style="width:15%;"><fmt:formatDate pattern="hh:mm:ss" value="${comment.createdDate }"/></td>
						</c:when>
						<c:otherwise>
							<td colspan="1" style="width:15%;"><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.createdDate }"/></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tfoot>
	</table>
	</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
	<c:if test="${board.writerNo == LOGIN_USER.userNo or LOGIN_USER.id eq 'admin01'}">
		<button type="button" id="boardUpdateBtn" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#updateBoardModal">수정</button>
		<button type="button" id="boardDeleteBtn" class="btn btn-outline-dark" data-bs-dismiss="modal">삭제</button>
	</c:if>
</div>