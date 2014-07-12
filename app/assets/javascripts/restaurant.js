$(document).ready( function() {
  $(".manual_restaurant").hide();
  $(".show_manual_restaurant").click(function(event){
    event.preventDefault();
    $(".yelp_search_and_results").hide();
    $(".manual_restaurant").show();
  });
});

// var map;
// map = L.mapbox.map('map', 'calebnthill.ioeb36fl').setView([42.352, -71.066], 13);

// $.ajax
//   dataType: 'text'
//   url: 'restaurants/index.json'
//   success: (data) ->
//     geojson = $.parseJSON(data)
//     map.featureLayer.setGeoJSON(geojson)


