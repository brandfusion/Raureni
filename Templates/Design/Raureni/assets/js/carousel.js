$(function(){



  $('.product-list-carousel-4').on("init", function(){
    var $this= $(this);
    setTimeout(function(){
      $this.parent().css("opacity","1");
    }, 1000);   
  });
  $('.product-list-carousel').on("init", function(){
    var $this= $(this);
    setTimeout(function(){
      $this.parent().css("opacity","1");
    }, 1000);   
  });
  $(".product-list-wrapper").each(function(){
        
        var $this = $(this);
        var slick = $this.find('.product-list-carousel').slick({
            appendArrows: $this.find('.product-list-navigation'),
            dots: false,
            infinite: true,
            speed: 300,
            touchMove: false,
            slidesToShow: 5,
            slidesToScroll: 1, 
            prevArrow: "<a href='#' class='slick-prev'><i class='fa fa-angle-left'></a>",
            nextArrow: "<a href='#' class='slick-next'><i class='fa fa-angle-right'></i></a>",
            responsive: [
              {
                breakpoint: 1200,
                settings: {
                  slidesToShow: 3,
                  slidesToScroll: 1
                }
              },
              {
                breakpoint: 768,
                settings: {
                  slidesToShow: 2,
                  slidesToScroll: 1
                }
              },
              {
                breakpoint: 480,
                settings: {
                  slidesToShow: 1,
                  slidesToScroll: 1
                }
              }
            ]
        });

        var slick4 = $this.find('.product-list-carousel-4').slick({
            appendArrows: $this.find('.product-list-navigation'),
            dots: false,
            infinite: true,
            speed: 300,
            touchMove: false,
            slidesToShow: 4,
            slidesToScroll: 1, 
            prevArrow: "<a href='#' class='slick-prev'><i class='ion-ios-arrow-back'></a>",
            nextArrow: "<a href='#' class='slick-next'><i class='ion-ios-arrow-forward'></i></a>",
            responsive: [
              {
                breakpoint: 1200,
                settings: {
                  slidesToShow: 3,
                  slidesToScroll: 1
                }
              },
              {
                breakpoint: 768,
                settings: {
                  slidesToShow: 2,
                  slidesToScroll: 1
                }
              },
              {
                breakpoint: 480,
                settings: {
                  slidesToShow: 1,
                  slidesToScroll: 1
                }
              }
            ]
        });
  });





});