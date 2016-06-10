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
App.controller('JoinUsController', ['$scope', 'RegisterService', function ($scope, RegisterService) {

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
        $scope.toDate = function (dStr, format) {
            var now = new Date();
            if (format == "h:m") {
                now.setHours(dStr.substr(0, dStr.indexOf(":")));
                now.setMinutes(dStr.substr(dStr.indexOf(":") + 1));
                now.setSeconds(0);
                return now;
            } else
                return "Invalid Format";
        }



        $scope.registerCook = function (name, email, password, phone, address, SworkingHour, EworkingHour) {
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
                        function (resolve) {
                            $scope.addedCook = resolve;
                            alert(" added cook is " + $scope.addedCook);

                        },
                        function (reject) {
                            console.log(reject);

                        }
                );

            }
        }

        $scope.showRegionnSelected = function (regionSelected) {
            $scope.regionSelected = regionSelected;
        }

        $scope.getAllRegions = function () {
            RegisterService.getAllRegion().then(function (resolve) {
                $scope.allregions = resolve;
            },
                    function (reject) {
                        console.log(reject);
                    });

        }

        $scope.getAllRegions();

        $scope.checkCookMail = function () {
            //  alert(" email address is " + $scope.email);
            $scope.AlreadyCook = "";
            RegisterService.checkCookEmail($scope.email).then(function (resolve) {
                if (!jQuery.isEmptyObject(resolve)) {
                    //  alert(" already a user");
                    $scope.AlreadyCustomer = "Already a user";
                }
            }, function (reject) {
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
