
$(document).on('ready page:load', function(){
  if ($('#map-index').length > 0){
    var canvas = $('#map-index');
  }else if ($('#map-show').length > 0){
    var canvas = $('#map-show');
    listingLocation = {lat: canvas.data('latitude'), lng: canvas.data('longitude')}
  }

  initMap = function() {
    var map = new google.maps.Map(canvas[0], {
      // center: {lat: 43.7, lng: -79.4},
      // center: new google.maps.LatLng(mapMarker[0].lat, mapMarker[0].lng),
      zoom: 10

    });

    var manyIcon = ('/pride_flag.gif')
    var singleIcon = ('/google_pin.png')

  // var latLngBounds = new google.maps.LatLngBounds();
  if (window.nearby) {
    var latlngbounds = new google.maps.LatLngBounds();

    nearby.forEach(function(listing) {
      var mapMarker = new google.maps.Marker({
        position: { lat: parseFloat(listing.lat), lng: parseFloat(listing.lng) },
        // position: markerBounds
        map: map,
        animation: google.maps.Animation.DROP,
        icon: manyIcon
      });

      var listingInfo =
        "<div id='listing-info'>"+
          "<h4>"+ listing.name + "</h4>"+
          "<img src='/uploads/image/photo/"+listing.id+"/"+listing.image+"'/>"+
          "<p>" + listing.desc + "</p>"+
          "<p>" +"$" +listing.price + "</p>"+
          "<p>" +"Bedrooms: " + listing.bedrooms + "</p>"+
          "<p>" + "Date Available: " + listing.date + "</p>"+
          "<a href=/listings/" + listing.id + ">" + 'Go!' +"</a>"+
        "</div>"
      var infoWindow = new google.maps.InfoWindow({
        content: listingInfo
      });
      mapMarker.addListener('click',function(){
        console.log("clicky mappy");
        console.log(listing.name);
        infoWindow.open(map, mapMarker);

      });

      latlngbounds.extend(mapMarker.position);

    });

      //  //Center map and adjust Zoom based on the position of all markers.


  }
  if ($('#map-show').length >0){

    var marker = new google.maps.Marker({
      position: listingLocation,
      map: map,
      animation: google.maps.Animation.DROP,
      icon: singleIcon
    });
    map.setCenter(marker.position);
  }
  else if(window.nearby){
    console.log(latlngbounds)
    map.setCenter(latlngbounds.getCenter());
    map.fitBounds(latlngbounds);
  }
  // else{
  //   map.setCenter(marker.position);
  // }

}

  if (canvas.length > 0){
    initMap();
  }
});
