<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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

<ul class="pagination justify-content-center">
	<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
		<a class="page-link" data-page="${pagination.prevPage }" aria-label="Previous"> 
			<span aria-hidden="true">&laquo;</span>
		</a>
	</li>
	<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
		<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
			<a class="page-link">${num }</a>
		</li>
	</c:forEach>
	<li class="page-item  ${pagination.existNext ? '' : 'disabled' }">
		<a class="page-link" data-page="${pagination.nextPage }" aria-label="Next">
			<span aria-hidden="true">&raquo;</span>
		</a>
	</li>
</ul>