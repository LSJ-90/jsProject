/*
 * makeEcharts.js: 알맞는 데이터를 매칭시키면 해당하는 그래프를 그릴 수 있는 함수의 모음 
 * 작성자: 이승준
 * 제작기간: 2022.06.13 ~
 */

/*
 * 함수명: echart_BarHorizontal(location, jsonData, xName, yName): 수평 바 그래프를 그리는 함수
 * 		-locatino: 차트를 위치시킬 id명
 * 		-jsonData: 차트에 이용될 데이터
 * 		-xName: x축 이름
 * 		-yName: y축 이름  
 */
function echart_BarHorizontal(location, jsonData, xName, yName) {
	/*
	 * 차트 인스턴스 초기화
	 * echarts.init()의 인자는 차트가 그려질 위치의 DOM 요소
	 */
	var chartLocationInit = echarts.init(document.getElementById(location));
	
	// 데이터 핸들러
	var xAxisData = new Array();
	var yAxisData = new Array();
	var yValueFormat;
	echarts.util.each(jsonData, function(data) {
		xAxisData.push(data.xValue);
		
		if (data.yValue.length > 25 ) { 
			data.yValue = data.yValue.substr(0,25) + '...';
		}
		yAxisData.push(data.yValue);
	});
	// console.log(xAxisData);
	// console.log(yAxisData);
	
	// 차트옵션
	var option = {
		toolbox: {
			itemSize : 25,
		    feature: {
		    	restore : {},
		    	saveAsImage: {
		    		name : 'testImage'
		    	}
		    },
		    showTitle: false,
		    show: true
		},
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
			containLabel : true,
			top : '8%'
		},
		dataZoom: {
		    type : "inside",
		    yAxisIndex : [0],
		    minSpan : 10
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
			type : 'category',
			data : yAxisData,
			name : yName,
			nameLocation : 'start',
			nameTextStyle : {
		      fontWeight : 'bold',
		      fontSize : 13
		    },
			inverse : true,
		},
		series : [{
			data : xAxisData,
			type : 'bar',
			label : {
				show : true,
				position : 'right',
				color : 'rgba(0, 0, 0, 1)',
				formatter : function(params) {
					return echart_UtilMakePattern(params.data);
				}
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
 * 함수명: echart_BarAndLine(location, jsonData, xName, yNameLeft, yNameRight): 바, 라인 두 가지의 복합 그래프를 그리는 함수
 * 		-locatino: 차트를 위치시킬 id명
 * 		-jsonData: 차트에 이용될 데이터
 * 		-xName: x축 이름
 * 		-yNameLeft: 왼쪽 y축 이름  
 * 		-yNameRight: 오른쪽 y축 이름  
 */
function echart_BarAndLine(location, jsonData, xName, yNameLeft, yNameRight) {
	
	/*
	 * 차트 인스턴스 초기화 
	 * echarts.init()의 인자는 차트가 그려질 위치의 DOM 요소
	 */
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
	// console.log(xAxisData);
	// console.log(yAxisLeftData);
	// console.log(yAxisRightData);
	
	// 차트옵션
	var option = {
		toolbox: {
			itemSize : 25,
		    feature: {
		    	restore : {},
		    	saveAsImage: {
		    		name : 'testImage'
		    	}
		    },
		    showTitle: false,
		    show: true
		},
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
			data : [yNameLeft, yNameRight],
			top : '5%'
		},
		grid: {
			containLabel : true,
			top : '15%',
			bottom : '10%'
		},
		dataZoom: [{
			id : 'dataZoomXLeft',
	        type : 'inside',
	        xAxisIndex : [0],
	        minSpan : 10,
	        filterMode : 'empty'
	    },
	    {
            id : 'dataZoomXRight',
            type : 'inside',
            xAxisIndex : [0],
            filterMode : 'empty'
	    }],
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
 * 함수명: echart_LineMultiple(location, jsonData, xName, yName): 여러 라인그래프를 그리는 함수
 * 		-locatino: 차트를 위치시킬 id명
 * 		-jsonData: 차트에 이용될 데이터
 * 		-xName: x축 이름
 * 		-yName: y축 이름 
 */		
function echart_LineMultiple(location, jsonData, xName, yName) {
	/*
	 * 차트 인스턴스 초기화 
	 * echarts.init()의 인자는 차트가 그려질 위치의 DOM 요소
	 */
	var chartLocationInit = echarts.init(document.getElementById(location));
	
	// 데이터 컨트롤
	var seriesList = new Array();
	echarts.util.each(jsonData.yValues, function(data) {
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
		color : echart_UtilMakeRandomColor(seriesList.length),
		toolbox: {
			itemSize : 25,
		    feature: {
		    	restore : {},
		    	saveAsImage: {
		    		name : 'testImage'
		    	}
		    },
		    showTitle: false,
		    show: true
		},
		tooltip : {
			trigger : 'axis',
			order : 'valueDesc',
			position : function (point, params, dom, rect, size) {
	          var obj = {
	            top: 10
	          };
	          obj[['left', 'right'][+(point[0] < size.viewSize[0] / 2)]] = 30;
	          return obj;
	        },
        	formatter : function(params) {
        		return echart_UtilTooltipFormatter(params);
			},
		},
		legend : {
			textStyle : {
				overflow : 'truncate',
				width : 130
		    },
		    bottom : '0%',
			width : '80%',
			tooltip : {
				show : true,
				trigger : 'axis'
			}
		},
		grid : {
			containLabel : true,
			bottom : '25%'
		},
		dataZoom: [{
			id : 'dataZoomX',
	        type : 'inside',
	        xAxisIndex : [0],
	        filterMode : 'empty'
	    },
	    {
            id : 'dataZoomY',
            type : 'inside',
            yAxisIndex : [0],
            filterMode : 'empty'
	    }],
		xAxis : {
			type : 'category',
			name : xName,
			nameLocation : 'middle',
			nameTextStyle : {
			    lineHeight : 40,
			    fontWeight : 'bold',
			    fontSize : 13
		    },
			data : jsonData.xValues
		},
		yAxis : {
			type : 'value',
			name : yName,
			nameLocation : 'end',
			nameTextStyle : {
				lineHeight: 10,
			    fontWeight : 'bold',
			    fontSize : 13
		    },
		    dataZoom: {
			    yAxisIndex : [0,2]
		    },
		},
		series : seriesList
	};
	// 차트 생성
	chartLocationInit.setOption(option);
}
		
/*
 * 함수명: echart_ScatterSingle(location, jsonData, xName, yName): 하나의 시리즈로 scatter그래프를 그리는 함수
 * 		-locatino: 차트를 위치시킬 id명
 * 		-jsonData: 차트에 이용될 데이터
 * 		-xName: x축 이름
 * 		-yName: y축 이름
 */
function echart_ScatterSingle(location, jsonData, xName, yName) {
	/**
	 * 차트 인스턴스 초기화 
	 * echarts.init()의 인자는 차트가 그려질 위치의 DOM 요소
	 */
	var chartLocationInit = echarts.init(document.getElementById(location));

	// 데이터 컨트롤
	var seriesData = new Array();
	echarts.util.each(jsonData, function(data) {
		seriesData.push([data.xValue,data.yValue]);
	});
	// console.log(seriesData);
	
	// 차트옵션	
	var option = {
		tooltip: {
			trigger : 'item',
			axisPointer : {
				type : 'cross'
			},
			formatter: function(params) {
				return echart_UtilTooltipFormatter(params, xName, yName);
		 	},
		},
		toolbox: {
			itemSize : 25,
		    feature: {
		    	restore : {},
		    	saveAsImage: {
		    		name : 'testImage'
		    	}
		    },
		    showTitle: false,
		    show: true
		},
		grid : {
			containLabel : true,
			top : '8%'
		},
		dataZoom: [{
			id: 'dataZoomX',
	        type: 'inside',
	        xAxisIndex: [0],
	        filterMode: 'empty'
	    },
	    {
            id: 'dataZoomY',
            type: 'inside',
            yAxisIndex: [0],
            filterMode: 'empty'
	    }],
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
			nameLocation : 'end',
			nameTextStyle : {
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
 * 함수명: echart_ScatterMultiple(location, jsonData, xName, yName): 여러 시리즈로 scatter그래프를 그리는 함수
 * 		-locatino: 차트를 위치시킬 id명
 * 		-jsonData: 차트에 이용될 데이터
 * 		-xName: x축 이름
 * 		-yName: y축 이름
 */
function echart_ScatterMultiple(location, jsonData, xName, yName) {
	
	/**
	 * 차트 인스턴스 초기화 
	 * echarts.init()의 인자는 차트가 그려질 위치의 DOM 요소
	 */
	var chartLocationInit = echarts.init(document.getElementById(location));
	// console.log(JSON.parse(jsonData));
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
		color : echart_UtilMakeRandomColor(seriesList.length),
		toolbox: {
			itemSize : 25,
		    feature: {
		    	restore : {},
		    	saveAsImage: {
		    		name : 'testImage'
		    	}
		    },
		    showTitle: false,
		    show: true
		},
		tooltip: {
			trigger : 'item',
			axisPointer : {
				type : 'cross'
			},
			formatter: function(params) {
				return echart_UtilTooltipFormatter(params, xName, yName);
		 	}
		},
		legend : {
			textStyle: {
				overflow: "truncate",
				width: 130,
		    },
		    bottom: '0%',
			width: '80%',
			tooltip: {
				show : true,
				trigger : 'item',
				formatter: function(params) {
					console.log(params);
					var formatResult;
					var series = chartLocationInit.getOption().series;
					
					for (var i=0; i<series.length; i++) {
						console.log(series[i]);
						if (series[i].name === params.name) {
							formatResult = params.name + '<br/>'
							   			 + xName + '<strong style="float: right; padding-left: 20px;">' + echart_UtilMakePattern(series[i].data[0][0]) + '</strong><br/>'
							   			 + yName + '<strong style="float: right; padding-left: 20px;">' + echart_UtilMakePattern(series[i].data[0][1]) + '</strong><br/>';
						}
					}
					return formatResult;
			 	}
			}
		},
		dataZoom: [{
			id: 'dataZoomX',
	        type: 'inside',
	        xAxisIndex: [0],
	        filterMode: 'empty'
	    },
	    {
            id: 'dataZoomY',
            type: 'inside',
            yAxisIndex: [0],
            filterMode: 'empty'
	    }],
		grid : {
			containLabel : true,
			top : '8%',
			bottom : '25%'
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
			nameLocation : 'end',
			nameTextStyle : {
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

/* TODO: 랜덤색상이 밝은색이 나오거나 기본값의 색과 비슷하다면 육안으로 보기 힘듬 
 * 		  이때 전체 페이지를 새로고침을 하여 원하는 색으로 바꿈으로서 해결할 수 있으나, 근본적인 해결책은 되지 못함.
 * 	   
 * echart_UtilMakeRandomColor(dataLength): 데이터의 길이만큼의 랜덤색상을 생성해주는 함수
 * 		-dataLength: 데이터길이
 * 		
 *  	: echarts의 origin color(9가지)지만 11가지 색상을 임의로 추가하여 기본값을 20가지의 색으로 설정하였음
 * 
 * returnType 
 *		: Array	  
 */
function echart_UtilMakeRandomColor(dataLength) {
	var colorBox = ['#5470c6', '#91cc75', '#fac858', '#ee6666', '#73c0de', 
					'#3ba272', '#fc8452', '#9a60b4', '#ea7ccc', '#580056',
					'#005802', '#7CEA9A', '#7AB460', '#3BA272', '#A23B6B',
					'#DE9173', '#66EEEE', '#588AFA', '#B075CC', '#C6AA54'
				   ];
	if (colorBox.length < dataLength) {
		for (var i=colorBox.length; i<dataLength; i++) {
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
	}
	return colorBox;
}

/* TODO: 상황에 따라 추가 예정(현재는 숫자에 대한 패턴만을 만듬 00,000,000)	
 * 
 * echart_UtilMakePattern(value): 정규표현식과 같은 패턴식을 사용하여 포맷팅하는 함수
 * 		-value: 패턴을 만들 값	
 * 
 * returnType 
 *		: String	   	
 */
function echart_UtilMakePattern(value) {
	var regExpNum = /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g;
	var patternNum = value.toString().replace(regExpNum,",");
	return patternNum;
}

/* TODO: (overflow: truncate)가 버그로 인해 Tooltip에서는 작동하지 않아 함수를 작성하게됨.(legend에서는 정상작동)
 * 	   : https://github.com/apache/echarts/issues/16699
 * 
 * echart_UtilTooltipFormatter(params, xName, yName): ToolTip의 시리즈명이 maxlength 이상의 길이만큼을 '...'으로 변경하는 함수
 * 		-params: formmater에서 가져온 params(=데이터)
 * 		-xName: 그래프 설정 당시 x축 이름
 * 		-yName: 그래프 설정 당시 x축 이름
 * 
 * returnType 
 *		: String
 */
function echart_UtilTooltipFormatter(params, xName, yName) {
	var maxlength = 25;		// 최대 길이 설정
	var truncateSeriesName;	// truncate된 시리즈명
	var formatResult;		// 최종 결과
	
	if (Array.isArray(params)) {
		// 각 데이터 내림차순 정렬
		params.sort(function(a, b) {
			// console.log(a);
			// console.log(b);
			return b.data-a.data;
		});
		
		formatResult = '<div style="font-size: 18px; padding-bottom: 10px;">' + params[0].name + '</div>';
		
		for (var param of params) {
			if (param.seriesName.length > maxlength ) { 
				truncateSeriesName = param.seriesName.substr(0,maxlength) + '...';
				
			} else {
				truncateSeriesName = param.seriesName;
			}
			formatResult += param.marker + '  ' + truncateSeriesName + '<strong style="float: right; padding-left: 20px;">' + echart_UtilMakePattern(param.data) + '</strong><br/>';
		}
	} else {

		if (params.seriesName === 'series\u00000') {
			truncateSeriesName = '';
		} else {
			if (params.seriesName.length > maxlength) {
				truncateSeriesName = params.seriesName.substr(0,maxlength) + '...';
			} else {
				truncateSeriesName = params.seriesName
			}
		}
		formatResult = params.marker + '  ' + truncateSeriesName + '<br/>'
				       + xName + '<strong style="float: right; padding-left: 20px;">' + echart_UtilMakePattern(params.value[0]) + '</strong><br/>'
				       + yName + '<strong style="float: right; padding-left: 20px;">' + echart_UtilMakePattern(params.value[1]) + '</strong><br/>';
	}
	// console.log(testFormat);
	return formatResult;
}
