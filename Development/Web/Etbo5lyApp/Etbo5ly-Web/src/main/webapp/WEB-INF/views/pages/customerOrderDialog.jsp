<%-- 
    Document   : customerOrderDialog
    Created on : Jun 1, 2016, 6:59:13 AM
    Author     : menna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div style="width:300% ;height: 150%; margin-top: 10%; margin-top: 25%;margin-left: 20%;" >

    <md-dialog aria-label="Mango (Fruit)"  ng-cloak>
        <form method="post">

            <form>
                <md-toolbar style="background-color: #f0ad4e">
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

                            <p class="lead">The order was placed on <strong><label ng-bind="order.orderTime"></label></strong></p>

                            <hr>

                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Item</th>
                                            <th>Quantity</th>
                                            <th>Unit price</th>
                                            <th>Sub Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="i in order.orderDetails">

                                            <td><label ng-bind="i.menuItemsNameEn"></label></td>
                                            <td><label ng-bind="i.quantity"></label></td>
                                            <td><label ng-bind="i.menuItemsPrice"></label></td>
                                            <td><label ng-bind="i.price"></label></td>
                                        </tr>

                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th colspan="5" class="text-right">Total</th>
                                            <th><label ng-bind="order.totalPrice"></label></th>
                                        </tr>
                                    </tfoot>
                                </table>

                            </div>
                            <!-- /.table-responsive -->

                        </div>
                    </div>

                </md-dialog-content>
                <md-dialog-actions layout="row">

                    <span flex></span>

                    <md-button class="btn btn-primary" ng-click="hide()" style="margin-right:20px;">
                        OK
                    </md-button>
                </md-dialog-actions>
            </form>
    </md-dialog>
</div>
