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
		
		#viewContent1, #viewContent2, #viewContent3, #viewContent3 input{
			border: none;
			height: 15px;
			width: 100%;
			text-align: center;
			font-size: 15px;
		}
		
		input:focus {
			outline-color: blue;
		}
		
		select {
			text-align: center;
		}
		
		select:focus {
			border: 1px solid black;
		}
		
		.deptNoSelectBox, .jobSelectBox{
			border: none;
			width: 100%;
			height: 20px;
			font-size: 15px;
		}
		
		form {
			margin: 10px 0;
		}
		
		#updateAjaxBtn {
			float: right;
		}
		
		.container {
			display: none;
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
		<h1>
			1. 다른 FORM, 다른 BTN
			<button class="hideContentBtn">펼치기</button>
		</h1>
		<div class="container">
			<form method="get" action="/mybatis/selectEmpByDeptNo">
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
			
			<form method="get" action="/mybatis/selectEmpByJob">
				<label for="jobSelectBox1">Choose a job:</label>
				<select name="job1" id="jobSelectBox1">
					<option value="">--담당업무--</option>
					<c:forEach items="${jobs }" var="job">
						<option value="${job }"><c:out value="${job }"/></option>
					</c:forEach>
				</select>
				<button type="submit">담당업무 검색</button>
			</form>
			
			<div class="viewBox">
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
		</div>
	</section>
	
	<section>
		<h1>
			2. 같은 FORM, 같은 BTN
			<button class="hideContentBtn">펼치기</button>
		</h1>
		<div class="container">
			<form method="get" action="/mybatis/selectEmpByValue" id="searchForm2">
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
			
			<div class="viewBox">
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
		</div>
	</section>
	
	<section>
		<h1>
			3. Ajax TODO: ing..
			<button class="hideContentBtn">펼치기</button>
		</h1>
		<div class="container">
			<form>
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
				<button type="button" id="updateAjaxBtn">수정</button>
			</form>
			<form id="updateAjaxForm">	
			<div class="viewBox">
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
								<td><input type="hidden" name="empNo" value="${empInfo.empNo }"/><c:out value="${empInfo.empNo }"/></td>
								<td><input type="text" name="name" value="<c:out value="${empInfo.name }"/>"/></td>
								<td>
									<select name="job" class="jobSelectBox">
										<option value="${empInfo.job }">--<c:out value="${empInfo.job }"/>--</option>
										<c:forEach items="${jobs }" var="job">
											<option value="${job }"><c:out value="${job }"/></option>
										</c:forEach>
									</select>
								</td>
								<td><c:out value="${empInfo.mgrNo }"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${empInfo.hireDate }"/></td>
<%-- 								<td><input type="text" name="salary" value="<fmt:formatNumber value='${empInfo.salary }' pattern='##,###'/>"/></td> --%>
								<td><input type="number" name="salary" value="<c:out value="${empInfo.salary }"/>"/></td>
								<td><input type="number" name="commission" value="<c:out value="${empInfo.commission }"/>"/></td>
								<td>
									<select name="deptNo" class="deptNoSelectBox">
										<option value="${empInfo.deptNo }">--<c:out value="${empInfo.deptNo }"/>--</option>
										<c:forEach items="${deptNos }" var="deptNo">
											<option value="${deptNo }"><c:out value="${deptNo }"/></option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</form>
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		/* 사원 검색 */
		$('#searchAjaxBtn').click(function() {
			const deptNo2 = $('#deptNoSelectBox3 option:selected').val();
			const job2 = $('#jobSelectBox3 option:selected').val();
			
			const searchData = {'deptNo2':deptNo2, 'job2':job2};
			const jsonSearchData = JSON.stringify(searchData);
			
			$.ajax({
				type: 'post',
				url: '/mybatis/selectEmpByAjax',
				data: jsonSearchData,
				contentType: 'application/json; charset=utf-8',
				dataType: 'text',
				success: function(result) {
					 // alert("성공");
					 // console.log(result);
					 $('#empInfosTbody').html(result); 
				},
				error:function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR);
					console.log(textStatus);
					console.log(errorThrown);
			        alert('실패');
			    }
			});
		});
		
		/* 사원정보 업데이트 TODO: 수정된 값일 경우만 업데이트 로직 타게 만들어보기(요청데이터 줄이기) */
		$('#updateAjaxBtn').click(function() {
			/* 검색 값 가져오기 
			const deptNo2 = $('#deptNoSelectBox3 option:selected').val();
			const job2 = $('#jobSelectBox3 option:selected').val();
			const searchData = {'deptNo2':deptNo2, 'job2':job2};
			const jsonSearchData = JSON.stringify(searchData);
			*/
			
			/* 값을 가져올 태그 선택 */
			const empNoInputTag = $('#empInfosTbody input[name=empNo]');
			const nameInputTag = $('#empInfosTbody input[name=name]');
			const jobInputTag = $('.jobSelectBox option:selected');
			const salaryInputTag = $('#empInfosTbody input[name=salary]');
			const commissionInputTag = $('#empInfosTbody input[name=commission]');
			const deptNoInputTag = $('.deptNoSelectBox option:selected');
			
			/* 각 데이터에 대한 배열 생성 */
			const empNos = new Array();
			const names = new Array();
			const jobs = new Array();
			const salaries = new Array();
			const commissions = new Array();
			const deptNos = new Array();
		
			/* 각 태그에 입력된 값 뽑기 TODO: 함수화 */
			$.each(empNoInputTag, function (index, value) {
				empNos.push($(value).val());
			});
			$.each(nameInputTag, function (index, value) {
				names.push($(value).val());
			});
			$.each(jobInputTag, function (index, value) {
				jobs.push($(value).val());
			});
			$.each(salaryInputTag, function (index, value) {
				salaries.push($(value).val());
			});
			$.each(commissionInputTag, function (index, value) {
				commissions.push($(value).val());
			});
			$.each(deptNoInputTag, function (index, value) {
				deptNos.push($(value).val());
			});
	
			/* 각 데이터 겍체화 후 하나의 배열로 생성 */
			const empInfos = new Array();
 			for (let i=0; i<empNos.length; i++) {	
 				let empInfo = new Object();
				
 				empInfo.empNo = empNos[i];
 				empInfo.name = names[i];
 				empInfo.job = jobs[i];
 				empInfo.salary = salaries[i];
 				empInfo.commission = commissions[i];
 				empInfo.deptNo = deptNos[i];
				
 				empInfos.push(empInfo);
 			}
 			// console.log(empInfos);
 			
 			/* JSON 직렬화 처리*/
 			const jsonEmpInfos = JSON.stringify(empInfos);
 			// console.log(jsonEmpInfos);
 			
 			/* 검색값, 사원정보 객체화 후 JSON 직렬화 처리
 			const updateData = {'value': searchData, 'empInfos':empInfos};
 			const jsonUpdateData = JSON.stringify(updateData);
 			console.log(updateData);
 			console.log(jsonUpdateData);
 			*/
 			
 			$.ajax({
				type: 'post',
				url: '/mybatis/updateEmpInfo',
				data: jsonEmpInfos,
				contentType: 'application/json; charset=utf-8',
				dataType: 'text',
				success: function(result) {
					 alert("수정 성공");
					 // console.log(result); 
					 $('#empInfosTbody').html(result);
				},
				error:function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR);
					console.log(textStatus);
					console.log(errorThrown);
			        alert('실패');
			    }
			});
		});
		
		$('.hideContentBtn').click(function(e) {
			const $targetContainer = $(e.target).parent().next();
		    if ($targetContainer.css('display') == 'none') {
			   $targetContainer.css('display', 'block');
			   $(this).text('숨기기');
	        } else {
	        	$targetContainer.css('display', 'none');
	        	$(this).text('펼치기');
	        }
		});
		
	 	
		
 		
		$(function() {
			
				const url = new URL($(location).attr('href'));
				const queryStringValues = new URLSearchParams(url.search);
	 			
				for (const queryStringValue of queryStringValues.entries()) {
					console.log($.isEmptyObject(queryStringValue).);
					if ($.isEmptyObject(queryStringValue) == false) {
		 				$('.container').css('display', 'block');
		 			}
	 			}
				
	 			
		
		});
		
		
		
		
		// $('#deptNoSelectBox2')
	</script>
</body>
</html>
