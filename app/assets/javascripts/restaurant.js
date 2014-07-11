$(document).ready( function() {
  $(".manual_restaurant").hide();
  $(".show_manual_restaurant").click(function(event){
    event.preventDefault();
    $(".manual_restaurant").toggle();
  });
});




