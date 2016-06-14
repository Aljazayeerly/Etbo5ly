/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


App.controller('JoinUsController', ['$scope', 'RegisterService', 'MenuService', function($scope, RegisterService, MenuService) {

        var self = this;
        var cook = {};
        self.menuItem = {};
        $scope.regionSelected = 0;
        $scope.addedCook = {};
        $scope.AlreadyCook = "";
        $scope.categories = [];
        $scope.longitude = 0.0;
        $scope.latitude = 0.0;
        var date = new Date();
        var json = JSON.stringify(date);
        var dateStr = JSON.parse(json);
        var formdata = new FormData();
        // This function will convert String from input field to time format
        $scope.toDate = function(dStr, format) {
            var now = new Date();
            if (format == "h:m") {
                now.setHours(dStr.substr(0, dStr.indexOf(":")));
                now.setMinutes(dStr.substr(dStr.indexOf(":") + 1));
                now.setSeconds(0);
                return now;
            } else
                return "Invalid Format";
        };
        $scope.registerCook = function(name, email, password, phone, address, SworkingHour, EworkingHour) {
            if (name != null && password != null && email != null && address != null && $scope.regionSelected != 0) {
                cook.name = name;
                cook.email = email;
                cook.password = password;
                cook.phone = phone;
                cook.address = address;
                cook.regionId = parseInt($scope.regionSelected);
                cook.cookStatusStatusId = 2;
                cook.startWorkingHours = $scope.toDate(SworkingHour, "h:m");
                cook.endWorkingHours = $scope.toDate(EworkingHour, "h:m");
                cook.registerationDate = dateStr;
                RegisterService.registerCook(cook).then(
                        function(resolve) {
                            $scope.addedCook = resolve;

                        },
                        function(reject) {
                            console.log(reject);
                        }
                );
            }
        };
        $scope.addItemToMenu = function() {
            
            
            self.menuItem.nameEn = name;
            self.menuItem.price = price;
            self.menuItem.descriptionEn = description;
            
            MenuService.addMenuItem(self.menuIem).then(
                    function(resolve) {
                        $scope.addedItem = resolve;
                    },
                    function(reject) {
                        console.log(reject);
                    }
            );
        };
        $scope.showRegionnSelected = function(regionSelected) {
            $scope.regionSelected = regionSelected;
        };
        $scope.getAllRegions = function() {
            RegisterService.getAllRegion().then(function(resolve) {
                $scope.allregions = resolve;
            },
                    function(reject) {
                        console.log(reject);
                    });
        };
        
        
        $scope.getAllCategories = function() {

            MenuService.getAllCategories()
                    .then(
                            function(d) {
                                $scope.categories = d;
                            },
                            function(errResponse) {
                                console.error('Error while fetching all categories in controller');
                            }
                    );
        };
       
         $scope.showCategorySelected = function(categorySelected) {
            $scope.categorySelected = categorySelected;
        };
        $scope.getAllRegions();
        $scope.getAllCategories();
        $scope.checkCookMail = function() {
//            $scope.AlreadyCook = " ";
//            RegisterService.checkEmail($scope.email).then(function (resolve) {
            $scope.AlreadyCook = "";
            RegisterService.checkCookEmail($scope.email).then(function(resolve) {
                if (!jQuery.isEmptyObject(resolve)) {
                    $scope.AlreadyCustomer = "Already a user";
                }
            }, function(reject) {
                console.log(reject);
            });
        };
        $scope.showPosition = function(position) {
            $scope.latitude = position.coords.latitude;
            $scope.longitude = position.coords.longitude;
        };
        function location() {

            navigator.geolocation.getCurrentPosition($scope.showPosition);
        }

        location();
        $scope.goToLogin = function() {
            window.location.href = "login.htm";
        }
        ;
    }]);
//App.controller('JoinUsController', ['$scope', function($scope) {
//
//    }]);

App.controller('OrderCookController', ['$scope', 'orderService', '$mdDialog', '$mdMedia', 'PageService', function($scope, orderService, $mdDialog, $mdMedia, PageService) {

        $scope.orders = [];
        $scope.order = {};
        $scope.orderStatus = [{id: 1, statusName: "Ordered"}, {id: 2, statusName: "Preparing"}, {id: 3, statusName: "InWay"}];
        $scope.customFullscreen = $mdMedia('xs') || $mdMedia('sm');
        $scope.selectedStatus = null;
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

            alert(id);
            alert($scope.orders.length);
            $.each($scope.orders, function(index, item)

            {
                if (item.orderId == id)
                {
                    alert("index " + index);
                    PageService.setOrder($scope.orders[index]);
                    $scope.viewOrderDetails();
                }
            });

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
        };
//        $scope.checkCookMail = function () {
//        $scope.AlreadyCook = "";
//                RegisterService.checkCookEmail($scope.email).then(function (resolve) {
//        if (!jQuery.isEmptyObject(resolve)) {
//        $scope.AlreadyCustomer = "Already a user";
        $scope.filterExpression = function(orderStatus)
        {
            alert("status : " + $scope.selectedStatus);
            $scope.max = 0;
            $.each(orderStatus, function(index, item)

            {
                // alert("itemOrderStatusStatusId " + item.orderStatusStatusId);
                if ($scope.max < item.orderStatusStatusId)
                {
                    $scope.max = item.orderStatusStatusId;
                    $scope.selectedStatus = item.status;
                }
            });

        }

        $scope.changeOrderStatus = function(orderId, st)
        {
            var orderStatus = {};
            alert("st " + st);
            orderStatus.status = $scope.selectedStatus;
            orderStatus.statusIdOrder = orderId;
            orderStatus.orderStatusStatusId = st;
            alert("OrderID : " + orderId);
            alert("length : " + $scope.orders.length);
            PageService.setOrder($scope.orders[orderId]);
            orderService.changeOrderStatus(orderStatus);
            $scope.getAllCookOrders();
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
        };
        $scope.rateOrder = function(orderId)
        {
            var orderStatus = {};
            orderStatus.status = "Delivered";
            orderStatus.statusIdOrder = orderId;
            PageService.setOrder($scope.orders[orderId]);
            orderService.changeOrderStatus(orderStatus);
            $scope.showOrderRatingDialog();
            $scope.getAllCookOrders();
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
        function CookHistoryDialogController($scope, $mdDialog, PageService) {

            alert("cook controller");
            $scope.order = PageService.getOrder();
            alert("order id " + $scope.order.orderDetails.length);
            $scope.hide = function() {
                $mdDialog.hide();
            };
            $scope.cancel = function() {
                $mdDialog.cancel();
            };
            $scope.answer = function(answer) {
            }
            ;
        }
    }]);
App.controller("cookOrderRatingDialog", ['$scope', '$mdDialog', '$mdMedia', 'PageService', 'orderService', function($scope, $mdDialog, $mdMedia, PageService, orderService)
    {


        $scope.order = PageService.getOrder();
        $scope.rating1 = 5;
        $scope.rating2 = 2;
        $scope.isReadonly = true;
        $scope.rateFunction = function() {

        };
        $scope.hide = function() {
            $mdDialog.hide();
        };
        $scope.cancel = function() {
            $mdDialog.cancel();
        };
        $scope.answer = function(answer) {
        };
        $scope.submitOrderRating = function()
        {
            orderService.orderRate($scope.order);
            $scope.hide();
        };
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
        }
        ;
    }]);
