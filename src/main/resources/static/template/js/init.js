$(function () {
  btnPageTop();

  function btnPageTop() {
    var $body = $(document.body);
    var speed = 400; // 스크롤속도
    var $top = "";

    $top = $("<div>")
      .addClass("page__btn_top")
      .html("위로가기")
      .appendTo($body);

    $(window).scroll(function () {
      var y = $(this).scrollTop();
      if (y >= 100) {
        $(".page__btn_top").addClass("on");
      } else {
        $(".page__btn_top").removeClass("on");
      }
    });

    $(".page__btn_top").on("click", function () {
      $("body, html").animate({ scrollTop: 0 }, speed);
    });
  }
});
