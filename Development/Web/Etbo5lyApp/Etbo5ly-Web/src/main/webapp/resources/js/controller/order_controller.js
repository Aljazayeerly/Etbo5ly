
'use strict';
App.controller('OrderController', ['$scope', 'orderService', '$mdDialog', '$mdMedia', 'PageService', function($scope, orderService, $mdDialog, $mdMedia, PageService) {
        $scope.customFullscreen = $mdMedia('xs') || $mdMedia('sm');
        var self = $scope;
        $scope.orders = [];
        $scope.order = {};
        $scope.getAllCustomerOrders = function() {
            orderService.getAllCustomerOrders()
                    .then(
                            function(d) {
                                $scope.orders = d;
                                $.each($scope.orders, function(index, item)

                                {
                                    item.orderTime = new Date(item.orderTime).toUTCString();
                                })
                            },
                            function(errResponse) {
                                console.error('Error while fetching orders');
                            }
                    );
        };
        $scope.getAllCustomerOrders();
        $scope.OrderDetails = function(id)
        {
            $.each($scope.orders, function(i, order)

            {

                if (order.orderId == id)
                {
                    PageService.setOrder($scope.orders[i]);
                    $scope.viewOrderDetails();

                }
            });

        };
        $scope.viewOrderDetails = function(ev) {

            var useFullScreen = ($mdMedia('sm') || $mdMedia('xs')) && $scope.customFullscreen;
            $mdDialog.show({
                controller: CustomerHistoryDialogController,
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
        $scope.showSelectValue = function(mySelect)
        {
            $scope.myOrderBy = mySelect;
            $scope.orderHistory = true;
        }


        $scope.myFilter = function(item)
        {
            if ($scope.myOrderBy == "All")
                return item;
            else if ($scope.myOrderBy == "Current Orders")
            {
                if (item.statusHasOrders.length <= 3)
                {
                    return item;
                }
            }
            else if ($scope.myOrderBy == "Past Orders")
            {
                if (item.statusHasOrders.length == 4)
                {
                    return item;
                }
            }
        }
        $scope.filterExpression = function()
        {
        }
        $scope.changeOrderStatus = function(orderId)
        {
//            alert(orderId);
//            var orderStatus = {};
//            orderStatus.status = "Delivered";
//            orderStatus.statusIdOrder = orderId;
//            alert(orderId);
            PageService.setOrder($scope.orders[orderId]);
            $scope.showOrderRatingDialog();
        }
        $scope.showOrderRatingDialog = function(ev) {
            var useFullScreen = ($mdMedia('sm') || $mdMedia('xs')) && $scope.customFullscreen;
            $mdDialog.show({
                controller: "customerOrderRatingDialog",
                templateUrl: 'customerOrderRatingDialog.htm',
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
    }]);
function CustomerHistoryDialogController($scope, $mdDialog, PageService) {

    $scope.order = PageService.getOrder();
    $scope.hide = function() {
        $mdDialog.hide();
    };
    $scope.cancel = function() {
        $mdDialog.cancel();
    };
    $scope.answer = function(answer) {
//        alert("answer");
    };
}
App.controller("customerOrderRatingDialog", ['$scope', '$mdDialog', '$mdMedia', 'PageService', 'orderService', function($scope, $mdDialog, $mdMedia, PageService, orderService)
    {


        $scope.order = PageService.getOrder();
        $scope.hide = function() {
            $mdDialog.hide();
        };
        $scope.cancel = function() {
            $mdDialog.cancel();
        };
        $scope.answer = function(answer) {
//            alert("answer");
        };
        $scope.getAllCustomerOrders = function() {
            orderService.getAllCustomerOrders()
                    .then(
                            function(d) {
                                $scope.orders = d;
                                $.each($scope.orders, function(index, item)

                                {
                                    item.orderTime = new Date(item.orderTime).toUTCString();
                                })
                            },
                            function(errResponse) {
                                console.error('Error while fetching orders');
                            }
                    );
        };

        $scope.submitOrderRating = function()
        {
//            alert("submit rating");
            var statusOrder = {};
            statusOrder.statusIdOrder = $scope.order.orderId;
            statusOrder.status = "Delivered";
            orderService.orderRate($scope.order);
            $scope.getAllCustomerOrders();
            $scope.hide();
            location.reload();
        }

        $scope.starRating1 = 4;
        $scope.starRating2 = 5;
        $scope.starRating3 = 2;
        $scope.hoverRating1 = $scope.hoverRating2 = $scope.hoverRating3 = 0;
        $scope.click1 = function(param) {
            console.log('Click(' + param + ')');
        };
        $scope.mouseHover1 = function(param) {
            console.log('mouseHover(' + param + ')');
            $scope.hoverRating1 = param;
        };
        $scope.mouseLeave1 = function(param) {
            console.log('mouseLeave(' + param + ')');
            $scope.hoverRating1 = param + '*';
        };
        $scope.click2 = function(param) {
            console.log('Click');
        };
        $scope.mouseHover2 = function(param) {
            console.log('mouseHover(' + param + ')');
            $scope.hoverRating1 = param;
        };
        $scope.mouseLeave2 = function(param) {
            console.log('mouseLeave(' + param + ')');
            $scope.hoverRating2 = param + '*';
        };
        $scope.click3 = function(param) {
            console.log('Click');
        };
        $scope.mouseHover3 = function(param) {
            console.log('mouseHover(' + param + ')');
            $scope.hoverRating3 = param;
        };
        $scope.mouseLeave3 = function(param) {
            console.log('mouseLeave(' + param + ')');
            $scope.hoverRating3 = param + '*';
        };
    }]);