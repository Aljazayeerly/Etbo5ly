<%-- 
    Document   : kitchens
    Created on : May 21, 2016, 5:53:04 PM
    Author     : Nada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="map"></div>
<script>
    function initMap() {
        alert("inside initMap method");
        var mapDiv = document.getElementById('map');
        alert("mapDiv  is"+ mapDiv );
        var map = new google.maps.Map(mapDiv, {
            center: {lat: 44.540, lng: -78.546},
            zoom: 8
              });
        
//        if (navigator.geolocation) {
//            navigator.geolocation.getCurrentPosition(showPosition);
//        } else {
//            alert("inside the else ya zft ");
////            var mapDiv = document.getElementById('map');
////            var map = new google.maps.Map(mapDiv, {
////                center: {lat: 44.540, lng: -78.546},
////                zoom: 8});
//        }

    }
//
//    function showPosition(position) {
//        var mapDiv = document.getElementById('map');
//        var map = new google.maps.Map(mapDiv, {
//            center: {lat: position.coords.latitude, lng: position.coords.longitude},
//            zoom: 8
//        });
//         var marker = new google.maps.Marker({
//            position: new google.maps.LatLng(position.coords.latitude,position.coords.longitude),
//            map: map
//          });
//    }
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGtRP3guELz_t4zDQavl8ronw8E-QCTIo&callback=initMap" async defer ></script>

