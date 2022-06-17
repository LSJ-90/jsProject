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
</head>
<body>
	<header>
		<%@include file="navbar.jsp" %>
		<%@include file="signInForm.jsp" %>
		<%@include file="signUpForm.jsp" %>
	</header>
	<div class="container">
		<p>그림 1. 연도별 특허 출원 추이</p>
		<div class="echart" id="chartTest1" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 2. 출원인 국적별 특허 수</p>
		<div class="echart" id="chartTest2" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 3(수평범례). 출원인 국적별 연도별 특허 수</p>
		<div class="echart" id="chartTest3" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 3-1(수직범례). 출원인 국적별 연도별 특허 수</p>
		<div class="echart" id="chartTest3_1" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 4. 출원인 국적별 활동도 지수</p>
		<div class="echart" id="chartTest4" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 5. 출원인 국적별 이끌림 지수</p>
		<div class="echart" id="chartTest5" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 6. 출원인 국적별 특허 수준 지수</p>
		<div class="echart" id="chartTest6" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 7. 출원인 국적별 특허 수 대비 수준 지수</p>
		<div class="echart" id="chartTest7" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 8. 특허 수 대비 평균 패밀리 크기</p>
		<div class="echart" id="chartTest8" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 9. 출원인별 특허 수</p>
		<div class="echart" id="chartTest9" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 10. 출원인별 연도별 특허 수</p>
		<div class="echart" id="chartTest10" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 11. 출원인별 활동도 지수</p>
		<div class="echart" id="chartTest11" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 12. 출원인별 이끌림 지수</p>
		<div class="echart" id="chartTest12" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 13. 출원인별 특허 수준 지수</p>
		<div class="echart" id="chartTest13" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 14. 출원인별 특허 수 대비 수준 지수</p>
		<div class="echart" id="chartTest14" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 15. 특허 수 대비 평균 패밀리 크기(출원인별)</p>
		<div class="echart" id="chartTest15" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
		<p>그림 16. 피인용 수에 따른 특허 수의 분포</p>
		<div class="echart" id="chartTest16" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="/resources/js/echarts.min.js"></script>
	<script type="text/javascript">
		
		/*
		 * BarAndLine, horizontalBar,
		 */
// 		function makeEcharts(seriesType, location, jsonData, xAxisCategory, xAxisName, yAxisLeftName, yAxisRightName) {
			
// 			if (seriesType === 'horizontalBar') {
// 				horizontalBarGraph(location, jsonData, xAxisName, yAxisLeftName);
// 			} 
// 			else if (seriesType === 'multifleLine') {
// 				multifleLineGraph(location, jsonData, xAxisName, yAxisLeftName, xAxisCategory);
// 			}
// 		}
		
		/*
		 * 작성자: 이승준
		 * 함수명: horizontalBarGraph(location, jsonData, xAxisName, yAxisName);
		 * 		-locatino: 차트를 위치시킬 id명
		 * 		-jsonData: 차트에 이용될 데이터
		 * 		-xAxisName: x축 이름
		 * 		-yAxisName: y축 이름  
		 * JSON DATA:
		 *  	-결과의 기준이 되는 값 : standardValue
		 *      -기준별 결과 값 : resultValue
		 */
		function horizontalBarGraph(location, jsonData, xAxisName, yAxisName) {
			// 차트위치생성
			var chartLocationInit = echarts.init(document.getElementById(location));
			
			// 데이터 핸들러
			var standardList = new Array();
			var resultList = new Array();
			echarts.util.each(jsonData, function(data) {
				standardList.push(data.standardValue);
				resultList.push(data.resultValue);
			});
			// console.log(standardList);
			// console.log(resultList);
			
			// 차트옵션
			var option = {
				tooltip: {
					trigger : "axis",
					axisPointer : {
						type : "shadow"
					}
				},
				grid: {
					containLabel: true,
					tooltip: {
						axisPointer: {
							type: "line" // none, line, shadow, cross
						}
					}
				},
				xAxis : {
					type: 'value',
					name: xAxisName,
				    nameLocation: 'middle',
				    nameTextStyle: {
				      lineHeight: 60
				    }
				},
				yAxis: {
					data: standardList,
					name: yAxisName,
					nameLocation: 'start',
					inverse: true
				},
				series: [{
					type: 'bar',
					data: resultList,
					label: {
						show: true,
						position: 'right',
						color: 'rgba(0, 0, 0, 1)'
					},
					itemStyle: {
						color: new echarts.graphic.LinearGradient(1, 0.5, 0, 0.5,[
							   {offset : 0, color : '#1472ff'}, 
							   {offset : 0.5, color : '#61a0ff'}, 
							   {offset : 1, color : '#83bff6'}]
						)
					}
				}]
			};

			// 차트 생성
			chartLocationInit.setOption(option);
		}

		/*
		 * 작성자: 이승준
		 * 함수명: BarAndLineGraph(location, jsonData, xAxisName, yAxisLeftName, yAxisRightName);
		 * 		-locatino: 차트를 위치시킬 id명
		 * 		-jsonData: 차트에 이용될 데이터
		 * 		-xAxisName: x축 이름
		 * 		-yAxisLeftName: 왼쪽 y축 이름  
		 * 		-yAxisRightName: 오른쪽 y축 이름  
		 * JSON DATA:
		 *  	-결과의 기준이 되는 값 : standardValue
		 *      -기준별 결과 값 : resultValue
		 *		-참조 할 값: referenceValue
		 */
		function barAndLineGraph(location, jsonData, xAxisName, yAxisLeftName, yAxisRightName) {
			// 차트위치생성
			var chartLocationInit = echarts.init(document.getElementById(location));

			// 데이터 핸들러
			var resultList = new Array();
			var standardList = new Array();
			var referenceValueList = new Array();
			echarts.util.each(jsonData, function(data) {
				standardList.push(data.standardValue);
				resultList.push(data.resultValue);
				referenceValueList.push(data.referenceValue);
			});
// 			console.log("standardList:" + standardList);
// 			console.log("resultList:" + resultList);
// 			console.log("referenceValueList:" + referenceValueList);
			
			// 차트옵션
			option = {
				tooltip: {
					trigger: 'axis',
					axisPointer: {
						type : 'line'
					}
				},
				legend : {
					data: [yAxisLeftName, yAxisRightName]
				},
				xAxis : [{
					type: 'category',
					name: xAxisName,
					nameLocation: 'middle',
					nameTextStyle: {
				      lineHeight: 60
				    },
					data: standardList
				}],
				yAxis : [{
					type : 'value',
					name : yAxisLeftName,
					position : 'left',
					axisLine : {
						show : true
					}
				},
				{
					type : 'value',
					name : yAxisRightName,
					position : 'right',
					axisLine : {
						show : true
					}
				}],
				series : [{
					name : yAxisLeftName,
					type : 'bar',
					data : resultList
				},
				{
					name : yAxisRightName,
					type : 'line',
					yAxisIndex : 1,
					data : referenceValueList
				}]
			};
			// 차트 생성
			chartLocationInit.setOption(option);
		}
		
		/*
		 * 작성자: 이승준
		 * 함수명: multifleLineGraph(location, jsonData, xAxisCategory, xAxisName, yAxisName);
		 * 		-locatino: 차트를 위치시킬 id명
		 * 		-jsonData: 차트에 이용될 데이터
		 *		-xAxisCategory: x축에 사용될 데이터
		 * 		-xAxisName: x축 이름
		 * 		-yAxisName: y축 이름 
		 * JSON DATA
		 *  	-결과의 기준이 되는 값 : standardValue
		 *      -기준별 결과 값 : resultValue[]
		 *	    -x축 카테고리 데이터 : 분석기간 내의 모든 연도 
		 */		
		function multifleLineGraph(location, jsonData, xAxisName, yAxisName, xAxisCategory) {
			// 차트위치생성
			var chartLocationInit = echarts.init(document.getElementById(location));
			
			// 데이터 컨트롤
			var standardList = new Array();
			var resultList = new Array();
			echarts.util.each(jsonData, function(data) {
				standardList.push(data.standardValue);
				resultList.push({
					name: data.standardValue,
					type: 'line',
					data: data.resultValue
				});
			});
 			// console.log(standardList);
 			// console.log(resultList);
 			
//			// 기준데이터의 최대 문장길이 구하기
// 			var standardValueLengthList = new Array();
// 			for (var standardValue of standardList) {
// 				standardValueLengthList.push(standardValue.length);
// 			}
// 			var maxLength = Math.max.apply(null, standardValueLengthList);
// 			console.log(maxLength);
			
			// 차트옵션	
			option = {
				color : makeRandomColor(standardList),
				tooltip : {
					trigger : 'axis',
					order : 'valueDesc',
				},
				legend : {
					type : 'scroll',
					formatter : function (name) {
						var formatName = name;
						
						if (name.length > 15 ) {
							formatName = name.substr(0,15) + '...'
						}
						
						return formatName;
						
//						// 기준데이터의 최대길이만큼 빈공간을 더해주기
// 						var gap = maxLength - name.length;
// 						var space = ' ';
// 						if (name.length <= maxLength) {
// 							console.log(name + ": " + name.length);
// 							for (var i=0; i < gap; i++) {
// 								formatName = formatName + space;
// 							}
// 							console.log(name + ": " + formatName.length);
// 						}

					},
					bottom: '0%',
					width: '80%'
				},
				grid : {
					containLabel : true,
				},
				dataZoom: {
				    start: 0,
				    end: 100,
				    type: "inside"
			    },
				xAxis : {
					type : 'category',
					name : xAxisName,
					nameLocation : 'middle',
					nameTextStyle : {
				      lineHeight : 60
				    },
					data : xAxisCategory
				},
				yAxis : {
					type : 'value',
					name : yAxisName,
					nameLocation : 'middle',
					nameTextStyle : {
					      lineHeight: 80
				    },
				},
				series : resultList
			};
			// 차트 생성
			chartLocationInit.setOption(option);
		}
		 
		 function multifleLineGraph2(location, jsonData, xAxisName, yAxisName, xAxisCategory) {
			// 차트위치생성
			var chartLocationInit = echarts.init(document.getElementById(location));
			
			// 데이터 컨트롤
			var standardList = new Array();
			var resultList = new Array();
			echarts.util.each(jsonData, function(data) {
				standardList.push(data.standardValue);
				resultList.push({
					name: data.standardValue,
					type: 'line',
					data: data.resultValue
				});
			});
 			// console.log(standardList);
 			// console.log(resultList);
			
			// 차트옵션	
			option = {
				color : makeRandomColor(standardList),
				tooltip : {
					trigger : 'axis',
					order : 'valueDesc',
				},
				legend : {
					type: 'scroll',
					formatter: function (name) {
						console.log(standardList.length);
						var formatName = name;
						if (name.length > 20 ) {
							formatName = name.substr(0,20) + '...'
						}
						return formatName;
					},
					orient: 'vertical',
					right: '0%',
					top: '10%'
				},
				grid : {
					containLabel : true,
					width: '75%',
					left: '5%'
				},
				dataZoom: {
				    start: 0,
				    end: 100,
				    type: "inside"
			    },
				xAxis : {
					type : 'time',
					name : xAxisName,
					nameLocation: 'middle',
					nameTextStyle: {
				      lineHeight: 60
				    },
				},
				yAxis : {
					type : 'value',
					name : yAxisName,
					nameLocation: 'middle',
					nameTextStyle: {
					      lineHeight: 80
				    },
				},
				series : resultList
			};
			// 차트 생성
			chartLocationInit.setOption(option);
		} 
		
		/*
		 * 작성자: 이승준
		 * 함수명: scatterGraph(location, jsonData, xAxisName, yAxisName);
		 * 		-locatino: 차트를 위치시킬 id명
		 * 		-jsonData: 차트에 이용될 데이터
		 * 		-xAxisName: x축 이름
		 * 		-yAxisName: y축 이름
		 * JSON DATA:
		 *  	-결과의 기준이 되는 값 : standardValue
		 *      -기준별 결과 값 : resultValue
		 */
		function scatterGraph(location, jsonData, xAxisName, yAxisName) {
			// 차트위치 가져오기
			var chartLocationInit = echarts.init(document.getElementById(location));
				// console.log(jsonData);
			// 데이터 컨트롤
			var standardList = new Array();
			var resultList = new Array();
			
			if (typeof jsonData[0].resultValue == 'undefined') {
				echarts.util.each(jsonData, function(data) {
					standardList.push([data.standardValue,data.patentCnt]);
				});
				resultList.push({
					type: 'scatter',
					data: standardList
				});
			} else {
				echarts.util.each(jsonData, function(data) {
					standardList.push(data.standardValue);
					resultList.push({
						name: data.standardValue,
						type: 'scatter',
						data: [[data.patentCnt, data.resultValue]]
					});
				});
			}
 			// console.log(standardList);
 			// console.log(resultList);
			
			// 차트옵션	
			option = {
				color : makeRandomColor(standardList),
				legend : {
					
				},
				grid : {
					containLabel : true
				},
				tooltip: { 
					formatter: function(params) {
						// console.log(params);
				    	if (params.seriesName === 'series\u00000') {
			        		return (xAxisName + ': ' + params.value[0] + '<br/>' +  yAxisName + ': ' +params.value[1]);
			      		} else {
			      			return (params.seriesName + '<br/>' + xAxisName + ': ' + params.value[0] + '<br/>' +  yAxisName + ': ' +params.value[1]);
			      		}
				 	}
				},
				xAxis : {
					type : 'value',
					name : xAxisName,
					nameLocation : 'middle',
					nameTextStyle : {
				      lineHeight : 60
				    },
				    min : 0,
					splitLine : {
						show : true
					}
				},
				yAxis : {
					type : 'value',
					name : yAxisName,
					nameLocation : 'middle',
					nameTextStyle : {
				      lineHeight : 60
				    },
				    min: 0,
					splitLine : {
						show : true
					}
				},
				series : resultList
			};
			// 차트 생성
			chartLocationInit.setOption(option);
		}
		
		/* TODO: 밝은 색이 나올 경우 새로고침을 하여 원하는 색으로 만들어하는 문제가 있음
		 * 	   
		 * makeRandomColor(data);
		 * 		: data 길이만큼의 랜덤색상을 생성해주는 함수
		 *  	: echarts의 origin color(9가지)로 모든 데이터를 표현할 수 없을 때 사용 권장
		 * 
		 * returnType 
		 *		: Array	  
		 */
		function makeRandomColor(data) {
			var colorBox = ['#5470c6', '#91cc75', '#fac858', '#ee6666', '#73c0de', '#3ba272', '#fc8452', '#9a60b4', '#ea7ccc'];
			for (var i=9; i<data.length; i++) {
				var newColor = '#' + Math.round(Math.random() * 0xffffff).toString(16);
				if (!colorBox.includes(newColor) && newColor.length > 6) {
					// console.log("newColor:" + newColor);
					colorBox[i] = newColor;
				} 
				else {
					// console.log("badColor:" + newColor);
					i--;
				}	
			}
			// console.log(colorBox);
			// console.log(colorBox.length);
			return colorBox;
		}
		
		var exYear = ['2012','2013','2014','2015','2016','2017','2018','2019','2020','2021','2022'];
		
		var ex1 = [
			{"standardValue" : "2012", "resultValue" : 5988, "etcValue" : 5988, "referenceValue" : 418},			
			{"standardValue" : "2013", "resultValue" : 7022, "etcValue" : 13010, "referenceValue" : 502},			
			{"standardValue" : "2014", "resultValue" : 7935, "etcValue" : 20945, "referenceValue" : 595},			
			{"standardValue" : "2015", "resultValue" : 8643, "etcValue" : 29588, "referenceValue" : 836},			
			{"standardValue" : "2016", "resultValue" : 8706, "etcValue" : 38294, "referenceValue" : 922},			
			{"standardValue" : "2017", "resultValue" : 9814, "etcValue" : 48108, "referenceValue" : 1071},			
			{"standardValue" : "2018", "resultValue" : 9796, "etcValue" : 57904, "referenceValue" : 933},			
			{"standardValue" : "2019", "resultValue" : 11530, "etcValue" : 69434, "referenceValue" : 990},			
			{"standardValue" : "2020", "resultValue" : 11984, "etcValue" : 81418, "referenceValue" : 1105},			
			{"standardValue" : "2021", "resultValue" : 11563, "etcValue" : 92981, "referenceValue" : 1027},			
			{"standardValue" : "2022", "resultValue" : 4728, "etcValue" : 97709, "referenceValue" : 430}			
		];
		
		var ex2 = [
			{"standardValue" : "United States of America", "resultValue" : "51582", "etcValue" : "51582", "rank" : "1"},
			{"standardValue" : "Japan", "resultValue" : "9166", "etcValue" : "9166", "rank" : "2"},
			{"standardValue" : "Korea, Republic", "resultValue" : "8829", "etcValue" : "8829", "rank" : "3"},
			{"standardValue" : "China", "resultValue" : "3451", "etcValue" : "3451", "rank" : "4"},
			{"standardValue" : "Taiwan", "resultValue" : "3243", "etcValue" : "3243", "rank" : "5"},
			{"standardValue" : "Germany", "resultValue" : "2968", "etcValue" : "2968", "rank" : "6"},
			{"standardValue" : "United Kingdom", "resultValue" : "1587", "etcValue" : "1587", "rank" : "7"},
			{"standardValue" : "France", "resultValue" : "1557", "etcValue" : "1557", "rank" : "8"},
			{"standardValue" : "Netherlands", "resultValue" : "1476", "etcValue" : "1476", "rank" : "9"},
			{"standardValue" : "Switzerland", "resultValue" : "1246", "etcValue" : "1246", "rank" : "10"}
		];
		
		var ex3 = [
			{"standardValue" : "United States of America", "resultValue" : ["3217", "3806", "4369", "4474", "4481", "5037", "5104", "6139", "6441", "6139", "2375"], "etcValue" : "51582"},
			{"standardValue" : "Japan", "resultValue" : ["822", "865", "852", "964", "874", "952", "830", "923", "935", "823", "326"], "etcValue" : "9166"},
			{"standardValue" : "Korea, Republic", "resultValue" : ["418", "502", "595", "836", "922", "1071", "933", "990", "1105", "1027", "430"], "etcValue" : "8829"},
			{"standardValue" : "China", "resultValue" : ["101", "125", "179", "224", "254", "341", "329", "505", "479", "579", "335"], "etcValue" : "3451"},
			{"standardValue" : "Taiwan", "resultValue" : ["292", "301", "336", "328", "316", "328", "298", "319", "304", "291", "130"], "etcValue" : "3243"},
			{"standardValue" : "Germany", "resultValue" : ["170", "190", "232", "252", "214", "295", "320", "426", "420", "328", "121"], "etcValue" : "2968"},
			{"standardValue" : "United Kingdom", "resultValue" : ["56", "77", "103", "121", "138", "160", "180", "232", "228", "207", "85"], "etcValue" : "1587"},
			{"standardValue" : "France", "resultValue" : ["97", "124", "125", "156", "135", "165", "164", "193", "182", "157", "59"], "etcValue" : "1557"},
			{"standardValue" : "Netherlands", "resultValue" : ["110", "133", "151", "174", "158", "147", "149", "134", "144", "118", "58"], "etcValue" : "1476"},
			{"standardValue" : "Switzerland", "resultValue" : ["67", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland1", "resultValue" : ["2000", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland2", "resultValue" : ["2100", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland3", "resultValue" : ["2200", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland4", "resultValue" : ["2300", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland5", "resultValue" : ["2400", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland6", "resultValue" : ["2500", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland7", "resultValue" : ["2600", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland8", "resultValue" : ["2700", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland9", "resultValue" : ["2700", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland10", "resultValue" : ["2700", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland11", "resultValue" : ["2700", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland12", "resultValue" : ["2700", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland13", "resultValue" : ["2700", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland14", "resultValue" : ["2700", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland15", "resultValue" : ["2700", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland16", "resultValue" : ["2700", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"},
			{"standardValue" : "Switzerland17", "resultValue" : ["2700", "107", "97", "105", "111", "137", "128", "143", "148", "133", "70"], "etcValue" : "1246"}
		];
		
		var ex4 = [
			{"standardValue" : "Korea, Republic", "etcValue1" : "8829", "etcValue2" : "97709", "etcValue3" : "215194", "etcValue4" : "3561291", "resultValue" : "1.495"},
			{"standardValue" : "Netherlands", "etcValue1" : "1476", "etcValue2" : "97709", "etcValue3" : "42733", "etcValue4" : "3561291", "resultValue" : "1.259"},
			{"standardValue" : "United States of America", "etcValue1" : "51582", "etcValue2" : "97709", "etcValue3" : "1614311", "etcValue4" : "3561291", "resultValue" : "1.165"},
			{"standardValue" : "United Kingdom", "etcValue1" : "1587", "etcValue2" : "97709", "etcValue3" : "50401", "etcValue4" : "3561291", "resultValue" : "1.148"},
			{"standardValue" : "Switzerland", "etcValue1" : "1246", "etcValue2" : "97709", "etcValue3" : "46192", "etcValue4" : "3561291", "resultValue" : "0.983"},
			{"standardValue" : "Taiwan", "etcValue1" : "3243", "etcValue2" : "97709", "etcValue3" : "120953", "etcValue4" : "3561291", "resultValue" : "0.977"},
			{"standardValue" : "China", "etcValue1" : "3451", "etcValue2" : "97709", "etcValue3" : "137079", "etcValue4" : "3561291", "resultValue" : "0.918"},
			{"standardValue" : "France", "etcValue1" : "1557", "etcValue2" : "97709", "etcValue3" : "66875", "etcValue4" : "3561291", "resultValue" : "0.849"},
			{"standardValue" : "Germany", "etcValue1" : "2968", "etcValue2" : "97709", "etcValue3" : "166867", "etcValue4" : "3561291", "resultValue" : "0.648"},
			{"standardValue" : "Japan", "etcValue1" : "9166", "etcValue2" : "97709", "etcValue3" : "558648", "etcValue4" : "3561291", "resultValue" : "0.598"}
		];
		
		var ex5 = [
			{"standardValue" : "United States of America", "etcValue1" : "298767", "etcValue2" : "382682", "etcValue3" : "9502405", "etcValue4" : "14450503", "resultValue" : "1.187"},
			{"standardValue" : "Netherlands", "etcValue1" : "3086", "etcValue2" : "382682", "etcValue3" : "139032", "etcValue4" : "14450503", "resultValue" : "0.838"},
			{"standardValue" : "Taiwan", "etcValue1" : "6452", "etcValue2" : "382682", "etcValue3" : "293250", "etcValue4" : "14450503", "resultValue" : "0.831"},
			{"standardValue" : "Korea, Republic", "etcValue1" : "11733", "etcValue2" : "382682", "etcValue3" : "552420", "etcValue4" : "14450503", "resultValue" : "0.802"},
			{"standardValue" : "Switzerland", "etcValue1" : "2990", "etcValue2" : "382682", "etcValue3" : "156344", "etcValue4" : "14450503", "resultValue" : "0.722"},
			{"standardValue" : "United Kingdom", "etcValue1" : "3037", "etcValue2" : "382682", "etcValue3" : "171221", "etcValue4" : "14450503", "resultValue" : "0.67"},
			{"standardValue" : "France", "etcValue1" : "1958", "etcValue2" : "382682", "etcValue3" : "135464", "etcValue4" : "14450503", "resultValue" : "0.546"},
			{"standardValue" : "Japan", "etcValue1" : "14748", "etcValue2" : "382682", "etcValue3" : "1019637", "etcValue4" : "14450503", "resultValue" : "0.546"},
			{"standardValue" : "Germany", "etcValue1" : "5636", "etcValue2" : "382682", "etcValue3" : "398900", "etcValue4" : "14450503", "resultValue" : "0.534"},
			{"standardValue" : "China", "etcValue1" : "2741", "etcValue2" : "382682", "etcValue3" : "236236", "etcValue4" : "14450503", "resultValue" : "0.438"}

		];
		
		var ex6_7 = [
			{"standardValue" : "United States of America", "patentCnt" : "51582", "etcValue" : "5.792", "resultValue" : "1.479"},
			{"standardValue" : "Switzerland", "patentCnt" : "1246", "etcValue" : "2.4", "resultValue" : "0.613"},
			{"standardValue" : "Netherlands", "patentCnt" : "1476", "etcValue" : "2.091", "resultValue" : "0.534"},
			{"standardValue" : "Taiwan", "patentCnt" : "3243", "etcValue" : "1.99", "resultValue" : "0.508"},
			{"standardValue" : "United Kingdom", "patentCnt" : "1587", "etcValue" : "1.914", "resultValue" : "0.489"},
			{"standardValue" : "Germany", "patentCnt" : "2968", "etcValue" : "1.899", "resultValue" : "0.485"},
			{"standardValue" : "Japan", "patentCnt" : "9166", "etcValue" : "1.609", "resultValue" : "0.411"},
			{"standardValue" : "Korea, Republic", "patentCnt" : "8829", "etcValue" : "1.329", "resultValue" : "0.339"},
			{"standardValue" : "France", "patentCnt" : "1557", "etcValue" : "1.258", "resultValue" : "0.321"},
			{"standardValue" : "China", "patentCnt" : "3451", "etcValue" : "0.794", "resultValue" : "0.203"}
		];
		
		var ex8 = [
			{"standardValue" : "Switzerland", "patentCnt" : "1246", "resultValue" : "9.293", "etcValue" : "2.418"},
			{"standardValue" : "Germany", "patentCnt" : "2968", "resultValue" : "6.989", "etcValue" : "1.819"},
			{"standardValue" : "United Kingdom", "patentCnt" : "1587", "resultValue" : "6.885", "etcValue" : "1.792"},
			{"standardValue" : "France", "patentCnt" : "1557", "resultValue" : "5.781", "etcValue" : "1.504"},
			{"standardValue" : "Netherlands", "patentCnt" : "1476", "resultValue" : "5.249", "etcValue" : "1.366"},
			{"standardValue" : "Japan", "patentCnt" : "9166", "resultValue" : "4.26", "etcValue" : "1.109"},
			{"standardValue" : "United States of America", "patentCnt" : "51582", "resultValue" : "3.555", "etcValue" : "0.925"},
			{"standardValue" : "Korea, Republic", "patentCnt" : "8829", "resultValue" : "2.985", "etcValue" : "0.777"},
			{"standardValue" : "China", "patentCnt" : "3451", "resultValue" : "2.887", "etcValue" : "0.751"},
			{"standardValue" : "Taiwan", "patentCnt" : "3243", "resultValue" : "2.477", "etcValue" : "0.645"},
		];
		
		var ex9 = [
			{"standardValue" : "SAMSUNG ELECTRONICS CO LTD", "resultValue" : "2774", "etcValue" : "2.84", "rank" : "1"},
			{"standardValue" : "IBM", "resultValue" : "2043", "etcValue" : "2.09", "rank" : "2"},
			{"standardValue" : "AT & T IP I LP", "resultValue" : "1826", "etcValue" : "1.87", "rank" : "3"},
			{"standardValue" : "INTEL CORP", "resultValue" : "986", "etcValue" : "1.01", "rank" : "4"},
			{"standardValue" : "SAMSUNG DISPLAY CO LTD", "resultValue" : "906", "etcValue" : "0.93", "rank" : "5"},
			{"standardValue" : "UNIV CALIFORNIA", "resultValue" : "866", "etcValue" : "0.89", "rank" : "6"},
			{"standardValue" : "GENENTECH INC", "resultValue" : "638", "etcValue" : "0.65", "rank" : "7"},
			{"standardValue" : "AT & T MOBILITY II LLC", "resultValue" : "603", "etcValue" : "0.62", "rank" : "8"},
			{"standardValue" : "MASSACHUSETTS INST TECHNOLOGY", "resultValue" : "576", "etcValue" : "0.59", "rank" : "9"},
			{"standardValue" : "TAIWAN SEMICONDUCTOR MFG", "resultValue" : "557", "etcValue" : "0.57", "rank" : "10"}
		];
		
		var ex10 = [
			{"standardValue" : "SAMSUNG ELECTRONICS CO LTD", "resultValue" : ["137", "168", "203", "287", "322", "338", "293", "263", "320", "320", "123"], "etcValue" : "2774"},
			{"standardValue" : "IBM", "resultValue" : ["88", "104", "140", "126", "102", "166", "203", "287", "388", "363", "76"], "etcValue" : "2043"},
			{"standardValue" : "AT & T IP I LP", "resultValue" : ["9", "21", "44", "47", "74", "143", "228", "358", "457", "338", "107"], "etcValue" : "1826"},
			{"standardValue" : "INTEL CORP", "resultValue" : ["24", "25", "20", "33", "52", "92", "83", "197", "173", "203", "84"], "etcValue" : "986"},
			{"standardValue" : "SAMSUNG DISPLAY CO LTD", "resultValue" : ["4", "24", "34", "52", "59", "103", "83", "108", "159", "199", "81"], "etcValue" : "906"},
			{"standardValue" : "UNIV CALIFORNIA", "resultValue" : ["63", "81", "98", "89", "68", "89", "70", "75", "104", "97", "32"], "etcValue" : "866"},
			{"standardValue" : "GENENTECH INC", "resultValue" : ["65", "77", "65", "46", "58", "62", "80", "50", "59", "61", "15"], "etcValue" : "638"},
			{"standardValue" : "AT & T MOBILITY II LLC", "resultValue" : ["29", "38", "70", "72", "67", "72", "71", "61", "65", "36", "22"], "etcValue" : "603"},
			{"standardValue" : "MASSACHUSETTS INST TECHNOLOGY", "resultValue" : ["47", "54", "68", "51", "70", "47", "56", "60", "45", "62", "16"], "etcValue" : "576"},
			{"standardValue" : "TAIWAN SEMICONDUCTOR MFG", "resultValue" : ["10", "17", "16", "23", "41", "75", "70", "74", "79", "95", "58"], "etcValue" : "557"},
		];
		
		var ex11 = [
			{"standardValue" : "GENENTECH INC", "patentCnt" : "638", "etcValue" : "97709", "etcValue2" : "1080", "etcValue3" : "3561291", "resultValue" : "21.531"},
			{"standardValue" : "AT & T MOBILITY II LLC", "patentCnt" : "603", "etcValue" : "97709", "etcValue2" : "2224", "etcValue3" : "3561291", "resultValue" : "9.882"},
			{"standardValue" : "UNIV CALIFORNIA", "patentCnt" : "866", "etcValue" : "97709", "etcValue2" : "4391", "etcValue3" : "3561291", "resultValue" : "7.188"},
			{"standardValue" : "MASSACHUSETTS INST TECHNOLOGY", "patentCnt" : "576", "etcValue" : "97709", "etcValue2" : "3103", "etcValue3" : "3561291", "resultValue" : "6.766"},
			{"standardValue" : "AT & T IP I LP", "patentCnt" : "1826", "etcValue" : "97709", "etcValue2" : "10315", "etcValue3" : "3561291", "resultValue" : "6.452"},
			{"standardValue" : "SAMSUNG DISPLAY CO LTD", "patentCnt" : "906", "etcValue" : "97709", "etcValue2" : "12466", "etcValue3" : "3561291", "resultValue" : "2.649"},
			{"standardValue" : "SAMSUNG ELECTRONICS CO LTD", "patentCnt" : "2774", "etcValue" : "97709", "etcValue2" : "67114", "etcValue3" : "3561291", "resultValue" : "1.506"},
			{"standardValue" : "INTEL CORP", "patentCnt" : "986", "etcValue" : "97709", "etcValue2" : "24720", "etcValue3" : "3561291", "resultValue" : "1.454"},
			{"standardValue" : "TAIWAN SEMICONDUCTOR MFG", "patentCnt" : "557", "etcValue" : "97709", "etcValue2" : "19464", "etcValue3" : "3561291", "resultValue" : "1.043"},
			{"standardValue" : "IBM", "patentCnt" : "2043", "etcValue" : "97709", "etcValue2" : "83303", "etcValue3" : "3561291", "resultValue" : "0.894"}
		];
		
		var ex12 = [
			{"standardValue" : "GENENTECH INC", "etcValue1" : "2545", "etcValue2" : "382682", "etcValue3" : "3695", "etcValue4" : "14450503", "resultValue" : "26.009"},
			{"standardValue" : "AT & T IP I LP", "etcValue1" : "48436", "etcValue2" : "382682", "etcValue3" : "77435", "etcValue4" : "14450503", "resultValue" : "23.62"},
			{"standardValue" : "AT & T MOBILITY II LLC", "etcValue1" : "4041", "etcValue2" : "382682", "etcValue3" : "10019", "etcValue4" : "14450503", "resultValue" : "15.23"},
			{"standardValue" : "MASSACHUSETTS INST TECHNOLOGY", "etcValue1" : "5112", "etcValue2" : "382682", "etcValue3" : "19622", "etcValue4" : "14450503", "resultValue" : "9.838"},
			{"standardValue" : "UNIV CALIFORNIA", "etcValue1" : "2921", "etcValue2" : "382682", "etcValue3" : "14437", "etcValue4" : "14450503", "resultValue" : "7.64"},
			{"standardValue" : "SAMSUNG DISPLAY CO LTD", "etcValue1" : "665", "etcValue2" : "382682", "etcValue3" : "16780", "etcValue4" : "14450503", "resultValue" : "1.496"},
			{"standardValue" : "TAIWAN SEMICONDUCTOR MFG", "etcValue1" : "2121", "etcValue2" : "382682", "etcValue3" : "77544", "etcValue4" : "14450503", "resultValue" : "1.033"},
			{"standardValue" : "SAMSUNG ELECTRONICS CO LTD", "etcValue1" : "5981", "etcValue2" : "382682", "etcValue3" : "256156", "etcValue4" : "14450503", "resultValue" : "0.882"},
			{"standardValue" : "INTEL CORP", "etcValue1" : "1207", "etcValue2" : "382682", "etcValue3" : "53634", "etcValue4" : "14450503", "resultValue" : "0.85"},
			{"standardValue" : "IBM", "etcValue1" : "4466", "etcValue2" : "382682", "etcValue3" : "198602", "etcValue4" : "14450503", "resultValue" : "0.849"}
		];
		
		var ex13_14 = [
			{"standardValue" : "AT & T IP I LP", "patentCnt" : 1826, "etcValue" : 26.526, "resultValue" : 6.773},
			{"standardValue" : "MASSACHUSETTS INST TECHNOLOGY", "patentCnt" : 576, "etcValue" : 8.875, "resultValue" : 2.266},
			{"standardValue" : "AT & T MOBILITY II LLC", "patentCnt" : 603, "etcValue" : 6.701, "resultValue" : 1.711},
			{"standardValue" : "GENENTECH INC", "patentCnt" : 638, "etcValue" : 3.989, "resultValue" : 1.018},
			{"standardValue" : "TAIWAN SEMICONDUCTOR MFG", "patentCnt" : 557, "etcValue" : 3.808, "resultValue" : 0.972},
			{"standardValue" : "UNIV CALIFORNIA", "patentCnt" : 866, "etcValue" : 3.373, "resultValue" : 0.861},
			{"standardValue" : "IBM", "patentCnt" : 2043, "etcValue" : 2.186, "resultValue" : 0.558},
			{"standardValue" : "SAMSUNG ELECTRONICS CO LTD", "patentCnt" : 2774, "etcValue" : 2.156, "resultValue" : 0.55},
			{"standardValue" : "INTEL CORP", "patentCnt" : 986, "etcValue" : 1.224, "resultValue" : 0.313},
			{"standardValue" : "SAMSUNG DISPLAY CO LTD", "patentCnt" : 906, "etcValue" : 0.734, "resultValue" : 0.187}
		];
		
		var ex15 = [
			{"standardValue" : "GENENTECH INC", "patentCnt" : 638, "resultValue" : 16.194, "etcValue" : 4.214},
			{"standardValue" : "MASSACHUSETTS INST TECHNOLOGY", "patentCnt" : 576, "resultValue" : 3.332, "etcValue" : 0.867},
			{"standardValue" : "UNIV CALIFORNIA", "patentCnt" : 866, "resultValue" : 3.3, "etcValue" : 0.859},
			{"standardValue" : "SAMSUNG ELECTRONICS CO LTD", "patentCnt" : 2774, "resultValue" : 2.572, "etcValue" : 0.669},
			{"standardValue" : "INTEL CORP", "patentCnt" : 986, "resultValue" : 2.496, "etcValue" : 0.65},
			{"standardValue" : "SAMSUNG DISPLAY CO LTD", "patentCnt" : 906, "resultValue" : 2.446, "etcValue" : 0.637},
			{"standardValue" : "TAIWAN SEMICONDUCTOR MFG", "patentCnt" : 557, "resultValue" : 2.341, "etcValue" : 0.609},
			{"standardValue" : "AT & T IP I LP", "patentCnt" : 1826, "resultValue" : 2.086, "etcValue" : 0.543},
			{"standardValue" : "IBM", "patentCnt" : 2043, "resultValue" : 1.697, "etcValue" : 0.442},
			{"standardValue" : "AT & T MOBILITY II LLC", "patentCnt" : 603, "resultValue" : 1.381, "etcValue" : 0.359}

		];
		
		var ex16 = [
			{"standardValue" : 1198, "patentCnt" : 1},
			{"standardValue" : 1054, "patentCnt" : 1},
			{"standardValue" : 1037, "patentCnt" : 1},
			{"standardValue" : 1015, "patentCnt" : 1},
			{"standardValue" : 952, "patentCnt" : 1},
			{"standardValue" : 941, "patentCnt" : 1},
			{"standardValue" : 938, "patentCnt" : 1},
			{"standardValue" : 902, "patentCnt" : 1},
			{"standardValue" : 857, "patentCnt" : 1},
			{"standardValue" : 856, "patentCnt" : 1},
			{"standardValue" : 846, "patentCnt" : 1},
			{"standardValue" : 840, "patentCnt" : 1},
			{"standardValue" : 763, "patentCnt" : 1},
			{"standardValue" : 753, "patentCnt" : 1},
			{"standardValue" : 746, "patentCnt" : 1},
			{"standardValue" : 744, "patentCnt" : 1},
			{"standardValue" : 744, "patentCnt" : 1},
			{"standardValue" : 729, "patentCnt" : 1},
			{"standardValue" : 726, "patentCnt" : 1},
			{"standardValue" : 724, "patentCnt" : 1},
			{"standardValue" : 721, "patentCnt" : 1},
			{"standardValue" : 719, "patentCnt" : 1},
			{"standardValue" : 713, "patentCnt" : 1},
			{"standardValue" : 705, "patentCnt" : 1},
			{"standardValue" : 684, "patentCnt" : 2},
			{"standardValue" : 667, "patentCnt" : 1},
			{"standardValue" : 659, "patentCnt" : 1},
			{"standardValue" : 639, "patentCnt" : 1},
			{"standardValue" : 605, "patentCnt" : 1},
			{"standardValue" : 5, "patentCnt" : 2104},
			{"standardValue" : 2, "patentCnt" : 7025},
			{"standardValue" : 42, "patentCnt" : 49}
		];
		barAndLineGraph('chartTest1', ex1, '연도', '특허 수(전체)', '특허 수(기준국가)');
		// makeEcharts('horizontalBar', 'chartTest2', ex2, , '', '특허 수', '국적');
		horizontalBarGraph('chartTest2', ex2, '특허 수', '국적');
		multifleLineGraph('chartTest3', ex3, '연도', '특허 수', exYear);
		multifleLineGraph2('chartTest3_1', ex3, '연도', '특허 수', exYear);
		horizontalBarGraph('chartTest4', ex4, '활동도 지수', '국적');
		horizontalBarGraph('chartTest5', ex5, '이끌림 지수', '국적');
		horizontalBarGraph('chartTest6', ex6_7, '수준 지수', '국적');
		scatterGraph('chartTest7', ex6_7, '특허 수', '수준 지수');
		scatterGraph('chartTest8', ex8, '특허 수', '평균 패밀리 크기');
		horizontalBarGraph('chartTest9', ex9, '특허 수', '출원인');
		multifleLineGraph('chartTest10', ex10, '연도', '특허 수', exYear);
		horizontalBarGraph('chartTest11', ex11, '활동도 지수', '출원인');
		horizontalBarGraph('chartTest12', ex12, '이끌림 지수', '출원인');
		horizontalBarGraph('chartTest13', ex13_14, '수준 지수', '출원인');
		scatterGraph('chartTest14', ex13_14, '특허 수', '수준 지수');
		scatterGraph('chartTest15', ex15, '특허 수', '평균 패밀리 크기');
		scatterGraph('chartTest16', ex16, '피 인용 수', '특허 수');
	</script>
	<script src="/resources/js/common.js"></script>
</body>
</html>
