<%-- 
    Document   : cookOrders
    Created on : Jun 8, 2016, 9:26:55 AM
    Author     : menna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="col-md-9" id="cook-orders" style="float: right;">
    <div ng-controller="OrderCookController as ctrl" class="box" style=" margin-top: 10%;margin-right: 25%;">
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


        <div class="table-responsive" ng-show="cookOrderHistory" ng-hide="true">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Order</th>
                        <th>Customer</th>
                        <th>Date</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="i in orders| filter : myFilter">
                        <th>{{ $index + 1}}</th>
                        <th><label ng-model="i.customerName" ng-bind="i.customerName"></label></th>
                        <td><label ng-bind="i.orderTime"></label></td>
                        <td><label ng-bind="i.totalPrice"></label></td>
                        <td>
                            <select ng-show = "i.statusHasOrders.length < 3" class="form-control" ng-model="selectedStatus"  ng-change="changeOrderStatus(i.orderId, selectedStatus)" >
                                <option ng-repeat="st in orderStatus" value ="{{st.id}}" ng-selected="i.statusHasOrders.length == st.id" ng-disabled="st.id < i.statusHasOrders.length">{{st.statusName}}</option>
                            </select>
                            <span ng-show = "i.statusHasOrders.length == 4" class="label label-success">Delivered</span>
                            <span ng-show = "i.statusHasOrders.length == 3" class="label label-warning">In Way</span>

                        </td>

                        <td><button type="submit" ng-click="OrderDetails(i.orderId)" value="View" class="btn btn-primary btn-sm">View</button></td>
                        <!--                        <td> 
                                                                                <button ng-show = "i.statusHasOrders.length == 3" class="btn btn-primary" ng-click="changeOrderStatus(i.orderId)">
                                                                                    <i class="fa fa-refresh"></i>Change Status
                                                                                </button>
                                                </td>-->


                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

