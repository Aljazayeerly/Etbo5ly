
'use strict';

//App.controller('JoinUsController', ['$scope', function($scope) {
//
//    }]);

App.controller('OrderCookController', ['$scope', 'orderService', '$mdDialog', '$mdMedia', 'PageService', function($scope, orderService, $mdDialog, $mdMedia, PageService) {

        $scope.orders = [];
        $scope.order = {};
        $scope.customFullscreen = $mdMedia('xs') || $mdMedia('sm');

        $scope.getAllCookOrders = function() {
            orderService.getAllCookOrders()
                    .then(
                            function(d) {
                                $scope.orders = d;
                                $.each($scope.orders, function(index, item)

                                {
                                    item.orderTime = new Date(item.orderTime).toUTCString();
                                })
                            },
                            function(errResponse) {
                                console.error('Error while fetching cook orders');
                            }
                    );
        };
        $scope.getAllCookOrders();
        $scope.OrderDetails = function(id)
        {

            PageService.setOrder($scope.orders[id]);
            $scope.viewOrderDetails();
        };
        $scope.viewOrderDetails = function(ev) {

            var useFullScreen = ($mdMedia('sm') || $mdMedia('xs')) && $scope.customFullscreen;
            $mdDialog.show({
                controller: CookHistoryDialogController,
                templateUrl: 'cookOrderDialog.htm',
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
        $scope.changeOrderStatus = function(orderId)
        {
            var orderStatus = {};
            orderStatus.status = "Delivered";
            orderStatus.statusIdOrder = orderId;
            alert("OrderID : " + orderId);
            PageService.setOrder($scope.orders[orderId]);
            orderService.changeOrderStatus(orderStatus);
            $scope.showOrderRatingDialog();
            location.reload();
        }
        $scope.showOrderRatingDialog = function(ev) {
            var useFullScreen = ($mdMedia('sm') || $mdMedia('xs')) && $scope.customFullscreen;
            $mdDialog.show({
                controller: "cookOrderRatingDialog",
                templateUrl: 'cookOrderRatingDialog.htm',
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
function CookHistoryDialogController($scope, $mdDialog, PageService) {

    $scope.order = PageService.getOrder();
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
App.controller("cookOrderRatingDialog", ['$scope', '$mdDialog', '$mdMedia', 'PageService', 'orderService', function($scope, $mdDialog, $mdMedia, PageService, orderService)
    {


        $scope.order = PageService.getOrder();

        $scope.rating1 = 5;
        $scope.rating2 = 2;
        $scope.isReadonly = true;
        $scope.rateFunction = function() {
            alert("Rating : " + $scope.rating1);
            alert("Rating : " + $scope.rating2);
        };

        $scope.hide = function() {
            $mdDialog.hide();
        };
        $scope.cancel = function() {
            $mdDialog.cancel();
        };
        $scope.answer = function(answer) {
            alert("answer");
        };
        $scope.submitOrderRating = function()
        {
            orderService.orderRate($scope.order);
            $scope.hide();
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
