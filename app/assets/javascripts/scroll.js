$(function(){
  var num = $(".projectTtl").offset().top;
  $(window).scroll(function(){
    if($(this).scrollTop() >= num){
      $("#scrollContent").fadeIn(150);
    }else if($(this).scrollTop() <= num){
      $("#scrollContent").fadeOut(150);
    }
  });

  $("#siteBtn").on("click", function(){
    $("html, body").animate({ scrollTop: $(".returnTtl").offset().top-20 }, 800);
  });

});
