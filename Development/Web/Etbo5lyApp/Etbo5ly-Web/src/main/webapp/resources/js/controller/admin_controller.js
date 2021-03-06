'use strict';
App.controller('MenuController', ['$scope', 'MenuService', 'MainService', '$mdDialog', '$mdMedia', 'PageService', function($scope, MenuService, MainService, $mdDialog, $mdMedia, PageService) {

        var cookId = 0;
        var order = {};
        var self = this;
        self.item = {};
        self.currentPage = 1;
        self.items = [];
        self.allItems = [];
        self.checkedItems = [];
        self.checkedAddress = [];
        self.order = {};
        self.addedItems = [];
        $scope.cooks = [];
        self.categories = [];
        self.searchMeals = [];
        self.check = false;
        $scope.checkedCategories = [];
        $scope.checkedLocations = [];
        self.cookMeals = [];
        $scope.status = '  ';
        $scope.customFullscreen = $mdMedia('xs') || $mdMedia('sm');
        $scope.checked;
        $scope.location;
        var itemDetails = {menuItemsItemId: 0, menuItemsNameEn: "", menuItemsNameAr: "", menuItemsPrice: 0, menuItemsDescriptionEn: "", menuItemsDescriptionAr: "", menuItemsImageUrl: "", quantity: 1, price: 0.0};
        var totalPrice = 0;
        $scope.status = '  ';
        var cookName = null;
        $scope.checked2;
        self.locations = [];
        $scope.showCheckedMeal = false;
        $scope.showAllMeals = true;
        $scope.showSearchMeals = false;
        $scope.showLocationMeals = false;
        var s = {"selectedCategories": [
            ]};
        var l = {"selectedLocations": [
            ]};
        $scope.selectedId = 0;
        $scope.callToSetCookID = function(id)
        {
            $scope.selectedId = id;
            PageService.setId($scope.selectedId);
            window.location.href = "cookProfile.htm?id=" + $scope.selectedId;
        };
        self.getList = function() {

            self.addedItems = MainService.list();
        };
        self.getAllMeals = function() {

            MenuService.getAllMeals()
                    .then(
                            function(d) {

                                self.items = d;
                                self.allItems = d;
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
                                $scope.cooks = d;


                            },
                            function(errResponse) {
                                console.error('Error while fetching cooks in controller');
                            }
                    );
        };
        $scope.IncDecValue = function(itemId)
        {


            $.each(self.addedItems, function(index, item)

            {
                if (item.menuItemsItemId == itemId)
                {
                    var oldPrice = item.price;
                    item.price = item.menuItemsPrice * item.quantity;
                    $scope.totalPrice = PageService.getTotalPrice();
                    $scope.totalPrice -= oldPrice;
                    $scope.totalPrice += item.price;
                    PageService.setTotalPrice($scope.totalPrice);
                    document.getElementById("total").innerHTML = $scope.totalPrice;
                }
            });
        }

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
        self.getAllLocations = function() {
            MenuService.getAllLocations()
                    .then(
                            function(d) {
                                self.locations = d;
                            },
                            function(errResponse) {
                                console.error('Error while fetching all locations in controller');
                            }
                    );
        };
        self.searchForMeal = function(mealName) {
            $scope.showCheckedMeal = false;
            $scope.showAllMeals = false;
            $scope.showSearchMeals = true;
            MenuService.searchForMeal(mealName)
                    .then(
                            function(d) {
                                self.searchMeals = d;
//                                self.check = true;
                            },
                            function(errResponse) {
                                console.error('Error while fetching search meals in controller');
                            }
                    );
        };
// dy aly sh9alal 
        $scope.createOrder = function() {
            var addressDetails = null;
            cookId = PageService.getCookId();
            cookName = PageService.getCookName();
            var regionID = PageService.getRegion();
            $scope.totalPrice = PageService.getTotalPrice();
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
            order.cookRating = 0;
            order.cookComment = "";
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
            location.reload();
            $scope.cartItems = false;
            $scope.emptyCart = true;
//            alert($scope.emptyCart + " " + $scope.cartItems);

        };
        self.getAllMeals();
        self.getList();
        self.getAllCooks();
        self.getAllCategories();
        self.getAllLocations();
        self.submit = function() {

            console.log('Saving New Order', self.order);
//            self.createOrder(self.order);
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
            });
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
                            $scope.showAlert();
                        }


                    }
                }
                )
            }
            if (self.addedItems.length == 1)
            {
                $scope.emptyCart = false;
                $scope.cartItems = true;
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
                    PageService.setTotalPrice($scope.totalPrice);
                    document.getElementById("total").innerHTML = $scope.totalPrice;
                    self.addedItems.splice(index, 1);
                    return;
                }
            })
            if (self.addedItems.length == 0)
            {
                $scope.emptyCart = true;
                $scope.cartHasItems = false;
                $scope.cartItems = false;
                cookId = 0;
                location.reload();

            }


        };
        $scope.checkOut = function()
        {
            PageService.setCart(self.addedItems);
            $scope.showAdvanced();
        };
        $scope.showAlert = function(ev) {
            // Appending dialog to document.body to cover sidenav in docs app
            // Modal dialogs should fully cover application
            // to prevent interaction outside of dialog
            $mdDialog.show(
                    $mdDialog.alert()
                    .parent(angular.element(document.querySelector('#popupContainer')))
                    .clickOutsideToClose(true)
                    .title('Add To Cart')
                    .textContent('You Can Order From One Cook Only At A Time.')
                    .ariaLabel('Alert Dialog Demo')
                    .ok('OK!')
                    .targetEvent(ev)
                    );
        };
        self.isSelected = function(categorgyId, checked, index) {


            if (checked == true)
            {
                $scope.checkedCategories.push(categorgyId);
            }
            else
            {
                $scope.checkedCategories = $scope.checkedCategories.splice(index, 1);
            }
            return   $scope.checkedCategories;
        };
        self.getSelected = function() {
            $scope.showCheckedMeal = true;
            $scope.showAllMeals = false;
            $scope.showLocationMeals = false;

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
        self.isSelectedLocation = function(id, checked2, index) {
            if (checked2 == true)
            {
                $scope.checkedLocations.push(id);
            }
            else
            {
                $scope.checkedLocations = $scope.checkedLocations.splice(index, 1);
            }

            return   $scope.checkedLocations;
        };
        self.getSelectedLocation = function() {
            $scope.showCheckedMeal = false;
            $scope.showAllMeals = false;
            $scope.showLocationMeals = true;
            l.selectedLocations = $scope.checkedLocations;
            MenuService.getMealsByLocation(l)
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
                controller: "DialogControllers",
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
        }
        ;
    }
]);
App.controller('DialogControllers', ['$scope', '$mdDialog', '$mdMedia', 'MenuService', 'PageService', function($scope, $mdDialog, $mdMedia, MenuService, PageService) {

        var self = this;
        self.countries = [];
        $scope.selectedCity = null;
        $scope.selectedRegion = null;
        $scope.addressDetails = null;
        $scope.cities = [];
        $scope.regions = [];
        $scope.cart = PageService.getCart();
        $scope.totalPrice = PageService.getTotalPrice();
        $scope.hide = function() {
            $mdDialog.hide();
        };
        $scope.cancel = function() {
            $mdDialog.cancel();
        };
        $scope.orderReviewBtn = true;
//        $scope.createOrderBtn = false;

        $scope.orderReviewDialog = function()
        {
            $scope.showA = false;
            $scope.showB = true;
            $scope.orderReviewBtn = false;
            $scope.totalPrice = PageService.getTotalPrice();
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
            $.each($scope.cities, function(index, item)
            {
                if ($scope.selectedCity == item.cityId)
                {
                    $scope.regions = $scope.cities[index].regions;
                    return;
                }
            });
        };
//        $scope.createOrder = function() {
//            var order = {};
//            var cookId = 0;
//            var cookName = null;
//            alert("create zft b2a");
//            alert($scope.cart.length);
//            var cityName = null;
//            var addressDetails = null;
//            cookId = PageService.getCookId();
//            cookName = PageService.getCookName();
////            cityName = PageService.getCity();
//            var regionID = PageService.getRegion();
//            $scope.totalPrice = PageService.getTotalPrice();
//            addressDetails = PageService.getAddressDetails();
//            order.userByCustomerId = 1;
//            order.customerName = "";
//            order.userByCookId = cookId;
//            order.cookName = cookName;
//            order.location = addressDetails;
//            order.duration = 90;
//            order.type = "normal";
//            order.longitude = 0;
//            order.latitude = 0;
//            order.addressDetails = addressDetails;
//            order.regionId = regionID;
//            order.totalPrice = $scope.totalPrice;
//            order.orderDetails = $scope.cart;
//            alert("hena");
//            MenuService.createOrderService(order)
//                    .then(
//                            function() {
//                            },
//                            function(errResponse) {
//
//                                console.error('Error while creating Order.');
//                            }
//                    );
//            $scope.hide();
//            alert("hena 2 ");
//            $scope.cartHasItems = false;
//            alert("hena 3");
//
//            $scope.emptyCart = true;
//            alert("hena 4 ");
//
//            self.addedItems = [];
//
//
//        };
    }
]);




