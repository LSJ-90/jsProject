if (typeof jQuery !== "undefined" && typeof saveAs !== "undefined") {
    /*
     * 사용자정의 메서드($.fn.메서드명)
     * wordExport: DOC파일로 내보내는 메서드
     */
	(function($) {
        $.fn.wordExport = function(coverpage, fileName) {
            fileName = typeof fileName !== 'undefined' ? fileName : "jQuery-Word-Export";
            var defalut = {
                mhtml: {
                    top: "Mime-Version: 1.0\nContent-Base: " + location.href + "\nContent-Type: Multipart/related; boundary=\"NEXT.ITEM-BOUNDARY\";type=\"text/html\"\n\n--NEXT.ITEM-BOUNDARY\nContent-Type: text/html; charset=\"utf-8\"\nContent-Location: " + location.href + "\n\n<!DOCTYPE html>\n<html>\n_html_</html>",
                    head: "<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<style>\n_styles_\n</style>\n</head>\n",
                    body: "<body>_body_</body>"
                }
            };
            var options = {
                maxWidth: 624
            };
            
            // Clone selected element before manipulating it
            var markup = new Array();
            for (var i=0; i<$(this).length; i++) {
            	markup.push($(this).eq(i).clone());
            }
            console.log(markup);
            
            // Remove hidden elements from the output
            for (var i=0; i<markup.length; i++) {
            	var self = $(this).eq(i);
                if (self.is(':hidden'))
                    self.remove();
            }

            // Embed all images using Data URLs
            var exportImages = new Array();
			var tempImgs = $(this).find('img');
			// console.log(tempImgs);
			
	        for (var i = 0; i < tempImgs.length; i++) {
	            // Calculate dimensions of output image
	            var w = Math.min(tempImgs[i].width, options.maxWidth);
	            var h = tempImgs[i].height * (w / tempImgs[i].width);
	            
	            // Create canvas for converting image to data URL
	            var canvas = document.createElement("CANVAS");
	            canvas.width = w;
	            canvas.height = h;
	            
	            // Draw image to canvas
	            var context = canvas.getContext('2d');
	            context.drawImage(tempImgs[i], 0, 0, w, h);
	            
	            // Get data URL encoding of image
	            var uri = canvas.toDataURL();
	            $(tempImgs[i]).attr("src", tempImgs[i].src);
	            tempImgs[i].width = w;
	            tempImgs[i].height = h;
		        
	            // Save encoded image to array
                exportImages.push({
                	contentType: uri.substring(uri.indexOf(":") + 1, uri.indexOf(";")),
                	contentEncoding: uri.substring(uri.indexOf(";") + 1, uri.indexOf(",")),
                    contentLocation: $(tempImgs[i]).attr("src"),
                    contentData: uri.substring(uri.indexOf(",") + 1)
                });
	            
                // Remove canvas now that we no longer need it
	            // canvas.parentNode.removeChild(canvas);
	        }
            // console.log(tempImgs);
            // console.log(exportImages);
            
            // Prepare bottom of mhtml file with image data
            var mhtmlBottom = "\n";
            for (var i = 0; i < exportImages.length; i++) {
                mhtmlBottom += "--NEXT.ITEM-BOUNDARY\n";
                mhtmlBottom += "Content-Location: " + exportImages[i].contentLocation + "\n";
                mhtmlBottom += "Content-Type: " + exportImages[i].contentType + "\n";
                mhtmlBottom += "Content-Transfer-Encoding: " + exportImages[i].contentEncoding + "\n\n";
                mhtmlBottom += exportImages[i].contentData + "\n\n";
            }
            mhtmlBottom += "--NEXT.ITEM-BOUNDARY--";

            //TODO: load css from included stylesheet
            var styles = "";
            
            // Aggregate parts of the file together 
            var markupHtml = coverpage;
            for (var i=0; i<markup.length; i++) {
            	markupHtml += markup[i].html();
            }
            console.log(markupHtml);
         
            var fileContent = defalut.mhtml.top.replace("_html_", defalut.mhtml.head.replace("_styles_", styles) 
            			    + defalut.mhtml.body.replace("_body_", markupHtml)) 
            			    + mhtmlBottom;
            console.log(fileContent);
            // Create a Blob with the file contents
            var blob = new Blob([fileContent], {type: "application/msword;charset=utf-8"});
            saveAs(blob, fileName + ".doc");
        };
    })(jQuery);
    
    /*
     * 함수명: exportDoc(exportDomArr, fileNm): doc 파일을  내보내는 함수
     * 		- exportDomArr: export할 DOM의 배열
     * 		- fileNm: 파일명
     */
    function exportDoc(exportDomArr, coverpage, fileNm) {
    	console.log(coverpage);
		var exportPromise = new Promise(function(resolve, reject) {
    		// export할 div 내의 echart가 그려진 canvas태그 찾기
    		var canvas = exportDomArr.find("canvas");
			// echarts tooltip div 내용 비우기
    		canvas.parent().next().empty();
    		// canvas로  라이브러리에 보낼 temp Image 만들기
        	for (var i=0; i<canvas.length; i++) {
        	    var tempImg = new Image();
        		tempImg.src = canvas[i].toDataURL();
        		tempImg.width = 600;
        		tempImg.height = 400;
        		canvas[i].append(tempImg);
        	}
        	resolve(coverpage);
        	//TODO: reject()
        	reject();
   		});
    		 
    	exportPromise
    	.then(function(coverpage) {
   			// export 실행
			exportDomArr.wordExport(coverpage, fileNm);
   			// temp Image 삭제
		    exportDomArr.find("img").remove();
			// console.log(tempImgs);
   		})
   		//TODO: reject()
   		.catch(function() {
   			
   		});
	}
} else {
    if (typeof jQuery === "undefined") {
        console.error("jQuery Word Export: missing dependency (jQuery)");
    }
    if (typeof saveAs === "undefined") {
        console.error("jQuery Word Export: missing dependency (FileSaver.js)");
    };
}