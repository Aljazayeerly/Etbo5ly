'use strict';

var App = angular.module('myApp', []);
App.controller('MenuController', ['$scope', 'MenuService', 'MainService', function ($scope, MenuService, MainService) {
        alert("inside controller jj");
        var self = this;
        self.item = {};
        self.items = [];
        self.order = {};
        self.addedItems = [];
        self.cooks = [];
        self.categories = [];
        self.searchMeals = [];
        self.check = false;

        var itemDetails = {menuItemsItemId: 0, menuItemsNameEn: "", menuItemsNameAr: "", menuItemsPrice: 0, menuItemsDescriptionEn: "", menuItemsDescriptionAr: "", menuItemsImageUrl: "", quantity: 1, totalPrice: 0.0};
        var totalPrice = 0;

        self.getList = function () {

            alert("getList");

            self.addedItems = MainService.list();


        };

        self.getAllMeals = function () {
            MenuService.getAllMeals()
                    .then(
                            function (d) {
                                alert("getAllMeals");
                                self.items = d;
                            },
                            function (errResponse) {
                                console.error('Error while fetching titles');
                            }
                    );
        };


        self.getAllCooks = function () {
            MenuService.getAllCooks()
                    .then(
                            function (d) {
                                self.cooks = d;
                            },
                            function (errResponse) {
                                console.error('Error while fetching cooks');
                            }
                    );
        };

        self.getAllCategories = function () {

            MenuService.getAllCategories()
                    .then(
                            function (d) {
                                self.categories = d;
                            },
                            function (errResponse) {
                                console.error('Error while fetching categories');
                            }
                    );
        };

        $scope.searchForMeal = function (mealName) {

            alert("controller +  meal name " + mealName);
            MenuService.searchForMeal(mealName)
                    .then(
                            function (d) {
                                alert("okkkk controller" + d);
                                self.searchMeals = d;
                                alert("search meals" + self.searchMeals.length);
                                self.check = true;
                            },
                            function (errResponse) {
                                alert("errooooooor" + errResponse);
                                console.error('Error while fetching search meals');
                            }
                    );
        };

        $scope.createOrder = function () {
            alert("hennnnnnaaaa");
//            MenuService.createOrder(order)
//                    .then(
//                            self.getAllMeals,
//                            function(errResponse) {
//                                console.error('Error while creating Order.');
//                            }
//                    );
        };

        self.getAllMeals();
        self.getList();
        self.getAllCooks();
        self.getAllCategories();

        self.submit = function () {
            console.log('Saving New Order', self.order);
            self.createOrder(self.order);
            self.reset();
        };

        $scope.addItem = function (itemId) {

            alert("add items method");
            var found = false;
            $.each(self.addedItems, function (index, item)
            {
                if (item.menuItemsItemId == itemId)
                {
                    alert("found");
                    item.quantity = item.quantity + 1;
                    item.totalPrice = item.menuItemsPrice * item.quantity;
                    totalPrice += item.menuItemsPrice;
                    document.getElementById("total").innerHTML = totalPrice;
                    found = true;
                }
            })
            if (!found)
            {
                alert("not found")
                $.each(self.items, function (index, item)
                {
                    if (item.itemId == itemId)
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
                })
            }

        };
        $scope.deleteItem = function (itemId)
        {
            $.each(self.addedItems, function (index, item)
            {
                alert("check if found in added items");
                if (item.menuItemsItemId == itemId)
                {
                    totalPrice -= item.totalPrice;
                    document.getElementById("total").innerHTML = totalPrice;
                    addedItems.splice(index, 1);
                    return;
                }
            })

        }
        $scope.checkOut = function ()
        {
            alert("checkout");
            MainService.setList(self.addedItems);
            window.location = "orderReview2.htm";
        }

    }]);
