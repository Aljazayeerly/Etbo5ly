<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!--Fixed Menu Bar-->
<div class="navbar navbar-inverse navbar-fixed-top" id="myHeader">
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
                <li class="active"><a href="login.htm"><fmt:message key="login"/></a></li>
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
        </div>
    </div>
</div>