'use strict';

var App = angular.module('myApp', []);
App.controller('MenuController', ['$scope', 'MenuService', function ($scope, MenuService) {
        var self = this;
//        self.item = {};
        self.items = [];
        self.cooks = [];
        self.categories = [];
        self.searchMeals = [];
        self.check = false;

        self.getAllMeals = function () {
            MenuService.getAllMeals()
                    .then(
                            function (d) {
                                self.items = d;
                            },
                            function (errResponse) {
                                console.error('Error while fetching meals');
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

        self.getAllMeals();
        self.getAllCooks();
        self.getAllCategories();

    }]);
