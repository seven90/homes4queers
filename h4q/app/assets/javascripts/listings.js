$(document).on('ready page:load', function() {
  $('#search-nearby').on('click', function() {
    if("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(works, worksNot)
    }
  });
});

function works(position){
  var lat = position.coords.latitude
  var lon = position.coords.longitude
  $.ajax({
    url: '/listings',
    method: 'GET',
    data: {latitude: lat, logitude: lon},
    dataType: 'script'
  })
}

function worksNot(error){
  console.log('AAAAAAAAAH' + error.message);
}
