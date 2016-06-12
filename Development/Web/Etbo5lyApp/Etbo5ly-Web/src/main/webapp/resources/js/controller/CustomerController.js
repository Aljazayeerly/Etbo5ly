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


//            customer.id=0;
//            customer.image=null;
//            customer.imageURL=null;
//            customer.role=null;
//            customer.RoleId=0;


               // alert("customersss object is " + JSON.stringify(customer));
                RegisterService.registerCustomer(customer).then(function (resolve) {
                    //alert("resolve is " + resolve);
                    $scope.addedCustomer = resolve;

                }, function (reject) {
                    console.log(reject);

                   // alert("reject" + reject);
                });
              //  alert(" added Customer is " + JSON.stringify($scope.addedCustomer));
            }

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

        $scope.checkMail = function () {
            //  alert(" email address is " + $scope.email);
            $scope.AlreadyCustomer = "";
            RegisterService.checkEmail($scope.email).then(function (resolve) {
                if (!jQuery.isEmptyObject(resolve)) {
                   //  alert(" already a user");
                    $scope.AlreadyCustomer = "Already a user";
                }
            }, function (reject) {
                console.log(reject);
            });

        }


    }]);
