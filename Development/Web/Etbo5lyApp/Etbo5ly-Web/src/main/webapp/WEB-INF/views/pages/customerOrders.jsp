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
                        <td><button type="submit" ng-click="setOrderDetails(1)" value="View" class="btn btn-primary btn-sm"></button></td>

                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
