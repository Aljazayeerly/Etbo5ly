<%-- 
Document   : pagesHeader
Created on : May 21, 2016, 11:06:21 AM
Author     : Nada
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!--Fixed Menu Bar-->
<div class="navbar navbar-inverse navbar-fixed-top" id="pageHeaders">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Etbo5ly</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="home.htm"><fmt:message key="home"/></a></li>
                <sec:authorize access="!isAuthenticated()">
                    <li><a href="login.htm"><fmt:message key="login"/></a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li><a href="login.htm?logout"><fmt:message key="logout"/></a></li>
                </sec:authorize>
                <%--<sec:authorize access="!isAuthenticated()">--%>

                    <li><a href="register.htm"><fmt:message key="register"/></a></li>
                <%--</sec:authorize>--%>
                <%--<sec:authorize access="!isAuthenticated()">--%>

                    <li><a href="joinUS.htm"><fmt:message key="joinUs"/></a></li>
                <%--</sec:authorize>--%>
                <sec:authorize access="hasRole('COOK')">
                    <li><a href="cookOrders.htm"><fmt:message key="myorders"/></a></li>
                </sec:authorize>
                <sec:authorize access="hasRole('CUSTOMER')">
                    <li><a href="customerOrders.htm"><fmt:message key="myorders"/></a></li>
                </sec:authorize>


                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><fmt:message key="language"/><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="?lang=en">English</a></li>
                        <li><a href="?lang=ar_EG">Arabic</a></li>
                    </ul>
                </li>

            </ul>
            <div ng-controller="MenuController as ctrl"  id="headersearch">
                <form action="" method="" class="navbar-form" role="search">

                    <div class="input-group add-on">
                        <input class="form-control" placeholder="Search"  id="srch-term" type="text" ng-model="mealName">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit" ng-click="ctrl.searchForMeal(mealName)">
                                <i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
