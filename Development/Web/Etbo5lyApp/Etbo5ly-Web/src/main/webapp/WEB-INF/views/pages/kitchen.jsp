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
<div id="mainDiv">
    <div id="categories" class="col-md-3" style="float: left;width: 20%">
    <!-- *** MENUS AND FILTERS ***
_________________________________________________________ -->
    <div class="panel panel-default sidebar-menu">

        <div class="panel-heading">
            <h3 class="panel-title"><font color="#f0ad4e"><b>Cooks</b></font></h3>
        </div>

        <div ng-controller="MenuController as ctrl" class="panel-body">
            <ul ng-repeat="i in ctrl.cooks" class="nav nav-pills nav-stacked category-menu">
                <li>
                    <a href="cook.htm" ng-bind="i.name + '&rsquo;' + 's Menu'"></a>
                </li>
            </ul>
        </div>
    </div>

    <div class="panel panel-default sidebar-menu">

        <div class="panel-heading">
            <h3 class="panel-title"><font color="#f0ad4e"><b>Categories</b></font></h3>
        </div>
        <div ng-controller="MenuController as ctrl" class="panel-body">

            <form>
                <div class="form-group">
                    <div ng-repeat="c in ctrl.categories"class="checkbox">
                        <label>
                            <input type="checkbox" ng-model="checked" >{{c.nameEn}}
                        </label>
                    </div>
                </div>
                <!--checked="false" ng-checked="ctrl.isSelected(c.categoryId,checkedCategories)"  -->
                <button class="btn btn-default btn-sm btn-primary" ng-click="getSelected(checked, checkedCategories)"> Apply</button>
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


<div id="menus">

    <div >
        <section  ng-controller="MenuController as ctrl"  style="width: 4000px; left: 5000px">

            <div ng-show="!searchMeals" ng-repeat="i in ctrl.items" style="left: 390px;width: 600px;height: 200px;margin: 2em 0;border: 3px solid #E18728;border-radius: 10px;background-color: white;padding-left: 55px;position: relative;">
                <div>

                    <div style="margin-left: 340px;">
                        <label style="color: #E18728; margin-left: -220px; font-size: 15px" ng-bind="i.nameEn"></label>
                        <br>
                        <label style="color: gray; margin-left: -220px; font-size: 13px" ng-bind="i.cookName"></label>
                        <div>
                            <label style="color: black; margin-left: -220px; font-size: 10px" ng-bind="i.descriptionEn"></label>
                        </div>
                        <label style="color: #E18728; margin-left: -220px; font-size: 13px" ng-bind="i.price + ' L.E'"></label>

                    </div>
                    <div>
                        <button ng-click="addItem(i.itemId)">Add To Cart</button>
                    </div>
                    <div style="margin-left: 340px;  padding-top: -500px; margin-top: -120px;">

                        <img src="{{i.resourcesURL}}/{{i.imageUrl}}" style="float: left; margin-left: -380px;width: 154px;height: 154px;">
                    </div>

                </div>
            </div>  

            <!--            <div ng-show="searchMeals" ng-repeat="m in ctrl.searchMeals" style="left: 390px;width: 600px;height: 200px;margin: 2em 0;border: 3px solid #E18728;border-radius: 10px;background-color: white;padding-left: 55px;position: relative;">
                            <div>
                                <div style="margin-left: 340px;">
                                    <label style="color: #E18728; margin-left: -220px; font-size: 15px" ng-bind="m.nameEn"></label>
                                    <br>
                                    <label style="color: gray; margin-left: -220px; font-size: 13px" ng-bind="m.cookName"></label>
                                    <div>
                                        <label style="color: black; margin-left: -220px; font-size: 10px" ng-bind="m.descriptionEn"></label>
                                    </div>
                                    <label style="color: #E18728; margin-left: -220px; font-size: 13px" ng-bind="m.price + ' L.E'"></label>
                                </div>
                                <div style="margin-left: 340px; margin-top: -110px;">
                                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/652/ada-small.jpeg" style="float: left; margin-left: -380px; margin-top: -8px;">
                                </div>
                            </div>-->
            <!--            </div>  -->
        </section>
    </div>
</div>


<!--<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">-->
<!--<div class="col-md-3" style="width:30%;height: 50%;left: 50px; margin-left: 65%;margin-top: 70px;">-->
<div class="col-md-3" id="order-summ" style="float: right;width: 20%">

    <div class="box" id="order-summary" ng-controller="MenuController as ctrl">
        <div class="box-header">
            <h3>Order summary</h3>
        </div>
        <div class="container" style="width:30%;height: 50%;left: 50px; margin-left: 65%;margin-top: 70px;">
            <table id="cart" class="table table-hover table-condensed">
                <thead>    
                    <tr>   
                        <th style="width:50%">Item</th>
                        <th style="width:10%">Price</th>
                        <th style="width:8%">Quantity</th>
                        <th style="width:22%" class="text-center">Subtotal</th>
                        <th style="width:10%"></th>
                    </tr>   
                </thead>        
                <tbody>   
                    <tr ng-repeat="i in ctrl.addedItems">   
                        <td data-th="Item">
                            <!--<div class="row">-->
                                <div class="col-sm-10">
                                    <!--                                                            <h4 class="nomargin" ng-bind="i.item.nameEn"></h4>-->
                                    <label style="color: #E18728; font-size: 15px" ng-bind="i.menuItemsNameEn"></label>
                                </div>
                            <!--</div>-->
                        </td>
                        <td data-th="Price"><label ng-bind="i.menuItemsPrice"></label></td>
                        <td data-th="Quantity">
                            <input type="number" min="1" max="30" class="form-control text-center" value="i.quantity" ng-model="i.quantity">
                        </td>
                        <td data-th="Subtotal" class="text-center"><p ng-bind="i.totalPrice"</p></td>
                        <!--//"(i.quantity) * (i.menuItemsPrice)"-->
                        <td class="actions" data-th="">
                            <button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
                            <button class="btn btn-danger btn-sm" ng-click="deleteItem(i.menuItemsItemId)"><i class="fa fa-trash-o"></i></button>								
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr class="visible-xs">
                        <td class="text-center"><strong><label id="totalPrices" value="ooo"></label></strong></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="hidden-xs"></td>
                        <td><label id="total">Total:</label></td>
                        <td class="hidden-xs text-center"><strong> <label id="totalPricess"></label></strong></td>
                        <!--<td><a href="orderReview2.htm" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>-->
                        <td><button value="CheckOut" class="btn btn-success btn-block" ng-click="checkOut()">CheckOut</button></td>
                    </tr>
                </tfoot>
            </table>
        </div>

    </div>

</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="resources/js/controller/admin_controller.js" type="text/javascript"></script>
<!--<script src="resources/js/app.js" type="text/javascript"></script>-->
<script src="resources/js/service/admin_service.js" type="text/javascript"></script>
<script src="resources/js/service/mainService.js" type="text/javascript"></script>
