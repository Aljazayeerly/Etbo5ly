<%-- 
    Document   : cooksInformation
    Created on : May 24, 2016, 1:37:56 PM
    Author     : Nada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div style="width:700px ;height: 70px;" >

    <div  class="md-padding" id="popupContainer" ng-cloak >
        <md-dialog aria-label="cookProfile"  ng-cloak >
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
                    <div style="overflow-y:auto ;max-height: 500px">
                    <div class="md-dialog-content">
                        <div ng-repeat="i in menu.$$state.value" style="width: 466px;height: 200px;margin: 2em 0;border: 3px solid #E18728;border-radius: 10px;background-color: white;">
                            <div>
                              
                                <div style="margin-left: 340px;"> 
                                    <label style="color: #E18728; margin-left: -140px; font-size: 15px" ng-bind="i.nameEn"></label>
                                    <br>
                                    <label style="color: gray; margin-left: -140px; font-size: 13px" ng-bind="i.cookName"></label>
                                    <div style="width: 170px;">
                                        <label style="color: black; margin-left: -140px; font-size: 10px" ng-bind="i.descriptionEn"></label>
                                    </div>
                                    <label style="color: #E18728; margin-left: -140px; font-size: 13px" ng-bind="i.price + ' L.E'"></label>
                                </div>
                               
                                <div style="margin-left: 340px;  padding-top: -800px; margin-top: -130px; height: 130px;width: 130px;">
                                    <img src="{{i.resourcesURL}}/{{i.imageUrl}}" style="float: left; margin-left: -310px;width: 100%;height: 100%;">
                                </div>
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
</div>
<!--</div>-->
