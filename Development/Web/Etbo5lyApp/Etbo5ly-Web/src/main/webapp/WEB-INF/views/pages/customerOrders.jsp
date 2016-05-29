<%-- 
    Document   : ordersHistory
    Created on : May 27, 2016, 6:50:45 PM
    Author     : menna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="col-md-9" id="customer-orders" style="float: right;">
    <div ng-controller="OrderController as ctrl" class="box">
        <h1>My orders</h1>

        <p class="lead">Your orders on one place.</p>
        <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p>

        <hr>

        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Order</th>
                        <th>Cook</th>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="i in orders">
                        <th>{{ $index + 1}}</th>
                        <th><label ng-model="i.cookName" ng-bind="i.cookName"></label></th>
                        <td><label ng-bind="i.duration"></label></td>
                        <td><label ng-bind="i.type"></label></td>
                        <td>$ 150.00</td>
                        <td><span class="label label-info">Being prepared</span>
                        </td>
                        <!--<td><a href="customer-order.html" class="btn btn-primary btn-sm">View</a>-->
                        <td><button type="submit" ng-click="setOrderDetails(1)" value="View" class="btn btn-primary btn-sm"></button></td>

                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!--
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular-route.min.js"></script>-->

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.2.13/angular-ui-router.min.js"></script>-->
<script src="https://ajax.googleapis.com/ajax/libs.angularjs/1.4.4/angularjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.2.15/angular-ui-router.min.js"></script>
<script src="resources/js/controller/order_controller.js" type="text/javascript"></script>
<!--<script src="resources/js/app.js" type="text/javascript"></script>-->
<script src="resources/js/service/order_service.js" type="text/javascript"></script>