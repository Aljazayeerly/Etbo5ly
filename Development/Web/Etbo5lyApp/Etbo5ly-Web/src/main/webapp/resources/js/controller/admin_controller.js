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
        $scope.status = '  ';
        $scope.customFullscreen = $mdMedia('xs') || $mdMedia('sm');
        $scope.checked;
        var itemDetails = {menuItemsItemId: 0, menuItemsNameEn: "", menuItemsNameAr: "", menuItemsPrice: 0, menuItemsDescriptionEn: "", menuItemsDescriptionAr: "", menuItemsImageUrl: "", quantity: 1, price: 0.0};
        $scope.totalPrice = 0;
        $scope.status = '  ';
        var cookName = null;
        $scope.checked;

        self.getList = function() {

            self.addedItems = MainService.list();
        }
        ;
        self.getAllMeals = function() {

            MenuService.getAllMeals()
                    .then(
                            function(d) {

                                self.items = d;
                            },
                            function(errResponse) {
                                console.error('Error while fetching all meals in controller');
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
                                console.error('Error while fetching cooks in controller');
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
                                console.error('Error while fetching cook meals in controller');
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
                                console.error('Error while fetching all categories in controller');
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
                                console.error('Error while fetching search meals in controller');
                            }
                    );
        };
        $scope.createOrder = function() {

            var cityName = null;
            var addressDetails = null;
            cookId = PageService.getCookId();
            cookName = PageService.getCookName();
            cityName = PageService.getCity();
            var regionID = PageService.getRegion();
            $scope.totalPrice = PageService.getTotalPrice();
            alert("ReGION ID : " + regionID);
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
            order.totalPrice = $scope.totalPrice;
            order.orderDetails = self.addedItems;

            MenuService.createOrderService(order)
                    .then(
                            function() {
                            },
                            function(errResponse) {

                                console.error('Error while creating Order.');
                            }
                    );
            $scope.hide();
            self.addedItems = [];
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

            var found = false;
            $.each(self.addedItems, function(index, item)

            {
                if (item.menuItemsItemId == itemId)
                {

                    item.quantity = item.quantity + 1;
                    item.price = item.menuItemsPrice * item.quantity;
                    $scope.totalPrice = PageService.getTotalPrice();
                    $scope.totalPrice += item.menuItemsPrice;
                    PageService.setTotalPrice($scope.totalPrice);
                    document.getElementById("total").innerHTML = $scope.totalPrice;
                    found = true;
                }
            })
            if (!found)
            {

                $.each(self.items, function(index, item)

                {
                    if (item.itemId == itemId)
                    {
                        if (cookId == 0) {
                            cookId = item.cookId;
                            cookName = item.cookName;
                            order.userByCookId = cookId;
                            order.cookName = item.cookName;
                            order.totalPrice = 0;
                            alert(order.cookName);
                            PageService.setCookId(cookId);
                            PageService.setCookName(cookName);
                        }

                        if (item.cookId == cookId)
                        {
                            itemDetails = {};
                            itemDetails.quantity = 1;
                            itemDetails.price = item.price * itemDetails.quantity;
                            itemDetails.menuItemsNameEn = item.nameEn;
                            itemDetails.menuItemsItemId = item.itemId;
                            itemDetails.menuItemsPrice = item.price;
                            itemDetails.menuItemsDescriptionEn = item.descriptionEn;
                            itemDetails.menuItemsImageUrl = item.imageUrl;
                            self.addedItems.push(itemDetails);
                            $scope.totalPrice = PageService.getTotalPrice();
                            $scope.totalPrice += itemDetails.price;
                            PageService.setTotalPrice($scope.totalPrice);
                            document.getElementById("total").innerHTML = $scope.totalPrice;
                        }
                        else
                        {
                            alert("Please Order From One Cook at a time");
                        }


                    }
                })
            }

        };
        $scope.deleteItem = function(itemId)
        {
            $.each(self.addedItems, function(index, item)
            {
                if (item.menuItemsItemId == itemId)
                {

                    $scope.totalPrice = PageService.getTotalPrice();
                    $scope.totalPrice = $scope.totalPrice - item.price;
                    document.getElementById("total").innerHTML = $scope.totalPrice;
                    self.addedItems.splice(index, 1);
                    return;
                }
            })


        };
        $scope.checkOut = function()
        {

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
                                console.error('Error while fetching Meals catergory in controller');
                            }
                    );
        };
        $scope.showAdvanced = function(ev) {
            var useFullScreen = ($mdMedia('sm') || $mdMedia('xs')) && $scope.customFullscreen;
            $mdDialog.show({
                controller: "DialogController",
                templateUrl: 'orderReviewDialog.htm',
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
App.controller('DialogController', ['$scope', '$mdDialog', '$mdMedia', 'MenuService', 'PageService', function($scope, $mdDialog, $mdMedia, MenuService, PageService) {

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

            $scope.regions = $scope.cities[$scope.selectedCity - 1].regions;
        }
    }
]);

        