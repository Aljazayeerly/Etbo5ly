<%-- 
    Document   : customerOrderRatingDialog
    Created on : Jun 5, 2016, 8:38:06 PM
    Author     : menna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div   class="md-padding" id="popupContainer" ng-cloak style="width: 200%; height: 100%">

    <md-dialog  aria-label="Mango (Fruit)"  ng-cloak >
        <form method="post">

            <form>
                <md-toolbar>
                    <div class="md-toolbar-tools">
                        <h2>Order Rating</h2>
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
                                            <th>Menu Item</th>
                                            <th>Comment</th>
                                            <th>Rate</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="i in order.orderDetails">

                                            <td><label ng-bind="i.menuItemsNameEn"></label></td>
                                            <td><textarea type="text"  ng-model="i.comment" id="comment"></textarea></td>
                                            <td>
                                                <div class="alert alert-success">
                                                    <span class="label label-info"></span>
                                                    <div star-rating rating="i.rating"
                                                         read-only="false" max-rating="10" click="click1(param)" mouse-hover="mouseHover1(param)"
                                                         mouse-leave="mouseLeave1(param)">
                                                    </div>

                                                </div>
                                            </td>



                                        </tr>
                                        <tr>
                                            <td> <label >Cook Rate</label></td>

                                            <td>
                                                <div class="alert alert-success">
                                                    <span class="label label-info"></span>
                                                    <div star-rating rating="order.cookRating"
                                                         read-only="false" max-rating="10" click="click1(param)" mouse-hover="mouseHover1(param)"
                                                         mouse-leave="mouseLeave1(param)">
                                                    </div>

                                                </div>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>  <label>Order Comment</label> </td>
                                            <td>  <textarea ng-model="order.orderComment" ></textarea></td>
                                        </tr>

                                    </tbody>

                                </table>

                            </div>
                            <!-- /.table-responsive -->

                        </div>
                    </div>
                </md-dialog-content>
                <md-dialog-actions layout="row">
                    <md-button  class="btn btn-primary" ng-click="submitOrderRating()" style="margin-right:20px;">
                        Submit Order Rating
                    </md-button>

                </md-dialog-actions>
            </form>
    </md-dialog>
</div>
<!--</div>-->
<link href="../../../resources/Style/css/bootstrap.css" rel="stylesheet" type="text/css"/>