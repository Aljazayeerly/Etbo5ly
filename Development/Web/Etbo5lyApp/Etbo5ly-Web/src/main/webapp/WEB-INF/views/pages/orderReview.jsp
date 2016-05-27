<%-- 
    Document   : orderReview
    Created on : May 21, 2016, 10:36:32 AM
    Author     : menna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<div id="content">
    <div class="container">

        <div class="col-md-12">
            <ul class="breadcrumb">
                <li><a href="#">Home</a>
                </li>
                <li>Checkout - Order review</li>
            </ul>
        </div>

        <div class="col-md-9" id="checkout">

            <div class="box">
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
                                    <div>
                                        <button ng-click="addItem(i.itemId)">Add To Cart</button>
                                    </div>
                                </div>
                                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/652/ada-small.jpeg" style="margin-left: -360px;margin-top: -90px;">
                            </div>
                        </div>  
                        <div class="col-md-3">

                            <div class="box" id="order-summary">
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
                                                    <div class="row">
                                                        <div class="col-sm-2 hidden-xs"><img src="http://placehold.it/100x100" alt="..." class="img-responsive"/></div>
                                                        <div class="col-sm-10">
                                                            <!--                                                            <h4 class="nomargin" ng-bind="i.item.nameEn"></h4>-->
                                                            <label style="color: #E18728; margin-left: -220px; font-size: 15px" ng-bind="i.menuItemsNameEn"></label>
                                                        </div>
                                                    </div>
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
                                                <td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
                                                <td colspan="2" class="hidden-xs"></td>
                                                <td><label id="total">Total:</label></td>
                                                <td class="hidden-xs text-center"><strong> <label id="totalPricess"></label></strong></td>
                                                <!--<td><a href="orderReview2.htm" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>-->
                                                <td><button value="CheckOut" class="btn btn-success btn-block" ng-click="checkOut()">sjs</button></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>

                            </div>

                        </div>
                    </section>
                </div>
            </div>
            <!-- /.box -->


        </div>
        <!-- /.col-md-9 -->

        <!--        <div class="col-md-3">
        
                    <div class="box" id="order-summary">
                        <div class="box-header">
                            <h3>Order summary</h3>
                        </div>
                        <div class="container" style="width:30%;height: 50%;left: 50px; margin-left: 65%;margin-top: 70px;">
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
        
                    </div>
        
                </div>-->
        <!-- /.col-md-3 -->

    </div>
    <!-- /.container -->
</div>
<!-- /#content -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="resources/js/controller/admin_controller.js" type="text/javascript"></script>
<!--<script src="resources/js/app.js" type="text/javascript"></script>-->
<script src="resources/js/service/admin_service.js" type="text/javascript"></script>
<script src="resources/js/service/mainService.js" type="text/javascript"></script>