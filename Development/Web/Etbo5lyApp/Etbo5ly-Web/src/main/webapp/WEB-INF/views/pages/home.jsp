<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script
src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular.min.js"></script>
<script
src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-animate.min.js"></script>
<script
src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-aria.min.js"></script>
<script
src="//ajax.googleapis.com/ajax/libs/angular_material/1.1.0-rc2/angular-material.min.js"></script>
<script
src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular-messages.js"></script>
<link rel="stylesheet"
      href="https://ajax.googleapis.com/ajax/libs/angular_material/0.11.2/angular-material.min.css"/>

<header class="headbar">



    <div class="fullbg">

        <div class="row">
            <div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-12">

                <!--        <nav class="navi navbar navbar-default" role="navigation"> -->

                <div class="navbar-header">

                    <button type="button" class="navbar-toggle collapsed navb" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>

                </div>

                <!--        </nav>-->

            </div>

            <div class="col-md-8 col-md-offset-2 col-xs-12 text-center text-banner">
                <!--    <div class="call" style="    margin-top: -34px;">
                                <p> lang : <a class="lang" href="?lang=en">en</a>|<a class="lang" href="?lang=ar_EG">ar</a></p>
                            </div>-->
                <h2><fmt:message key="introducingEtbokhly"/></h2>
                <p><fmt:message key="introducingStatment"/></p>

                <br>
                <br>
                <%--<sec:authorize access="hasRole('CUSTOMER')">--%>
                <div class="demo-content buttondemoBasicUsage">
                    <div class="demo-content buttondemoBasicUsage">
                        <div ng-controller="AppCtrl">
                            <section layout="row" layout-phone="column" layout-align="center center" layout-wrap>
                                <sec:authorize access="hasRole('CUSTOMER')">
                                    <md-button class="md-accent md-raised md-hue-1" id="buttons" ng-href="neighbouringKitchen.htm">Neighbourhood Kitchens</md-button>
                                    <md-button class="md-accent md-raised md-hue-1" id="buttons" ng-href="kitchen.htm">Choose Your meal</md-button>
                                    </sec:authorize>
                                    <sec:authorize access="hasRole('COOK')">
                                    <md-button class="md-accent md-raised md-hue-1" id="buttons" ng-href="addItem.htm">Add Item</md-button>
                                    <!--                            <md-button class="md-accent md-raised md-hue-1" id="buttons">Catering</md-button>-->
                                    <!--                            <button class="md-raised md-primary">Catering</button>-->
                                    <div class="label"></div>
                                </sec:authorize>
                                <sec:authorize access="hasRole('ADMIN')">
                                    <md-button class="md-accent md-raised md-hue-1" id="buttons" ng-href="adminConfirmCooks.xhtml">Verify Cooks</md-button>

                                </sec:authorize>
                            </section>
                        </div>
                        <%--</sec:authorize>--%>
                    </div>

                </div>

            </div>

            </header>
            <div class="container-fluid footer section-container">

                <div class="row">

                    <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">

                        <h3><fmt:message key="contact"/><spring:message code="contact" /></h3>

                        <span class="header-text"><fmt:message key="etbokhly"/></span> </div>

                    <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">

                        <div class="col-md-6 col-sm-6 address">

                            <p><fmt:message key="Address"/></p>

                            <!--        <p>Street-7 Local Highway,</p>
                            
                                    <p>Newyork - 392001</p>-->

                        </div>

                        <div class="col-md-6 col-sm-6 social">

                            <ul>

                                <li><a href="#"><i class="fa fa-twitter-square"></i></a></li>

                                <li><a href="#"><i class="fa fa-facebook-square"></i></a></li>

                                <li><a href="#"><i class="fa fa-google-plus-square"></i></a></li>

                                <li><a href="#"><i class="fa fa-linkedin-square"></i></a></li>

                            </ul>

                        </div>

                    </div>

                </div>

            </div>