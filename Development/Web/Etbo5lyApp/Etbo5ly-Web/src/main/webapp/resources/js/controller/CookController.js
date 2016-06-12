/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//
//App.directive('ngFiles', ['$parse', function ($parse) {
//
//        function fn_link(scope, element, attrs) {
//            var onChange = $parse(attrs.ngFiles);
//            element.on('change', function (event) {
//                onChange(scope, {$files: event.target.files});
//            });
//        }
//        ;
//
//        return {
//            link: fn_link
//        }
//    }]);
App.controller('JoinUsController', ['$scope', 'RegisterService', function($scope, RegisterService) {
        var cook = {};
        $scope.regionSelected = 0;
        $scope.addedCook = {};
        $scope.AlreadyCook = "";
        var date = new Date();
        var json = JSON.stringify(date);
        var dateStr = JSON.parse(json);
        var formdata = new FormData();


//        $scope.getTheFiles = function ($files) {
//            angular.forEach($files, function (value, key) {
//                formdata.append(key, value);
//            });
//        };

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
        }



        $scope.registerCook = function(name, email, password, phone, address, SworkingHour, EworkingHour) {
            //  alert("start working hours is " + SworkingHour + "End working hours "+ EworkingHour);
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

                alert(" json object of cook to be send is " + JSON.stringify(cook));
                RegisterService.registerCook(cook).then(
                        function(resolve) {
                            $scope.addedCook = resolve;
                            alert(" added cook is " + $scope.addedCook);

                        },
                        function(reject) {
                            console.log(reject);

                        }
                );

            }
        }

        $scope.showRegionnSelected = function(regionSelected) {
            $scope.regionSelected = regionSelected;
        }

        $scope.getAllRegions = function() {
            RegisterService.getAllRegion().then(function(resolve) {
                $scope.allregions = resolve;
            },
                    function(reject) {
                        console.log(reject);
                    });

        }

        $scope.getAllRegions();

        $scope.checkCookMail = function() {
            //  alert(" email address is " + $scope.email);
            $scope.AlreadyCook = "";
            RegisterService.checkCookEmail($scope.email).then(function(resolve) {
                if (!jQuery.isEmptyObject(resolve)) {
                    //  alert(" already a user");
                    $scope.AlreadyCustomer = "Already a user";
                }
            }, function(reject) {
                console.log(reject);
            });

        }

//        $scope.uploadFiles = function () {
//
//                var request = {
//                    method: 'POST',
//                    url: '/api/fileupload/',
//                    data: formdata,
//                    headers: {
//                        'Content-Type': undefined
//                    }
//                }
//            }
//        


    }]);


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

//        $scope.checkCookMail = function () {
//        //  alert(" email address is " + $scope.email);
//        $scope.AlreadyCook = "";
//                RegisterService.checkCookEmail($scope.email).then(function (resolve) {
//        if (!jQuery.isEmptyObject(resolve)) {
//        //  alert(" already a user");
//        $scope.AlreadyCustomer = "Already a user";
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
    }]);
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

//        $scope.uploadFiles = function () {
//
//                var request = {
//                    method: 'POST',
//                    url: '/api/fileupload/',
//                    data: formdata,
//                    headers: {
//                        'Content-Type': undefined
//                    }
//                }
//            }
//        


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
