<%-- 
    Document   : orderReviewDialog
    Created on : May 30, 2016, 5:22:36 PM
    Author     : menna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<md-dialog aria-label="Mango (Fruit)"  ng-cloak style="width: 2500px;height: 2500px">
    <form method="post">
        <!--<h1>Checkout</h1>-->
        <!--        <ul class="nav nav-pills nav-justified">
                    <li ng-show="addressLI" class="active"><a href="#"><i class="fa fa-map-marker"></i><br>Address</a>
                    </li>
                    <li ng-show="orderReviewLI" class="disabled"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                    </li>
                </ul>-->
        <form>
            <md-toolbar>
                <div class="md-toolbar-tools">
                    <h2>Checkout</h2>
                    <span flex></span>
                    <md-button class="md-icon-button" ng-click="cancel()">
                        <md-icon md-svg-src="img/icons/ic_close_24px.svg" aria-label="Close dialog"></md-icon>
                    </md-button>
                </div>
            </md-toolbar>
            <md-dialog-content>
                <div>
                    <div class="col-md-9" id="addressReviewDiv" ng-show="showA" ng-hide="false">

                        <div class="box">
                            <ul class="nav nav-pills nav-justified">
                                <li class="active"><a href="#"><i class="fa fa-map-marker"></i><br>Address</a>
                                </li>
                                <li class="disabled"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                                </li>
                            </ul>
                            <form method="post">
                                <div class="content">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="city">City</label>
                                                <input type="text" class="form-control" id="city">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="region">Region</label>
                                                <input type="text" class="form-control" id="region">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.row -->

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="addressDetails">Address Details</label>
                                                <!--                                                <input type="text" class="form-control" id="addressDetails">-->
                                                <textarea type="text" class="form-control" id="addressDetails"></textarea>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.row -->
                                </div>

                                <!--                                <div class="box-footer">
                                                                    <div class="pull-right">
                                                                                                                <button type="submit" class="btn btn-primary">Continue to Delivery Method<i class="fa fa-chevron-right"></i>
                                                                                                                </button>
                                                                        <md-button class="btn btn-primary" ng-click="orderReviewDialog()" style="margin-right:20px;">
                                                                             Order Review<i class="fa fa-chevron-right"></i>
                                                                        </md-button>
                                                                    </div>
                                
                                                                </div>-->
                            </form>
                            <div class="pull-right">
                                <!--<button class="btn btn-primary" ng-click="orderReviewDialog()">Continue b2a</button>-->
                            </div>
                        </div>
                        <!-- /.box -->


                    </div>

                    <div id="orderReviewDiv" class="md-dialog-content" ng-show="showB" ng-hide="true">
                        <div id="content">
                            <div class="container">

                                <div class="col-md-9" id="checkout">
                                    <div class="box">
                                        <ul class="nav nav-pills nav-justified">
                                            <li class="disabled"><a href="#"><i class="fa fa-map-marker"></i><br>Address</a>
                                            </li>
                                            <li class="active"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                                            </li>
                                        </ul>
                                        <br><br>

                                        <section  ng-controller="MenuController as ctrl"  style="width: 650px; left: 5000px">

                                            <form ng-submit="createOrder()">

                                                <div class="content">
                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <thead>
                                                                <tr>
                                                                    <th colspan="2">Product</th>
                                                                    <th>Quantity</th>
                                                                    <th>Unit price</th>
                                                                    <th>Total</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr ng-repeat="i in ctrl.addedItems">   
                                                                    <td data-th="Product">
                                                                        <!--<div class="row">-->
                                                                        <div class="col-sm-10">
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
                                                                <tr>
                                                                    <th colspan="4">Total</th>
                                                                    <td></td>
                                                                </tr>
                                                            </tfoot>
                                                        </table>

                                                    </div>
                                                    <!-- /.table-responsive -->
                                                </div>
                                                <!-- /.content -->

                                                <div class="box-footer">

                                                    <div class="pull-right">
                                                        <!--                                <button type="submit" class="btn btn-primary">Place an order<i class="fa fa-chevron-right"></i>
                                                                                        </button>-->
                                                        <input type="submit" value="Place an Order"ng-click="createOrder()"/>
                                                    </div>
                                                </div>

                                            </form>
                                        </section>

                                    </div>
                                    <!-- /.box -->

                                </div>
                                <!-- /.col-md-9 -->

                                <!--                                <div class="col-md-3">
                                
                                                                    <div class="box" id="order-summary">
                                                                        <div class="box-header">
                                                                            <h3>Order summary</h3>
                                                                        </div>
                                                                        <p class="text-muted">Shipping and additional costs are calculated based on the values you have entered.</p>
                                
                                                                        <div class="table-responsive">
                                                                            <table class="table">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td>Order subtotal</td>
                                                                                        <th>$446.00</th>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>Shipping and handling</td>
                                                                                        <th>$10.00</th>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>Tax</td>
                                                                                        <th>$0.00</th>
                                                                                    </tr>
                                                                                    <tr class="total">
                                                                                        <td>Total</td>
                                                                                        <th>$456.00</th>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                
                                                                    </div>
                                
                                                                </div>-->
                                <!-- /.col-md-3 -->

                            </div>
                            <!-- /.container -->
                        </div>
                    </div>
                </div>
            </md-dialog-content>
            <md-dialog-actions layout="row">
                <md-button  ng-show="orderReviewBtn" class="btn btn-primary" ng-click="orderReviewDialog()" style="margin-right:20px;">
                    Continue to Order Review
                </md-button>
                <md-button  ng-show="createOrderBtn" class="btn btn-primary" ng-click="createOrder()" style="margin-right:20px;">
                     Order
                </md-button>
                <!--
                                <span flex></span>
                
                                <md-button class="btn btn-primary" ng-click="answer('useful')" style="margin-right:20px;">
                                    Coontinue
                                </md-button>-->
            </md-dialog-actions>
        </form>
</md-dialog>