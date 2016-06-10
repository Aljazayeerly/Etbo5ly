<%-- 
    Document   : cookOrderRatingDialog
    Created on : Jun 8, 2016, 5:45:44 PM
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

                    <div class="col-md-9" id="cook-order">
                        <div class="box">

                            <p class="lead">The order was placed on <strong><label ng-bind="order.orderTime"></label></strong> and is currently <strong>Being prepared</strong>.</p>
                            <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p>

                            <hr>

                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Comment</th>
                                            <th>Rate</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>

                                            <td><textarea type="text"  ng-model="order.comment" id="comment"></textarea></td>
                                            <td>
                                                <div class="alert alert-success">
                                                    <span class="label label-info"></span>
                                                    <div star-rating rating="order.rating"
                                                         read-only="false" max-rating="10" click="click1(param)" mouse-hover="mouseHover1(param)"
                                                         mouse-leave="mouseLeave1(param)">
                                                    </div>

                                                </div>
                                            </td>
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
