<%-- 
    Document   : customerOrder
    Created on : May 27, 2016, 8:51:07 PM
    Author     : menna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-md-9" id="customer-order">
    <div  ng-controller="OrderController2 as ctrl" class="box">
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
                        <th>Discount</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="i in orderr.orderDetails">
                        <!--                        <td>
                                                    <a href="#">
                                                        <img src="img/detailsquare.jpg" alt="White Blouse Armani">
                                                    </a>
                                                </td>-->
                        <td><label ng-bind="i.menuItemsNameEn"></label></td>
                        <td><label ng-bind="i.quantity"></label></td>
                        <td>$123.00</td>
                        <td>$0.00</td>
                        <td>$246.00</td>
                    </tr>

                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="5" class="text-right">Order subtotal</th>
                        <th>$446.00</th>
                    </tr>
                    <tr>
                        <th colspan="5" class="text-right">Shipping and handling</th>
                        <th>$10.00</th>
                    </tr>
                    <tr>
                        <th colspan="5" class="text-right">Tax</th>
                        <th>$0.00</th>
                    </tr>
                    <tr>
                        <th colspan="5" class="text-right">Total</th>
                        <th>$456.00</th>
                    </tr>
                </tfoot>
            </table>

        </div>
        <!-- /.table-responsive -->

        <div class="row addresses">
            <div class="col-md-6">
                <h2>Invoice address</h2>
                <p>John Brown
                    <br>13/25 New Avenue
                    <br>New Heaven
                    <br>45Y 73J
                    <br>England
                    <br>Great Britain</p>
            </div>
            <div class="col-md-6">
                <h2>Shipping address</h2>
                <p>John Brown
                    <br>13/25 New Avenue
                    <br>New Heaven
                    <br>45Y 73J
                    <br>England
                    <br>Great Britain</p>
            </div>
        </div>

    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.2.13/angular-ui-router.min.js"></script>-->
<script src="https://ajax.googleapis.com/ajax/libs.angularjs/1.4.4/angularjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.2.15/angular-ui-router.min.js"></script>
<!--    <script src="https://raw.githubusercontent.com/marklagendijk/ui-router.stateHelper/master/statehelper.min.js"></script>-->
<script src="resources/js/controller/order_controller.js" type="text/javascript"></script>
<script src="resources/js/controller/controller2.js" type="text/javascript"></script>
<script src="resources/js/service/order_service.js" type="text/javascript"></script>

<!--<script src="resources/js/app.js" type="text/javascript"></script>-->
