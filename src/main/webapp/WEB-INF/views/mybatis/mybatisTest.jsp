<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="description" content="Web tutorials">
	<meta name="keywords" content="HTML">
	<meta name="author" content="AlpacaJoon">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MybatisTest</title>
	<style>
		* {
			margin: 0;
			padding: 0;
		}

		#viewContent, td {
			border: 1px solid black;
			
		}
		
		th {
			padding: 10px;
			font-size: 30px;
		}
		
		td {
			padding: 10px;
		}
		
		section {
			margin: 30px;
		}
	</style>
</head>
<body>
	<a href="../home"><img src="../resources/images/logo.png" alt=""></a>
	
	<section>
		<form method="get" action="/mybatis/searchEmpByDeptNo">
			<label for="deptNoSelectBox">Choose a deptNo:</label>
			<select name="deptNo1" id="deptNoSelectBox1">
				<c:forEach items="${deptNos }" var="deptNo">
					<option value="${deptNo }"><c:out value="${deptNo }"/></option>
				</c:forEach>
			</select>
			<button type="submit">부서번호 검색</button>
		</form>
		
		<form method="get" action="/mybatis/searchEmpByJob">
			<label for="jobSelectBox">Choose a job:</label>
			<select name="job1" id="jobSelectBox1">
				<c:forEach items="${jobs }" var="job">
					<option value="${job }"><c:out value="${job }"/></option>
				</c:forEach>
			</select>
			<button type="submit">담당업무 검색</button>
		</form>
		
		<div id="viewBox">
			<table id="viewContent">
				<thead>
					<tr>
						<th>사원번호</th>
						<th>사원이름</th>
						<th>담당업무</th>
						<th>상사번호</th>
						<th>고용일</th>
						<th>급여</th>
						<th>상여</th>
						<th>부서번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${empInfos1 }" var="empInfo">
						<tr>
							<td><c:out value="${empInfo.empNo }"/></td>
							<td><c:out value="${empInfo.name }"/></td>
							<td><c:out value="${empInfo.job }"/></td>
							<td><c:out value="${empInfo.mgrNo }"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${empInfo.hireDate }"/></td>
							<td><c:out value="${empInfo.salary }"/></td>
							<td><c:out value="${empInfo.commission }"/></td>
							<td><c:out value="${empInfo.deptNo }"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	
	<section>
		<form method="get" action="/mybatis/searchEmpByValue">
			<label for="deptNoSelectBox2">Choose a deptNo:</label>
			<select name="deptNo2" id="deptNoSelectBox2">
					<option value="">선택하세요.</option>
				<c:forEach items="${deptNos }" var="deptNo">
					<option value="${deptNo }"><c:out value="${deptNo }"/></option>
				</c:forEach>
			</select>
			
			<label for="jobSelectBox2">Choose a job:</label>
			<select name="job2" id="jobSelectBox2">
					<option value="">선택하세요.</option>
				<c:forEach items="${jobs }" var="job">
					<option value="${job }"><c:out value="${job }"/></option>
				</c:forEach>
			</select>
			<button type="submit">검색</button>
		</form>
		
		<div id="viewBox">
			<table id="viewContent">
				<thead>
					<tr>
						<th>사원번호</th>
						<th>사원이름</th>
						<th>담당업무</th>
						<th>상사번호</th>
						<th>고용일</th>
						<th>급여</th>
						<th>상여</th>
						<th>부서번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${empInfos2 }" var="empInfo">
						<tr>
							<td><c:out value="${empInfo.empNo }"/></td>
							<td><c:out value="${empInfo.name }"/></td>
							<td><c:out value="${empInfo.job }"/></td>
							<td><c:out value="${empInfo.mgrNo }"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${empInfo.hireDate }"/></td>
							<td><c:out value="${empInfo.salary }"/></td>
							<td><c:out value="${empInfo.commission }"/></td>
							<td><c:out value="${empInfo.deptNo }"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	
	<section>
		
		<label for="deptNoSelectBox">Choose a deptNo:</label>
		<select name="deptNo" id="deptNoSelectBox">
				<option value="">선택하세요.</option>
			<c:forEach items="${deptNos }" var="deptNo">
				<option value="${deptNo }"><c:out value="${deptNo }"/></option>
			</c:forEach>
		</select>
		
		<label for="jobSelectBox">Choose a job:</label>
		<select name="job" id="jobSelectBox">
				<option value="">선택하세요.</option>
			<c:forEach items="${jobs }" var="job">
				<option value="${job }"><c:out value="${job }"/></option>
			</c:forEach>
		</select>
		<button type="button" id="searchAjaxBtn">검색</button>
			
		<div id="viewBox">
			<table id="viewContent">
				<thead>
					<tr>
						<th>사원번호</th>
						<th>사원이름</th>
						<th>담당업무</th>
						<th>상사번호</th>
						<th>고용일</th>
						<th>급여</th>
						<th>상여</th>
						<th>부서번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${empInfos3 }" var="empInfo">
						<tr>
							<td><c:out value="${empInfo.empNo }"/></td>
							<td><c:out value="${empInfo.name }"/></td>
							<td><c:out value="${empInfo.job }"/></td>
							<td><c:out value="${empInfo.mgrNo }"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${empInfo.hireDate }"/></td>
							<td><c:out value="${empInfo.salary }"/></td>
							<td><c:out value="${empInfo.commission }"/></td>
							<td><c:out value="${empInfo.deptNo }"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		const deptNo = $("#deptNoSelectBox option:selected").val();
		console.log(deptNo);
		
		$("#searchAjaxBtn").click(function() {
			alert(3);
		});
	</script>
</body>
</html>
