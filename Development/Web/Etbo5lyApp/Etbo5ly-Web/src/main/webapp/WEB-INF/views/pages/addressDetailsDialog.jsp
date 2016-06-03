<%-- 
    Document   : orderReviewDialog
    Created on : May 30, 2016, 5:22:36 PM
    Author     : menna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<md-dialog aria-label="Mango (Fruit)"  ng-cloak>
    <form method="post" action="checkout2.html">
        <h1>Checkout</h1>
        <ul class="nav nav-pills nav-justified">
            <li class="active"><a href="#"><i class="fa fa-map-marker"></i><br>Address</a>
            </li>
            <li class="disabled"><a href="#"><i class="fa fa-truck"></i><br>Delivery Method</a>
            </li>
            <li class="disabled"><a href="#"><i class="fa fa-money"></i><br>Payment Method</a>
            </li>
            <li class="disabled"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
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
                <div class="col-md-9" id="checkout">

                    <div class="box">
                        <form method="post" action="checkout2.html">
                            <h1>Checkout</h1>
                            <ul class="nav nav-pills nav-justified">
                                <li class="active"><a href="#"><i class="fa fa-map-marker"></i><br>Address</a>
                                </li>
                                <li class="disabled"><a href="#"><i class="fa fa-truck"></i><br>Delivery Method</a>
                                </li>
                                <li class="disabled"><a href="#"><i class="fa fa-money"></i><br>Payment Method</a>
                                </li>
                                <li class="disabled"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                                </li>
                            </ul>

                            <div class="content">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="firstname">Firstname</label>
                                            <input type="text" class="form-control" id="firstname">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="lastname">Lastname</label>
                                            <input type="text" class="form-control" id="lastname">
                                        </div>
                                    </div>
                                </div>
                                <!-- /.row -->

                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="company">Company</label>
                                            <input type="text" class="form-control" id="company">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="street">Street</label>
                                            <input type="text" class="form-control" id="street">
                                        </div>
                                    </div>
                                </div>
                                <!-- /.row -->

                                <div class="row">
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="city">Company</label>
                                            <input type="text" class="form-control" id="city">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="zip">ZIP</label>
                                            <input type="text" class="form-control" id="zip">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="state">State</label>
                                            <select class="form-control" id="state"></select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="country">Country</label>
                                            <select class="form-control" id="country"></select>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="phone">Telephone</label>
                                            <input type="text" class="form-control" id="phone">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="text" class="form-control" id="email">
                                        </div>
                                    </div>

                                </div>
                                <!-- /.row -->
                            </div>

                            <div class="box-footer">
                                <div class="pull-left">
                                    <a href="basket.html" class="btn btn-default"><i class="fa fa-chevron-left"></i>Back to basket</a>
                                </div>
                                <div class="pull-right">
                                    <button type="submit" class="btn btn-primary">Continue to Delivery Method<i class="fa fa-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- /.box -->


                </div>
            </md-dialog-content>
            <md-dialog-actions layout="row">
                <md-button href="http://en.wikipedia.org/wiki/Mango" target="_blank" md-autofocus>
                    More on Wikipedia
                </md-button>
                <span flex></span>
                <md-button ng-click="answer('not useful')">
                    Not Useful
                </md-button>
                <md-button ng-click="answer('useful')" style="margin-right:20px;">
                    Useful
                </md-button>
            </md-dialog-actions>
        </form>
</md-dialog>