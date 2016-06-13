<%-- 
    Document   : pagesTemplate
    Created on : May 11, 2016, 9:25:18 AM
    Author     : Nada
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="resources/css/pageCustomDesign.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link href='http://fonts.googleapis.com/css?family=Oxygen:400,300,700' rel='stylesheet' type='text/css'/>

        <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,900,700,700italic,900italic' rel='stylesheet' type='text/css'/>

        <link href='http://fonts.googleapis.com/css?family=Niconne' rel='stylesheet' type='text/css'/>
        <!--        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>-->
        <script src="jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script type= "text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.5/angular-route.min.js"></script>-->
        <script src="resources/js/bootstrap.min.js"></script>
        <style>
            body{ margin-top:20px; margin-bottom:20px; background-color:#f0f0f0;}
            #pageHeaders{
                background-color: #f0ad4e;
            }
        </style>

        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGtRP3guELz_t4zDQavl8ronw8E-QCTIo" async defer ></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>


        <!--        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>-->
        <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/angular_material/1.0.0-rc5/angular-material.min.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>

        <!--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>-->
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-aria.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-messages.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>

        <!--        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.min.js"></script>-->
        <!--        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.8/angular-route.min.js.map"></script>-->


        <!-- Angular Material Library -->
        <script src="http://ajax.googleapis.com/ajax/libs/angular_material/1.0.0-rc5/angular-material.min.js"></script>
        <script src="resources/js/app.js" type="text/javascript"></script>
        <script src="resources/js/controller/admin_controller.js" type="text/javascript"></script>
        <script src="resources/js/directives/starRatingDirective.js" type="text/javascript"></script>
        <script src="resources/js/controller/myMapJS.js" type="text/javascript"></script>
        <script src="resources/js/controller/order_controller.js" type="text/javascript"></script>
        <script src="resources/js/controller/cookMenuController.js" type="text/javascript"></script>
        <script src="resources/js/controller/CookProfileController.js" type="text/javascript"></script>
        <script src="resources/js/controller/CustomerController.js" type="text/javascript"></script>
        <script src="resources/js/controller/CookController.js" type="text/javascript"></script>
        <script src="resources/js/service/admin_service.js" type="text/javascript"></script>
        <script src="resources/js/service/mainService.js" type="text/javascript"></script>
        <script src="resources/js/service/CookService.js" type="text/javascript"></script>
        <script src="resources/js/service/myMapService.js" type="text/javascript"></script>
        <script src="resources/js/service/pageIntegerationService.js" type="text/javascript"></script>
        <script src="resources/js/service/cookMenuService.js" type="text/javascript"></script>
        <script src="resources/js/service/RegisterService.js" type="text/javascript"></script>
        <script src="resources/js/service/order_service.js" type="text/javascript"></script>
        <script src="resources/js/service/profile_service.js" type="text/javascript"></script>




        <!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGtRP3guELz_t4zDQavl8ronw8E-QCTIo" async defer ></script>-->


    </head>

    <body ng-app="myApp">
        <tiles:insertAttribute name="header"></tiles:insertAttribute>
            <br>
            <br>
        <tiles:insertAttribute name="body"></tiles:insertAttribute>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br> 
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br> 
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br> 
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br> 
            <br>

        <%--<tiles:insertAttribute name="body"></tiles:insertAttribute>--%>
    </body>
</html> 
