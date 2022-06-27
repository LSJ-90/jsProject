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
		.echart {
			width: 900px; height:600px; margin-bottom: 10px; border: 1px solid black;	
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
	
		<p>그림 1. 연도별 특허 출원 추이</p>
		<div class="echart" id="chartTest1"></div>
		
		<p>그림 2. 출원인 국적별 특허 수</p>
		<div class="echart" id="chartTest2"></div>
		
		<p>그림 3. 출원인 국적별 연도별 특허 수</p>
		<div class="echart" id="chartTest3"></div>
		
		<p>그림 4. 출원인 국적별 활동도 지수</p>
		<div class="echart" id="chartTest4"></div>
		
		<p>그림 5. 출원인 국적별 이끌림 지수</p>
		<div class="echart" id="chartTest5"></div>
		
		<p>그림 6. 출원인 국적별 특허 수준 지수</p>
		<div class="echart" id="chartTest6"></div>
		
		<p>그림 7. 출원인 국적별 특허 수 대비 수준 지수</p>
		<div class="echart" id="chartTest7"></div>
		
		<p>그림 8. 특허 수 대비 평균 패밀리 크기</p>
		<div class="echart" id="chartTest8"></div>
		
		<p>그림 9. 출원인별 특허 수</p>
		<div class="echart" id="chartTest9"></div>
		
		<p>그림 10. 출원인별 연도별 특허 수</p>
		<div class="echart" id="chartTest10"></div>
		
		<p>그림 11. 출원인별 활동도 지수</p>
		<div class="echart" id="chartTest11"></div>
		
		<p>그림 12. 출원인별 이끌림 지수</p>
		<div class="echart" id="chartTest12"></div>
		
		<p>그림 13. 출원인별 특허 수준 지수</p>
		<div class="echart" id="chartTest13"></div>
		
		<p>그림 14. 출원인별 특허 수 대비 수준 지수</p>
		<div class="echart" id="chartTest14"></div>
		
		<p>그림 15. 특허 수 대비 평균 패밀리 크기(출원인별)</p>
		<div class="echart" id="chartTest15"></div>
		
		<p>그림 16. 피인용 수에 따른 특허 수의 분포</p>
		<div class="echart" id="chartTest16"></div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="/resources/js/echarts.min.js"></script>
	<script src="/resources/js/makeEcharts.js"></script>
	<script type="text/javascript">
	
// 		$.post('/projects/misostudy/getChartData',
// 			function(jsonDataList) {
// 				 console.log(jsonDataList);
// 				 console.log(JSON.parse(jsonDataList));
// 			}		
// 		);
	
		$.post('/projects/misostudy/chartBarAndLine',
			function(jsonDataList) {
				// console.log(jsonDataList);
				echart_BarAndLine('chartTest1', jsonDataList[0], '연도', '특허 수(전체)', '특허 수(기준국가)');
			}		
		);
		
		$.post('/projects/misostudy/chartBarHorizontal',
			function(jsonDataList) {
				// console.log(jsonDataList);
				echart_BarHorizontal('chartTest2', jsonDataList[0], '특허 수', '국적');
				echart_BarHorizontal('chartTest4', jsonDataList[1], '활동도 지수', '국적');
				echart_BarHorizontal('chartTest5', jsonDataList[2], '이끌림 지수', '국적');
				echart_BarHorizontal('chartTest6', jsonDataList[3], '수준 지수', '국적');
				echart_BarHorizontal('chartTest9', jsonDataList[4], '특허 수', '출원인');
				echart_BarHorizontal('chartTest11', jsonDataList[5], '활동도 지수', '출원인');
				echart_BarHorizontal('chartTest12', jsonDataList[6], '이끌림 지수', '출원인');
				echart_BarHorizontal('chartTest13', jsonDataList[7], '수준 지수', '출원인');
			}		
		);
		
		$.post('/projects/misostudy/chartLineMultiple',
			function(jsonDataList) {
				// console.log(jsonDataList);
				echart_LineMultiple('chartTest3', jsonDataList[0], '연도', '특허 수');
				echart_LineMultiple('chartTest10', jsonDataList[1], '연도', '특허 수');
			}		
		);
		
		$.post('/projects/misostudy/chartScatterMultiple',
			function(jsonDataList) {
				// console.log(jsonDataList);
				echart_ScatterMultiple('chartTest7', jsonDataList[0], '특허 수', '수준 지수');
				echart_ScatterMultiple('chartTest8', jsonDataList[1], '특허 수', '평균 패밀리 크기');
				echart_ScatterMultiple('chartTest14', jsonDataList[2], '특허 수', '수준 지수');
				echart_ScatterMultiple('chartTest15', jsonDataList[3], '특허 수', '평균 패밀리 크기');
			}		
		);
		
		$.post('/projects/misostudy/chartScatterSingle',
			function(jsonDataList) {
				// console.log(jsonDataList);
				echart_ScatterSingle('chartTest16', jsonDataList[0], '피 인용 수', '특허 수');
			}		
		);
	</script>
	<script src="/resources/js/common.js"></script>
</body>
</html>
