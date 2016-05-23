<%-- 
    Document   : kitchens
    Created on : May 21, 2016, 5:53:04 PM
    Author     : Nada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<div id="floating-panel">
    <input id="address" type="textbox">
    <input id="submit" type="button" value="Geocode">
</div>-->

<div id="map"></div>
<style>
    #map {
        width: 1350px;
        height: 600px;

    }
    #floating-panel {
        position: absolute;
        top: 60px;
        left: 50%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
    }
</style>
<script>
    function initMap() {
//        alert("inside initMap method");
        var mapDiv = document.getElementById('map');
        var map = new google.maps.Map(mapDiv, {
            center: {lat: 44.540, lng: -78.546},
            zoom: 8
        });
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            alert("navigator is not on , sorry please enable your location so we can find you");
        }

    }
    function showPosition(position) {
        var mapDiv = document.getElementById('map');
        var map = new google.maps.Map(mapDiv, {
            center: {lat: position.coords.latitude, lng: position.coords.longitude},
            zoom: 12
        });
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(position.coords.latitude, position.coords.longitude),
            map: map
        });
        
//        var geocoder = new google.maps.Geocoder();
//        document.getElementById('submit').addEventListener('click', function () {
//            geocodeAddress(geocoder, map);
//        });

        $.ajax({
            type: 'GET',
            url: "/Etbo5ly-Web/rest/cook/nearbyCooks?long=" + position.coords.longitude + "&latit=" + position.coords.latitude + "",
            dataType: "json",
            success: function (data) {
                //  alert (" the data send was " + JSON.stringify(data))  ;
                var nearbyCooks = JSON.stringify(data);
                $.each(data, function (index, element) {
                    //alert(element.latitude);
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(element.latitude, element.longitude),
                        map: map
                    });
                });

            }
        });
    }

//    function geocodeAddress(geocoder, resultsMap) {
//        var address = document.getElementById('address').value;
//        geocoder.geocode({'address': address}, function (results, status) {
//            if (status === google.maps.GeocoderStatus.OK) {
//                resultsMap.setCenter(results[0].geometry.location);
//                var marker = new google.maps.Marker({
//                    map: resultsMap,
//                    position: results[0].geometry.location
//                });
//            } else {
//                alert('Geocode was not successful for the following reason: ' + status);
//            }
//        });
//    }

</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGtRP3guELz_t4zDQavl8ronw8E-QCTIo&callback=initMap" async defer ></script>

