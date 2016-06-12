<%-- 
    Document   : RegiserationSuccess
    Created on : Jun 11, 2016, 11:16:51 AM
    Author     : Nada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<br>
<br>
<br>
<br>
<div class="generic-container">
    <div class="alert alert-success lead">
        ${success}
    </div>

    <span class="well pull-left">
        <a href="/Etbo5ly-Web/add-document.htm?id=${cook.id}">Click here to upload your documents</a>   
    </span>
    <!--    <span class="well pull-right">
            Go to <a href="<c:url value='/list' />">Users List</a>
        </span>-->
</div>