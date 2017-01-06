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
    console.log($(this).children);
  });
  var fav_star = 'http://imgur.com/I0EwG.png';
  var resource = $(this);
  // var img = document.getElementById();

}