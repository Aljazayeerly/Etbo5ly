<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="myApp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Etbo5ly</title>
            <!--            <link rel="stylesheet" href="resources/css/screen.css" 
                              type="text/css" media="screen, projection"></link>
                        <link rel="stylesheet" href="resources/css/print.css" 
                              type="text/css" media="print"></link>-->
            <!--[if IE]>
            <link rel="stylesheet" href="resources/css/ie.css" 
                  type="text/css" media="screen, projection">
            <![endif]-->
            <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/angular_material/1.0.0-rc5/angular-material.min.css"/>
            <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
            <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.min.js"></script>
            <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-aria.min.js"></script>
            <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-messages.min.js"></script>

            <!-- Angular Material Library -->
            <script src="http://ajax.googleapis.com/ajax/libs/angular_material/1.0.0-rc5/angular-material.min.js"></script>
            <script src="resources/js/home.js"></script>

            <link href="resources/css/bootstrap.min.css" rel="stylesheet"/>
            <link href="resources/css/styles.css" rel="stylesheet"/>
            <link href="resources/css/angularDirectiveStyle.css" rel="stylesheet"/>

            <style>
                body{ margin-top:20px; margin-bottom:20px; background-color:#DFDFDF;}
            </style>
            <link href='http://fonts.googleapis.com/css?family=Oxygen:400,300,700' rel='stylesheet' type='text/css'/>

            <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,900,700,700italic,900italic' rel='stylesheet' type='text/css'/>

            <link href='http://fonts.googleapis.com/css?family=Niconne' rel='stylesheet' type='text/css'/>

    </head>
    <body>
        <!--        <div class="container" style="border: #C1C1C1 solid 1px; border-radius:10px;">-->
        <!-- Header -->
        <tiles:insertAttribute name="header" />
        <!--             Menu Page 
                    <div class="span-5  border" style="height:400px;background-color:#FCFCFC;">
        <%--<tiles:insertAttribute name="menu" />--%>
    </div>-->
        <!--             Body Page 
        -->            <div class="span-19 last">
            <tiles:insertAttribute name="body" />
        </div>
        <!-- Footer Page -->
        <tiles:insertAttribute name="footer" />
        <!--        </div>-->
        <!--       js for  Fixed Navigator bar -->  
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!--<script src="resources/js/bootstrap.min.js"></script>-->
    </body>
</html>