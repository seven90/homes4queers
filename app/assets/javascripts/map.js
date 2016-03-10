
$(document).on('ready page:load', function(){
  var canvas = $('#map-show');
      listingLocation = {lat: canvas.data('latitude'), lng: canvas.data('longitude')}

     initMap = function() {
      var map = new google.maps.Map(canvas[0], {
        center: listingLocation,
        zoom: 10
      });

      // var nearbys = window.nearby
      // for(i = 0; i< nearby; i++){
      //   marker = new google.map.Marker({
      //     position: nearbys
      //     map:
      //   });
      // }

      var marker = new google.maps.Marker({
        position: listingLocation,
        map: map
      });

    if (window.nearby) {
      nearby.forEach(function(coord) {
        new google.maps.Marker({
          position: { lat: parseFloat(coord.lat), lng: parseFloat(coord.lng) },
          map: map,

        });
      });
}
    }

    if (canvas.length > 0){
      initMap();
    }

});
