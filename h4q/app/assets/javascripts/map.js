// function Map(mapId) {
//   this.mapId = mapId;
// }
//
// Map.prototype.init = function(latitude, longitude){
//   var options = {
//     center: {lat: latitude, long: longitude},
//     zoom: 15,
//     mapTypeId: google.maps.MapTypeId.ROADMAP
//   };
//
//   this.canvas = new google.maps.Map(this.mapId, options);
// }
//
// $(document).on('ready page:load', function(){
//   if ($('#map-show').length) {
//     window.myMap = new Map($('#map-show').get());
//     window.myMap.init(43.6426, -79.3871);
//   }
// })
//
$(document).on('ready page:load', function(){
  var canvas = $('#map-show');
      listingLocation = {lat: canvas.data('latitude'), lng: canvas.data('longitude')}

     window.initMap = function() {
      map = new google.maps.Map(canvas[0], {
        center: listingLocation,
        zoom: 12
      });
      var marker = new google.maps.Marker({
        position: listingLocation,
        map: map
      });
    }


});
