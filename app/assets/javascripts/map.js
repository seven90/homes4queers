
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

  var markerBounds = new google.maps.LatLngBounds();

//window.nearby used for show nearby listings and index all listings cause laziness/ DRY
  if (window.nearby) {
    nearby.forEach(function(listing) {
      mapMarker = new google.maps.Marker({
        position: { lat: parseFloat(listing.lat), lng: parseFloat(listing.lng) },
        map: map,
        animation: google.maps.Animation.DROP,
        icon: manyIcon
      });

      var listingInfo =
        "<div id='listing-info'>"+
          "<h4>"+ listing.name + "</h4>"+
        "</div>"
      var infoWindow = new google.maps.InfoWindow({
        content: listingInfo
      });
      mapMarker.addListener('click',function(){
        console.log("clicky mappy");
        console.log(listing.name);
        infoWindow.open(map, mapMarker);

      });
    });
  }

}

  if (canvas.length > 0){
    initMap();
  }

});
