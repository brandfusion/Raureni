function listLimit (elm, line){
    var maxHeight = parseInt(elm.css('line-Height'))*line;

    while(elm.height() > maxHeight){
        var text = elm.text();
        elm.text(text.substring(0,text.length-10)).text(elm.text()+' ...');
    }
}

$(document).ready(function() {
	$('.flexslider').flexslider({
		animation: "slide"		
	});
	$('.item-details').each(function(){
	   listLimit ($(this), 5)
	})
});
