
$(document).on('ready page:load', function(){
  var canvas = $('#map-show');
      listingLocation = {lat: canvas.data('latitude'), lng: canvas.data('longitude')}

     initMap = function() {
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
