/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

App.controller('RegisterController', ['$scope', 'RegisterService', function ($scope, RegisterService) {

        $scope.addedCustomer = {};
        $scope.AlreadyCustomer = "";
        var customer = {};
        $scope.allregions = [];
        $scope.regions = [];
        $scope.regionSelected = 0;
        var date = new Date();
        var json = JSON.stringify(date);
        var dateStr = JSON.parse(json);
        $scope.role = [{"id": 2, "role": "CUSTOMER"}];

        $scope.registerCustomer = function (name, password, email, phone, address) {
            if (name != null && password != null && email != null && address != null && $scope.regionSelected != 0) {
                customer.name = name;
                customer.password = password;
                customer.email = email;
                customer.phone = phone;
                customer.address = address;
                customer.regionId = parseInt($scope.regionSelected);
                customer.registerationDate = dateStr;
                customer.enabled = true;
                customer.roles = $scope.role;


//            customer.id=0;
//            customer.image=null;
//            customer.imageURL=null;
//            customer.role=null;
//            customer.RoleId=0;


                RegisterService.registerCustomer(customer).then(function (resolve) {
                    $scope.addedCustomer = resolve;

                }, function (reject) {
                    console.log(reject);

                });

                window.location.href = "login.htm";

            }

        };

        $scope.getAllRegions = function () {
            RegisterService.getAllRegion().then(function (resolve) {
                $scope.allregions = resolve;
            },
                    function (reject) {
                        console.log(reject);
                    });

        };

        $scope.getAllRegions();

        $scope.showRegionnSelected = function (regionSelected) {
            $scope.regionSelected = regionSelected;
        };

        $scope.checkMail = function () {
            $scope.AlreadyCustomer = "";
            RegisterService.checkEmail($scope.email).then(function (resolve) {
                if (!jQuery.isEmptyObject(resolve)) {
                    $scope.AlreadyCustomer = "Already a user";
                }
            }, function (reject) {
                console.log(reject);
            });

        };


    }]);
