<%-- 
    Document   : kitchen
    Created on : May 21, 2016, 12:37:35 PM
    Author     : salma
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!--<!DOCTYPE html>-->
<!--<html>
-->   
<!--<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../../../resources/css/menuStyle.css" rel="stylesheet" type="text/css"/>
    </head>-->
<!--    <body>
        <h1>Hello World!</h1>
    </body>
</html>-->
<div class="col-md-3">
    <!-- *** MENUS AND FILTERS ***
_________________________________________________________ -->
    <div class="panel panel-default sidebar-menu">

        <div class="panel-heading">
            <h3 class="panel-title"><font color="#f0ad4e"><b>Cooks</b></font></h3>
        </div>

        <div class="panel-body">
            <ul class="nav nav-pills nav-stacked category-menu">
                <li>
                    <a href="category.html">Salma's Menu </a>
                </li>
            </ul>
            <ul class="nav nav-pills nav-stacked category-menu">
                <li><a href="category.html">Menna's Menu </a>
                </li>
            </ul>
            <ul class="nav nav-pills nav-stacked category-menu">
                <li><a href="category.html">Nada's Menu</a>
                </li>

            </ul>   

        </div>
    </div>

    <div class="panel panel-default sidebar-menu">

        <div class="panel-heading">
            <h3 class="panel-title"><font color="#f0ad4e"><b>Categories</b></font></h3>
        </div>

        <div class="panel-body">

            <form>
                <div class="form-group">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox">Sandwich
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox">Salad
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox">Pasta
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox">Soup
                        </label>
                    </div>
                </div>

                <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>

            </form>

        </div>
    </div>

    <div class="panel panel-default sidebar-menu">

        <div class="panel-heading">
            <h3 class="panel-title"><font color="#f0ad4e"><b>Locations</b></font></h3>
        </div>

        <div class="panel-body">

            <form>
                <div class="form-group">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox">Nasr City
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> 6th October
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox">Maadi
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox">Sheraton
                        </label>
                    </div>

                </div>

                <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>

            </form>

        </div>
    </div>
</div>



<div ng-app="myApp">
    <section  ng-controller="MenuController as ctrl"  style="width: 4000px; left: 5000px">

        <div ng-repeat="i in ctrl.items" style="left: 390px;width: 600px;height: 200px;margin: 2em 0;border: 3px solid #E18728;border-radius: 10px;background-color: white;padding-left: 55px;position: relative;">
            <div style="position: relative">
                <div style="margin-left: 340px;">
                    <label style="color: #E18728; margin-left: -220px; font-size: 15px" ng-bind="i.nameEn"></label>
                    <br>
                    <label style="color: gray; margin-left: -220px; font-size: 13px" ng-bind="i.cookName"></label>
                    <div >
                        <label style="color: black; margin-left: -220px; font-size: 10px" ng-bind="i.descriptionEn"></label>
                    </div>
                </div>
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/652/ada-small.jpeg" style="margin-left: -360px;margin-top: -90px;">
            </div>
        </div>  
    </section>
</div>

<!--<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">-->
<div class="col-md-3" style="width:30%;height: 50%;left: 50px; margin-left: 65%;margin-top: 70px;">
    <table id="cart" class="table table-hover table-condensed">
        <thead>    
            <tr>   
                <th style="width:50%">Product</th>
                <th style="width:10%">Price</th>
                <th style="width:8%">Quantity</th>
                <th style="width:22%" class="text-center">Subtotal</th>
                <th style="width:10%"></th>
            </tr>   
        </thead>        
        <tbody>   
            <tr>   
                <td data-th="Product">
                    <div class="row">
                        <div class="col-sm-2 hidden-xs"><img src="http://placehold.it/100x100" alt="..." class="img-responsive"/></div>
                        <div class="col-sm-10">
                            <h4 class="nomargin">Product Name</h4>
                            <p>Ay Klam </p>
                        </div>
                    </div>
                </td>
                <td data-th="Price">$1.99</td>
                <td data-th="Quantity">
                    <input type="number" class="form-control text-center" value="1">
                </td>
                <td data-th="Subtotal" class="text-center">1.99</td>
                <td class="actions" data-th="">
                    <button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
                    <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>								
                </td>
            </tr>
        </tbody>
        <tfoot>
            <tr class="visible-xs">
                <td class="text-center"><strong>Total 1.99</strong></td>
            </tr>
            <tr>
                <td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
                <td colspan="2" class="hidden-xs"></td>
                <td class="hidden-xs text-center"><strong>Total $1.99</strong></td>
                <td><a href="#" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
            </tr>
        </tfoot>
    </table>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="resources/js/controller/admin_controller.js" type="text/javascript"></script>
<!--<script src="resources/js/app.js" type="text/javascript"></script>-->
<script src="resources/js/service/admin_service.js" type="text/javascript"></script>
<script src="resources/js/service/mainService.js" type="text/javascript"></script>