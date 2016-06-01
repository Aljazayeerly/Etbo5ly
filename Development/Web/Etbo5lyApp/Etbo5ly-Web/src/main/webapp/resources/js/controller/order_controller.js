
'use strict';

App.controller('OrderController', '$mdDialog', '$mdMedia', function($scope, orderService, $location, $window, $mdDialog, $mdMedia) {

    $scope.customFullscreen = $mdMedia('xs') || $mdMedia('sm');

    alert("inside");
    var self = $scope;
    $scope.orders = []; //[ {userByCustomerId:0,customerName:"",userByCookId:0,cookName:"",location:"",duration:0,orderDetails:[{menuItemsItemId:0},{menuItemsItemId:0}]},{}];
    // self.orders =  $scope.orders;
    $scope.order = {};


    $scope.getAllCustomerOrders = function() {
//        alert("getAllCustomerOrders");
        orderService.getAllCustomerOrders()
                .then(
                        function(d) {
                            
//                            alert("getAllCustomerOrders  : " + d.length);
//                            alert("getAllCustomerOrders  : " + d[0].orderDetails.length);
//                            alert("cutomer" + JSON.stringify(d));
//                            alert("cutomer" + d[0].location);


                            self.orders = d;
//                            alert("quantity :" + self.orders[0].location);

                        },
                        function(errResponse) {
                            alert("erros fl controller")
                            console.error('Error while fetching orders');
                        }
                );
    };

    $scope.getAllCustomerOrders();

    $scope.OrderDetails = function(id)
    {
        alert("vvvvvvvvview set details");

//        orderService.setOrder(self.orders[id - 1]);
//        orderService.getOrder();
//        alert("getting the order" + JSON.stringify(orderService.getOrder()));
//        $window.location = "customerOrder.htm";
        $scope.show();

    };

    $scope.show = function(ev) {

        alert("show advanced 'karim M.\n\Fadel :) AND Ahmed Moawad :)'");
        var useFullScreen = ($mdMedia('sm') || $mdMedia('xs')) && $scope.customFullscreen;
        $mdDialog.show({
//                controller: DialogController,
            templateUrl: 'customerOrderDialog.htm',
            parent: angular.element(document.body),
            targetEvent: ev,
            clickOutsideToClose: true,
            fullscreen: useFullScreen
        })

                .then(function(answer) {
                    $scope.status = 'You said the information was "' + answer + '".';
                }, function() {
                    $scope.status = 'You cancelled the dialog.';
                });
        $scope.$watch(function() {
            return $mdMedia('xs') || $mdMedia('sm');
        }, function(wantsFullScreen) {
            $scope.customFullscreen = (wantsFullScreen === true);
        });
    };

});


function DialogController($scope, $mdDialog) {
    alert("dialog controller");
    $scope.hide = function() {
        $mdDialog.hide();
    };
    $scope.cancel = function() {
        $mdDialog.cancel();
    };
    $scope.answer = function(answer) {
        alert("answer");
    };
}
    