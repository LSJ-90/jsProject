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

var excelHandler = {
    // 시트에 담길 테이블이 여러 개 일 때
	getWorksheetByMultipleTable : function(tableDomArray) {
    	var sheet = XLSX.utils.table_to_sheet(tableDomArray[0]);
    	
    	optionUtils.create_gap_rows(sheet, 3);
    	
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
    },
    
 	// 시트에 담길 테이블이 하나 일 때
    getWorksheetBySingleTable : function(tableDom){
    	var sheet = XLSX.utils.table_to_sheet(tableDom);
    	
    	optionUtils.create_border_cell(sheet);
    	optionUtils.fill_color_headers(sheet, tableDom);
    	optionUtils.replace_fit_columns(sheet);
    	
    	return sheet;
    }
}

var optionUtils = {
	create_border_cell : function(sheet) {
		for (var property in sheet) { 
		    if (typeof (sheet[property]) !== 'object') {
		    	continue; 
		    }
		    
		    sheet[property].s = { 
 		    	alignment: {
 		        	horizontal: 'center',
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
	
	fill_color_headers : function(sheet, tableDom) {
		for (var property in sheet) { 
			var thArr = tableDom.getElementsByTagName("th");
			var headerArr = new Array();
			
			for (var th of thArr) {
				headerArr.push(th.innerText);
			}
			
		    if (typeof (sheet[property]) !== 'object') {
		    	continue; 
		    }
		    
		    for (var header of headerArr) {
    		    if (sheet[property].v == header) {
    		    	sheet[property].s = {
		    			fill: {
			    			fgColor: { rgb: "DCDCDC" } 
 				    	},
 				    	alignment: {
		 		        	horizontal: 'center',
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
		 		            	style: 'thick',
		 		            	color: '000000',
		 		          	}
		 		        }
    		    	}
    		    }
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