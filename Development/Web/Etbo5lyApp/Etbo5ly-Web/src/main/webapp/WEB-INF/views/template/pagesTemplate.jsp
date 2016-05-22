<%-- 
    Document   : pagesTemplate
    Created on : May 11, 2016, 9:25:18 AM
    Author     : Nada
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="resources/css/pageCustomDesign.css" rel="stylesheet"/>
        <style>
            body{ margin-top:20px; margin-bottom:20px; background-color:#DFDFDF;}
        </style>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>

    </head>
    <body>
        <tiles:insertAttribute name="body"></tiles:insertAttribute>
    </body>
</html>
