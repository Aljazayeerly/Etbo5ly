<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!--Fixed Menu Bar-->
<div class="navbar navbar-inverse navbar-fixed-top" id="myHeader">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
<!--            <a class="navbar-brand" href="#">Etbo5ly</a>-->
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="home.htm"><img src="resources/images/EtbokhlyWebLogoDesign_WebLogo.png" style="height:40px;width:80px;"></a></li>
                <li class="active"><a href="home.htm" style="height:70px;"><fmt:message key="home"/></a></li>
                    <sec:authorize access="!isAuthenticated()">
                    <li><a href="login.htm"><fmt:message key="login"/></a></li>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                    <li><a href="login.htm?logout" style="height:70px;"><fmt:message key="logout"/></a></li>
                    </sec:authorize>

                <sec:authorize access="!isAuthenticated()">
                    <li><a href="register.htm" style="height:70px;"><fmt:message key="register"/></a></li>
                    </sec:authorize>
                    <sec:authorize access="!isAuthenticated()">

                    <li><a href="joinUS.htm" style="height:70px;"><fmt:message key="joinUs"/></a></li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('COOK')">
                    <li><a href="cookOrders.htm"style="height:70px;"><fmt:message key="myorders"/></a></li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('CUSTOMER')">
                    <li><a href="customerOrders.htm" style="height:70px;"><fmt:message key="myorders"/></a></li>
                    </sec:authorize>


<!--                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><fmt:message key="language"/><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="?lang=en">English</a></li>
                        <li><a href="?lang=ar_EG">Arabic</a></li>
                    </ul>
                </li>-->

            </ul>
        </div>
    </div>
</div>