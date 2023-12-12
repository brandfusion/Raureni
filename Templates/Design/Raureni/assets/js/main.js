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
  	   
    var open = false;
    var hover = false;
    var linkHover = false;
	var readMore = true;
    
  	// fixed header
    var nav = $('.header');
    
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            nav.addClass("fixed");
        } else {
            nav.removeClass("fixed");
        }
    });
  
  	// tiny nav
    $("#nav").tinyNav({
      active: 'selected', // String: Set the "active" class
      header: 'Alege categorie', // String: Specify text for "header" and show header instead of the active item
      indent: '- ', // String: Specify text for indenting sub-items
      label: '' // String: Sets the <label> text for the <select> (if not set, no label will be added)
    });
  
    // more-less 
    /* $('.show-more').click(function() {        
        $(this).prev('.text').toggleClass("show-more-height");
        $(this).toggleClass("show-more show-less").text($(this).text() == 'Vezi mai puţin' ? 'Vezi gama completă' : 'Vezi mai puţin');      	
    }); */
    if ($(".show-more-height").length > 0) {           
      
           $('.show-more').on('click', function(e){               
             
             var divHeight = $(this).parents(".category-items").find(".show-more-height").prop("scrollHeight");
       		 var divHeightWrapper =  $(this).parents(".category-items").find(".show-more-height").height();
             var openText = $(this).attr("data-open");
             var closeText = $(this).attr("data-close");
             
             e.preventDefault();
    
             if (!$(this).hasClass("opened")) {   
                 $('.show-more-height').animate({height: 280}, 0);
                 $(".show-more").removeClass("opened");
                 $(this).addClass("opened");
                 $(this).parents(".category-items").find(".show-more-height").animate({height: divHeight}, 1500);          
                 $(this).html(closeText);
             } else { 
               	 $('.show-more-height').animate({height: 280}, 500);
                 $(".show-more").removeClass("opened");
                 $(this).html(openText);
             }        
           });       
        
    }
    $('.gif-boxes').on("mouseenter", function(){
      var $this = $(this);
      var value = $(this).attr("data-gif");
      var content = '<div class="gif-overlay" style="background-image:url('+ value + '?' + Math.random() +');"></div>';
      $(this).find(".media").append(content);
      setTimeout(function(){
        $this.find(".gif-overlay").addClass("fadeIn");
      }, 100);
      
    });
    $('.gif-boxes').on("mouseleave", function(){
      var value = $(this).attr("data-gif");     
      $(this).find(".gif-overlay").remove();
    });
    // anchor
    $('.category-box a[href*=#]').on('click', function(e){     
        e.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
    });
    
    // flexslider
    $('.flexslider').flexslider({
      animation: "slide",
      slideshow: false
    });
  
  	// flexslider carousel
    if($(".flexslider-productlist").length) {
        // store the slider in a local variable
        var $window = $(window),
            flexslider;
       
        // tiny helper function to add breakpoints
        function getGridSize() {
          return (window.innerWidth < 600) ? 2 :
                 (window.innerWidth < 900) ? 3 : 4;
        }
       
        $window.load(function() {
          $('.flexslider-productlist').flexslider({
            animation: "slide",
            animationLoop: false,
            itemWidth: 210,
            itemMargin: 5,
            minItems: getGridSize(), // use function to pull in initial value
            maxItems: getGridSize() // use function to pull in initial value
          });
        });
       
        // check grid size on resize event  	
        $window.resize(function() {
          var gridSize = getGridSize();
       
          flexslider.vars.minItems = gridSize;
          flexslider.vars.maxItems = gridSize;
        });
    }
  
  	
    //  article blog
    $('.item-details').each(function(){
      listLimit ($(this), 5)
    });
	
  	var menuOpened = false;
    // $(".dropdown-menu").on("opened", function(){
    //      $(".header").addClass("drawer");
    // });
    // $(".dropdown-menu").on("closed", function(){
    //      $(".header").removeClass("drawer");
    // });
    $('.dropdown').on("mouseover", function(){
     // console.log("enter")
      $(".header").addClass("drawer");
      $(this).parents("ul").find(".dropdown-menu").hide();
      $(this).find("ul").show();
      // menuOpened = true;
    });   
    $('.dropdown').on("mouseleave", function(){    
      $(".header").removeClass("drawer");
      // menuOpened = true;
    });
   $('.dropdown-menu').on("mouseleave", function(){
    // console.log("exit l2");
     $(".header").removeClass("drawer");
   });
    // $('.dropdown-menu').on("mouseout", function(){
    //   console.log("out")
    //    $(".header").removeClass("drawer");
      
    //   // setTimeout(function(){
    //   //   if(!menuOpened) {
    //   //     $(".header").removeClass("drawer");
    //   //     menuOpened = false;
    //   //   }
       
    //   // }, 2000);
      
    // });

  // if (Cookies.get('hideMovie') !== "true") { // If newsletter popup must be seen
  //  $("#homeMovie").bPopup({
  //      closeClass:'times',
  //      onOpen: function() { 
  //        var link = $('#homeMovie iframe').attr("src");
  //        var linkUpdated= link + "&autoplay=1";
  //        $("#homeMovie").addClass("animated fadeIn");       
  //        $('#homeMovie iframe').attr("src",linkUpdated);
  //        $(".mobile-big-wrapper").addClass("blur");
  //      },
  //      onClose: function() { 
  //        $(".mobile-big-wrapper").removeClass("blur");
  //        $('iframe.youtube-content').each(function(){
  //          this.contentWindow.postMessage('{"event":"command","func":"' + 'stopVideo' + '","args":""}', '*')
  //        });
  //        Cookies.set('hideMovie', true);
  //      }           
  //  });
  // }
    	

  const customPopUpCloseElements = document.querySelectorAll('.customPopUp , .customPopUp .closePopup');
  if(customPopUpCloseElements.length) {
      customPopUpCloseElements.forEach(function(element) {
        element.addEventListener('click' , function(e) {
            sessionStorage.setItem('customPopUpClosed' , true);
                    element.style.display = 'none';
        });
      });
  }
  document.addEventListener('DOMContentLoaded' , function(e) {
      const customPopUp = document.querySelector('.customPopUp');
      if(customPopUp && sessionStorage.getItem('customPopUpClosed') !== null) {
          customPopUp.style.display = 'none';
      }
  });
});