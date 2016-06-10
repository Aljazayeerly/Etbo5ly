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

        <form:form  method="post" commandName="customer" name="customer">
            <form:errors path="*" element="div" />
            <div class="form-group">
                <label path="name" id="rLabel"><fmt:message key="name"/></label>
                <input type="text" class="form-control" id="name"  name="name" path="name" ng-model="name" required="true" ng-minlength="4" ng-maxlength="15" ng-pattern="/[a-zA-Z]+/">
                <%--<form:errors cssClass="error" path="name"/>--%>
                <br>
                <ng-messages for="customer.name.$error" style="color:maroon" role="alert" md-auto-hide="false">
                    <ng-message when="minlength"><fmt:message key="userName.minLength"/></ng-message>
                    <ng-message when="maxlength"><fmt:message key="userName.maxLength"/></ng-message>
                    <ng-message when="required"><fmt:message key="userName.required"/></ng-message>
                    <ng-message when="pattern"><fmt:message key="userName.pattern"/></ng-message>
                </ng-messages>

            </div>
            <div class="form-group">
                <label path="email" id="rLabel"><fmt:message key="email"/></label>
                <input  class="form-control"  name="email" id="email" path="email" ng-model="email" required="true" type="email" ng-blur="checkMail()">
                <ng-messages for="customer.email.$error" style="color:maroon" role="alert" md-auto-hide="false">
                    <ng-message when="email"><fmt:message key="email.valid"/></ng-message>
                    <ng-message when="required"><fmt:message key="email.required"/></ng-message>
                </ng-messages>
<!--                 <div id="emailErrors">{{$scope.AlreadyCustomer}}</div>-->
                 <div><label ng-bind="AlreadyCustomer" style="color:maroon" role="alert"></label></div>
            </div>
            <div class="form-group">
                <label path="password" id="rLabel"><fmt:message key="password"/></label>
                <input type="password" class="form-control" id="password" name="password" path="password" ng-model="password" required="true" ng-minlength="6" ng-maxlength="15">
                <ng-messages for="customer.password.$error" style="color:maroon" role="alert" md-auto-hide="false">
                    <ng-message when="email"><fmt:message key="email.valid"/></ng-message>
                    <ng-message when="required"><fmt:message key="password.required"/></ng-message>
                    <ng-message when="minlength"><fmt:message key="password.minLength"/></ng-message>
                    <ng-message when="maxlength"><fmt:message key="password.maxLength"/></ng-message>
                </ng-messages>

            </div>
            <div class="form-group">
                <label path="phone" id="rLabel"><fmt:message key="phone"/></label>
                <input type="text" class="form-control" name="phone" id="phone" path="phone" ng-model="phone" required="true" ng-pattern="/^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/">
                <ng-messages for="customer.phone.$error" style="color:maroon" role="alert" md-auto-hide="false">
                    <ng-message when="pattern"><fmt:message key="phone.valid"/></ng-message>
                    <ng-message when="required"><fmt:message key="phone.required"/></ng-message>
                </ng-messages>
            </div>
            <div class="form-group">
                <label path="address"id="rLabel"><fmt:message key="address"/></label>
                <input type="text" class="form-control" id="address" name="address" path="address" ng-model="address" required="true">
                <ng-messages for="customer.address.$error" style="color:maroon" role="alert" md-auto-hide="false">
                    <ng-message when="required"><fmt:message key="address.required"/></ng-message>
                </ng-messages>
            </div>
            <div class="form-group">
                <label for="singleSelect"><fmt:message key="location"/> </label>
                <select name="singleSelect" id="singleSelect" ng-model="$scope.regionSelected" ng-change="showRegionnSelected($scope.regionSelected)" required="true">
                    <option value="">Please Choose your region</option>
                    <option ng-repeat="region in allregions" value="{{region.regionId}}">{{region.regionName}}</option>
                </select><br>
                 <ng-messages for="customer.singleSelect.$error" style="color:maroon" role="alert" md-auto-hide="false">
                    <ng-message when="required"><fmt:message key="region.required"/></ng-message>
                </ng-messages>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary" id="rButton" ng-click="registerCustomer(name, password, email, phone, address)"><i class="fa fa-user-md"></i> <fmt:message key="register"/></button>
            </div>
        </form:form>
    </div>
</div>

