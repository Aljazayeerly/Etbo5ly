<%-- 
    Document   : orderDetailsDialog
    Created on : May 29, 2016, 9:50:38 AM
    Author     : menna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div ng-controller="AppCtrl" class="md-padding" id="popupContainer" ng-cloak>
    <p class="inset">
        Open a dialog over the app's content. Press escape or click outside to close the dialog and
        send focus back to the triggering button.
    </p>
    <div class="dialog-demo-content" layout="row" ayout="row" layout-wrap layout-margin layout-align="center">
        <md-button class="md-primary md-raised" ng-click="showAlert($event)"  >
            Alert Dialog
        </md-button>
        <md-button class="md-primary md-raised" ng-click="showConfirm($event)" >
            Confirm Dialog
        </md-button>
        <md-button class="md-primary md-raised" ng-click="showAdvanced($event)">
            Custom Dialog
        </md-button>
        <md-button class="md-primary md-raised" ng-click="showTabDialog($event)">
            Tab Dialog
        </md-button>
    </div>
    <p class="footer">Note: The <b>Confirm</b> dialog does not use <code>$mdDialog.clickOutsideToClose(true)</code>.</p>
    <div hide-gt-sm layout="row" layout-align="center center" flex>
        <md-checkbox ng-model="customFullscreen" aria-label="Fullscreen Custom Dialog">Custom Dialog Fullscreen</md-checkbox>
    </div>
    <div ng-if="status">
        <br/>
        <b layout="row" layout-align="center center" class="md-padding">
            {{status}}
        </b>
    </div>
</div>