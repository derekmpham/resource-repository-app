$(document).ready(function() {
  handleEventBinders();
});

var handleEventBinders = function() {
  changeFavButton();
}

var changeFavButton = function() {
  $("ul").on("click", "button", function(e){
    e.preventDefault();
    var button = $(this);
    // button.children.closest("i").css("color", "blue");
    button.children().first().toggleClass("favorite");
    if (button.children().first().hasClass("favorite")) {
      var url = '/favorites';
      var method = 'POST';
      console.log($(this).parent().siblings().first().attr('id'));
      var data = $(this).parent().siblings().first().attr('id');
      var request = $.ajax({
        url: url,
        method: method,
        data: {resource_id: data}
      });
  }
    else {
      var method = 'delete';
      var data = $(this).parent().siblings().first().attr('id');
      var url = '/favorites/'+data;
      var request = $.ajax({
        url: url,
        method: method
      });
    }
  });

};