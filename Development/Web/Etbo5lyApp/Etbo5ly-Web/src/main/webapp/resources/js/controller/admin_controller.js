'use strict';
App.controller('MenuController', ['$scope', 'MenuService', 'MainService', '$mdDialog', '$mdMedia', function($scope, MenuService, MainService, $mdDialog, $mdMedia) {

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
        $scope.checked;
        var s = {"selectedCategories": [
                {
                    "categoryId": 0,
                    "nameEn": ""
                }
            ]};
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
            alert("hennnnnnaaaa");
            order.userByCustomerId = 1;
            order.customerName = "";
//            order.userByCookId = cookId;
//            order.cookName = "Nada";
            order.location = "";
            order.duration = 90;
            order.type = "normal";
            order.longitude = 90;
            order.latitude = 90;
            order.addressDetails = "ppp";
            order.regionId = 3;
            order.regionName = "Smart Village";
            order.regionNameAr = "clc";
            order.regionCityName = "Cairo";
            order.regionCityNameAr = "clc";
            order.regionCityCountryName = "Egypt";
            order.orderDetails = self.addedItems;
            alert("cookname : " + order.cookName);
            MenuService.createOrder(order)
                    .then(
                            self.getAllMeals,
                            function(errResponse) {
                                console.error('Error while creating Order.');
                            }
                    );
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

            alert("addItem");
            alert(self.addedItems.length);
            var found = false;
            $.each(self.addedItems, function(index, item)

            {
                if (item.menuItemsItemId == itemId)
                {

                    item.quantity = item.quantity + 1;
                    item.totalPrice = item.menuItemsPrice * item.quantity;
                    totalPrice += item.menuItemsPrice;
                    document.getElementById("total").innerHTML = totalPrice;
                    found = true;
                }
            })
            if (!found)
            {

                alert("cookId : " + cookId);
                $.each(self.items, function(index, item)
                {
                    if (item.itemId == itemId)
                    {
                        if (cookId == 0) {
                            alert("00");
                            cookId = item.cookId;
                            order.userByCookId = cookId;
                            order.cookName = item.cookName;
                            alert("cookId : " + cookId);
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
                            item.quantity = 10;
                            self.addedItems.push(itemDetails);
                            totalPrice += itemDetails.totalPrice;
                            document.getElementById("total").innerHTML = totalPrice;
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
            alert("delete" + itemId);
            alert("self.addedItems" + self.addedItems.length);
            $.each(self.addedItems, function(index, item)
            {
                if (item.menuItemsItemId == itemId)
                {
                    alert("found : " + totalPrice);
                    totalPrice = totalPrice -  item.totalPrice;
                    document.getElementById("total").innerHTML = totalPrice;
                    addedItems.splice(index, 1);
                    alert("self.addedItems" + self.addedItems.length);

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
                                alert("getSelected");
                                self.items = d;
                            },
                            function(errResponse) {
                                console.error('Error while fetching titles');
                            }
                    );
        };
        $scope.showAdvanced = function(ev) {

            alert("show advanced");
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
    }
]);
App.controller('DialogController', ['$scope', '$mdDialog', '$mdMedia', function($scope, $mdDialog, $mdMedia) {


        alert("dialog controller");
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
            $scope.addressLI.Attr.className = "disabled";
            $scope.orderReviewLI.Attr.className = "active";
            $scope.orderReviewBtn = false;
            $scope.createOrderBtn = true;
        };
    }]);


        