/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

App.controller('JoinUsController', ['$scope', 'RegisterService', function ($scope, RegisterService) {

        var cook = {};
        $scope.regionSelected = 0;
        $scope.addedCook = {};
        $scope.AlreadyCook = "";



        $scope.registerCook = function (name, email, password, phone, address) {
            if (name != null && password != null && email != null && address != null && $scope.regionSelected != 0) {
                cook.name = name;
                cook.email = email;
                cook.password = password;
                cook.phone = phone;
                cook.address = address;
                cook.regionId = parseInt($scope.regionSelected);
                cook.cookStatusStatusId = 2;
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

    }]);
