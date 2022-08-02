/*
 * xlsx.util.js: excel 다운로드 라이브러리의 유틸
 * 작성자: 이승준
 * 제작기간: 2022.07.04 ~ 
 */


/*
 * 함수명: excelFileExport(sheetArr): excel 파일을 생성 후 내보내는 함수
 * 		-sheetArr: 생성한 sheet 배열
 */
function exportExcel(sheetArr) {
	// 새로운 workbook 생성
    var newWorkbook = XLSX.utils.book_new();
	
    // workbook에 새로만든 워크시트를 삽입
    for (var sheet of sheetArr) {
    	 XLSX.utils.book_append_sheet(newWorkbook, sheet.value, sheet.name);	
    }
   
    // 엑셀파일 만들기
    var wordbookOut = XLSX.write(newWorkbook, {bookType:"xlsx",  type: "binary"});

    // 엑셀 파일 내보내기
    saveAs(new Blob([s2ab(wordbookOut)],{type:"application/octet-stream"}), "testWorkbook.xlsx");
}


/*
 * 함수명: createSheet(tableDomArr): sheet 생성 함수
 * 		-tableDomArr: table태그의  배열 혹은 같은 클래스명을 가진 table태그의 배열
 */
function createSheet(tableDomArr) {
	var sheet = XLSX.utils.table_to_sheet(tableDomArr[0]);
	
	if (tableDomArr.length > 1) {
		optionUtils.create_gap_rows(sheet, 3);
	}
	
	for (var i=1; i<tableDomArr.length; i++) {
		var testDom = XLSX.utils.sheet_add_dom(sheet, tableDomArr[i], {origin: -1});
		optionUtils.create_gap_rows(sheet, 3);
	}
	
	optionUtils.create_border_cell(sheet);
	
	optionUtils.fill_color_headers(sheet);
	
	optionUtils.replace_fit_columns(sheet);
	
	return sheet;
}

/*
 * optionUtils: cell의 옵션을 컨트롤 
 * 		- create_border_cell(sheet): sheet 범위내의 모든 셀에 border를 적용시킴.
 * 		- fill_color_headers(sheet): 각 표의 헤더를 구별할 수 있는 색을 채움.
 * 		- replace_fit_columns(sheet): 각 column의 간격을 초기화된 cellWith값으로 통일함.
 * 		- create_gap_rows(sheet, nrows): sheet에 표가 여러개일 경우 nrows값 기준으로 빈 행을 삽입함.
 */

var optionUtils = {
	create_border_cell : function(sheet) {
		var tempMerges;
		
		if (sheet['!merges'] !== null && sheet['!merges'] !== undefined) {
			tempMerges = sheet['!merges'];
			
			for (var tempMerge of tempMerges) {
				// column
				if (tempMerge.e.c - tempMerge.s.c == 0) {
					for (var i=tempMerge.s.r+1; i<=tempMerge.e.r; i++) {
						var property = XLSX.utils.encode_cell({"r": i, "c": tempMerge.s.c});
						sheet[property] = {
								"t": "s", "v": ""	
						}
					}
				}
				
				// row
				if (tempMerge.e.r - tempMerge.s.r == 0) {
					for (var i=tempMerge.s.c+1; i<=tempMerge.e.c; i++) {
						var property = XLSX.utils.encode_cell({"r": tempMerge.s.r, "c": i});
						console.log(typeof property);
						sheet[property] = {
								"t": "s", "v": ""	
						}
					}
				}
			}
			sheet['!merges'] = [];
		}
		
		
		for (var property in sheet) { 
			// console.log(property);
			// console.log(sheet[property]);
			
			if (typeof (sheet[property]) !== 'object') {
		    	continue; 
		    }
			
		    sheet[property].s = { 
 		    	alignment: {
 		        	horizontal: 'center',
 		        	vertical: 'center'
 		        },
 		        border: {
 		        	right: {
 		            	style: 'thin',
 		            	color: '000000',
 		          	},
 		          	left: {
 		            	style: 'thin',
 		            	color: '000000',
 		         	},
 		          	top: {
 		            	style: 'thin',
 		            	color: '000000',
 		          	},
 		          	bottom: {
 		            	style: 'thin',
 		            	color: '000000',
 		          	}
 		        }
 		    }
    	}
		
		if (sheet['!merges'] !== null && sheet['!merges'] !== undefined) {
			sheet['!merges'] = tempMerges;
		}
	},
	
	fill_color_headers : function(sheet) {
		var column = "Z";
		var row = -1;
		var isHeader = false;
		var fullRef = XLSX.utils.decode_range(sheet["!fullref"]);
		var lastProperty = XLSX.utils.encode_cell(fullRef.e);
		console.log(fullRef);
		console.log(lastProperty);
		for (var property in sheet) { 
			
			if (property == lastProperty) {
				break;
			}
			
			var p_row = Number(property.match("[0-9]+")); 
			
			var p_column;
			var array_column = property.match("[A-Z]+");
			
			if (array_column != null && p_row != null) {
				p_column = array_column[0];
				
				if(isHeader && row != p_row){
					if(column !== p_column){
						isHeader = false;
					}
				}
				
				if (p_column == "A" && p_row - row != 1) {
					isHeader = true;
				}
				
//				console.log("sheet: ", sheet);
//				console.log("property: ", property);
//				// console.log("encode: ", XLSX.utils.encode_cell({"r": 1, "c": 0}));
//				console.log("array_column: ", array_column);
//				console.log("column: ", column);
//				console.log("p_column: ", p_column);
//				console.log("row: ", row);
//				console.log("p_row: ", p_row);
//				console.log("isHeader: ", isHeader);
//				console.log("column != p_column: ", column != p_column);
//				console.log("-----------------------------");
				
				if (isHeader) {
					sheet[property].s = {
		    			fill: {
			    			fgColor: { rgb: "DCDCDC" } 
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
		 		            	style: 'thin',
		 		            	color: '000000',
		 		          	},
		 		          	left: {
		 		            	style: 'thin',
		 		            	color: '000000',
		 		         	},
		 		          	top: {
		 		            	style: 'thin',
		 		            	color: '000000',
		 		          	},
		 		          	bottom: {
		 		            	style: 'thin',
		 		            	color: '000000',
		 		          	}
		 		        }
			    	}
				}
				row = p_row;
				column = p_column;
			}
    	}
	},
	
	replace_fit_columns : function(sheet) {
		var cellWidth = 15;
		var columLength = (XLSX.utils.decode_range(sheet["!ref"]).e.c) + 1;
    	var	cellWidthArr = []; 
    	
    	for (var i=0; i<columLength; i++) {
    		cellWidthArr[i] = {width:cellWidth};
    	}
    	
    	sheet["!cols"] = cellWidthArr;
	},
	
	create_gap_rows : function(sheet, nrows) {
		var ref = XLSX.utils.decode_range(sheet["!ref"]);
		// console.log(ref);
		ref.e.r += nrows;
		sheet["!ref"] = XLSX.utils.encode_range(ref);	
	}	
}

function s2ab(s) {
    let buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
    let view = new Uint8Array(buf);  //create uint8array as viewer
    for (let i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
    return buf;
}