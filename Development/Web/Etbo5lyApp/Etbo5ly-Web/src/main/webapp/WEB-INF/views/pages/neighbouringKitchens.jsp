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
<!--<div ng-app="aa">-->
<div id="map" ng-controller="mapController">
    <!--    <div class="dialog-demo-content" layout="row" ayout="row" layout-wrap layout-margin layout-align="center">
    
            <md-button class="md-primary md-raised" ng-click="showAdvanced($event)">
                Custom Dialog
            </md-button>-->
</div>
<!--</div>-->
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
<!--<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/angular_material/1.0.0-rc5/angular-material.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-aria.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-messages.min.js"></script>

 Angular Material Library 
<script src="http://ajax.googleapis.com/ajax/libs/angular_material/1.0.0-rc5/angular-material.min.js"></script>
<script src="resources/js/app.js" type="text/javascript"></script>
<script src="resources/js/controller/myMapJS.js" type="text/javascript"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGtRP3guELz_t4zDQavl8ronw8E-QCTIo" async defer ></script>
<script src="resources/js/service/myMapService.js" type="text/javascript"></script>
<script src="resources/js/service/pageIntegerationService.js" type="text/javascript"></script>
<script src="resources/js/service/admin_service.js" type="text/javascript"></script>
<script src="resources/js/service/mainService.js" type="text/javascript"></script>-->