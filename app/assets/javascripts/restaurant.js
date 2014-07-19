$(document).ready( function() {
  $(".manual_restaurant").hide();
  $(".show_manual_restaurant").click(function(event){
    event.preventDefault();
    $(".yelp_search_and_results").hide();
    $(".manual_restaurant").show();
  });
});

$(function (){
  $("#myModel").modal({show: false });
});


$("#search").click(function(){
  $("#search").addClass("active");
});

