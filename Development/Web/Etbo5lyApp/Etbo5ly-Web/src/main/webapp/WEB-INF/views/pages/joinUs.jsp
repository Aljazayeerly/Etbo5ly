<%-- 
    Document   : joinUs
    Created on : Jun 8, 2016, 10:06:23 AM
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
    <div class="box"  ng-controller="JoinUsController">
        

        <form:form  method="post" commandName="cook"  name="cook" enctype="multipart/form-data" action="/cook/joinus">
            <%--<form:errors path="*" element="div"/>--%>
            <div class="form-group">
                <label  id="rLabel"><fmt:message key="name"/></label>
                <form:input type="text" class="form-control" id="name"  name="name" path="name" ng-model="name" required="true" ng-minlength="4" ng-maxlength="15" ng-pattern="/[a-zA-Z]+/"></form:input>
                <%--<form:errors cssClass="error" path="name"/>--%>
                <br>
                <ng-messages for="cook.name.$error" style="color:maroon" role="alert" md-auto-hide="false">
                    <ng-message when="minlength"><fmt:message key="userName.minLength"/></ng-message>
                    <ng-message when="maxlength"><fmt:message key="userName.maxLength"/></ng-message>
                    <ng-message when="required"><fmt:message key="userName.required"/></ng-message>
                    <ng-message when="pattern"><fmt:message key="userName.pattern"/></ng-message>
                </ng-messages>

            </div>
            <div class="form-group">
                <label  id="rLabel"><fmt:message key="email"/></label>
                <form:input  class="form-control"  name="email" id="email" path="email" ng-model="email" required="true" type="email" ng-blur="checkCookMail()"></form:input>
                    <ng-messages for="cook.email.$error" style="color:maroon" role="alert" md-auto-hide="false">
                        <ng-message when="email"><fmt:message key="email.valid"/></ng-message>
                    <ng-message when="required"><fmt:message key="email.required"/></ng-message>
                </ng-messages>
                <!--                 <div id="emailErrors">{{$scope.AlreadyCustomer}}</div>-->
                <div><label ng-bind="AlreadyCustomer" style="color:maroon" role="alert"></label></div>
            </div>
            <div class="form-group">
                <label  id="rLabel"><fmt:message key="password"/></label>
                <form:input type="password" class="form-control" id="password" name="password" path="password" ng-model="password" required="true" ng-minlength="6" ng-maxlength="15"></form:input>
                    <ng-messages for="cook.password.$error" style="color:maroon" role="alert" md-auto-hide="false">
                    <ng-message when="email"><fmt:message key="email.valid"/></ng-message>
                    <ng-message when="required"><fmt:message key="password.required"/></ng-message>
                    <ng-message when="minlength"><fmt:message key="password.minLength"/></ng-message>
                    <ng-message when="maxlength"><fmt:message key="password.maxLength"/></ng-message>
                </ng-messages>

            </div>
            <div class="form-group">
                <label id="rLabel"><fmt:message key="phone"/></label>
                <form:input type="text" class="form-control" name="phone" id="phone" path="phone" ng-model="phone" required="true" ng-pattern="/^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/"></form:input>
                    <ng-messages for="cook.phone.$error" style="color:maroon" role="alert" md-auto-hide="false">
                        <ng-message when="pattern"><fmt:message key="phone.valid"/></ng-message>
                    <ng-message when="required"><fmt:message key="phone.required"/></ng-message>
                </ng-messages>
            </div>
            <div class="form-group">
                <label  id="rLabel"><fmt:message key="address"/></label>
                <form:input type="text" class="form-control" id="address" name="address" path="address" ng-model="address" required="true"></form:input>
                    <ng-messages for="cook.address.$error" style="color:maroon" role="alert" md-auto-hide="false">
                        <ng-message when="required"><fmt:message key="address.required"/></ng-message>
                </ng-messages>
            </div>
            <div class="form-group">
                <label id="rLabel"><fmt:message key="startWorkingHours"/></label>
                <form:input type="text" class="form-control" id="address" name="startWorkingHours" path="startWorkingHours" ng-model="SworkingHour" required="true" ng-pattern="/^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/"></form:input>
                    <ng-messages for="cook.startWorkingHours.$error" style="color:maroon" role="alert" md-auto-hide="false">
                        <ng-message when="required"><fmt:message key="startWorkingHours.required"/></ng-message>
                    <ng-message when="pattern"><fmt:message key="startWorkingHours.valid"/></ng-message>

                </ng-messages>
            </div>
            <div class="form-group">
                <label id="rLabel"><fmt:message key="endWorkingHours"/></label>
                <form:input type="text" class="form-control" id="address" name="endWorkingHours" path="endWorkingHours" ng-model="EworkingHour" required="true" ng-pattern="/^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/"></form:input>
                    <ng-messages for="cook.endWorkingHours.$error" style="color:maroon" role="alert" md-auto-hide="false">
                        <ng-message when="required"><fmt:message key="endWorkingHours.required"/></ng-message>
                    <ng-message when="pattern"><fmt:message key="endWorkingHours.valid"/></ng-message>
                </ng-messages>
            </div>

            <div class="form-group">
                <label  for="singleSelect"><fmt:message key="location"/> </label>
                <form:select path="regionid" name="singleSelect" id="singleSelect" ng-model="$scope.regionSelected" ng-change="showRegionnSelected($scope.regionSelected)" required="true">
                    <form:option value="">Please Choose your region</form:option>
                    <form:option ng-repeat="region in allregions" value="{{region.regionId}}">{{region.regionName}}</form:option>
                </form:select><br>
                <ng-messages for="cook.singleSelect.$error" style="color:maroon" role="alert" md-auto-hide="false">
                    <ng-message when="required"><fmt:message key="region.required"/></ng-message>
                </ng-messages>
            </div>

            <div class="form-group">
                <label id="rLabel"><fmt:message key="uploadMedicalDocuments"/></label>
                <form:input type="file" path="document" id="file" class="form-control input-sm"/>
                <input type="button" ng-click="uploadFiles()" value="Upload" />
            </div>
            <div class="form-group">
                <label id="rLabel"><fmt:message key="description"/></label>
                <div class="col-md-7">
                    <form:input type="text" path="description" id="description" class="form-control input-sm"/>
                </div>
            </div>
            <div class="form-group">
                <label for="singleSelect"><fmt:message key="documentType"/> </label>
                <form:select path="documentId" name="singleSelects" id="singleSelects" required="true">
                    <form:option value="">Please Choose document type</form:option>
                    <form:option value="1">PDF</form:option>
                    <form:option value="2">Image PNG</form:option>
                    <form:option value="3">zipped file</form:option>
                    <form:option value="4">Image JEPG</form:option>
                </form:select><br>
                <ng-messages for="cook.singleSelects.$error" style="color:maroon" role="alert" md-auto-hide="false">
                    <ng-message when="required"><fmt:message key="type.required"/></ng-message>
                </ng-messages>
            </div>    

            <div class="text-center">
                <button type="submit" class="btn btn-primary" id="rButton" ><i class="fa fa-user-md"></i> <fmt:message key="register"/></button>
            </div>
        </form:form>
    </div>
</div>


