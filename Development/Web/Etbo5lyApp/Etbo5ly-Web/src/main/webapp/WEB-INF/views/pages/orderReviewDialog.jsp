<%-- 
    Document   : orderReviewDialog
    Created on : May 30, 2016, 5:22:36 PM
    Author     : menna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div  class="md-padding" id="popupContainer" ng-cloak >
    <md-dialog aria-label="cookProfile"  ng-cloak>
        <form>
            <md-toolbar style="background-color: #f0ad4e">
                <div class="md-toolbar-tools" >
                    <h2><label ng-bind="clickedCook.name + ' Profile'"></label></h2>
                    <span flex></span>
                    <md-button class="md-icon-button" ng-click="cancel()">
                        <md-icon md-svg-src="img/icons/ic_close_24px.svg" aria-label="Close dialog"></md-icon>
                    </md-button>
                </div>
            </md-toolbar>
            <md-dialog-content>
                <div class="md-dialog-content">
                    <div ng-repeat="i in menu.$$state.value" style="width: 600px;height: 200px;margin: 2em 0;border: 3px solid #E18728;border-radius: 10px;background-color: white;padding-left: 55px;position: relative;">
                        <div>

                            <div style="margin-left: 340px;">
                                <label style="color: #E18728; margin-left: -220px; font-size: 15px" ng-bind="i.nameEn"></label>
                                <br>
                                <label style="color: gray; margin-left: -220px; font-size: 13px" ng-bind="i.cookName"></label>
                                <div>
                                    <label style="color: black; margin-left: -220px; font-size: 10px" ng-bind="i.descriptionEn"></label>
                                </div>
                                <label style="color: #E18728; margin-left: -220px; font-size: 13px" ng-bind="i.price + ' L.E'"></label>
                            </div>
                            <div style="margin-left: 340px;  padding-top: -500px; margin-top: -120px;">
                                <img src="{{i.resourcesURL}}/{{i.imageUrl}}" style="float: left; margin-left: -380px;width: 154px;height: 154px;">
                            </div>
                        </div>
                    </div>  
                </div>

            </md-dialog-content>
            <md-dialog-actions layout="row">
                <md-button target="_blank" md-autofocus ng-click="goToCook()">
                    Visit Cook page
                </md-button>
                <span flex></span>
                <md-button ng-click="answer('not useful')">
                    close
                </md-button>
            </md-dialog-actions>
        </form>
    </md-dialog>
</div>
<!--</div>-->
