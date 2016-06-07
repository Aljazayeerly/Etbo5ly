/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

App.controller('RegisterController', ['$scope', 'RegisterService', function ($scope, RegisterService) {

        $scope.addedCustomer = false;
        var customer = {};
        $scope.allregions = [];
        $scope.regions = [];
        $scope.regionSelected = 0;
        $scope.registerCustomer = function (name, password, email, phone, address) {
            customer.name = name;
            customer.password = password;
            customer.email = email;
            customer.phone = phone;
            customer.address = address;
            customer.regionId = parseInt($scope.regionSelected);
//            customer.id=0;
//            customer.image=null;
        //    customer.enabled=false;
//            customer.imageURL=null;
//            customer.registerationDate=null;
//            customer.role=null;
//            customer.RoleId=0;
//var utc = new Date().toJSON().slice(0,10);

            alert("customersss object is " + JSON.stringify(customer))
            $scope.addedCustomer = RegisterService.registerCustomer(customer);
            alert(" added Customer is " + JSON.stringify($scope.addedCustomer));

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

        $scope.showRegionnSelected = function (regionSelected) {
            $scope.regionSelected = regionSelected;
        }


    }]);
