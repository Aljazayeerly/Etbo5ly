<%-- 
    Document   : cooksInformation
    Created on : May 24, 2016, 1:37:56 PM
    Author     : Nada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div   class="md-padding" id="popupContainer" ng-cloak >

    <md-dialog  aria-label="Mango (Fruit)"  ng-cloak >
        <form method="post">
            <ul class="nav nav-pills nav-justified">
                <li ng-show="addressLI" id="addressLI" class="active"><a href="#"><i class="fa fa-map-marker"></i><br>Address</a>
                </li>
                <li ng-show="orderReviewLI" id="orderReviewLI" class="disabled"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                </li>
            </ul>
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
                        <div class="col-md-9" id="addressReviewDiv" ng-show="showA" ng-hide="false" style="width:100%;height: 200%">

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
                                                    <!--<input type="text" class="form-control" id
                                                    ="city" ng-model="city">-->
                                                    <!--                                                    <select  ng-change="onChangeCity(itemSelected)" ng-model="selectedCity" ng-options="city.cityId as city.cityName for city in cities" >
                                                                                                            <select ng-model="opt1" ng-options="obj.num as obj.code for obj in opts">                                                        <option value="">Select City</option>
                                                                                                        </select>-->
                                                    <select ng-change="onChangeCity(itemSelected)" name="selectedCity" id="selectedCity" ng-model="selectedCity">
                                                        <option ng-repeat="city in cities" value="{{city.cityId}}">{{city.cityName}}</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <br>
                                            <br>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="region">Region</label>
                                                    <!--<input type="text" class="form-control" id="region" ng-model="region">-->
                                                    <!--                                                    <select ng-model="selectedRegion" ng-options="region.regionId as region.regionName for region in regions"  value="{{option.id}}">
                                                                                                            <option value="">Select Region</option>
                                                                                                        </select>-->
                                                    <select name="selectedRegion" id="selectedRegion" ng-model="selectedRegion">
                                                        <option ng-repeat="region in regions" value="{{region.regionId}}">{{region.regionName}}</option>
                                                    </select>

                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.row -->

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="addressDetails">Address Details</label>
                                                    <!--                                                <input type="text" class="form-control" id="addressDetails">-->
                                                    <textarea type="text" class="form-control" id="addressDetails" ng-model="addressDetails"  ng-required="required"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                    </div>

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
                                                                        <th>Product</th>
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
                                                                        <td data-th="Quantity">
                                                                            <input type="text" ng-disabled="true" style="width: 20%;height: 20%" class="form-control text-center" value="i.quantity" ng-model="i.quantity">
                                                                        </td>
                                                                        <td data-th="Price"><label ng-bind="i.menuItemsPrice"></label></td>

                                                                        <td data-th="Subtotal" class="text-center"><p ng-bind="i.price"</p></td>
                                                                        <!--//"(i.quantity) * (i.menuItemsPrice)"-->

                                                                    </tr>
                                                                </tbody>
                                                                <tfoot>
                                                                    <tr>
                                                                        <th colspan="4">Total</th>
                                                                        <td><label ng-bind="totalPrice" ></label></td>
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

                </md-dialog-actions>
            </form>
    </md-dialog>
</div>
