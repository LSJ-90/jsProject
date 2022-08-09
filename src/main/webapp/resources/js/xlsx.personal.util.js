function excelFileExport(sheetArr) {
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

function createSheet(tableDomArray) {
	var sheet = XLSX.utils.table_to_sheet(tableDomArray[0]);
	// console.log(sheet);
	
	if (tableDomArray.length > 1) {
		optionUtils.create_gap_rows(sheet, 3);
	}
	
	for (var i=1; i<tableDomArray.length; i++) {
		var testDom = XLSX.utils.sheet_add_dom(sheet, tableDomArray[i], {origin: -1});
		optionUtils.create_gap_rows(sheet, 3);
	}
	
	optionUtils.create_border_cell(sheet);
	
	for (var i=0; i<tableDomArray.length; i++) {
		optionUtils.fill_color_headers(sheet, tableDomArray[i]);
	}
	
	optionUtils.replace_fit_columns(sheet);
	
	return sheet;
}


var optionUtils = {
	create_border_cell : function(sheet) {
		for (var property in sheet) { 
			// console.log(property);
			// console.log(sheet[property]);
			
			if (typeof (sheet[property]) !== 'object') {
		    	continue; 
		    }
			
//			if (property === '!merges') {
//				alert('접근');
//				var merges = sheet[property];
//				sheet[property] = [];
//				console.log(merges);
//				console.log(sheet[property]);
//			}
//		    
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
	},
	
//	fill_color_headers : function(sheet, tableDom) {
//		for (var property in sheet) { 
//			var thArr = tableDom.getElementsByTagName("th");
//			var headerArr = new Array();
//			
//			for (var th of thArr) {
//				headerArr.push(th.innerText);
//			}
//			
//			console.log(sheet);
//			// console.log(headerArr);
//			
//		    if (typeof (sheet[property]) !== 'object') {
//		    	continue; 
//		    }
//		    
//		    for (var header of headerArr) {
//    		    if (sheet[property].v == header) {
//    		    	sheet[property].s = {
//		    			fill: {
//			    			fgColor: { rgb: "DCDCDC" } 
// 				    	},
// 				    	alignment: {
// 				    		horizontal: 'center',
// 		 		        	vertical: 'center'
//		 		        },
//		 		        border: {
//		 		        	right: {
//		 		            	style: 'thin',
//		 		            	color: '000000',
//		 		          	},
//		 		          	left: {
//		 		            	style: 'thin',
//		 		            	color: '000000',
//		 		         	},
//		 		          	top: {
//		 		            	style: 'thin',
//		 		            	color: '000000',
//		 		          	},
//		 		          	bottom: {
//		 		            	style: 'thick',
//		 		            	color: '000000',
//		 		          	}
//		 		        }
//    		    	}
//    		    }
//		    }
//    	}
//	},	
	
	fill_color_headers : function(sheet, rowspanMaxArr) {
		var column = "Z";
		var row = -1;
		var isHeader = false;
		var fullRef = XLSX.utils.decode_range(sheet["!fullref"]);
		var lastProperty = XLSX.utils.encode_cell(fullRef.e);
		var headerPropertyArr = new Array();
		
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