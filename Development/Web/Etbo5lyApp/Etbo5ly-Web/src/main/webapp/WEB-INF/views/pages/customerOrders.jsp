<%-- 
    Document   : ordersHistory
    Created on : May 27, 2016, 6:50:45 PM
    Author     : menna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="col-md-9" id="customer-orders" style="float: right;">
    <div ng-controller="OrderController as ctrl" class="box" style=" margin-top: 10%;margin-right: 25%;"> 
        <h1>My orders</h1>

        <p class="lead">Your orders on one place.</p>
        <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p>

        <hr>

        <div class="products-sort-by">
            <strong>Show</strong>
            <select ng-model="mySelect" ng-change="showSelectValue(mySelect)" class="form-control">
                <option>All</option>
                <option>Current Orders</option>
                <option>Past Orders</option>
            </select>
        </div>

        <div ng-show="orderHistory" ng-hide="true">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Order</th>
                            <th>Cook</th>
                            <th>Date</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="i in orders| filter : myFilter">
                            <th>{{ $index + 1}}</th>
                            <th><label ng-model="i.cookName" ng-bind="i.cookName"></label></th>
                            <td><label ng-bind="i.orderTime"></label></td>
                            <td><label ng-bind="i.totalPrice"></label></td>
                            <td><span  ng-show = "i.statusHasOrders.length == 1" class="label label-info">Ordered</span>
                                <span ng-show = "i.statusHasOrders.length == 2" class="label label-danger">Being prepared</span>
                                <span ng-show = "i.statusHasOrders.length == 3" class="label label-warning">In Way</span>

                                <span ng-show = "i.statusHasOrders.length == 4" class="label label-success">Delivered</span>
                            </td>

                            <td><button ng-show = "i.statusHasOrders.length != 3" type="submit" ng-click="OrderDetails(i.orderId)" value="View" class="btn btn-primary btn-sm">View Details</button>
                                <button ng-show = "i.statusHasOrders.length == 3" class="btn btn-info" ng-click="changeOrderStatus(i.orderId - 1)">
                                    <i class="fa fa-refresh"></i>Rate Order
                                </button>
                            </td>


                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
