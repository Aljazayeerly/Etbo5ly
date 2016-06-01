'use strict';

//var App = angular.module('myApp', ['ngMaterial']);
App.controller('MenuController', ['$scope', 'MenuService', 'MainService', '$mdDialog', '$mdMedia', function ($scope, MenuService, MainService, $mdDialog, $mdMedia) {
//        alert("inside controller jj");
        var self = this;
        self.item = {};
        self.items = [];
        self.order = {};
        self.addedItems = [];
        self.cooks = [];
        self.categories = [];
        self.searchMeals = [];
        self.check = false;
        $scope.checkedCategories=[];
        self.cookMeals = [];
//        .selected=[];
        $scope.status = '  ';
        $scope.customFullscreen = $mdMedia('xs') || $mdMedia('sm');
        $scope.checked;
//        self.search={};

        var itemDetails = {menuItemsItemId: 0, menuItemsNameEn: "", menuItemsNameAr: "", menuItemsPrice: 0, menuItemsDescriptionEn: "", menuItemsDescriptionAr: "", menuItemsImageUrl: "", quantity: 1, totalPrice: 0.0};
        var totalPrice = 0;
        var s = {"selectedCategories": [
                {
                    "categoryId": 0,
                    "nameEn": ""
                }
            ]};

        self.getList = function () {

//            alert("getList");

            self.addedItems = MainService.list();


        };

        self.getAllMeals = function () {
            MenuService.getAllMeals()
                    .then(
                            function (d) {
//                                alert("getAllMeals");
                                self.items = d;
                            },
                            function (errResponse) {
                                console.error('Error while fetching titles');
                            }
                    );
        };


        self.getAllCooks = function (id) {
            MenuService.getAllCooks(id)
                    .then(
                            function (d) {
                                self.cooks = d;
                            },
                            function (errResponse) {
                                console.error('Error while fetching cooks');
                            }
                    );
        };

        self.getCookMeals = function (id) {
            MenuService.getCookMeals()
                    .then(
                            function (d) {
                                self.cookMeals = d;
                            },
                            function (errResponse) {
                                console.error('Error while fetching cook meals');
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

//            alert("controller +  meal name " + mealName);
            MenuService.searchForMeal(mealName)
                    .then(
                            function (d) {
//                                alert("okkkk controller" + d);
                                self.searchMeals = d;
//                                alert("search meals" + self.searchMeals.length);
                                self.check = true;
                            },
                            function (errResponse) {
//                                alert("errooooooor" + errResponse);
                                console.error('Error while fetching search meals');
                            }
                    );
        };

        $scope.createOrder = function () {
//            alert("hennnnnnaaaa");
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

//            alert("add items method");
            var found = false;
            $.each(self.addedItems, function (index, item)
            {
                if (item.menuItemsItemId == itemId)
                {
//                    alert("found");
                    item.quantity = item.quantity + 1;
                    item.totalPrice = item.menuItemsPrice * item.quantity;
                    totalPrice += item.menuItemsPrice;
                    document.getElementById("total").innerHTML = totalPrice;
                    found = true;
                }
            })
            if (!found)
            {
//                alert("not found");
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
//                alert("check if found in added items");
                if (item.menuItemsItemId == itemId)
                {
                    totalPrice -= item.totalPrice;
                    document.getElementById("total").innerHTML = totalPrice;
                    addedItems.splice(index, 1);
                    return;
                }
            })

        };
        $scope.checkOut = function ()
        {
            showAdvanced();
//            MainService.setList(self.addedItems);
//            window.location = "orderReview2.htm";
//            order = {};
//                order.userByCustomerId = 1;
//                order.customerName = "";
//                order.userByCookId =  2;
//                order.cookName = "";
//                order.location = "location";
//                order.duration = 90;
//                order.type="normal";
//                order.longitude = 90;
//                order.latitude = 0;
//                order.addressDetails = "";
//            MenuService.createOrder(order);
        };


        $scope.isSelected = function (categorgyId, categorgyName, checked) {
//            alert("category id " + categorgyId);
            self.catg = {};
            self.catg.categorgyId = categorgyId;
            self.catg.categorgyName = categorgyName;
//            alert("sizzzzeeeee1 "+$scope.checkedCategories.length);
//            alert("category selected[ " + $scope.checkedCategories);
//            alert("checked " + checked);
            if (checked == true)
            {
//                alert(self.catg.categorgyId);
//                alert(self.catg.categorgyName);
                $scope.checkedCategories.push(self.catg);//array of searchDTO objects
//                alert("checked categories pushed " + $scope.checkedCategories);
//                alert("sizzzzeeeee 2 "+$scope.checkedCategories.length);
            }
            else
                $scope.checkedCategories.pop();
            return   $scope.checkedCategories;

        };


        $scope.getSelected = function () {
//            alert("category check" + $scope.checkedCategories);

            s.selectedCategories = $scope.checkedCategories;
//            alert("lengthhhhh" + s.selectedCategories.length);
        
            MenuService.getMealsForCheckedCategories(s)
                    .then(
                            function (d) {
                                alert("getSelected");
                                self.items = d;
                            },
                            function (errResponse) {
                                console.error('Error while fetching titles');
                            }
                    );

        };




//App.controller('orderReviewDialog', function($scope) {
        $scope.showAdvanced = function (ev) {
//            alert("heyyy");
            var useFullScreen = ($mdMedia('sm') || $mdMedia('xs')) && $scope.customFullscreen;
            $mdDialog.show({
                controller: DialogController,
                templateUrl: 'orderReviewDialog.htm',
                parent: angular.element(document.body),
                targetEvent: ev,
                clickOutsideToClose: true,
                fullscreen: useFullScreen
            })
                    .then(function (answer) {
                        $scope.status = 'You said the information was "' + answer + '".';
                    }, function () {
                        $scope.status = 'You cancelled the dialog.';
                    });
            $scope.$watch(function () {
                return $mdMedia('xs') || $mdMedia('sm');
            }, function (wantsFullScreen) {
                $scope.customFullscreen = (wantsFullScreen === true);
            });
        };

//});


    }]);
function DialogController($scope, $mdDialog) {
    $scope.hide = function () {
        $mdDialog.hide();
    };
    $scope.cancel = function () {
        $mdDialog.cancel();
    };
    $scope.answer = function (answer) {
        $mdDialog.hide(answer);
    };
}
