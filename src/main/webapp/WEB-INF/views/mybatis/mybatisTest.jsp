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
		
		.deptNoSelectBox, .jobSelectBox, .mgrNoSelectBox {
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
			visibility: hidden;
			max-height: 0vh;
			overflow: auto;
			transform-origin: 0px 0px;
			transform: scaleY(0);
			transition: all 1s;
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
	
	<section id="section1">
		<h1>
			1. 다른 FORM, 다른 BTN
			<button class="hideContentBtn">펼치기</button>
		</h1>
		<div id="contentDiv1" class="container">
			<form method="get" action="/mybatis/selectEmpByDeptNo">
				<label for="deptNoSelectBox1">Choose a deptNo:</label>
				<select name="deptNo1" id="deptNoSelectBox1">
						<option value="-1">
							--부서번호--
						</option>
					<c:forEach items="${deptNos }" var="deptNo">
						<option value="${deptNo }" ${deptNo eq selectedDeptNo ? 'selected' : '' }>
							<c:out value="${deptNo }"/>
						</option>
					</c:forEach>
						<option value="${deptNos[0] },${deptNos[1] }" 
							<c:if test="${deptNos[0] == selectedDeptNos[0] and deptNos[1] == selectedDeptNos[1]}">
								selected
							</c:if>>
							<c:out value="${deptNos[0] },${deptNos[1] }"/>
						</option>
				</select>
				<button type="submit">부서번호 검색</button>
			</form>
			
			<form method="get" action="/mybatis/selectEmpByJob">
				<label for="jobSelectBox1">Choose a job:</label>
				<select name="job1" id="jobSelectBox1">
					<option value="">--담당업무--</option>
					<c:forEach items="${jobs }" var="job">
						<option value="${job }" ${job eq selectedJob ? 'selected' : '' }><c:out value="${job }"/></option>
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
							<th>급여($)</th>
							<th>상여($)</th>
							<th>부서번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${empInfos1 }" var="empInfo">
							<tr>
								<td><c:out value="${empInfo.empNo }"/></td>
								<td><c:out value="${empInfo.name }"/></td>
								<td><c:out value="${empInfo.job }"/></td>
								<td><c:out value="${empInfo.mgrNo == 0 ? '없음' : empInfo.mgrNo}"/></td>
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
	
	<section id="section2">
		<h1>
			2. 같은 FORM, 같은 BTN
			<button class="hideContentBtn">펼치기</button>
		</h1>
		<div id="contentDiv2" class="container">
			<form method="get" action="/mybatis/selectEmpByValue" id="searchForm2">
				<label for="deptNoSelectBox2">Choose a deptNo:</label>
				<select name="deptNo2" id="deptNoSelectBox2">
						<option value=-1>--부서번호--</option>
					<c:forEach items="${deptNos }" var="deptNo">
						<option value="${deptNo }" ${deptNo == selectedValue.deptNo2 ? 'selected' : '' }><c:out value="${deptNo }"/></option>
					</c:forEach>
				</select>
				
				<label for="jobSelectBox2">Choose a job:</label>
				<select name="job2" id="jobSelectBox2">
						<option value="">--담당업무--</option>
					<c:forEach items="${jobs }" var="job">
						<option value="${job }" ${job == selectedValue.job2 ? 'selected' : '' }><c:out value="${job }"/></option>
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
							<th>급여($)</th>
							<th>상여($)</th>
							<th>부서번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${empInfos2 }" var="empInfo">
							<tr>
								<td><c:out value="${empInfo.empNo }"/></td>
								<td><c:out value="${empInfo.name }"/></td>
								<td><c:out value="${empInfo.job }"/></td>
								<td><c:out value="${empInfo.mgrNo == 0 ? '없음' : empInfo.mgrNo}"/></td>
								<td><fmt:formatDate value="${empInfo.hireDate }" pattern="yyyy-MM-dd"/></td>
								<td><fmt:formatNumber value="${empInfo.salary }" pattern="##,###"/></td>
								<td><fmt:formatNumber value="${empInfo.commission }" pattern="##,###"/></td>
								<td><c:out value="${empInfo.deptNo }"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	
	<section id="section3">
		<h1>
			3. Ajax TODO: ing..
			<button class="hideContentBtn">펼치기</button>
		</h1>
		<div id="contentDiv3" class="container">
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
							<th>급여($)</th>
							<th>상여($)</th>
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
										<c:forEach items="${jobs }" var="job">
											<option value="${job }" ${empInfo.job == job ? 'selected' : '' }>
												<c:out value="${empInfo.job == job ? '--' += empInfo.job += '--' : job  }"/>
											</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<select name="mgrNo" class="mgrNoSelectBox">
										<c:forEach items="${mgrNos }" var="mgrNo">
											<option value="${mgrNo }" ${empInfo.mgrNo == mgrNo ? 'selected' : '' }>
												<!-- 삼항연산자 -->
												<c:out 
													value="${empInfo.mgrNo == mgrNo 
																? (empInfo.mgrNo == 0 ? '--없음--' : '--' += empInfo.mgrNo += '--') 
																: (mgrNo == 0 ? '없음' : mgrNo)}"/>
												<!-- choose when otherwise 사용
												<c:choose>
													<c:when test="${empInfo.mgrNo == mgrNo}">
														<c:choose>
															<c:when test="${empInfo.mgrNo == 0}">
																<c:out value="${'--없음--' }"/>
															</c:when>
															<c:otherwise>
																<c:out value="${'--' += empInfo.mgrNo += '--' }"/>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<c:out value="${mgrNo == 0 ? '없음' : mgrNo}"/>
													</c:otherwise>
												</c:choose>
												-->
											</option>
										</c:forEach>
									</select>
								</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${empInfo.hireDate }"/></td>
							<!-- <td><input type="text" name="salary" value="<fmt:formatNumber value='${empInfo.salary }' pattern='##,###'/>"/></td> -->
								<td><input type="number" name="salary" min="0" value="<c:out value="${empInfo.salary }"/>"/></td>
								<td><input type="number" name="commission" min="0" value="<c:out value="${empInfo.commission }"/>"/></td>
								<td>
									<select name="deptNo" class="deptNoSelectBox">
										<c:forEach items="${deptNos }" var="deptNo">
											<option value="${deptNo }" ${empInfo.deptNo == deptNo ? 'selected' : '' }>
												<c:out value="${empInfo.deptNo == deptNo ? '--' += empInfo.deptNo += '--' : deptNo }"/>
											</option>
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
		/* TODO: 요청데이터 혹은 응답데이터가 있을 때 펼치기 기능 on */
		$(function() {
			if (${!empty empInfos1}) {
				$('#contentDiv1').css('visibility', 'visible');
				$('#contentDiv1').css('transform', 'scaleY(1)');
				$('#contentDiv1').css('max-height', '100vh');
				$('#section1 .hideContentBtn').text('숨기기');	
			} else if (${!empty empInfos2}) {
				$('#contentDiv2').css('visibility', 'visible');
				$('#contentDiv2').css('transform', 'scaleY(1)');
				$('#contentDiv2').css('max-height', '100vh');
				$('#section2 .hideContentBtn').text('숨기기');	
			} else if (${!empty empInfos3}) {
				$('#contentDiv3').css('visibility', 'visible');
				$('#contentDiv3').css('transform', 'scaleY(1)');
				$('#contentDiv3').css('max-height', '100vh');
				$('#section3 .hideContentBtn').text('숨기기');	
			}
		});
		/*
		const url = new URL($(location).attr('href'));
		const queryStringValues = new URLSearchParams(url.search);
		
		for (const queryStringValue of queryStringValues.entries()) {
			console.log($.isEmptyObject(queryStringValue));
			if ($.isEmptyObject(queryStringValue) == false) {
				$('.container').css('display', 'block');
				$('.hideContentBtn').text('숨기기');
			} else if ($.isEmptyObject(queryStringValue) == true) {
				$('.container').css('display', 'none');
				$('.hideContentBtn').text('펼치기');
			}
		}
		*/
	
		/* ajax사원 검색 */
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
			/* 검색 값 가져오기 */
// 			const deptNo2 = $('#deptNoSelectBox3 option:selected').val();
// 			const job2 = $('#jobSelectBox3 option:selected').val();
// 			const searchData = {'deptNo2':deptNo2, 'job2':job2};
// 			const jsonSearchData = JSON.stringify(searchData);
			
			/* 값을 가져올 태그 선택 */
// 			const formTag = $('#updateAjaxForm').serializeArray();
// 			console.log(formTag);
			const empNoInputTag = $('#empInfosTbody input[name=empNo]'),
				  nameInputTag = $('#empInfosTbody input[name=name]'),
				  jobInputTag = $('.jobSelectBox option:selected'),
				  mgrNoInputTag = $('.mgrNoSelectBox option:selected'),
			 	  salaryInputTag = $('#empInfosTbody input[name=salary]'),
				  commissionInputTag = $('#empInfosTbody input[name=commission]'),
			 	  deptNoInputTag = $('.deptNoSelectBox option:selected');
			const empInfoValueTags = [empNoInputTag, nameInputTag, jobInputTag, mgrNoInputTag, salaryInputTag, commissionInputTag, deptNoInputTag];
			
			/* 각 데이터에 대한 배열 생성 */
			const empNos = new Array(),
				  names = new Array(),
			 	  jobs = new Array(),
			 	  mgrNos = new Array(),
			 	  salaries = new Array(),
			 	  commissions = new Array(),
			 	  deptNos = new Array();
			const empInfoValueNewArraies = [empNos, names, jobs, mgrNos, salaries, commissions, deptNos];
			
			/* 각 태그에 입력된 값 뽑기 */
			pushEmpInfoValues(empInfoValueTags, empInfoValueNewArraies);
			
			/* 음수 체크 */
			for (let salary of salaries) {
				if (salary < 0) {
					alert('급여가 마이너스라고..!!?그러지마..');
					return;
				}
			}
			for (let commission of commissions) {
				if (commission < 0) {
					alert('상여가 마이너스라고..!!? 차라리 0으로 해줘!!');
					return;
				}
			}
			
			/* 각 데이터 겍체화 후 하나의 배열로 생성 */
			const empInfos = new Array();
 			for (let i=0; i<empNos.length; i++) {	
 				let empInfo = new Object();
				
 				empInfo.empNo = empNos[i];
 				empInfo.name = names[i];
 				empInfo.job = jobs[i];
 				empInfo.mgrNo = mgrNos[i];
 				empInfo.salary = salaries[i];
 				empInfo.commission = commissions[i];
 				empInfo.deptNo = deptNos[i];
				
 				empInfos.push(empInfo);
 			}
 			console.log(empInfos);
 			
 			/* JSON 직렬화 처리*/
 			const jsonEmpInfos = JSON.stringify(empInfos);
 			console.log(jsonEmpInfos);
 			
 			/* 검색값, 사원정보 객체화 후 JSON 직렬화 처리 */
//  			const updateData = {'value': searchData, 'empInfos':empInfos};
//  			const jsonUpdateData = JSON.stringify(updateData);
//  			console.log(updateData);
//  			console.log(jsonUpdateData);
 			
 			/* ajax 통신처리 */
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
		
		/* 숨기기/펼치기 기능 */
		$('.hideContentBtn').click(function(e) {
			const $targetContainer = $(e.target).parent().next();
		    if ($targetContainer.css('visibility') == 'hidden') {
			   $targetContainer.css('visibility', 'visible');
			   $targetContainer.css('transform', 'scaleY(1)');
			   $targetContainer.css('max-height', '100vh');
			   $(this).text('숨기기');
	        } else {
	        	$targetContainer.css('visibility', 'hidden');
	        	$targetContainer.css('transform', 'scaleY(0)');
	        	$targetContainer.css('max-height', '0vh');
	        	$(this).text('펼치기');
	        }
		});
		
		function pushEmpInfoValues(tags, arraies) {
			for (let i=0; i<tags.length; i++) {
				$.each(tags[i], function (index, valueTag) {
					arraies[i].push($(valueTag).val());
				});
			}
			/* 각 push
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
			*/
		}
	</script>
</body>
</html>
