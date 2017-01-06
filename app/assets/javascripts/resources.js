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
    console.log(button.children().first());
    // button.children.closest("i").css("color", "blue");
    button.children().first().toggleClass("favorite");
  });

};