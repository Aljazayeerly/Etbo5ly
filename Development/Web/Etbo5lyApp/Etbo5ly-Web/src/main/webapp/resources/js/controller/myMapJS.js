/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
'use strict';
//var App = angular.module('myApp', ['ngMaterial']);
App.controller('mapController', ['$scope', 'MapService', '$mdDialog', '$mdMedia', 'PageService', function ($scope, MapService, $mdDialog, $mdMedia, PageService) {

        $scope.items = [];
        $scope.cook;
        $scope.customFullscreen = $mdMedia('xs') || $mdMedia('sm');

        $scope.showCookInformation = function (ev) {
            var useFullScreen = ($mdMedia('sm') || $mdMedia('xs')) && $scope.customFullscreen;
            $mdDialog.show({
                controller: DialogController,
                templateUrl: 'cooksInformation.htm',
                parent: angular.element(document.body),
                targetEvent: ev,
                clickOutsideToClose: true,
                fullscreen: useFullScreen
            })
                    .then(function (answer) {
                        $scope.status = 'You said the information was "' + answer + '".';
                    }, function () {
                        $scope.status = 'You cancelled the dialog.';
                    });
            $scope.$watch(function () {
                return $mdMedia('xs') || $mdMedia('sm');
            }, function (wantsFullScreen) {
                $scope.customFullscreen = (wantsFullScreen === true);
            });
        };



        $scope.showPosition = function (position) {
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

            MapService.getnearbyCooks(position.coords.latitude, position.coords.longitude)
                    .then(
                            function (data) {
                                $scope.items = data;
                                var nearbyCooks = JSON.stringify(data);
                                $.each(data, function (index, element) {
                                    
                                    marker = new google.maps.Marker({
                                        position: new google.maps.LatLng(element.latitude, element.longitude),
                                        map: map
                                    });

                                    marker.addListener('click', function (cook) {
                                        $scope.cook = element;
                                        var cookjson = JSON.parse(JSON.stringify($scope.cook));
                                       // alert(" element is " + JSON.stringify($scope.cook));
                                        PageService.setElement($scope.cook);
                                        $scope.showCookInformation();
                                    });

                                });
                            },
                            function (errResponse) {
                                console.error('Error while fetching titles');
                            }
                    );
        }

        $scope.initMap = function () {
            alert("inside in the function");
            var mapDiv = document.getElementById('map');
            var map = new google.maps.Map(mapDiv, {
                center: {lat: 44.540, lng: -78.546},
                zoom: 8
            });
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition($scope.showPosition);
            } else {
                alert("navigator is not on , sorry please enable your location so we can find you");
            }
        }

        $scope.initMap();

    }]);


function DialogController($scope, $mdDialog, PageService) {
    $scope.clickedCook;
    $scope.hide = function () {
        $mdDialog.hide();
    };
    $scope.cancel = function () {
        $mdDialog.cancel();
    };
    $scope.answer = function (answer) {
        $mdDialog.hide(answer);
    };
    $scope.clickedCook = PageService.getElement();
//    alert(" the user id is " + clickedCook.id);
//    PageService.getCookMeals(clickedCook.id);
    alert("element send is " + JSON.stringify(PageService.getElement()));
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





