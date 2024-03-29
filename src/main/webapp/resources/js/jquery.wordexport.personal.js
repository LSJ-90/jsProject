if (typeof jQuery !== "undefined" && typeof saveAs !== "undefined") {
    (function($) {
        $.fn.wordExport = function(fileName) {
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
            // console.log(markup);
            
            // Remove hidden elements from the output
            for (var i=0; i<markup.length; i++) {
            	var self = $(this).eq(i);
                if (self.is(':hidden'))
                    self.remove();
            }

            // Embed all images using Data URLs
            var imageAll = new Array();
			var imgs = new Array();
            
			for (var i=0; i<markup.length; i++) {
            	imgs.push($(this).eq(i).find('img'));
            }
			console.log(imgs);
			
            for (var img of imgs) { 
		        for (var i = 0; i < img.length; i++) {
		            // Calculate dimensions of output image
		            var w = Math.min(img[i].width, options.maxWidth);
		            var h = img[i].height * (w / img[i].width);
		            
		            // Create canvas for converting image to data URL
		            var canvas = document.createElement("CANVAS");
		            canvas.width = w;
		            canvas.height = h;
		            
		            // Draw image to canvas
		            var context = canvas.getContext('2d');
		            context.drawImage(img[i], 0, 0, w, h);
		            
		            // Get data URL encoding of image
		            var uri = canvas.toDataURL();
		            $(img[i]).attr("src", img[i].src);
		            img[i].width = w;
		            img[i].height = h;
			        
		            // Save encoded image to array
	                imageAll.push({
	                	contentType: uri.substring(uri.indexOf(":") + 1, uri.indexOf(";")),
	                	contentEncoding: uri.substring(uri.indexOf(";") + 1, uri.indexOf(",")),
	                    contentLocation: $(img[i]).attr("src"),
	                    contentData: uri.substring(uri.indexOf(",") + 1)
	                });
		            
	                // Remove canvas now that we no longer need it
		            // canvas.parentNode.removeChild(canvas);
		        }
            }
            // console.log(imgs);
            // console.log(imageAll);
            // Prepare bottom of mhtml file with image data
            var mhtmlBottom = "\n";
            for (var i = 0; i < imageAll.length; i++) {
                mhtmlBottom += "--NEXT.ITEM-BOUNDARY\n";
                mhtmlBottom += "Content-Location: " + imageAll[i].contentLocation + "\n";
                mhtmlBottom += "Content-Type: " + imageAll[i].contentType + "\n";
                mhtmlBottom += "Content-Transfer-Encoding: " + imageAll[i].contentEncoding + "\n\n";
                mhtmlBottom += imageAll[i].contentData + "\n\n";
            }
            mhtmlBottom += "--NEXT.ITEM-BOUNDARY--";

            //TODO: load css from included stylesheet
            var styles = "";
            
            // Aggregate parts of the file together 
            var markupHtml = "";
            for (var i=0; i<markup.length; i++) {
            	markupHtml += markup[i].html();
            }
            // console.log(markupHtml);
            
            var fileContent = defalut.mhtml.top.replace("_html_", defalut.mhtml.head.replace("_styles_", styles) + defalut.mhtml.body.replace("_body_", markupHtml)) + mhtmlBottom;
            
            // Create a Blob with the file contents
            var blob = new Blob([fileContent], {type: "application/msword;charset=utf-8"});
            saveAs(blob, fileName + ".doc");
        };
    })(jQuery);
} else {
    if (typeof jQuery === "undefined") {
        console.error("jQuery Word Export: missing dependency (jQuery)");
    }
    if (typeof saveAs === "undefined") {
        console.error("jQuery Word Export: missing dependency (FileSaver.js)");
    };
}