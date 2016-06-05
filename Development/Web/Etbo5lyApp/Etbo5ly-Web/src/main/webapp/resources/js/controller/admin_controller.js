'use strict';
App.controller('MenuController', ['$scope', 'MenuService', 'MainService', '$mdDialog', '$mdMedia', 'PageService', function($scope, MenuService, MainService, $mdDialog, $mdMedia, PageService) {

        var cookId = 0;
        var order = {};
        var self = this;
        self.item = {};
        self.items = [];
        self.order = {};
        self.addedItems = [];
        self.cooks = [];
        self.categories = [];
        self.searchMeals = [];
        self.check = false;
        $scope.checkedCategories = [];
        self.cookMeals = [];
        $scope.customFullscreen = $mdMedia('xs') || $mdMedia('sm');
        var itemDetails = {menuItemsItemId: 0, menuItemsNameEn: "", menuItemsNameAr: "", menuItemsPrice: 0, menuItemsDescriptionEn: "", menuItemsDescriptionAr: "", menuItemsImageUrl: "", quantity: 1, totalPrice: 0.0};
        var totalPrice = 0;
        $scope.status = '  ';
        var cookName = null;
        $scope.checked;

//        self.countries = [];
//        $scope.selectedCity = null;
//        $scope.selectedRegion = null;
//        $scope.cities = [];
//        var numbers = ['1','2','3'];
        var s = {"selectedCategories": [
                {
                    "categoryId": 0,
                    "nameEn": ""
                }
            ]};

        $scope.opts = [
            {
                "code": "ABC",
                "num": ["246810", "4681012", "681012"]
            },
            {
                "code": "DEF",
                "num": ["13579", "357913", "5791315"]
            }

        ];
        var regionID = 0;


        self.getList = function() {

            self.addedItems = MainService.list();
        };

        self.getAllMeals = function() {
            MenuService.getAllMeals()
                    .then(
                            function(d) {

                                self.items = d;
                            },
                            function(errResponse) {
                                console.error('Error while fetching titles');
                            }
                    );
        };
        self.getAllCooks = function() {

            MenuService.getAllCooks()
                    .then(
                            function(d) {
                                self.cooks = d;
                            },
                            function(errResponse) {
                                console.error('Error while fetching cooks');
                            }
                    );
        };
        self.getCookMeals = function(id) {

            MenuService.getCookMeals()
                    .then(
                            function(d) {
                                self.cookMeals = d;
                            },
                            function(errResponse) {
                                console.error('Error while fetching cook meals');
                            }
                    );
        };
        self.getAllCategories = function() {

            MenuService.getAllCategories()
                    .then(
                            function(d) {
                                self.categories = d;
                            },
                            function(errResponse) {
                                console.error('Error while fetching categories');
                            }
                    );
        };
        $scope.searchForMeal = function(mealName) {


            MenuService.searchForMeal(mealName)
                    .then(
                            function(d) {
                                self.searchMeals = d;
                                self.check = true;
                            },
                            function(errResponse) {
                                console.error('Error while fetching search meals');
                            }
                    );
        };
        $scope.createOrder = function() {
            alert("seldfff :  " + self.totalPrice);
            var cityName = null;
            var addressDetails = null;
            cookId = PageService.getCookId();
            cookName = PageService.getCookName();
            cityName = PageService.getCity();
            regionID = PageService.getRegion();
            addressDetails = PageService.getAddressDetails();
            order.userByCustomerId = 1;
            order.customerName = "";
            order.userByCookId = cookId;
            order.cookName = cookName;
            order.location = addressDetails;
            order.duration = 90;
            order.type = "normal";
            order.longitude = 0;
            order.latitude = 0;
            order.addressDetails = addressDetails;
            order.regionId = regionID;
            order.totalPrice = totalPrice;
//            order.regionName = null;
//            order.regionNameAr = null;
//            order.regionCityName = null;
//            order.regionCityNameAr = null;
//            order.regionCityCountryName = null;
            order.orderDetails = self.addedItems;
            alert("total pice abl al create: " + order.totalPrice);
            MenuService.createOrder(order)
                    .then(
                            function() {

                            },
                            function(errResponse) {
                                console.error('Error while creating Order.');
                            }
                    );
            $scope.hide();
        };
        self.getAllMeals();
        self.getList();
        self.getAllCooks();
        self.getAllCategories();
        self.submit = function() {

            console.log('Saving New Order', self.order);
            self.createOrder(self.order);
            self.reset();
        };
        $scope.addItem = function(itemId) {

//            alert("addItem");
//            alert(self.addedItems.length);
            var found = false;
            $.each(self.addedItems, function(index, item)

            {
                if (item.menuItemsItemId == itemId)
                {

                    item.quantity = item.quantity + 1;
                    item.totalPrice = item.menuItemsPrice * item.quantity;
//                    totalPrice += item.menuItemsPrice;
                    totalPrice += item.totalPrice;
                    order.totalPrice += item.totalPrice;

                    alert("totalPrice " + totalPrice);
                    document.getElementById("total").innerHTML = totalPrice;
                    found = true;
                }
            })
            if (!found)
            {

//                alert("cookId : " + cookId);
                $.each(self.items, function(index, item)
                {
                    if (item.itemId == itemId)
                    {
                        if (cookId == 0) {
//                            alert("00");
                            cookId = item.cookId;
                            cookName = item.cookName;
                            order.userByCookId = cookId;
                            order.cookName = item.cookName;
                            order.totalPrice = 0;
                            alert(order.cookName);
//                            alert("cookId : " + cookId);
                            PageService.setCookId(cookId);
                            PageService.setCookName(cookName);
//                            alert("hena");
                        }

                        if (item.cookId == cookId)
                        {
                            itemDetails = {};
                            itemDetails.quantity = 1;
                            itemDetails.totalPrice = item.price * itemDetails.quantity;
                            itemDetails.menuItemsNameEn = item.nameEn;
                            itemDetails.menuItemsItemId = item.itemId;
                            itemDetails.menuItemsPrice = item.price;
                            itemDetails.menuItemsDescriptionEn = item.descriptionEn;
                            itemDetails.menuItemsImageUrl = item.imageUrl;
//                            item.quantity = 10;
                            self.addedItems.push(itemDetails);
                            totalPrice += itemDetails.totalPrice;
                            order.totalPrice += itemDetails.totalPrice;
//                            alert("totalPrice " + $scope.totalPrice);
                            document.getElementById("total").innerHTML = totalPrice;
                        }
                        else
                        {
                            alert("Please Order From One Cook at a time");
                        }


                    }
                })
            }
//            alert("added items : " + self.addedItems[0].menuItemsPrice);
//            alert("totalPrice " + $scope.totalPrice);

        };
        $scope.deleteItem = function(itemId)
        {

            $.each(self.addedItems, function(index, item)
            {
                if (item.menuItemsItemId == itemId)
                {
                    alert("Found");
                    alert("totalPrice : " + totalPrice);
                    alert("item.totalPrice : " + item.totalPrice);
                    totalPrice = totalPrice - item.totalPrice;
                    alert("totalPrice " + totalPrice);
                    document.getElementById("total").innerHTML = totalPrice;
                    addedItems.splice(index, 1);
                    alert("self.addedItems" + self.addedItems.length);

                    return;
                }
            })


        };
        $scope.checkOut = function()
        {
//            self.getAllRegions();

            $scope.showAdvanced();
        };
        $scope.isSelected = function(categorgyId, categorgyName, checked, index) {
            self.catg = {};
            self.catg.categoryId = categorgyId;
            self.catg.nameEn = categorgyName;
            if (checked == true)
            {
                $scope.checkedCategories.push(self.catg); //array of searchDTO objects
            }
            else
                $scope.checkedCategories.splice(index, 1);
            return   $scope.checkedCategories;
        };
        $scope.getSelected = function() {

            s.selectedCategories = $scope.checkedCategories;
            MenuService.getMealsForCheckedCategories(s)
                    .then(
                            function(d) {
                                self.items = d;
                            },
                            function(errResponse) {
                                console.error('Error while fetching titles');
                            }
                    );
        };
        $scope.showAdvanced = function(ev) {
            var useFullScreen = ($mdMedia('sm') || $mdMedia('xs')) && $scope.customFullscreen;
            $mdDialog.show({
                controller: "DialogController",
                templateUrl: 'cooksInformation.htm',
//                templateUrl: 'orderReviewDialog.htm',
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

    }
]);

//function DialogController($scope, $mdDialog) {
//  $scope.hide = function() {
//    $mdDialog.hide();
//  };
//  $scope.cancel = function() {
//    $mdDialog.cancel();
//  };
//  $scope.answer = function(answer) {
//    $mdDialog.hide(answer);
//  };
//}
App.controller('DialogController', ['$scope', '$mdDialog', '$mdMedia', 'MenuService', 'PageService', function($scope, $mdDialog, $mdMedia, MenuService, PageService) {


        $scope.opts = [
            {
                "code": "ABCCC",
                "num": ["246810", "4681012", "681012"]
            },
            {
                "code": "DEFFF",
                "num": ["13579", "357913", "5791315"]
            }

        ];

        self.countries = [];
        $scope.selectedCity = null;
        $scope.selectedRegion = null;
        $scope.addressDetails = null;
        $scope.cities = [];
        $scope.regions = [];

        $scope.hide = function() {
            $mdDialog.hide();
        };
        $scope.cancel = function() {
            $mdDialog.cancel();
        };
        $scope.orderReviewBtn = true;
        $scope.createOrderBtn = false;
        $scope.orderReviewDialog = function()
        {


            $scope.showA = false;

            $scope.showB = true;


//            $scope.addressLI.attrName.className = "disabled";
////            $scope.addressLI.
//            alert("orderReviewDialoooog 2");
//
//            $scope.orderReviewLI.attrName.className = "active";

            $scope.orderReviewBtn = false;
            $scope.createOrderBtn = true;

            PageService.setCity($scope.cities[$scope.selectedCity].cityName);

            PageService.setRegion($scope.selectedRegion);


            PageService.setAddressDetails($scope.addressDetails);
        };

        self.getAllRegions = function() {

            MenuService.getAllRegions()
                    .then(
                            function(d) {

                                self.countries = d;
                                $scope.cities = self.countries[0].cities;

                            },
                            function(errResponse) {
                                console.error('Error while fetching countries');
                            }
                    );
        };
        self.getAllRegions();

        $scope.onChangeCity = function(itemSelected) {

            alert("selcted : " + $scope.selectedCity);
            $scope.regions = $scope.cities[$scope.selectedCity - 1].regions;
        }
    }]);


        