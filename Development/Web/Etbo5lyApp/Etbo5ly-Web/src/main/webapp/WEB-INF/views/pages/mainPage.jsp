<%-- 
    Document   : mainPage
    Created on : May 29, 2016, 11:11:19 AM
    Author     : menna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="jumbotron text-center">
    <h1>Authors page</h1>
    <p>This page shows a list of popular and recent authors and it is intended to show the use of Multiple Views.</p> 
</div>

<div class="row">
    <!-- Popular authors named view -->
    <div class="col-sm-6">
        <div ui-view="menu"></div>
    </div>

    <!-- Recent authors named view -->
    <div class="col-sm-6">
        <div ui-view="order"></div>
    </div>

</div>

