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
    <div class="box"  ng-controller="JoinUsController">



        <form  method="post" commandName="meal"  name="meal" enctype="multipart/form-data" >
            <%--<form:errors path="*" element="div"/>--%>
            <div class="form-group">
                <label  id="rLabel">Meal Name</label>
                <input type="text" class="form-control" id="name"  name="name" path="name" ng-model="name" ></input>
                <%--<form:errors cssClass="error" path="name"/>--%>
            </div>
            <div class="form-group">
                <label  id="rLabel">Price</label>
                <input  class="form-control"  name="price" id="price" path="price" ng-model="price" ></input>

                </div>
                <div class="form-group">
                    <label  id="rLabel" >Description</label>
                <input type="text" class="form-control" id="description" name="description" path="description" ng-model="description" ></input>

                </div>

<!--                <div class="form-group">
                    <label id="rLabel">Categories</label>
                <label ng-repeat="category in categories">
                    <input type="checkbox" checklist-model="meal.categories" checklist-value="category"> {{category}}
                </label>
            </div>-->






                        <!--<div class="form-group">-->
                            <!--<label id="rLabel"></label>-->
            <%--<form:input type="file" path="document" id="file" class="form-control input-sm"/>--%>
<!--            <input type="button" ng-click="uploadFiles()" value="Upload" />
        </div>-->


            <div class="text-center">
                <button type="submit" class="btn btn-primary" id="rButton" ng-submit="addItemToMenu(name,price,description)" ><i class="fa fa-user-md"></i> Add Item</button>
            </div>
        </form>
    </div>
</div>



