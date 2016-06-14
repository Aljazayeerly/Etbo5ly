<%-- 
    Document   : addItem
    Created on : Jun 12, 2016, 3:08:53 PM
    Author     : salma
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
    <div class="box" ng-controller="JoinUsController" >

        <form:form  method="post" commandName="addItem" name="meal"  action="addItem.htm">         
            <div class="form-group">
                <label  id="rLabel">Meal Name</label>

                <form:input type="text" class="form-control" id="nameEn"  name="nameEn" path="nameEn" ng-model="name" ></form:input>
                <%--<form:errors cssClass="error" path="name"/>--%>
            </div>
            <div class="form-group">
                <label  id="rLabel">Price</label>
                <form:input  class="form-control"  name="price" id="price" path="price"  ></form:input>

                </div>
                <div class="form-group">
                    <label  id="rLabel" >Description</label>
                <form:input  type="text" class="form-control" id="descriptionEn" name="descriptionEn" path="descriptionEn"  ></form:input >

                </div>
                <div class="form-group">
                    <label  id="rLabel" >Categories</label>

                <form:select path="checked" name="singleSelect" id="singleSelect" ng-model=" $scope.categorySelected" ng-change="showCategorySelected($scope.categorySelected)" required="true">
                    <form:option value="">Please Choose meal's category</form:option>
                    <form:option ng-repeat="category in categories" value="{{category.categoryId}}">{{category.nameEn}}</form:option>
                </form:select><br>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary" id="rButton"  ><i class="fa fa-user-md"></i> Add Item</button>
            </div>
        </form:form >
    </div>
</div>



