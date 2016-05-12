<%-- 
    Document   : register
    Created on : May 11, 2016, 9:33:47 AM
    Author     : Nada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!--<link href="/resources/css/font-awesome.css" rel="stylesheet"/>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/resources/css/animate.min.css" rel="stylesheet"/>-->
<!--<link href="resources/css/pageCustomDesign.css" rel="stylesheet"/>-->

<!--<link href="/resources/css/owl.carousel.css" rel="stylesheet"/>
<link href="/resources/css/owl.theme.css" rel="stylesheet"/>-->

<!--    <script src="js/respond.min.js"></script>-->

<div class="col-md-6">
    <div class="box">
        <h1><fmt:message key="newAccount"/></h1>

        <p class="lead"><fmt:message key="leadParagraph"/></p>
        <p class="text-muted"><fmt:message key="contactInfo"/> <a href=""><fmt:message key="contactUs"/> </a>, <fmt:message key="contactInfo1"/> </p>

        <hr>

        <form action="" method="post">
            <div class="form-group">
                <label for="name" id="rLabel"><fmt:message key="name"/></label>
                <input type="text" class="form-control" id="name">
            </div>
            <div class="form-group">
                <label for="email" id="rLabel"><fmt:message key="email"/></label>
                <input type="text" class="form-control" id="email">
            </div>
            <div class="form-group">
                <label for="password" id="rLabel"><fmt:message key="password"/></label>
                <input type="password" class="form-control" id="password">
            </div>
            <div class="form-group">
                <label for="phone" id="rLabel"><fmt:message key="phone"/></label>
                <input type="text" class="form-control" id="phone">
            </div>
            <div class="form-group">
                <label for="address"id="rLabel"><fmt:message key="address"/></label>
                <input type="text" class="form-control" id="address">
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary" id="rButton"><i class="fa fa-user-md"></i> <fmt:message key="register"/></button>
            </div>
        </form>
    </div>
</div>

