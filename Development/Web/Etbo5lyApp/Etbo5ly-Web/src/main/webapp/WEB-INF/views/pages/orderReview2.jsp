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
                <section  ng-controller="MenuController as ctrl"  style="width: 750px; left: 5000px">

                    <form ng-submit="createOrder()">
                        <h1>Checkout - Order review</h1>
                        <ul class="nav nav-pills nav-justified">
                            <li class="active"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                            </li>
                        </ul>

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

        <div class="col-md-3">

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

        </div>
        <!-- /.col-md-3 -->

    </div>
    <!-- /.container -->
</div>
