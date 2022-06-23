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
		
		<p>그림 3. 출원인 국적별 연도별 특허 수</p>
		<div class="echart" id="chartTest3" style="width: 100%; height:600px; margin-bottom: 10px;"></div>
		
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
		 * 작성자: 이승준
		 * 함수명: horizontalBarGraph(location, jsonData, xAxisName, yAxisName);
		 * 		-locatino: 차트를 위치시킬 id명
		 * 		-jsonData: 차트에 이용될 데이터
		 * 		-xAxisName: x축 이름
		 * 		-yAxisName: y축 이름  
		 * JSON DATA: {"xAxisValue" : ?, "yAxisValue" : ?, },
		 *  	-xAxisValue: x축 값
		 *      -yAxisValue: y축 값
		 */
		function horizontalBarGraph(location, jsonData, xAxisName, yAxisName) {
			// 차트위치생성
			var chartLocationInit = echarts.init(document.getElementById(location));
			
			// 데이터 핸들러
			var xAxisData = new Array();
			var yAxisData = new Array();
			echarts.util.each(jsonData, function(data) {
				xAxisData.push(data.xAxisValue);
				yAxisData.push(data.yAxisValue);
			});
			// console.log(standardList);
			// console.log(resultList);
			
			// 차트옵션
			var option = {
				tooltip : {
					trigger : "axis",
					axisPointer : {
						type : "shadow",
						shadowStyle : {
							color: 'rgba(0, 0, 0, 0.1)'
						}
					}
				},
				grid: {
					containLabel : true
				},
				xAxis : {
					type: 'value',
					name: xAxisName,
				    nameLocation: 'middle',
				    nameTextStyle: {
				      lineHeight: 60,
				      fontWeight : 'bold',
				      fontSize : 13
				    }
				},
				yAxis: {
					data: yAxisData,
					name: yAxisName,
					nameLocation: 'start',
					nameTextStyle: {
				      fontWeight : 'bold',
				      fontSize : 13
				    },
					inverse: true
				},
				series: [{
					data: xAxisData,
					type: 'bar',
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
						),
						borderRadius : [0,10,10,0]
					}
				}]
			};

			// 차트 생성
			chartLocationInit.setOption(option);
		}

		/*
		 * 작성자: 이승준
		 * 함수명: barAndLineGraph(location, jsonData, xAxisName, yAxisLeftName, yAxisRightName);
		 * 		-locatino: 차트를 위치시킬 id명
		 * 		-jsonData: 차트에 이용될 데이터
		 * 		-xAxisName: x축 이름
		 * 		-yAxisLeftName: 왼쪽 y축 이름  
		 * 		-yAxisRightName: 오른쪽 y축 이름  
		 * JSON DATA: {'xAgixValue' : ?, 'yAgixLeftValue' : ?, 'yAgixRightValue' : ?, }
		 *  	-xAgixValue: x축 값
		 *      -yAgixLeftValue : 왼쪽 y축 값
		 *		-yAgixRightValue: 오른쪽 y축 값
		 */
		function barAndLineGraph(location, jsonData, xAxisName, yAxisLeftName, yAxisRightName) {
			// 차트위치생성
			var chartLocationInit = echarts.init(document.getElementById(location));

			// 데이터 핸들러
			var xAxisData = new Array();
			var yAxisLeftData = new Array();
			var yAxisRightData = new Array();
			echarts.util.each(jsonData, function(data) {
				xAxisData.push(data.xAxisValue);
				yAxisLeftData.push(data.yAxisLeftValue);
				yAxisRightData.push(data.yAxisRightValue);
			});
// 			console.log("standardList:" + standardList);
// 			console.log("resultList:" + resultList);
// 			console.log("referenceValueList:" + referenceValueList);
			
			// 차트옵션
			option = {
				tooltip : {
					trigger : 'axis',
					axisPointer : {
						type : 'shadow',
						shadowStyle : {
							color: 'rgba(0, 0, 0, 0.1)'
						}
					}
				},
				legend : {
					data : [yAxisLeftName, yAxisRightName]
				},
				xAxis : [{
					type: 'category',
					name: xAxisName,
					nameLocation: 'middle',
					nameTextStyle: {
				    	lineHeight: 60,
				    	fontWeight : 'bold',
					    fontSize : 13,
					    
				    },
					data: xAxisData
				}],
				yAxis : [{
					type : 'value',
					name : yAxisLeftName,
					position : 'left',
					axisLine : {
						show : true
					},
					nameTextStyle: {
				    	fontWeight : 'bold',
					    fontSize : 13
				    }
				},
				{
					type : 'value',
					name : yAxisRightName,
					position : 'right',
					axisLine : {
						show : true
					},
					nameTextStyle: {
				    	fontWeight : 'bold',
					    fontSize : 13
				    }
				}],
				series : [{
					name : yAxisLeftName,
					type : 'bar',
					itemStyle: {
						color: new echarts.graphic.LinearGradient(0.5, 0, 0.5, 1,[
							   {offset : 0, color : '#1472ff'}, 
							   {offset : 0.5, color : '#61a0ff'}, 
							   {offset : 1, color : '#83bff6'}]
						),
						borderRadius : [10,10,0,0]
					},
					data : yAxisLeftData,
				},
				{
					name : yAxisRightName,
					type : 'line',
					yAxisIndex : 1,
					itemStyle: {
						color: '#F6BA83'
					},
					data : yAxisRightData,
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
		 *  	-결과의 기준이 되는 값 : xAxisValue
		 *      -기준별 결과 값 : yAxisValue[]
		 *	    -x축 카테고리 데이터 : 분석기간 내의 모든 연도 
		 */		
		function multifleLineGraph(location, jsonData, xAxisName, yAxisName) {
			// 차트위치생성
			var chartLocationInit = echarts.init(document.getElementById(location));
			
			// 데이터 컨트롤
			var xAxisData = new Array();
			var yAxisData = new Array();
			var seriesList = new Array();
			
			xAxisData = jsonData[0].xAxisValues;
			echarts.util.each(jsonData, function(data) {
				console.log(data.yAxisValues);
				yAxisData.push(data.yAxisValues);
			});
			
			echarts.util.each(yAxisData, function(data) {
				seriesList.push({
					name: data.legendValue,
					type: 'line',
					data: data.yAxisValue
				});
			});

//  		console.log(xAxisData);
//  		console.log(yAxisData);
// 			console.log(nameData);
 			
// 			// 기준데이터의 최대 문장길이 구하기
// 			var xAxisValueLengthList = new Array();
// 			for (var xAxisValue of standardList) {
// 				xAxisValueLengthList.push(xAxisValue.length);
// 			}
// 			var maxLength = Math.max.apply(null, xAxisValueLengthList);
// 			console.log(maxLength);
			
			// 차트옵션	
			var option = {
				color : makeRandomColor(seriesList.length),
				tooltip : {
					trigger : 'axis',
					order : 'valueDesc',
				},
				legend : {
					textStyle: {
						overflow: "truncate",
						width: '130'
				    },
				    bottom: '0%',
					width: '80%'
//  					formatter : function (name) {
//  						var formatName = name;
						
// // 						if (name.length > 15 ) {
// // 							formatName = name.substr(0,15) + '...'
// // 						}
						
// 						// 기준데이터의 최대길이만큼 빈공간을 더해주기
// 						var gap = maxLength - name.length;
// 						var space = ' ';
// 						if (name.length <= maxLength) {
// 							console.log(name + ": " + name.length);
// 							for (var i=0; i < gap; i++) {
// 								formatName = formatName + space;
// 							}
// 							console.log(name + ": " + formatName.length);
// 						}
// 						return formatName;
//  					}
				},
				grid : {
					containLabel : true,
					bottom : '25%'
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
					    lineHeight : 40,
					    fontWeight : 'bold',
					    fontSize : 13
				    },
					data : xAxisData
				},
				yAxis : {
					type : 'value',
					name : yAxisName,
					nameLocation : 'middle',
					nameTextStyle : {
						lineHeight: 80,
					    fontWeight : 'bold',
					    fontSize : 13
				    },
				},
				series : seriesList
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
		 *  	-결과의 기준이 되는 값 : xAxisValue
		 *      -기준별 결과 값 : yAxisValue
		 */
		function scatterGraph(location, jsonData, xAxisName, yAxisName) {
			// 차트위치 가져오기
			var chartLocationInit = echarts.init(document.getElementById(location));
				// console.log(jsonData);
			// 데이터 컨트롤
			var seriesData = new Array();
			var seriesList = new Array();
// 			console.log(Object.keys(jsonData[0]).length);
// 			if (typeof jsonData[0].etcValue === 'undefined') {
			if (Object.keys(jsonData[0]).length == 2) {
				echarts.util.each(jsonData, function(data) {
					seriesData.push([data.xAxisValue,data.yAxisValue]);
				});
				seriesList.push({
					type : 'scatter',
					data : seriesData,
					itemStyle : {
						color : '#ee6666'
					}
				});
			} else {
				echarts.util.each(jsonData, function(data) {
					seriesList.push({
						name : data.legendValue,
						type : 'scatter',
						emphasis : {
							focus: 'series'
						},
						data : [[data.xAxisValue, data.yAxisValue]]
					});
				});
			}
 			// console.log(seriesData);
			
			// 차트옵션	
			var option = {
				color : makeRandomColor(seriesData.length),
				legend : {
					textStyle: {
						overflow: "truncate",
						width: '130',
				    },
				    bottom: '0%',
					width: '80%'
				},
				grid : {
					containLabel : true,
					top : '5%',
					bottom : '25%'
				},
				tooltip: {
					trigger : 'item',
					axisPointer : {
						type : 'cross'
					},
					formatter: function(params) {
						// console.log(params.marker);
				    	if (params.seriesName === 'series\u00000') {
				    		return (xAxisName + ': ' + params.value[0] + '<br/>' +  yAxisName + ': ' +params.value[1]);
			      		} else {
			      			return (params.marker + params.seriesName + '<br/>' + xAxisName + ': ' + params.value[0] + '<br/>' +  yAxisName + ': ' +params.value[1]);
			      		}
				 	},
				},
				xAxis : {
					type : 'value',
					name : xAxisName,
					nameLocation : 'middle',
					nameTextStyle : {
				      lineHeight : 60,
				      fontWeight : 'bold',
				      fontSize : 13
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
				      lineHeight : 80,
				      fontWeight : 'bold',
				      fontSize : 13
				    },
				    min: 0,
					splitLine : {
						show : true
					}
				},
				series : seriesList
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
		
		var ex1 = [
			{"xAxisValue" : "2012", "yAxisLeftValue" : 5988, "cumulativePatent" : 5988, "yAxisRightValue" : 418},
			{"xAxisValue" : "2013", "yAxisLeftValue" : 7022, "cumulativePatent" : 13010, "yAxisRightValue" : 502},
			{"xAxisValue" : "2014", "yAxisLeftValue" : 7935, "cumulativePatent" : 20945, "yAxisRightValue" : 595},
			{"xAxisValue" : "2015", "yAxisLeftValue" : 8643, "cumulativePatent" : 29588, "yAxisRightValue" : 836},
			{"xAxisValue" : "2016", "yAxisLeftValue" : 8706, "cumulativePatent" : 38294, "yAxisRightValue" : 922},
			{"xAxisValue" : "2017", "yAxisLeftValue" : 9814, "cumulativePatent" : 48108, "yAxisRightValue" : 1071},
			{"xAxisValue" : "2018", "yAxisLeftValue" : 9796, "cumulativePatent" : 57904, "yAxisRightValue" : 933},
			{"xAxisValue" : "2019", "yAxisLeftValue" : 11530, "cumulativePatent" : 69434, "yAxisRightValue" : 990},
			{"xAxisValue" : "2020", "yAxisLeftValue" : 11984, "cumulativePatent" : 81418, "yAxisRightValue" : 1105},
			{"xAxisValue" : "2021", "yAxisLeftValue" : 11563, "cumulativePatent" : 92981, "yAxisRightValue" : 1027},
			{"xAxisValue" : "2022", "yAxisLeftValue" : 4728, "cumulativePatent" : 97709, "yAxisRightValue" : 430}
		];
		
		var ex2 = [
			{"xAxisValue" : 51582, "yAxisValue" : "United States of America", "importance" : 52.79, "rank" : 1},
			{"xAxisValue" : 9166, "yAxisValue" : "Japan", "importance" : 9.38, "rank" : 2},
			{"xAxisValue" : 8829, "yAxisValue" : "Korea, Republic", "importance" : 9.04, "rank" : 3},
			{"xAxisValue" : 3451, "yAxisValue" : "China", "importance" : 3.53, "rank" : 4},
			{"xAxisValue" : 3243, "yAxisValue" : "Taiwan", "importance" : 3.32, "rank" : 5},
			{"xAxisValue" : 2968, "yAxisValue" : "Germany", "importance" : 3.04, "rank" : 6},
			{"xAxisValue" : 1587, "yAxisValue" : "United Kingdom", "importance" : 1.62, "rank" : 7},
			{"xAxisValue" : 1557, "yAxisValue" : "France", "importance" : 1.59, "rank" : 8},
			{"xAxisValue" : 1476, "yAxisValue" : "Netherlands", "importance" : 1.51, "rank" : 9},
			{"xAxisValue" : 1246, "yAxisValue" : "Switzerland", "importance" : 1.28, "rank" : 10}
		];
		
		var ex3 = [
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'United States of America', 'yAxisValue' : [3217, 3806, 4369, 4474, 4481, 5037, 5104, 6139, 6441, 6139, 2375]}, 'total' : 51582},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'Japan', 'yAxisValue' : [822, 865, 852, 964, 874, 952, 830, 923, 935, 823, 326]}, 'total' : 9166},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'Korea, Republic', 'yAxisValue' : [418, 502, 595, 836, 922, 1071, 933, 990, 1105, 1027, 430]}, 'total' : 8829},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'China', 'yAxisValue' : [101, 125, 179, 224, 254, 341, 329, 505, 479, 579, 335]}, 'total' : 3451},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'Taiwan', 'yAxisValue' : [292, 301, 336, 328, 316, 328, 298, 319, 304, 291, 130]}, 'total' : 3243},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'Germany', 'yAxisValue' : [170, 190, 232, 252, 214, 295, 320, 426, 420, 328, 121]}, 'total' : 2968},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'United Kingdom', 'yAxisValue' : [56, 77, 103, 121, 138, 160, 180, 232, 228, 207, 85]}, 'total' : 1587},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'France', 'yAxisValue' : [97, 124, 125, 156, 135, 165, 164, 193, 182, 157, 59]}, 'total' : 1557},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'Netherlands', 'yAxisValue' : [110, 133, 151, 174, 158, 147, 149, 134, 144, 118, 58]}, 'total' : 1476},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'Switzerland', 'yAxisValue' : [67, 107, 97, 105, 111, 137, 128, 143, 148, 133, 70]}, 'total' : 1246}
		];
		
		var ex4 = [
			{'xAxisValue' : 1.495, 'patent' : 8829, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 215194, 'totalPatent' : 3561291, 'yAxisValue' : 'Korea, Republic'},
			{'xAxisValue' : 1.259, 'patent' : 1476, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 42733, 'totalPatent' : 3561291, 'yAxisValue' : 'Netherlands'},
			{'xAxisValue' : 1.165, 'patent' : 51582, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 1614311, 'totalPatent' : 3561291, 'yAxisValue' : 'United States of America'},
			{'xAxisValue' : 1.148, 'patent' : 1587, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 50401, 'totalPatent' : 3561291, 'yAxisValue' : 'United Kingdom'},
			{'xAxisValue' : 0.983, 'patent' : 1246, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 46192, 'totalPatent' : 3561291, 'yAxisValue' : 'Switzerland'},
			{'xAxisValue' : 0.977, 'patent' : 3243, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 120953, 'totalPatent' : 3561291, 'yAxisValue' : 'Taiwan'},
			{'xAxisValue' : 0.918, 'patent' : 3451, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 137079, 'totalPatent' : 3561291, 'yAxisValue' : 'China'},
			{'xAxisValue' : 0.849, 'patent' : 1557, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 66875, 'totalPatent' : 3561291, 'yAxisValue' : 'France'},
			{'xAxisValue' : 0.648, 'patent' : 2968, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 166867, 'totalPatent' : 3561291, 'yAxisValue' : 'Germany'},
			{'xAxisValue' : 0.598, 'patent' : 9166, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 558648, 'totalPatent' : 3561291, 'yAxisValue' : 'Japan'}
		];
		
		var ex5 = [
			{'xAxisValue' : 1.187, 'citation' : 298767, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  9502405, 'totalCitation' :  14450503, 'yAxisValue' : 'United States of America'},
			{'xAxisValue' : 0.838, 'citation' : 3086, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  139032, 'totalCitation' :  14450503, 'yAxisValue' : 'Netherlands'},
			{'xAxisValue' : 0.831, 'citation' : 6452, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  293250, 'totalCitation' :  14450503, 'yAxisValue' : 'Taiwan'},
			{'xAxisValue' : 0.802, 'citation' : 11733, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  552420, 'totalCitation' :  14450503, 'yAxisValue' : 'Korea, Republic'},
			{'xAxisValue' : 0.722, 'citation' : 2990, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  156344, 'totalCitation' :  14450503, 'yAxisValue' : 'Switzerland'},
			{'xAxisValue' : 0.67, 'citation' : 3037, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  171221, 'totalCitation' :  14450503, 'yAxisValue' : 'United Kingdom'},
			{'xAxisValue' : 0.546, 'citation' : 1958, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  135464, 'totalCitation' :  14450503, 'yAxisValue' : 'France'},
			{'xAxisValue' : 0.546, 'citation' : 14748, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  1019637, 'totalCitation' :  14450503, 'yAxisValue' : 'Japan'},
			{'xAxisValue' : 0.534, 'citation' : 5636, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  398900, 'totalCitation' :  14450503, 'yAxisValue' : 'Germany'},
			{'xAxisValue' : 0.438, 'citation' : 2741, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  236236, 'totalCitation' :  14450503, 'yAxisValue' : 'China'}
		];
		
		var ex6 = [
			{'xAxisValue' : 1.479, 'patent' : 51582, 'citationByPatent' : 5.792, 'yAxisValue' : 'United States of America'},
			{'xAxisValue' : 0.613, 'patent' : 1246, 'citationByPatent' : 2.4, 'yAxisValue' : 'Switzerland'},
			{'xAxisValue' : 0.534, 'patent' : 1476, 'citationByPatent' : 2.091, 'yAxisValue' : 'Netherlands'},
			{'xAxisValue' : 0.508, 'patent' : 3243, 'citationByPatent' : 1.99, 'yAxisValue' : 'Taiwan'},
			{'xAxisValue' : 0.489, 'patent' : 1587, 'citationByPatent' : 1.914, 'yAxisValue' : 'United Kingdom'},
			{'xAxisValue' : 0.485, 'patent' : 2968, 'citationByPatent' : 1.899, 'yAxisValue' : 'Germany'},
			{'xAxisValue' : 0.411, 'patent' : 9166, 'citationByPatent' : 1.609, 'yAxisValue' : 'Japan'},
			{'xAxisValue' : 0.339, 'patent' : 8829, 'citationByPatent' : 1.329, 'yAxisValue' : 'Korea, Republic'},
			{'xAxisValue' : 0.321, 'patent' : 1557, 'citationByPatent' : 1.258, 'yAxisValue' : 'France'},
			{'xAxisValue' : 0.203, 'patent' : 3451, 'citationByPatent' : 0.794, 'yAxisValue' : 'China'}
		];
		
		var ex7 = [
			{'xAxisValue' : 51582, 'legendValue' : 'United States of America', 'citationByPatent' : 5.792, 'yAxisValue' : 1.479},
			{'xAxisValue' : 1246, 'legendValue' : 'Switzerland', 'citationByPatent' : 2.4, 'yAxisValue' : 0.613},
			{'xAxisValue' : 1476, 'legendValue' : 'Netherlands', 'citationByPatent' : 2.091, 'yAxisValue' : 0.534},
			{'xAxisValue' : 3243, 'legendValue' : 'Taiwan', 'citationByPatent' : 1.99, 'yAxisValue' : 0.508},
			{'xAxisValue' : 1587, 'legendValue' : 'United Kingdom', 'citationByPatent' : 1.914, 'yAxisValue' : 0.489},
			{'xAxisValue' : 2968, 'legendValue' : 'Germany', 'citationByPatent' : 1.899, 'yAxisValue' : 0.485},
			{'xAxisValue' : 9166, 'legendValue' : 'Japan', 'citationByPatent' : 1.609, 'yAxisValue' : 0.411},
			{'xAxisValue' : 8829, 'legendValue' : 'Korea, Republic', 'citationByPatent' : 1.329, 'yAxisValue' : 0.339},
			{'xAxisValue' : 1557, 'legendValue' : 'France', 'citationByPatent' : 1.258, 'yAxisValue' : 0.321},
			{'xAxisValue' : 3451, 'legendValue' : 'China', 'citationByPatent' : 0.794, 'yAxisValue' : 0.203}
		];
		
		var ex8 = [
			{'xAxisValue' : 1246, 'legendValue' : 'Switzerland', 'yAxisValue' : 9.293, 'avgFamilySizeBySectorAvg' : 2.418},
			{'xAxisValue' : 2968, 'legendValue' : 'Germany', 'yAxisValue' : 6.989, 'avgFamilySizeBySectorAvg' : 1.819},
			{'xAxisValue' : 1587, 'legendValue' : 'United Kingdom', 'yAxisValue' : 6.885, 'avgFamilySizeBySectorAvg' : 1.792},
			{'xAxisValue' : 1557, 'legendValue' : 'France', 'yAxisValue' : 5.781, 'avgFamilySizeBySectorAvg' : 1.504},
			{'xAxisValue' : 1476, 'legendValue' : 'Netherlands', 'yAxisValue' : 5.249, 'avgFamilySizeBySectorAvg' : 1.366},
			{'xAxisValue' : 9166, 'legendValue' : 'Japan', 'yAxisValue' : 4.26, 'avgFamilySizeBySectorAvg' : 1.109},
			{'xAxisValue' : 51582, 'legendValue' : 'United States of America', 'yAxisValue' : 3.555, 'avgFamilySizeBySectorAvg' : 0.925},
			{'xAxisValue' : 8829, 'legendValue' : 'Korea, Republic', 'yAxisValue' : 2.985, 'avgFamilySizeBySectorAvg' : 0.777},
			{'xAxisValue' : 3451, 'legendValue' : 'China', 'yAxisValue' : 2.887, 'avgFamilySizeBySectorAvg' : 0.751},
			{'xAxisValue' : 3243, 'legendValue' : 'Taiwan', 'yAxisValue' : 2.477, 'avgFamilySizeBySectorAvg' : 0.645}
		];
		
		var ex9 = [
			{'yAxisValue' : 'SAMSUNG ELECTRONICS CO LTD', 'xAxisValue' : '2774', 'importance' : 2.84, 'rank' : 1},
			{'yAxisValue' : 'IBM', 'xAxisValue' : '2043', 'importance' : 2.09, 'rank' : 2},
			{'yAxisValue' : 'AT & T IP I LP', 'xAxisValue' : '1826', 'importance' : 1.87, 'rank' : 3},
			{'yAxisValue' : 'INTEL CORP', 'xAxisValue' : '986', 'importance' : 1.01, 'rank' : 4},
			{'yAxisValue' : 'SAMSUNG DISPLAY CO LTD', 'xAxisValue' : '906', 'importance' : 0.93, 'rank' : 5},
			{'yAxisValue' : 'UNIV CALIFORNIA', 'xAxisValue' : '866', 'importance' : 0.89, 'rank' : 6},
			{'yAxisValue' : 'GENENTECH INC', 'xAxisValue' : '638', 'importance' : 0.65, 'rank' : 7},
			{'yAxisValue' : 'AT & T MOBILITY II LLC', 'xAxisValue' : '603', 'importance' : 0.62, 'rank' : 8},
			{'yAxisValue' : 'MASSACHUSETTS INST TECHNOLOGY', 'xAxisValue' : '576', 'importance' : 0.59, 'rank' : 9},
			{'yAxisValue' : 'TAIWAN SEMICONDUCTOR MFG', 'xAxisValue' : '557', 'importance' : 0.57, 'rank' : 10}
		];
		
		var ex10 = [
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'SAMSUNG ELECTRONICS CO LTD', 'yAxisValue' : [137, 168, 203, 287, 322, 338, 293, 263, 320, 320, 123]}, 'total' : 2774},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'IBM', 'yAxisValue' : [88, 104, 140, 126, 102, 166, 203, 287, 388, 363, 76]}, 'total' : 2043},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'AT & T IP I LP', 'yAxisValue' : [9, 21, 44, 47, 74, 143, 228, 358, 457, 338, 107]}, 'total' : 1826},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'INTEL CORP', 'yAxisValue' : [24, 25, 20, 33, 52, 92, 83, 197, 173, 203, 84]}, 'total' : 986},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'SAMSUNG DISPLAY CO LTD', 'yAxisValue' : [4, 24, 34, 52, 59, 103, 83, 108, 159, 199, 81]}, 'total' : 906},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'UNIV CALIFORNIA', 'yAxisValue' : [63, 81, 98, 89, 68, 89, 70, 75, 104, 97, 32]}, 'total' : 866},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'GENENTECH INC', 'yAxisValue' : [65, 77, 65, 46, 58, 62, 80, 50, 59, 61, 15]}, 'total' : 638},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'AT & T MOBILITY II LLC', 'yAxisValue' : [29, 38, 70, 72, 67, 72, 71, 61, 65, 36, 22]}, 'total' : 603},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'MASSACHUSETTS INST TECHNOLOGY', 'yAxisValue' : [47, 54, 68, 51, 70, 47, 56, 60, 45, 62, 16]}, 'total' : 576},
			{'xAxisValues' : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], 'yAxisValues' : {'legendValue' : 'TAIWAN SEMICONDUCTOR MFG', 'yAxisValue' : [9, 17, 16, 23, 41, 75, 70, 74, 79, 95, 58]}, 'total' : 557}
		];
		
		var ex11 = [
			{'xAxisValue' : 21.531, 'patent' : 638, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 1080, 'totalPatent' : 3561291, 'yAxisValue' : 'GENENTECH INC'},
			{'xAxisValue' : 9.882, 'patent' : 603, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 2224, 'totalPatent' : 3561291, 'yAxisValue' : 'AT & T MOBILITY II LLC'},
			{'xAxisValue' : 7.188, 'patent' : 866, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 4391, 'totalPatent' : 3561291, 'yAxisValue' : 'UNIV CALIFORNIA'},
			{'xAxisValue' : 6.766, 'patent' : 576, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 3103, 'totalPatent' : 3561291, 'yAxisValue' : 'MASSACHUSETTS INST TECHNOLOGY'},
			{'xAxisValue' : 6.452, 'patent' : 1826, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 10315, 'totalPatent' : 3561291, 'yAxisValue' : 'AT & T IP I LP'},
			{'xAxisValue' : 2.649, 'patent' : 906, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 12466, 'totalPatent' : 3561291, 'yAxisValue' : 'SAMSUNG DISPLAY CO LTD'},
			{'xAxisValue' : 1.506, 'patent' : 2774, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 67114, 'totalPatent' : 3561291, 'yAxisValue' : 'SAMSUNG ELECTRONICS CO LTD'},
			{'xAxisValue' : 1.454, 'patent' : 986, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 24720, 'totalPatent' : 3561291, 'yAxisValue' : 'INTEL CORP'},
			{'xAxisValue' : 1.043, 'patent' : 557, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 19464, 'totalPatent' : 3561291, 'yAxisValue' : 'TAIWAN SEMICONDUCTOR MFG'},
			{'xAxisValue' : 0.894, 'patent' : 2043, 'totalPatentByTechnologyArea' : 97709, 'totalPatentByCountry' : 83303, 'totalPatent' : 3561291, 'yAxisValue' : 'IBM'}
		];
		
		var ex12 = [
			{'xAxisValue' : 26.009, 'citation' : 2545, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  3695, 'totalCitation' :  14450503, 'yAxisValue' : 'GENENTECH INC'},
			{'xAxisValue' : 23.62, 'citation' : 48436, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  77435, 'totalCitation' :  14450503, 'yAxisValue' : 'AT & T IP I LP'},
			{'xAxisValue' : 15.23, 'citation' : 4041, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  10019, 'totalCitation' :  14450503, 'yAxisValue' : 'AT & T MOBILITY II LLC'},
			{'xAxisValue' : 9.838, 'citation' : 5112, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  19622, 'totalCitation' :  14450503, 'yAxisValue' : 'MASSACHUSETTS INST TECHNOLOGY'},
			{'xAxisValue' : 7.64, 'citation' : 2921, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  14437, 'totalCitation' :  14450503, 'yAxisValue' : 'UNIV CALIFORNIA'},
			{'xAxisValue' : 1.496, 'citation' : 665, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  16780, 'totalCitation' :  14450503, 'yAxisValue' : 'SAMSUNG DISPLAY CO LTD'},
			{'xAxisValue' : 1.033, 'citation' : 2121, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  77544, 'totalCitation' :  14450503, 'yAxisValue' : 'TAIWAN SEMICONDUCTOR MFG'},
			{'xAxisValue' : 0.882, 'citation' : 5981, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  256156, 'totalCitation' :  14450503, 'yAxisValue' : 'SAMSUNG ELECTRONICS CO LTD'},
			{'xAxisValue' : 0.85, 'citation' : 1207, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  53634, 'totalCitation' :  14450503, 'yAxisValue' : 'INTEL CORP'},
			{'xAxisValue' : 0.849, 'citation' : 4466, 'citationByTechnicalArea' : 382682, 'totalCitationByCountry' :  198602, 'totalCitation' :  14450503, 'yAxisValue' : 'IBM'}
		];
		
		var ex13 = [
			{'xAxisValue' : 6.773, 'patent' : 1826, 'citationByPatent' : 26.526, 'yAxisValue' : 'AT & T IP I LP'},
			{'xAxisValue' : 2.266, 'patent' : 576, 'citationByPatent' : 8.875, 'yAxisValue' : 'MASSACHUSETTS INST TECHNOLOGY'},
			{'xAxisValue' : 1.711, 'patent' : 603, 'citationByPatent' : 6.701, 'yAxisValue' : 'AT & T MOBILITY II LLC'},
			{'xAxisValue' : 1.018, 'patent' : 638, 'citationByPatent' : 3.989, 'yAxisValue' : 'GENENTECH INC'},
			{'xAxisValue' : 0.972, 'patent' : 557, 'citationByPatent' : 3.808, 'yAxisValue' : 'TAIWAN SEMICONDUCTOR MFG'},
			{'xAxisValue' : 0.861, 'patent' : 866, 'citationByPatent' : 3.373, 'yAxisValue' : 'UNIV CALIFORNIA'},
			{'xAxisValue' : 0.558, 'patent' : 2043, 'citationByPatent' : 2.186, 'yAxisValue' : 'IBM'},
			{'xAxisValue' : 0.55, 'patent' : 2774, 'citationByPatent' : 2.156, 'yAxisValue' : 'SAMSUNG ELECTRONICS CO LTD'},
			{'xAxisValue' : 0.313, 'patent' : 986, 'citationByPatent' : 1.224, 'yAxisValue' : 'INTEL CORP'},
			{'xAxisValue' : 0.187, 'patent' : 906, 'citationByPatent' : 0.734, 'yAxisValue' : 'SAMSUNG DISPLAY CO LTD'}
		];
		
		var ex14 = [
			{'xAxisValue' : 1826, 'legendValue' : 'AT & T IP I LP', 'citationByPatent' : 26.526, 'yAxisValue' : 6.773},
			{'xAxisValue' : 576, 'legendValue' : 'MASSACHUSETTS INST TECHNOLOGY', 'citationByPatent' : 8.875, 'yAxisValue' : 2.266},
			{'xAxisValue' : 603, 'legendValue' : 'AT & T MOBILITY II LLC', 'citationByPatent' : 6.701, 'yAxisValue' : 1.711},
			{'xAxisValue' : 638, 'legendValue' : 'GENENTECH INC', 'citationByPatent' : 3.989, 'yAxisValue' : 1.018},
			{'xAxisValue' : 557, 'legendValue' : 'TAIWAN SEMICONDUCTOR MFG', 'citationByPatent' : 3.808, 'yAxisValue' : 0.972},
			{'xAxisValue' : 866, 'legendValue' : 'UNIV CALIFORNIA', 'citationByPatent' : 3.373, 'yAxisValue' : 0.861},
			{'xAxisValue' : 2043, 'legendValue' : 'IBM', 'citationByPatent' : 2.186, 'yAxisValue' : 0.558},
			{'xAxisValue' : 2774, 'legendValue' : 'SAMSUNG ELECTRONICS CO LTD', 'citationByPatent' : 2.156, 'yAxisValue' : 0.55},
			{'xAxisValue' : 986, 'legendValue' : 'INTEL CORP', 'citationByPatent' : 1.224, 'yAxisValue' : 0.313},
			{'xAxisValue' : 906, 'legendValue' : 'SAMSUNG DISPLAY CO LTD', 'citationByPatent' : 0.734, 'yAxisValue' : 0.187}
		];
		
		var ex15 = [
			{'xAxisValue' : 638, 'legendValue' : 'GENENTECH INC', 'yAxisValue' : 16.194, 'avgFamilySizeBySectorAvg' : 4.214},
			{'xAxisValue' : 576, 'legendValue' : 'MASSACHUSETTS INST TECHNOLOGY', 'yAxisValue' : 3.332, 'avgFamilySizeBySectorAvg' : 0.867},
			{'xAxisValue' : 866, 'legendValue' : 'UNIV CALIFORNIA', 'yAxisValue' : 3.3, 'avgFamilySizeBySectorAvg' : 0.859},
			{'xAxisValue' : 2774, 'legendValue' : 'SAMSUNG ELECTRONICS CO LTD', 'yAxisValue' : 2.572, 'avgFamilySizeBySectorAvg' : 0.669},
			{'xAxisValue' : 986, 'legendValue' : 'INTEL CORP', 'yAxisValue' : 2.496, 'avgFamilySizeBySectorAvg' : 0.65},
			{'xAxisValue' : 906, 'legendValue' : 'SAMSUNG DISPLAY CO LTD', 'yAxisValue' : 2.446, 'avgFamilySizeBySectorAvg' : 0.637},
			{'xAxisValue' : 557, 'legendValue' : 'TAIWAN SEMICONDUCTOR MFG', 'yAxisValue' : 2.341, 'avgFamilySizeBySectorAvg' : 0.609},
			{'xAxisValue' : 1826, 'legendValue' : 'AT & T IP I LP', 'yAxisValue' : 2.086, 'avgFamilySizeBySectorAvg' : 0.543},
			{'xAxisValue' : 2043, 'legendValue' : 'IBM', 'yAxisValue' : 1.697, 'avgFamilySizeBySectorAvg' : 0.442},
			{'xAxisValue' : 603, 'legendValue' : 'AT & T MOBILITY II LLC', 'yAxisValue' : 1.381, 'avgFamilySizeBySectorAvg' : 0.359}
		];
		
		var ex16 = [
			{'xAxisValue' : 1198, 'yAxisValue' : 1},
			{'xAxisValue' : 1054, 'yAxisValue' : 1},
			{'xAxisValue' : 1037, 'yAxisValue' : 1},
			{'xAxisValue' : 1015, 'yAxisValue' : 1},
			{'xAxisValue' : 952, 'yAxisValue' : 1},
			{'xAxisValue' : 941, 'yAxisValue' : 1},
			{'xAxisValue' : 938, 'yAxisValue' : 1},
			{'xAxisValue' : 902, 'yAxisValue' : 1},
			{'xAxisValue' : 857, 'yAxisValue' : 1},
			{'xAxisValue' : 856, 'yAxisValue' : 1},
			{'xAxisValue' : 846, 'yAxisValue' : 1},
			{'xAxisValue' : 840, 'yAxisValue' : 1},
			{'xAxisValue' : 763, 'yAxisValue' : 1},
			{'xAxisValue' : 753, 'yAxisValue' : 1},
			{'xAxisValue' : 746, 'yAxisValue' : 1},
			{'xAxisValue' : 744, 'yAxisValue' : 1},
			{'xAxisValue' : 744, 'yAxisValue' : 1},
			{'xAxisValue' : 729, 'yAxisValue' : 1},
			{'xAxisValue' : 726, 'yAxisValue' : 1},
			{'xAxisValue' : 724, 'yAxisValue' : 1},
			{'xAxisValue' : 721, 'yAxisValue' : 1},
			{'xAxisValue' : 719, 'yAxisValue' : 1},
			{'xAxisValue' : 713, 'yAxisValue' : 1},
			{'xAxisValue' : 705, 'yAxisValue' : 1},
			{'xAxisValue' : 684, 'yAxisValue' : 2},
			{'xAxisValue' : 667, 'yAxisValue' : 1},
			{'xAxisValue' : 659, 'yAxisValue' : 1},
			{'xAxisValue' : 639, 'yAxisValue' : 1},
			{'xAxisValue' : 605, 'yAxisValue' : 1},
			{'xAxisValue' : 5, 'yAxisValue' : 2104},
			{'xAxisValue' : 2, 'yAxisValue' : 7025},
			{'xAxisValue' : 42, 'yAxisValue' : 49},
			{'xAxisValue' : 1, 'yAxisValue' : 14206}
		];
		
		barAndLineGraph('chartTest1', ex1, '연도', '특허 수(전체)', '특허 수(기준국가)');
		horizontalBarGraph('chartTest2', ex2, '특허 수', '국적');
		multifleLineGraph('chartTest3', ex3, '연도', '특허 수');
		horizontalBarGraph('chartTest4', ex4, '활동도 지수', '국적');
		horizontalBarGraph('chartTest5', ex5, '이끌림 지수', '국적');
		horizontalBarGraph('chartTest6', ex6, '수준 지수', '국적');
		scatterGraph('chartTest7', ex7, '특허 수', '수준 지수');
		scatterGraph('chartTest8', ex8, '특허 수', '평균 패밀리 크기');
		horizontalBarGraph('chartTest9', ex9, '특허 수', '출원인');
		multifleLineGraph('chartTest10', ex10, '연도', '특허 수');
		horizontalBarGraph('chartTest11', ex11, '활동도 지수', '출원인');
		horizontalBarGraph('chartTest12', ex12, '이끌림 지수', '출원인');
		horizontalBarGraph('chartTest13', ex13, '수준 지수', '출원인');
		scatterGraph('chartTest14', ex14, '특허 수', '수준 지수');
		scatterGraph('chartTest15', ex15, '특허 수', '평균 패밀리 크기');
		scatterGraph('chartTest16', ex16, '피 인용 수', '특허 수');
	</script>
	<script src="/resources/js/common.js"></script>
</body>
</html>
