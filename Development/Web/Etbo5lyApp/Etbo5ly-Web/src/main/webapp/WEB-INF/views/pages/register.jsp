<%-- 
    Document   : register
    Created on : May 11, 2016, 9:33:47 AM
    Author     : Nada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!--<link href="/resources/css/font-awesome.css" rel="stylesheet"/>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/resources/css/animate.min.css" rel="stylesheet"/>-->
<!--<link href="resources/css/pageCustomDesign.css" rel="stylesheet"/>-->

<!--<link href="/resources/css/owl.carousel.css" rel="stylesheet"/>
<link href="/resources/css/owl.theme.css" rel="stylesheet"/>-->

<!--    <script src="js/respond.min.js"></script>-->
<style>
    .error {
        color: #ff0000;
    }
</style>

<div class="col-md-6" id="registerbox">
    <div class="box"  ng-controller="RegisterController">
        <h1><fmt:message key="newAccount"/></h1>

        <p class="lead"><fmt:message key="leadParagraph"/></p>
        <p class="text-muted"><fmt:message key="contactInfo"/> <a href=""><fmt:message key="contactUs"/> </a>, <fmt:message key="contactInfo1"/> </p>

        <hr>

        <form:form  method="post" commandName="customer">
            <form:errors path="*" element="div" />
            <div class="form-group">
                <label path="name" id="rLabel"><fmt:message key="name"/></label>
                <input type="text" class="form-control" id="name" path="name" ng-model="name">
                <form:errors cssClass="error" path="name"/>
            </div>
            <div class="form-group">
                <label path="email" id="rLabel"><fmt:message key="email"/></label>
                <input type="text" class="form-control" id="email" path="email" ng-model="email">
                <form:errors cssClass="error" path="email"/>

            </div>
            <div class="form-group">
                <label path="password" id="rLabel"><fmt:message key="password"/></label>
                <input type="password" class="form-control" id="password" path="password" ng-model="password">
                <form:errors cssClass="error" path="password"/>

            </div>
            <div class="form-group">
                <label path="phone" id="rLabel"><fmt:message key="phone"/></label>
                <input type="text" class="form-control" id="phone" path="phone" ng-model="phone">
                <form:errors cssClass="error" path="phone"/>

            </div>
            <div class="form-group">
                <label path="address"id="rLabel"><fmt:message key="address"/></label>
                <input type="text" class="form-control" id="address" path="address" ng-model="address">
                <form:errors cssClass="error" path="address"/>


            </div>
            <div class="form-group">
                <label for="singleSelect"><fmt:message key="location"/> </label>
                <select name="singleSelect" id="singleSelect" ng-model="$scope.regionSelected" ng-change="showRegionnSelected($scope.regionSelected)">
                    <option ng-repeat="region in allregions" value="{{region.regionId}}">{{region.regionName}}</option>
                </select><br>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary" id="rButton" ng-click="registerCustomer(name, password, email, phone, address)"><i class="fa fa-user-md"></i> <fmt:message key="register"/></button>
            </div>
        </form:form>
    </div>
</div>

