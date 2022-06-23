/*
 * 작성자: 이승준
 * 함수명: chart_barHorizontal(location, jsonData, xName, yName);
 * 		-locatino: 차트를 위치시킬 id명
 * 		-jsonData: 차트에 이용될 데이터
 * 		-xName: x축 이름
 * 		-yName: y축 이름  
 */
function chart_barHorizontal(location, jsonData, xName, yName) {
	// 차트위치생성
	var chartLocationInit = echarts.init(document.getElementById(location));
	
	// 데이터 핸들러
	var xAxisData = new Array();
	var yAxisData = new Array();
	echarts.util.each(jsonData, function(data) {
		xAxisData.push(data.xValue);
		yAxisData.push(data.yValue);
	});
	// console.log("xAxisData:" + xAxisData);
	// console.log("yAxisData:" + yAxisData);
	
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
			name: xName,
		    nameLocation: 'middle',
		    nameTextStyle: {
		      lineHeight: 60,
		      fontWeight : 'bold',
		      fontSize : 13
		    }
		},
		yAxis: {
			data: yAxisData,
			name: yName,
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
 * 함수명: chart_barAndLine(location, jsonData, xName, yNameLeft, yNameRight);
 * 		-locatino: 차트를 위치시킬 id명
 * 		-jsonData: 차트에 이용될 데이터
 * 		-xName: x축 이름
 * 		-yNameLeft: 왼쪽 y축 이름  
 * 		-yNameRight: 오른쪽 y축 이름  
 */
function chart_barAndLine(location, jsonData, xName, yNameLeft, yNameRight) {
	// 차트위치생성
	var chartLocationInit = echarts.init(document.getElementById(location));

	// 데이터 핸들러
	var xAxisData = new Array();
	var yAxisLeftData = new Array();
	var yAxisRightData = new Array();
	echarts.util.each(jsonData, function(data) {
		xAxisData.push(data.xValue);
		yAxisLeftData.push(data.yValueLeft);
		yAxisRightData.push(data.yValueRight);
	});
	// console.log("xAxisData:" + xAxisData);
	// console.log("yAxisLeftData:" + yAxisLeftData);
	// console.log("yAxisRightData:" + yAxisRightData);
	
	// 차트옵션
	var option = {
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
			data : [yNameLeft, yNameRight]
		},
		xAxis : [{
			type : 'category',
			name : xName,
			nameLocation : 'middle',
			nameTextStyle : {
		    	lineHeight : 60,
		    	fontWeight : 'bold',
			    fontSize : 13,
			    
		    },
			data : xAxisData
		}],
		yAxis : [{
			type : 'value',
			name : yNameLeft,
			position : 'left',
			axisLine : {
				show : true
			},
			nameTextStyle : {
		    	fontWeight : 'bold',
			    fontSize : 13
		    }
		},
		{
			type : 'value',
			name : yNameRight,
			position : 'right',
			axisLine : {
				show : true
			},
			nameTextStyle : {
		    	fontWeight : 'bold',
			    fontSize : 13
		    }
		}],
		series : [{
			name : yNameLeft,
			type : 'bar',
			itemStyle : {
				color : new echarts.graphic.LinearGradient(0.5, 0, 0.5, 1,[
					{offset : 0, color : '#1472ff'}, 
					{offset : 0.5, color : '#61a0ff'}, 
					{offset : 1, color : '#83bff6'}]
				),
				borderRadius : [10,10,0,0]
			},
			data : yAxisLeftData,
		},
		{
			name : yNameRight,
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
 * 함수명: chart_lineMultiple(location, jsonData, xName, yName);
 * 		-locatino: 차트를 위치시킬 id명
 * 		-jsonData: 차트에 이용될 데이터
 * 		-xName: x축 이름
 * 		-yName: y축 이름 
 */		
function chart_lineMultiple(location, jsonData, xName, yName) {
	// 차트위치생성
	var chartLocationInit = echarts.init(document.getElementById(location));
	
	// 데이터 컨트롤
	var xAxisData = new Array();
	var yAxisData = new Array();
	var seriesList = new Array();
	
	xAxisData = jsonData[0].xValues;
	
	echarts.util.each(jsonData, function(data) {
		yAxisData.push(data.yValue);
	});
	
	echarts.util.each(yAxisData, function(data) {
		seriesList.push({
			name: data.seriesName,
			type: 'line',
			data: data.seriesValues
		});
	});
	// console.log(xAxisData);
	// console.log(yAxisData);
	
	// 차트옵션	
	var option = {
		color : makeRandomColor(seriesList.length),
		tooltip : {
			trigger : 'axis',
			order : 'valueDesc',
			position: function (point, params, dom, rect, size) {
	          var obj = {
	            top: 10
	          };
	          obj[['left', 'right'][+(point[0] < size.viewSize[0] / 2)]] = 30;
	          return obj;
	        }
		},
		legend : {
			textStyle: {
				overflow: "truncate",
				width: '130'
		    },
		    bottom: '0%',
			width: '80%'
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
			name : xName,
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
			name : yName,
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
 * 함수명: chart_scatterSingle(location, jsonData, xName, yName);
 * 		-locatino: 차트를 위치시킬 id명
 * 		-jsonData: 차트에 이용될 데이터
 * 		-xName: x축 이름
 * 		-yName: y축 이름
 */
function chart_scatterSingle(location, jsonData, xName, yName) {
	// 차트위치 가져오기
	var chartLocationInit = echarts.init(document.getElementById(location));
	
	// 데이터 컨트롤
	var seriesData = new Array();
	echarts.util.each(jsonData, function(data) {
		seriesData.push([data.xValue,data.yValue]);
	});
	// console.log("seriesData: " + seriesData);
	
	// 차트옵션	
	var option = {
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
		    	return (xName + ': ' + params.value[0] + '<br/>' +  yName + ': ' +params.value[1]);
		 	},
		},
		xAxis : {
			type : 'value',
			name : xName,
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
			name : yName,
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
		series : {
			type : 'scatter',
			data : seriesData,
			itemStyle : {
				color : '#ee6666'
			}
		}
	};
	// 차트 생성
	chartLocationInit.setOption(option);
}


/*
 * 작성자: 이승준
 * 함수명: chart_scatterMultiple(location, jsonData, xName, yName);
 * 		-locatino: 차트를 위치시킬 id명
 * 		-jsonData: 차트에 이용될 데이터
 * 		-xName: x축 이름
 * 		-yName: y축 이름
 */
function chart_scatterMultiple(location, jsonData, xName, yName) {
	// 차트위치 가져오기
	var chartLocationInit = echarts.init(document.getElementById(location));
	
	// 데이터 컨트롤
	var seriesList = new Array();
	echarts.util.each(jsonData, function(data) {
		seriesList.push({
			name : data.seriesName,
			type : 'scatter',
			emphasis : {
				focus: 'series'
			},
			data : [[data.xValue, data.yValue]]
		});
	});
	// console.log(seriesList.length);
	
	// 차트옵션	
	var option = {
		color : makeRandomColor(seriesList.length),
		legend : {
			textStyle: {
				overflow: "truncate",
				width: '130',
		    },
		    bottom: '0%',
			width: '80%',
			tooltip: {
				trigger : 'item'
			}
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
	      		return (params.marker + params.seriesName + '<br/>' + xName + ': ' + params.value[0] + '<br/>' +  yName + ': ' +params.value[1]);
		 	},
		},
		xAxis : {
			type : 'value',
			name : xName,
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
			name : yName,
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
 * makeRandomColor(dataLength);
 * 		: data 길이만큼의 랜덤색상을 생성해주는 함수
 *  	: echarts의 origin color(9가지)로 모든 데이터를 표현할 수 없을 때 사용 권장
 * 
 * returnType 
 *		: Array	  
 */
function makeRandomColor(dataLength) {
	var colorBox = ['#5470c6', '#91cc75', '#fac858', '#ee6666', '#73c0de', '#3ba272', '#fc8452', '#9a60b4', '#ea7ccc'];
	for (var i=9; i<dataLength; i++) {
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