/*
 * xlsx.util.js: excel 다운로드 라이브러리의 유틸
 * 작성자: 이승준
 * 제작기간: 2022.07.04 ~ 
 */

/**
 * 초기 값 설정
 */
var fileNm = "example";
var headerColor = "DCDCDC";
var tableGab = 3;
var columnWidth = 15;

/**
 * 함수명: excelFileExport(sheetArr): excel 파일을 생성 후 내보내는 함수
 * @param sheetArr
 * @param fileNm
 */
function exportExcel(sheetArr, fileNm) {
	if (fileNm === undefined) {
		fileNm = this.fileNm;
	}
	
	// 새로운 workbook 생성
    var newWorkbook = XLSX.utils.book_new();
    
    // workbook에 새로만든 워크시트를 삽입
    for (var sheet of sheetArr) {
    	 XLSX.utils.book_append_sheet(newWorkbook, sheet.value, sheet.name);	
    }
   
    // 엑셀파일 만들기
    var wordbookOut = XLSX.write(newWorkbook, {bookType:"xlsx",  type: "binary"});

    // 엑셀 파일 내보내기
    saveAs(new Blob([s2ab(wordbookOut)],{type:"application/octet-stream"}), fileNm+".xlsx");
}

/**
 * 함수명: create_sheet_table(tableDomArr, headerColor): sheet 생성 함수
 * @param tableDomArr
 * @returns sheet object
 */
function create_sheet_table(tableDomArr) {
	var sheet = XLSX.utils.table_to_sheet(tableDomArr[0]);
	// console.log(sheet);
	
	if (tableDomArr.length > 1) {
		optionUtils.set_gap_rows(sheet, tableGab);
	}
	
	for (var i=1; i<tableDomArr.length; i++) {
		XLSX.utils.sheet_add_dom(sheet, tableDomArr[i], {origin: -1});
		optionUtils.set_gap_rows(sheet, tableGab);
	}
	
	optionUtils.set_border_all(sheet);
	
	optionUtils.set_headerStyle_table(sheet, tableDomArr);
	
	return sheet;
}

/**
 * TODO: 병합된 셀이 있을 경우..?
 * 함수명: create_sheet_json(tableDomArr): sheet 생성 함수
 * @param jsonDataArr
 * @returns sheet object
 */
function create_sheet_json(jsonDataArr) {
	var sheet = XLSX.utils.json_to_sheet(jsonDataArr[0]);
	console.log(sheet);
	
	if (jsonDataArr.length > 1) {
		optionUtils.set_gap_rows(sheet, tableGab);
	}
	
	for (var i=1; i<jsonDataArr.length; i++) {
		XLSX.utils.sheet_add_json(sheet, jsonDataArr[i], {origin: -1});
		optionUtils.set_gap_rows(sheet, tableGab);
	}
	
	optionUtils.set_border_all(sheet);

	optionUtils.set_headerStyle_json(sheet, jsonDataArr);
	
	return sheet;
}

/*
 * optionUtils: cell의 옵션을 컨트롤 
 * 		- set_border_all(sheet): sheet 범위내의 모든 셀에 border를 적용시킴.
 * 		- set_headerStyle_table(sheet, tableDomArr): 데이터가 table dom 일 때 각 표의 헤더를 구별할 수 있는 색을 채우고 구분선을 적용.
 * 		- set_headerStyle_json(sheet, jsonDataArr): 데이터가 json 일 때 각 표의 헤더를 구별할 수 있는 색을 채우고 구분선을 적용.
 * 		- set_fit_columns(sheet): 각 column의 간격을 초기화된 cellWith값으로 통일함.
 * 		- set_gap_rows(sheet, nrows): sheet에 표가 여러개일 경우 nrows값 기준으로 빈 행을 삽입함.
 * 		- get_headerRowArr_table(tableDomArr): 각 표에서 시작되는 헤더 로우 값을 가져옴.
 * 		- get_headerColumnArr_table(tableDomArr): 각 표의 컬럼 길이 값을 가져옴.
 * 		- get_headerArr_json(sheet, jsonDataArr): 각 표의 헤더 값을 가져옴.
 * 		- get_rowspan_maxArr(tableDomArr): 각 표에서 th의 rowspan값 중 가장 큰 값을 가져옴.
 */
var optionUtils = {
	set_border_all : function(sheet) {
		// 병합 풀기
		var tempMerges;
		
		if (sheet['!merges'] !== null && sheet['!merges'] !== undefined) {
			tempMerges = sheet['!merges'];
			for (var tempMerge of tempMerges) {
				var cell;
				
				// column에 빈 property 추가
				if (tempMerge.e.c - tempMerge.s.c == 0) {
					for (var i=tempMerge.s.r+1; i<=tempMerge.e.r; i++) {
						cell = XLSX.utils.encode_cell({"r": i, "c": tempMerge.s.c});
						sheet[cell] = {
								"t": "s", "v": ""	
						}
					}
				}
				// row에 
				if (tempMerge.e.r - tempMerge.s.r == 0) {
					for (var i=tempMerge.s.c+1; i<=tempMerge.e.c; i++) {
						cell = XLSX.utils.encode_cell({"r": tempMerge.s.r, "c": i});
						sheet[cell] = {
								"t": "s", "v": ""	
						}
					}
				}
			}
			sheet['!merges'] = [];
		}
		
		// 모든 셀에 border 적용
		for (var cell in sheet) { 
			if (typeof (sheet[cell]) !== 'object') {
		    	continue; 
		    }
			sheet[cell].s = style.allBorder;
    	}
		
		// 재병합
		if (sheet['!merges'] !== null && sheet['!merges'] !== undefined) {
			sheet['!merges'] = tempMerges;
		}
	},
	
	set_headerStyle_table : function(sheet, tableDomArr) {
		var rowspanMaxArr = this.get_rowspan_maxArr(tableDomArr);
		var headerRowArr = this.get_headerRowArr_table(tableDomArr);
		var headerColumnArr = this.get_headerColumnArr_table(tableDomArr);
		
		for (var i=0; i<tableDomArr.length; i++) {
			for (var j=0; j<headerColumnArr[i]; j++) {
				var cell = XLSX.utils.encode_cell({"r": headerRowArr[i], "c": j});
				sheet[cell].s = style.lastHeader;	
				// console.log("header: ", "[" + headerRowArr[i], j + "]" + " ",  XLSX.utils.encode_cell({"r": headerRowArr[i], "c": j}));
				
				if (rowspanMaxArr[i] > 1) {
					var lastHeaderCell = XLSX.utils.encode_cell({"r": headerRowArr[i] + rowspanMaxArr[i]-1, "c": j});
					sheet[cell].s = style.isHeader;
					sheet[lastHeaderCell].s = style.lastHeader;
					// console.log("header: ", "[" + (headerRowArr[i] + rowspanMaxArr[i]-1), j + "]" + " ", XLSX.utils.encode_cell({"r": headerRowArr[i] + rowspanMaxArr[i]-1, "c": j}));
				} 
			}
		}
//		console.log("headerRowArr: ", headerRowArr);
//		console.log("headerColumnArr: ", headerColumnArr);
//		console.log("rowspanMaxArr: ", rowspanMaxArr);
//		console.log("------------------------------");
	},
	
	set_headerStyle_json : function(sheet, jsonDataArr) {
		var headerArr = this.get_headerArr_json(jsonDataArr);
		
		for (var cell in sheet) {
			var de_cell = XLSX.utils.decode_cell(cell);
			
			if (typeof (sheet[cell]) !== 'object') {
		    	continue; 
		    }
			
			if (headerArr.includes(sheet[cell].v)) {
				sheet[cell].s = style.lastHeader;
			}
		}
	},
	
	get_headerRowArr_table : function(tableDomArr) {
		var headerRow = 0;
		var headerRowArr = new Array();
		
		headerRowArr.push(headerRow);
		
		for (var i=0; i<tableDomArr.length-1; i++) {
			var rowLength = Number(tableDomArr[i].querySelector("tbody").children.length);
			headerRow += rowLength+tableGab;
			headerRowArr.push(headerRow);
		}
		// console.log("headerRowArr: ", headerRowArr);
		return headerRowArr;
	},
	
	get_headerColumnArr_table : function(tableDomArr) {
		var headerColumnArr = new Array();
		
		for (var tableDom of tableDomArr) {
			var columns = tableDom.querySelector("tbody").firstElementChild.children;
			var columnCnt = Number(columns.length);

			for (var column of columns) {
				var colsapn = Number(column.getAttribute("colspan"));
				if (colsapn !== 0) {
					columnCnt = columnCnt + colsapn - 1;
				}
			}
			headerColumnArr.push(columnCnt);
		}
		// console.log("headerColumnArr: ", headerColumnArr);
		return headerColumnArr;
	},
	
	get_headerArr_json : function(jsonDataArr) {
		var headerArr = new Array();
		
		for (var jsonData of jsonDataArr) {
			for (var key in jsonData[0]) {
				if (!headerArr.includes(key)) {
					headerArr.push(key);
				}
				
			}
		}
		// console.log("hearderArr: ", hearderArr);
		return headerArr;
	},
	
	get_rowspan_maxArr : function(tableDomArr) {
		var rowspanMax = 1;
		var rowspanMaxArr = new Array();
		
		for (var tableDom of tableDomArr) {
			var thArr = $(tableDom).find("th"); 
			var rowspanArr = new Array();
			for (var th of thArr) {
				if ($(th).attr("rowspan") === undefined) {
					rowspanArr.push(1);	
				} else {
					rowspanArr.push($(th).attr("rowspan"));
				}
			}
			rowspanMax = Math.max(...rowspanArr);
			// console.log("rowspanArr: ", rowspanArr);
			rowspanMaxArr.push(rowspanMax);
			// console.log("rowspanMax: ", rowspanMax);
		}
		// console.log("rowspanMaxArr: ", rowspanMaxArr);
		return rowspanMaxArr;
	},
	
	set_fit_columns : function(sheetArr, columnWidth) {
		if (columnWidth === undefined) {
			columnWidth = this.columnWidth;
		}
		
		for (var sheet of sheetArr) {
			var columLength = (XLSX.utils.decode_range(sheet.value["!ref"]).e.c) + 1;
	    	var	columnWidthArr = []; 
	    	
	    	for (var i=0; i<columLength; i++) {
	    		columnWidthArr[i] = {width:columnWidth};
	    	}
	    	
	    	sheet.value["!cols"] = columnWidthArr;
		}
	},
	
	set_gap_rows : function(sheet, nrows) {
		var ref = XLSX.utils.decode_range(sheet["!ref"]);
		ref.e.r += nrows;
		sheet["!ref"] = XLSX.utils.encode_range(ref);	
	}	
}

/**
 * style value setting
 */
var style = {
	lastHeader: {
		fill: {
			fgColor: { rgb: headerColor } 
		},
		font: {
			bold: true
		},
		alignment: {
			horizontal: 'center',
			vertical: 'center'
		},
		border: {
			right: {
            	style: "thin",
            	color: "000000",
          	},
          	left: {
            	style: "thin",
            	color: "000000",
         	},
          	top: {
            	style: "thin",
            	color: "000000",
          	},
          	bottom: {
            	style: "thick",
            	color: "000000",
          	}
    	}
	},
	
	isHeader: {
		fill: {
			fgColor: { rgb: headerColor } 
		},
		font: {
			bold: true
		},
		alignment: {
			horizontal: 'center',
			vertical: 'center'
		},
		border: {
			right: {
            	style: "thin",
            	color: "000000",
          	},
          	left: {
            	style: "thin",
            	color: "000000",
         	},
          	top: {
            	style: "thin",
            	color: "000000",
          	},
          	bottom: {
            	style: "thin",
            	color: "000000",
          	}
    	}
	},
	
	allBorder: {
		alignment: {
			horizontal: 'center',
			vertical: 'center'
		},
		border: {
			right: {
            	style: "thin",
            	color: "000000",
          	},
          	left: {
            	style: "thin",
            	color: "000000",
         	},
          	top: {
            	style: "thin",
            	color: "000000",
          	},
          	bottom: {
            	style: "thin",
            	color: "000000",
          	}
    	}
	}
}

function s2ab(s) {
    let buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
    let view = new Uint8Array(buf);  //create uint8array as viewer
    for (let i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
    return buf;
}