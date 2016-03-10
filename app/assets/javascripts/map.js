
$(document).on('ready page:load', function(){
  var canvas = $('#map-show');
  listingLocation = {lat: canvas.data('latitude'), lng: canvas.data('longitude')}

  initMap = function() {
    var map = new google.maps.Map(canvas[0], {
      center: {lat: 43.7, lng: -79.4},
      zoom: 10
  });

  var manyIcon = ('/pride_flag.gif')
  var singleIcon = ('/google_pin.png')

  var marker = new google.maps.Marker({
    position: listingLocation,
    map: map,
    animation: google.maps.Animation.DROP,
    icon: singleIcon
  });

//window.nearby used for show nearby listings and index all listings cause laziness or DRY
  if (window.nearby) {
    nearby.forEach(function(coord) {
      new google.maps.Marker({
        position: { lat: parseFloat(coord.lat), lng: parseFloat(coord.lng) },
        map: map,
        animation: google.maps.Animation.DROP,
        icon: manyIcon

      });
    });
  }

}

  if (canvas.length > 0){
    initMap();
  }

});
