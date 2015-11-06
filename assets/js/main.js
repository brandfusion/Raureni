function listLimit (elm, line){
    var maxHeight = parseInt(elm.css('line-Height'))*line;

    while(elm.height() > maxHeight){
        var text = elm.text();
        elm.text(text.substring(0,text.length-10)).text(elm.text()+' ...');
    }
}

//newsletter subscribe/unsubscribe functions
window.newsletterUnsubscribe = function(data){
  window.open(data)
  window.location.href = window.location.href
}

window.newsletterSubscribe = function(data){
  var url = data + $("#newsletter_subscribe").val()
  window.open(url)
  window.location.href = window.location.href
}  

window.newsletterSubscribeNoRedirect = function(data){
  var url = data + $("#newsletter_subscribe").val(),
  deferred = $.Deferred()
  $.ajax({'url': url,type:'get'}).done(function(response){
    var responseText = $($.parseHTML(response)).filter("#response").text()
      alert(responseText)
      $("#newsletter_subscribe").val("")
      $("#newsletter_subscribe").attr("placeholder", responseText)
      deferred.resolve()
    })
    return deferred.promise()
}

$(document).ready(function() {
	$('.flexslider').flexslider({
		animation: "slide"		
	});
	$('.item-details').each(function(){
	   listLimit ($(this), 5)
	})

  $('.level-1').on("hover", function(){
      $(".header").addClass('drawer');
  });
});