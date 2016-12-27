function addMypage(id){
  list =
    "<ul class = 'headerMyIconClick'>" +
      "<li class = mypage>"            +
        "<a class = myLink01 href =/users/" +id + ">" +
          "<div class = mypage_main>" +
            "<img class = user_image>" +
            "<span>" + "マイページ" + "</span>" +
          "</div>" +
        "</a>"  +
      "</li>" +
      "<li class = help>"              +
        "<a class = myLink02>" + "ヘルプ" + "</a>" +
      "</li>" +
      "<li class = logout>"            +
        "<a class = myLink03 href = /users/sign_out " + ">" + "ログアウト" + "</a>"
      "</li>" +
    "</ul>"
    return list;
}


$(function(){

  $(document).on("turbolinks:load", function(){
    $("#user_image").on("click", function(e){
      console.log("hogehoge");
      e.preventDefault();
      $.ajax({
        url: "",
        type: "GET",
        dataType: "json"
      })
        .done(function(data){
          $("#myMenuBox").append(addMypage(data.id))
          $("#user_image").on("click", function(e){
            $("#myMenuBox").remove();
          });
        })
        .fail(function(){
          alert("エラーが発生しました");
        })
    });
  });
});
