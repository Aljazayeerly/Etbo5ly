<%-- 
Document   : pagesHeader
Created on : May 21, 2016, 11:06:21 AM
Author     : Nada
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!--Fixed Menu Bar-->
<div class="navbar navbar-inverse navbar-fixed-top">
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
                <li><a href="login.htm"><fmt:message key="login"/></a></li>
                <li><a href="register.htm"><fmt:message key="register"/></a></li>
                <li><a href="#contact"><fmt:message key="joinUs"/></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><fmt:message key="language"/><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="?lang=en">English</a></li>
                        <li><a href="?lang=ar">Arabic</a></li>
                    </ul>
                </li>

            </ul>
            <div id="headersearch">
                <form action="" method="" class="navbar-form" role="search">

                    <div class="input-group add-on">
                        <input class="form-control" placeholder="Search" name="srch-term" id="srch-term" type="text">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div><!--/.nav-collapse -->
    </div>
</div>