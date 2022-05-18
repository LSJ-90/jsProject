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

		#viewContent1 td, #viewContent2 td, #viewContent3 td {
			border: 1px solid black;
			
		}
		
		th {
			padding: 10px;
			font-size: 30px;
		}
		
		td {
			padding: 10px;
			text-align: center;
			font-size: 15px;
		}
		
		section {
			margin: 30px;
			border-top: 2px solid black;
		}
		
		#viewContent1, #viewContent2, #viewContent3 input{
			border: none;
			height: 15px;
			width: 100%;
			text-align: center;
			font-size: 15px;
		}
		
		input:focus {
			outline-color: blue;
		}
		
		form {
			margin: 10px 0;
		}
	</style>
</head>
<body>
	<a href="../home"><img src="../resources/images/logo.png" alt=""></a>
	<a href="/mybatis/mybatisTest"><button type="button">초기화</button></a>
	<section>
		<h1>##사원 등록##</h1>
		<form method="get" action="/mybatis/insertEmpInfo">
			<label for="insertNameValue">사원이름:</label>
			<input type="text" name="name" id="insertNameValue"/>
			
			<label for="insertJobValue">담당업무:</label>
			<select name="job" id="insertJobValue">
				<option value="">--담당업무--</option>
				<c:forEach items="${jobs }" var="job">
					<option value="${job }"><c:out value="${job }"/></option>
				</c:forEach>
			</select>
			
			<label for="insertSalaryValue">급여:</label>
			<input type="number" name="salary" id="insertSalaryValue" value="0"/>
			
			<label for="insertCommissionValue">상여:</label>
			<input type="number" name="commission" id="insertCommissionValue" value="0"/>
			
			<label for="insertDeptNoValue">부서번호:</label>
			<select name="deptNo" id="insertDeptNoValue">
				<option value="-1">--부서번호--</option>
				<c:forEach items="${deptNos }" var="deptNo">
					<option value="${deptNo }"><c:out value="${deptNo }"/></option>
				</c:forEach>
			</select>
			
			<button type="submit">등록</button>
		</form>
	</section>
	
	<section>
		<h1>1. 다른 FORM, 다른 BTN</h1>
		<form method="get" action="/mybatis/searchEmpByDeptNo">
			<label for="deptNoSelectBox1">Choose a deptNo:</label>
			<select name="deptNo1" id="deptNoSelectBox1">
				<option value="-1">--부서번호--</option>
				<c:forEach items="${deptNos }" var="deptNo">
					<option value="${deptNo }"><c:out value="${deptNo }"/></option>
				</c:forEach>
					<option value="${deptNos[0] },${deptNos[1] }"><c:out value="${deptNos[0] },${deptNos[1] }"/></option>
			</select>
			<button type="submit">부서번호 검색</button>
		</form>
		
		<form method="get" action="/mybatis/searchEmpByJob">
			<label for="jobSelectBox1">Choose a job:</label>
			<select name="job1" id="jobSelectBox1">
				<option value="">--담당업무--</option>
				<c:forEach items="${jobs }" var="job">
					<option value="${job }"><c:out value="${job }"/></option>
				</c:forEach>
			</select>
			<button type="submit">담당업무 검색</button>
		</form>
		
		<div id="viewBox1">
			<table id="viewContent1">
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
		<h1>2. 같은 FORM, 같은 BTN</h1>
		<form method="get" action="/mybatis/searchEmpByValue">
			<label for="deptNoSelectBox2">Choose a deptNo:</label>
			<select name="deptNo2" id="deptNoSelectBox2">
					<option value=-1>--부서번호--</option>
				<c:forEach items="${deptNos }" var="deptNo">
					<option value="${deptNo }"><c:out value="${deptNo }"/></option>
				</c:forEach>
			</select>
			
			<label for="jobSelectBox2">Choose a job:</label>
			<select name="job2" id="jobSelectBox2">
					<option value="">--담당업무--</option>
				<c:forEach items="${jobs }" var="job">
					<option value="${job }"><c:out value="${job }"/></option>
				</c:forEach>
			</select>
			<button type="submit">검색</button>
		</form>
		
		<div id="viewBox2">
			<table id="viewContent2">
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
		<h1>3. Ajax TODO: ing..</h1>
		<label for="deptNoSelectBox3">Choose a deptNo:</label>
		<select name="deptNo2" id="deptNoSelectBox3">
				<option value="-1">--부서번호--</option>
			<c:forEach items="${deptNos }" var="deptNo">
				<option value="${deptNo }"><c:out value="${deptNo }"/></option>
			</c:forEach>
		</select>
		
		<label for="jobSelectBox3">Choose a job:</label>
		<select name="job2" id="jobSelectBox3">
				<option value="">--담당업무--</option>
			<c:forEach items="${jobs }" var="job">
				<option value="${job }"><c:out value="${job }"/></option>
			</c:forEach>
		</select>
		<button type="button" id="searchAjaxBtn">검색</button>
			
		<div id="viewBox3">
			<table id="viewContent3">
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
				<tbody id="empInfosTbody">
					<c:forEach items="${empInfos3 }" var="empInfo">
						<tr>
							<td><c:out value="${empInfo.empNo }"/></td>
							<td><input type="text" value="<c:out value="${empInfo.name }"/>"/></td>
							<td><input type="text" value="<c:out value="${empInfo.job }"/>"/></td>
							<td><c:out value="${empInfo.mgrNo }"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${empInfo.hireDate }"/></td>
							<td><input type="text" value="<c:out value="${empInfo.salary }"/>"/></td>
							<td><input type="text" value="<c:out value="${empInfo.commission }"/>"/></td>
							<td><input type="text" value="<c:out value="${empInfo.deptNo }"/>"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		$('#searchAjaxBtn').click(function() {
			const deptNo2 = $('#deptNoSelectBox3 option:selected').val();
			const job2 = $('#jobSelectBox3 option:selected').val();
			
			const data = {'deptNo2':deptNo2, 'job2':job2};
			const jsonText = JSON.stringify(data);
			
			$.ajax({
				type: 'post',
				url: '/mybatis/searchEmpByAjax',
				data: jsonText,
				contentType: 'application/json',
				dataType: 'json',
				success: function(result) {
					alert("성공");
					console.log(result);
					
					const tbody = $('#empInfosTbody').empty();
					
					$.each(result, function(index, result) {
						let row = "<tr>";
						row += "<td>"+result.empNo+"</td>";
						row += "<td>"+result.name+"</td>";
						row += "<td>"+result.job+"</td>";
						row += "<td>"+result.mgrNo+"</td>";
						row += "<td>"+result.hireDate+"</td>";
						row += "<td>"+result.salary+"</td>";
						row += "<td>"+result.commission+"</td>";
						row += "<td>"+result.deptNo+"</td>";
						row += "</tr>";
						tbody.append(row);
						// TODO: <input type="text" value="<c:out value="${empInfo.name }"/>"/>
					}); 
				},
				error:function() {
			        alert("실패");
			    }
			});
		});
	</script>
</body>
</html>
