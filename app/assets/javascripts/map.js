function initMap(latlng){
  var map = new google.maps.Map(document.getElementById('map'), {
    center: latlng,
    zoom: 8
  });
  var marker = new google.maps.Marker({
    position: latlng,
    map: map
  });
};

function getLatLng() {
  var geocoder = new google.maps.Geocoder();
  var destination = $("#map").data("address-id");
  geocoder.geocode({
    address: destination
  }, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      for (var i in results) {
        if (results[i].geometry) {
          var latlng = results[i].geometry.location;
          initMap(latlng)
        }
      }
    }
  });
};