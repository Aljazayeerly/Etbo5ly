<%-- 
    Document   : customerOrderDialog
    Created on : Jun 1, 2016, 6:59:13 AM
    Author     : menna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<md-dialog aria-label="Mango (Fruit)"  ng-cloak>
    <form method="post">
        <h1>Checkout</h1>
        <!--        <ul class="nav nav-pills nav-justified">
                    <li class="active"><a href="#"><i class="fa fa-map-marker"></i><br>Address</a>
                    </li>
                    <li class="disabled"><a href="#"><i class="fa fa-truck"></i><br>Delivery Method</a>
                    </li>
                    <li class="disabled"><a href="#"><i class="fa fa-money"></i><br>Payment Method</a>
                    </li>
                    <li class="disabled"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                    </li>
                </ul>-->
        <form>
            <md-toolbar>
                <div class="md-toolbar-tools">
                    <h2>Order Details</h2>
                    <span flex></span>
                    <md-button class="md-icon-button" ng-click="cancel()">
                        <md-icon md-svg-src="img/icons/ic_close_24px.svg" aria-label="Close dialog"></md-icon>
                    </md-button>
                </div>
            </md-toolbar>
            <md-dialog-content>

                <div class="col-md-9" id="customer-order">
                    <div class="box">
                        <h1>Order #1735</h1>

                        <p class="lead">Order #1735 was placed on <strong>22/06/2013</strong> and is currently <strong>Being prepared</strong>.</p>
                        <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p>

                        <hr>

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
                                    <tr ng-repeat="i in order.orderDetails">

                                        <td><label ng-bind="i.menuItemsNameEn"></label></td>
                                        <td><label ng-bind="i.quantity"></label></td>
                                        <td><label ng-bind="i.menuItemsPrice"></label></td>
                                        <td><label ng-bind="i.totalPrice"></label></td>
                                    </tr>

                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="5" class="text-right">Total</th>
                                        <th><label ng-bind="orders.totalPrice"></label></th>
                                    </tr>
                                </tfoot>
                            </table>

                        </div>
                        <!-- /.table-responsive -->

                    </div>
                </div>

            </md-dialog-content>
            <md-dialog-actions layout="row">
                <md-button class="btn btn-primary" ng-click="orderReviewDialog()" style="margin-right:20px;">
                    Continue
                </md-button>
                <span flex></span>

                <md-button class="btn btn-primary" ng-click="answer('useful')" style="margin-right:20px;">
                    Continue
                </md-button>
            </md-dialog-actions>
        </form>
</md-dialog>
