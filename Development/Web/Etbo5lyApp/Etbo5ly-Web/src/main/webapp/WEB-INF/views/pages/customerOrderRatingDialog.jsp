<%-- 
    Document   : customerOrderRatingDialog
    Created on : Jun 5, 2016, 8:38:06 PM
    Author     : menna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div style="width:300% ;height: 100%; margin-top: 10%;" >

    <div   class="md-padding" id="popupContainer" ng-cloak style="width: 100%; height: 100%">

        <md-dialog  aria-label="Mango (Fruit)"  ng-cloak >
            <form method="post">

                <form>
                    <md-toolbar style="background-color: #f0ad4e">
                        <div class="md-toolbar-tools">
                            <h2>Order Rating</h2>
                            <span flex></span>
                            <md-button class="md-icon-button" ng-click="cancel()">
                                <md-icon md-svg-src="img/icons/ic_close_24px.svg" aria-label="Close dialog"></md-icon>
                            </md-button>
                        </div>
                    </md-toolbar>
                    <md-dialog-content>

                        <div class="col-md-12" id="customer-order">
                            <div class="box">

                                <p class="lead">The order was placed on <strong><label ng-bind="order.orderTime"></label></strong></p>
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
                                                             read-only="false" max-rating="5" click="click1(param)" mouse-hover="mouseHover1(param)"
                                                             mouse-leave="mouseLeave1(param)">
                                                        </div>

                                                    </div>
                                                </td>



                                            </tr>
                                            <tr>
                                                <td> <label >Cook Rate & Comment</label></td>
                                            </tr>
                                            <tr>
                                                <td><label >Cook Rate</label></td>
                                                <td>
                                                    <div class="alert alert-success">
                                                        <span class="label label-info"></span>
                                                        <div star-rating rating="order.cookRating"
                                                             read-only="false" max-rating="5" click="click1(param)" mouse-hover="mouseHover1(param)"
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
</div>
<!--</div>-->
<link href="../../../resources/Style/css/bootstrap.css" rel="stylesheet" type="text/css"/>